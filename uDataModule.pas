unit uDataModule;

interface

uses
  SysUtils, Classes, XPMan, Dialogs, ExtCtrls, IdBaseComponent,
  Windows,
  Messages,
  Graphics, Forms,
  IdComponent, IdTCPConnection, IdTCPClient, ImgList, Controls;

type
  TModuleMain = class(TDataModule)
    XPManifest1: TXPManifest;
    SaveDialogLogFile: TSaveDialog;
    TimerRunCmd: TTimer;
    ClientSocketTelnet: TIdTCPClient;
    ImageListNeato: TImageList;
    procedure TimerRunCmdTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RunCmdFn(N: byte);
  end;

var
  ModuleMain: TModuleMain;

function FindCOMPort(vid, pid: DWORD): string;
procedure EasyFade(Bitmap: TBitmap; Down: Byte);
procedure Gamma(Bitmap: TBitmap; L: Double);
function GetAnalogSensors(): TStrings;
function GetBattV(): Real;
function GetButton(): TStrings;
function GetCharger(): TStrings;
function GetDigitalSensors(): TStrings;
function GetFuelPercent(): Integer;
function GetMyVersion(VerCount: Byte = 4):string;
function GetRobotTime(): TTime;
function GetSysLang: Integer;
procedure Mixer(Bitmap: TBitmap; Value: Byte; Color: TColor);
function OpenCOMPort(ComPortName: string): THandle;
function OpenComPortSmart(var H: THandle; Vid, Pid: DWORD; PortName: string = ''): boolean;
function SendCmd(Port: THandle; Cmd: string): string;
procedure SetTestMode(ModeOn: boolean);

implementation

{$R *.dfm}

uses
  SetupAPI,
  DateUtils,
  RegExpr,
  uMathLib,
  uVectors, StrUtils,
  uFrmMain;

// ищем USB-COM порт по VID PID
// если не найденно то ''.
function FindCOMPort(vid, pid: DWORD): string;
var
  Buffer: array [0..255] of Char;
  Index,
  RegDataType: DWORD;
  DevStrId: AnsiString;
  DevStrIdFinding: AnsiString;
  ClassDescription: array [0..255] of char;
  DevInfo: HDEVINFO;
  devInfoData: SP_DEVINFO_DATA;
  VPguid: TGUID;
  RecSize: DWORD;
  EndOfRec: boolean;
  hKey: THandle;
  ValueType: DWORD;
  SizeValue: DWORD;
begin
  Result := '';

  // мы ищем устройства с GUID COM порта
  VPguid := StringToGUID('{4D36E978-E325-11CE-BFC1-08002BE10318}');
  SetupDiGetClassDescription(VPguid, @ClassDescription, sizeof(ClassDescription), RecSize);
  DevInfo := SetupDiGetClassDevs(@VPguid, nil, 0, DIGCF_PRESENT);
  devInfoData.cbSize := sizeof(SP_DEVINFO_DATA);

  DevStrIdFinding := Format('USB\VID_%04X&PID_%04X', [vid, pid]);
  //wsprintf(txt2, 'USB\\VID_'%04X'&PID_'%04X'", vid, pid);

  Index := 0;
  repeat
    // перечисляем устройства с заданным GUID
    EndOfRec := SetupDiEnumDeviceInfo(DevInfo, Index, devInfoData);
    Inc(Index);

    // получаем "Код экземпляра устройства"
    // (можно найти в свойствах USB-устройства в Диспетчере устройств)
    // вида: "USB\VID_2108&PID_780B\6&320B4750&0&4"
    FillChar(Buffer, sizeof(Buffer), 0);
    if not SetupDiGetDeviceRegistryProperty(DevInfo, devInfoData, SPDRP_HARDWAREID,
        RegDataType, @Buffer, sizeof(Buffer), RecSize) then
      continue;

    // копируем из результата только первую часть, без доп индификаторов
    if(lStrLen(@Buffer) >= 21) then
    begin
      DevStrId := Buffer;
      SetLength(DevStrId, 21);
    end else
      continue;

    // если это не то устройство то продолжаем читать
    if CompareText(DevStrId, DevStrIdFinding) <> 0 then
      continue;

    // открываем ветку реества связанную с устройством
    hKey := SetupDiOpenDevRegKey(DevInfo, devInfoData, DICS_FLAG_GLOBAL, 0, DIREG_DEV, KEY_READ);
    if(hKey <> INVALID_HANDLE_VALUE) then
    begin
      FillChar(Buffer, sizeof(Buffer), 0);
      ValueType := REG_SZ;
      SizeValue := MAX_PATH;
      // считываем PortName - это и есть номер порта.
      if(RegQueryValueEx(hKey, 'PortName', nil, @ValueType, @Buffer, @SizeValue) = ERROR_SUCCESS) then
      begin
        RegCloseKey(hKey);
        DevStrId := Buffer;
        DevStrId := Copy(DevStrId, 4, 3);
        if StrToIntDef(DevStrId, -1) > 0 then
        begin
          Result := '\\?\COM'+IntToStr(StrToIntDef(DevStrId, -1));
          break;
        end;
      end;
      RegCloseKey(hKey);
    end;
  until not EndOfRec;

  SetupDiDestroyDeviceInfoList(DevInfo);
end;

// открыть COM порт
function OpenCOMPort(ComPortName: string): THandle;
var
  Dcb: TDcb;
begin
  Result := CreateFile(PChar(ComPortName), GENERIC_READ or GENERIC_WRITE, 0, nil,
    OPEN_EXISTING, 0, 0);
  if (Result <> INVALID_HANDLE_VALUE) then
  begin
    // сделали настройку COM порта
    GetCommState(Result, Dcb);
    Dcb.BaudRate := CBR_57600;
    //TEMP! Dcb.BaudRate := CBR_115200;
    Dcb.Parity := NOPARITY;
    Dcb.ByteSize := 8;
    Dcb.StopBits := ONESTOPBIT;
    if not SetCommState(Result, Dcb) then
      FatalError('Error setting port state (SetCommState)');
      //FatalError(LangManager.ConstantValue['ErrorSetPortState']); // Error setting port state (SetCommState)

    SetCommMask(Result, EV_RXCHAR);
  end;
end;

function OpenComPortSmart(var H: THandle; Vid, Pid: DWORD; PortName: string = ''): boolean;
begin
  //WIP
  result := false;
end;

// послать команду и получить ответ
function SendCmd(Port: THandle; Cmd: string): string;
var
  Buf: AnsiString;
  IOResult: DWORD;
  ComStat: TComStat;
  dwRead, dwReaded: DWORD;
  ReadStop: boolean;
begin
  if Port = INVALID_HANDLE_VALUE then
  Begin
    //OLD: ShowMessage('Connect USB');
    Result := '';
    exit;
  enD;

  // Запись:
  WriteFile(Port, Cmd[1], Length(Cmd), IOResult, nil);

  // Чтение:
  IOResult := 0;
  Result := '';
  SetLength(Buf, 1024);
  ReadStop := false;

  while (not ReadStop) do
  begin
    // ожидание ответа
    if WaitCommEvent(Port, IOResult, nil) = true then
    begin
      // проверяем событие
      if (IOResult and EV_ERR) <> 0 then
      begin
        FatalError('(IOResult and EV_ERR) <> 0');
        //FatalError(LangManager.ConstantValue['ErrorEvent']);
      end
      else if (IOResult and EV_RXCHAR) <> 0 then
      begin
        // используем ClearCommError() для определения количества принятых символов.
        if not ClearCommError(Port, IOResult, @ComStat) then
          FatalError('ErrorClearPort');
          //FatalError(LangManager.ConstantValue['ErrorClearPort']);
        dwRead := ComStat.cbInQue;

        if dwRead > DWORD(Length(Buf)) then
          SetLength(Buf, dwRead);

        // делаем чтение символов
        ReadFile(Port, Buf[1], dwRead, dwReaded, nil);

        if (dwReaded > 0) then
        Begin
          // В Buf находятся прочитанные байты
          // Далее идет обработка принятых байтов
          Result := Result + Copy(Buf, 1, dwReaded);

          // #1A - приглашение в консоль (метка завершения вывода команды)
          if Pos(#$1A, Result) <> 0 then
            ReadStop := true;
        enD else
          FatalError('Empty read');
      end;
    end else
      FatalError('WaitCommEvent fail');
  end;
end;


{ **** UBPFD *********** by delphibase.endimus.com ****
>> Смешивание цветов рисунка с другим цветом

Зависимости: Graphics
Автор:       Fenik, chook_nu@uraltc.ru, Новоуральск
Copyright:   Автор Федоровских Николай
Дата:        5 июня 2002 г.
***************************************************** }
{
Value - процент цвета рисунка от конечного цвета,
    (255-Value) - процент цвета Color от конечного цвета,
    где 255 - это 100%;
}
procedure Mixer(Bitmap: TBitmap; Value: Byte; Color: TColor);
  function BLimit(B: Integer): Byte;
  begin
    if B < 0 then
      Result := 0
    else if B > 255 then
      Result := 255
    else
      Result := B;
  end;
type
  TRGB = record
    B, G, R: Byte;
  end;
  pRGB = ^TRGB;
var
  x, y: Word;
  Dest: pRGB;
  DR, DG, DB, D: Double;
begin
  D := Value / 200;
  DR := Lo(Color) * (1.275 - D);
  DG := Lo(Color shr 8) * (1.275 - D);
  DB := Lo((Color shr 8) shr 8) * (1.275 - D);
  for y := 0 to Bitmap.Height - 1 do
  begin
    Dest := Bitmap.ScanLine[y];
    for x := 0 to Bitmap.Width - 1 do
    begin
      with Dest^ do
      begin
        B := BLimit(Round(B * D + DB));
        G := BLimit(Round(G * D + DG));
        R := BLimit(Round(R * D + DR));
      end;
      Inc(Dest);
    end;
  end;
end;

{ **** UBPFD *********** by delphibase.endimus.com ****
>> Изменение гаммы рисунка
Зависимости: Graphics
Автор:       Fenik, chook_nu@uraltc.ru, Новоуральск
Copyright:   Автор Федоровских Николай
Дата:        5 июня 2002 г.
***************************************************** }
{0.0 < L < 7.0}
procedure Gamma(Bitmap: TBitmap; L: Double);
  function Power(Base, Exponent: Extended): Extended;
  begin
    Result := Exp(Exponent * Ln(Base));
  end;
type
  TRGB = record
    B, G, R: Byte;
  end;
  pRGB = ^TRGB;
var
  Dest: pRGB;
  X, Y: Word;
  GT: array[0..255] of Byte;
begin
  Bitmap.PixelFormat := pf24Bit;
  GT[0] := 0;
  if L = 0 then
    L := 0.01;
  for X := 1 to 255 do
    GT[X] := Round(255 * Power(X / 255, 1 / L));
  for Y := 0 to Bitmap.Height - 1 do
  begin
    Dest := Bitmap.ScanLine[y];
    for X := 0 to Bitmap.Width - 1 do
    begin
      with Dest^ do
      begin
        R := GT[R];
        G := GT[G];
        B := GT[B];
      end;
      Inc(Dest);
    end;
  end;
end;

procedure EasyFade(Bitmap: TBitmap; Down: Byte);
type
  TRGB = record
    B, G, R: Byte;
  end;
  pRGB = ^TRGB;
var
  Dest: pRGB;
  X, Y: Word;
begin
  Bitmap.PixelFormat := pf24Bit;
  for Y := 0 to Bitmap.Height - 1 do
  begin
    Dest := Bitmap.ScanLine[y];
    for X := 0 to Bitmap.Width - 1 do
    begin
      with Dest^ do
      begin
        if R < 256-Down then R := R+Down else R:=255;
        if G < 256-Down then G := G+Down else G:=255;
        if B < 256-Down then B := B+Down else B:=255;
      end;
      Inc(Dest);
    end;
  end;
end;

function GetButton(): TStrings;
begin
  Result := TStringList.Create;
  {$IFNDEF Debug}
  Result.Text := frmMain.SendCmdSmart('GetButtons');
  {$ELSE}
  Result.Text := 'Button Name,Pressed'#13#10+
'BTN_SOFT_KEY,0'#13#10+
'BTN_SCROLL_UP,0'#13#10+
'BTN_START,0'#13#10+
'BTN_BACK,0'#13#10+
'BTN_SCROLL_DOWN,0'#13#10;
  {$ENDIF}
  Result.Text := StringReplace(Result.Text, ',1', '=True', [rfReplaceAll]);
  Result.Text := StringReplace(Result.Text, ',0', '=False', [rfReplaceAll]);

  Result.Delete(0);
  Result.Delete(0);
end;

function GetDigitalSensors(): TStrings;
begin
  Result := TStringList.Create;
  {$IFNDEF Debug}
  Result.Text := frmMain.SendCmdSmart('GetDigitalSensors');
  {$ELSE}
  Result.Text := 'Digital Sensor Name, Value'#13#10+
'SNSR_DC_JACK_CONNECT,0'#13#10+
'SNSR_DUSTBIN_IS_IN,1'#13#10+
'SNSR_LEFT_WHEEL_EXTENDED,0'#13#10+
'SNSR_RIGHT_WHEEL_EXTENDED,0'#13#10+
'LSIDEBIT,0'#13#10+
'LFRONTBIT,0'#13#10+
'RSIDEBIT,0'#13#10+
'RFRONTBIT,0'#13#10;
  {$ENDIF}
  Result.Text := StringReplace(Result.Text, ',1', '=True', [rfReplaceAll]);
  Result.Text := StringReplace(Result.Text, ',0', '=False', [rfReplaceAll]);

  Result.Delete(0);
  Result.Delete(0);
end;

function GetAnalogSensors(): TStrings;
begin
  Result := TStringList.Create;
  {$IFNDEF Debug}
  Result.Text := frmMain.SendCmdSmart('GetAnalogSensors');
  {$ELSE}
  Result.Text := 'SensorName,Value'#13#10+
'WallSensorInMM,34585'#13#10+
'BatteryVoltageInmV,19761'#13#10+
'LeftDropInMM,60'#13#10+
'RightDropInMM,60'#13#10+
'RightMagSensor,0'#13#10+
'LeftMagSensor,0'#13#10+
'XTemp0InC,28'#13#10;
  {$ENDIF}
  Result.Text := StringReplace(Result.Text, ','#13#10, #13#10, [rfReplaceAll]);
  Result.Text := StringReplace(Result.Text, ',', '=', [rfReplaceAll]);

  Result.Delete(0);
  Result.Delete(0);
end;

function GetCharger(): TStrings;
begin
  Result := TStringList.Create;
  {$IFNDEF Debug}
  Result.Text := frmMain.SendCmdSmart('GetCharger');
  {$ELSE}
  Result.Text :=
'GetCharger'#13#10+
'Charger Variable Name, Value'#13#10+
'FuelPercent,100'#13#10+
'BatteryOverTemp,0'#13#10+
'ChargingActive,0'#13#10+
'ChargingEnabled,0'#13#10+
'ConfidentOnFuel,0'#13#10+
'OnReservedFuel,0'#13#10+
'EmptyFuel,0';
  {$ENDIF}
  Result.Text := StringReplace(Result.Text, ','#13#10, #13#10, [rfReplaceAll]);
  Result.Text := StringReplace(Result.Text, ',', '=', [rfReplaceAll]);

  if Result.Count > 1 then
    Result.Delete(0);
  if Result.Count > 1 then
    Result.Delete(0);
end;

function GetFuelPercent(): Integer;
var tmpStrs: TStrings;
begin
  tmpStrs := TStringList.Create;
  try
    tmpStrs := GetCharger();
    if tmpStrs.Count > 0 then
      Result := StrToIntDef(tmpStrs.Values['FuelPercent'], 100) else
      Result := 0;
  finally
    tmpStrs.Free;
  end;
end;

function GetBattV(): Real;
var
  tmpStrs: TStrings;
  frmset: TFormatSettings;
begin
  tmpStrs := TStringList.Create;
  try
    frmset.DecimalSeparator := '.';
    //'VBattV=14.52'
    tmpStrs := GetCharger();
    Result := StrToFloatDef(tmpStrs.Values['VBattV'], 0, frmset);
  finally
    tmpStrs.Free;
  end;
end;

procedure SetTestMode(ModeOn: boolean);
begin
  if ModeOn then
    frmMain.SendCmdSmart('TestMode On') else
    frmMain.SendCmdSmart('TestMode Off');
end;

function GetRobotTime(): TTime;
var
  tmpStr: TStrings;
  r : TRegExpr;
begin
  result := -1;
  r := TRegExpr.Create;
  r.ModifierM := true;
  r.ModifierI := true;
  r.Expression := '[ ]+(\d+)[:](\d+)[:](\d+)';
{$IFNDEF Debug}
  r.InputString := frmMain.SendCmdSmart('GetTime');
{$ELSE}
  r.InputString :=
'DayOfWeek HourOf24:Min:Sec'#13#10+
'Example:'#13#10+
'Sunday 13:57:09'#13#10;
{$ENDIF}
  tmpStr := TStringList.Create;
  if r.Exec then
  try
    Result := EncodeTime(
      StrToIntDef(r.Match[1], 99),
      StrToIntDef(r.Match[2], 99),
      StrToIntDef(r.Match[3], 99),
      0);
  except
    on EConvertError do
      result := -1;
  end;

  tmpStr.Free;
  r.Free;
end;

// lib
function GetMyVersion(VerCount: Byte = 4):string;
type
  TVerInfo=packed record
    Nevazhno: array[0..47] of byte; // ненужные нам 48 байт
    Minor,Major,Build,Release: word; // а тут версия
  end;
var
  s:TResourceStream;
  v:TVerInfo;
begin
  result := '';
  try
    s:=TResourceStream.Create(HInstance,'#1',RT_VERSION); // достаём ресурс
    if s.Size>0 then begin
      s.Read(v,SizeOf(v)); // читаем нужные нам байты
      // версия:
      if VerCount >= 1 then
        Result := Result + IntToStr(v.Major);
      if VerCount >= 2 then
        Result := Result + '.' + IntToStr(v.Minor);
      if VerCount >= 3 then
        Result := Result + '.' + IntToStr(v.Release);
      if VerCount >= 4 then
        Result := Result + '.' + IntToStr(v.Build);
    end;
    s.Free;
  except;
  end;
end;

function GetSystemDefaultUILanguage: UINT; stdcall; external kernel32 name 'GetSystemDefaultUILanguage';
function GetSysLang: Integer;
begin
  Result := GetSystemDefaultUILanguage;
end;

//// //// //// //// //// //// //// ////  //// //// //// //// //// //// //// ////

procedure WriteFL(FileName,str:string);
var f:text;
begin
  assign(f,FileName);
  if FileExists(FileName) then
    append(f) else
    rewrite(f);
  write(f,str);
  //writeLN(f,str);
  close(f);
end;

procedure TModuleMain.RunCmdFn(N: byte);
var
  s, cmd: String;
begin
  // выполняем команду из поля
  cmd := Trim(frmMain.ConsoleRunCmd[N].Text);
  with frmMain do
    if (cmd <> '') then
    begin
      if cmd = '!time' then
      begin
        s := '================ '+TimeToStr(Now)+' ================'+#13;
      end else
      if cmd = '!test' then
      begin
        s := 'TEST1'+#13+'TEST2'+#13+'TEST3'+#13;
      end else
      if (cmd = '-') or (cmd = '=') then
      begin
        s := '================================================'+#13;
      end else
      begin
        if frmMain.Connected then
          s := SendCmd(frmMain.COMPort, cmd);
      end;
      
      if s<>'' then
      begin
        if frmMain.chSaveLogToFile.Checked then
          WriteFL(frmMain.edLogFileName.Text, s);

        // добавляем результат в консольный вывод
        memoConsole.Lines.Text := memoConsole.Lines.Text + s;
        // если строк слишком много то режем их
        while memoConsole.Lines.Count > 1000 do
          memoConsole.Lines.Delete(0);

        // скроллим в самый низ
        SendMessage(memoConsole.Handle, WM_VSCROLL, SB_BOTTOM, 0);
      end;
    end;
end;

procedure TModuleMain.TimerRunCmdTimer(Sender: TObject);
var
  i: integer;
begin
  with frmMain do
    for i:=Low(ConsoleRunCmdTimerCount) to High(ConsoleRunCmdTimerCount) do
    begin
      if ConsoleRunCmdTimerMaxCount[i]>0 then
      begin
        if ConsoleRunCmdTimerCount[i]>ConsoleRunCmdTimerMaxCount[i] then
        begin
          // cработал таймер
          ConsoleRunCmdTimerCount[i]:=0;
          RunCmdFn(i);
        end;
        Inc(ConsoleRunCmdTimerCount[i]);
      end;
    end;
end;

end.
