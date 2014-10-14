unit uFrmMain;

interface

{.$DEFINE Debug}
{$IFNDEF Debug}
{$ELSE}
{$ENDIF}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, CheckLst, ActnList, ComCtrls, Grids, ValEdit,
  DKLang, Gauges, Menus, Clipbrd;

type
  Float = Real;

  // точка локации
  TLocatePoint = record
    // координаты (1.0 - 1 мм)
    X, Y: float;
    // точность (0..1)
    Prec: float;
    // время
    Time: DWORD;
  end;
  // робот
  TRobot = record
    X, Y, Angle: float;
  end;

  TfrmMain = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Image1: TImage;
    ActionList1: TActionList;
    TabSheet3: TTabSheet;
    actScan: TAction;
    Panel1: TPanel;
    chkScanLDS: TCheckBox;
    TimerScan: TTimer;
    actSensors: TAction;
    TimerSensors: TTimer;
    GroupBox2: TGroupBox;
    Button2: TButton;
    Button3: TButton;
    actConnect: TAction;
    actDisconnect: TAction;
    GroupBox4: TGroupBox;
    listSchedule: TValueListEditor;
    btnSetSchedule: TButton;
    btnGetSchedule: TButton;
    btnTimeUpdate: TButton;
    lbSchState: TLabel;
    btnSchEn: TButton;
    btnSchDis: TButton;
    Label1: TLabel;
    GroupBox3: TGroupBox;
    textComPortN: TComboBox;
    Button4: TButton;
    Button5: TButton;
    lbComPortN: TLabel;
    chAutoDetectPort: TCheckBox;
    chAutoConnect: TCheckBox;
    GroupBox5: TGroupBox;
    textVersion: TMemo;
    Panel2: TPanel;
    chSensorAuto: TCheckBox;
    btnLoadParam: TButton;
    listSensors: TValueListEditor;
    Lng: TDKLanguageController;
    cbLanguage: TComboBox;
    lblLang: TLabel;
    actLangLoad: TAction;
    actSetSchedule: TAction;
    actGetSchedule: TAction;
    actSetCurrentTime: TAction;
    actScanLDS: TAction;
    chRemoteControl: TCheckBox;
    actRemoteControl: TAction;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    barFuelPercent: TGauge;
    MemoAbout: TMemo;
    TimerGetTime: TTimer;
    lbRobotTime2: TLabel;
    lbRobotTime: TLabel;
    actChrSet100PercentBattery: TAction;
    actChrEnableVaccum: TAction;
    actChrEnableBrush: TAction;
    PopupMenu1: TPopupMenu;
    mnCopy: TMenuItem;
    ScrollBox1: TScrollBox;
    Memo2: TMemo;
    Memo1: TMemo;
    Memo3: TMemo;
    btnSet100PercentBattery: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnEnableBrush: TButton;
    btnEnableVaccum: TButton;
    Label6: TLabel;
    Memo5: TMemo;
    Memo4: TMemo;
    lbWarnLowVoltage: TPanel;
    Memo6: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OnDeviceChange(var Msg: TMessage); message WM_DEVICECHANGE;

    procedure actScanExecute(Sender: TObject);
    procedure listSensorsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure actSensorsExecute(Sender: TObject);
    procedure chSensorAutoClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnSchEnClick(Sender: TObject);
    procedure btnSchDisClick(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure actConnectExecute(Sender: TObject);
    procedure actDisconnectExecute(Sender: TObject);
    procedure actConnectUpdate(Sender: TObject);
    procedure chAutoDetectPortClick(Sender: TObject);
    procedure cbLanguageChange(Sender: TObject);
    procedure actLangLoadExecute(Sender: TObject);
    procedure actGetScheduleExecute(Sender: TObject);
    procedure actSetScheduleExecute(Sender: TObject);
    procedure actScanLDSExecute(Sender: TObject);
    procedure actSetCurrentTimeExecute(Sender: TObject);
    procedure actRemoteControlExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDeactivate(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure TimerGetTimeTimer(Sender: TObject);
    procedure actChrSet100PercentBatteryExecute(Sender: TObject);
    procedure actChrEnableVaccumExecute(Sender: TObject);
    procedure actChrEnableBrushExecute(Sender: TObject);
    procedure mnCopyClick(Sender: TObject);
    procedure actChrCheck(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Points: array of TLocatePoint;

    Connected: boolean;
    BattV_Nornal: boolean;
    ScanRun: boolean;
    Port: THandle;

    RemoteControl: boolean;
    Speed: Integer;
    State: (stStop, stForward, stLeft, stRight, stBack);

    procedure SetPoint(X, Y: integer; C: TColor = clBlack);
    procedure ControlRobot(Key: Word);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  SetupAPI,
  DateUtils,
  RegExpr,
  uMathLib,
  uArrayAsPHP,
  uVectors, StrUtils;

  {
const
  ErrorSetPortState = 'Error setting port state (SetCommState)';
  ErrorEvent = 'WaitCommEvent IOResult = EV_ERR';
  ErrorClearPort = 'Error clearing port. (ClearCommError)';
  Sunday = 'Sunday';
  Monday = 'Monday';
  Tuesday = 'Tuesday';
  Wednesday = 'Wednesday';
  Thursda = 'Thursday';
  Friday = 'Friday';
  Saturday = 'Saturday';
  textEnabled = 'Enabled';
  textDisabled = 'Disabled';
  ErrorComPortNotDetect = 'COM port not detect';
  ErrorInvalidComPortNumber = 'invalid COM port number';
  ErrorCantOpenPortCOM = 'Can''t open port COM';
}

procedure FatalError(Text: string);
Begin
  MessageBox(frmMain.WindowHandle, PChar(Text), 'Fatal Error', 0);
  Halt(1);
enD;

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
    Dcb.Parity := NOPARITY;
    Dcb.ByteSize := 8;
    Dcb.StopBits := ONESTOPBIT;
    if not SetCommState(Result, Dcb) then
      FatalError(LangManager.ConstantValue['ErrorSetPortState']); // Error setting port state (SetCommState)

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
    ShowMessage('Connect USB');
    Result := '';
    exit;
  enD;

  Cmd := Cmd + #13;

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
        FatalError(LangManager.ConstantValue['ErrorEvent']);
      end
      else if (IOResult and EV_RXCHAR) <> 0 then
      begin
        // используем ClearCommError() для определения количества принятых символов.
        if not ClearCommError(Port, IOResult, @ComStat) then
          FatalError(LangManager.ConstantValue['ErrorClearPort']);
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

function GetButton(Port: THandle): TStrings;
begin
  Result := TStringList.Create;
  {$IFNDEF Debug}
  Result.Text := SendCmd(Port, 'GetButtons');
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

function GetDigitalSensors(Port: THandle): TStrings;
begin
  Result := TStringList.Create;
  {$IFNDEF Debug}
  Result.Text := SendCmd(Port, 'GetDigitalSensors');
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

function GetAnalogSensors(Port: THandle): TStrings;
begin
  Result := TStringList.Create;
  {$IFNDEF Debug}
  Result.Text := SendCmd(Port, 'GetAnalogSensors');
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

function GetCharger(Port: THandle): TStrings;
begin
  Result := TStringList.Create;
  {$IFNDEF Debug}
  Result.Text := SendCmd(Port, 'GetCharger');
  {$ELSE}
  Result.Text := 'Charger Variable Name, Value'#13#10+
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

  Result.Delete(0);
  Result.Delete(0);
end;

function GetFuelPercent(Port: THandle): Integer;
var tmpStrs: TStrings;
begin
  tmpStrs := TStringList.Create;
  try
    tmpStrs := GetCharger(Port);
    Result := StrToIntDef(tmpStrs.Values['FuelPercent'], 100);
  finally
    tmpStrs.Free;
  end;
end;

function GetBattV(Port: THandle): Real;
var
  tmpStrs: TStrings;
  frmset: TFormatSettings;
begin
  tmpStrs := TStringList.Create;
  try
    frmset.DecimalSeparator := '.';
    //'VBattV=14.52'
    tmpStrs := GetCharger(Port);
    Result := StrToFloatDef(tmpStrs.Values['VBattV'], 0, frmset);
  finally
    tmpStrs.Free;
  end;
end;

function GetTime(Port: THandle): TTime;
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
  r.InputString := SendCmd(Port, 'GetTime');
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

//// //// //// //// //// //// //// ////  //// //// //// //// //// //// //// ////


procedure TfrmMain.FormCreate(Sender: TObject);
var
  NF:TDEV_BROADCAST_DEVICEINTERFACE;
  i: Integer;
begin
  PageControl1.ActivePageIndex := 0;

   // Scan for language files in the app directory and register them in the LangManager object
  LangManager.ScanForLangFiles(ExtractFileDir(ParamStr(0)), '*.lng', False);
   // Fill cbLanguage with available languages
  for i := 0 to LangManager.LanguageCount-1 do
    cbLanguage.Items.AddObject(LangManager.LanguageNames[i], Pointer(LangManager.LanguageIDs[i]));

  //ToDo: !!! TMP WIP - hardcoded rus lang
  //LangManager.LanguageID := 1049;
  //ToDo: сделать авто поиск языка?
  LangManager.LanguageID := 0;
  cbLanguage.ItemIndex := 0;

  // регаем нотификацию "вставки" устройства
  NF.dbcc_size:=sizeof(TDEV_BROADCAST_DEVICEINTERFACE);
  NF.dbcc_devicetype:=DBT_DEVTYP_DEVICEINTERFACE;
  RegisterDeviceNotification(Handle,@NF,DEVICE_NOTIFY_ALL_INTERFACE_CLASSES);

  // картинка сканера
  Image1.Picture.Bitmap.Height := Image1.Height;
  Image1.Picture.Bitmap.Width := Image1.Width;
  Image1.Picture.Bitmap.Canvas.Rectangle(0, 0, Image1.Width, Image1.Height);

  // init
  Port := INVALID_HANDLE_VALUE;
  ScanRun := false;
  Connected := false;

  actLangLoad.Execute;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  actDisconnect.Execute;
end;

procedure TfrmMain.SetPoint;
begin
  Image1.Picture.Bitmap.Canvas.Brush.Color := C;
  Image1.Picture.Bitmap.Canvas.Pen.Color := C;
  Image1.Picture.Bitmap.Canvas.Ellipse(X-2, Y-2, X+2, Y+2);
end;

procedure TfrmMain.cbLanguageChange(Sender: TObject);
begin
  LangManager.LanguageID := DWORD(cbLanguage.Items.Objects[cbLanguage.ItemIndex]);
  actLangLoad.Execute;
end;

procedure TfrmMain.actScanExecute(Sender: TObject);
var
  str: string;
  strs, strs_line: ArrOfStr;
  i: integer;
  a, r, x, y: double;
begin
  if Connected then
  begin
    {$IFNDEF Debug}
    str := SendCmd(Port, 'GetLDSScan');
    {$ELSE}
    str :=
      'AngleInDegrees,DistInMM,Intensity,ErrorCodeHEX'#13#10+
      '0,221,1400,0'#13#10+
      '10,223,1396,0'#13#10+
      '20,228,1273,0';//#13#10;
    {$ENDIF}

    EasyFade(Image1.Picture.Bitmap, 16);

    SetLength(strs, 0);
    strs := explode(#13#10, str);
    SetLength(strs_line, 0);
    for i := Low(strs) to High(strs) do
    begin
      strs_line := explode(',', strs[i]);
      if Length(strs_line) = 4 then
        if StrToIntDef(strs_line[0], -1) <> -1 then
        begin
          a := DegreeToRadian(StrToInt(strs_line[0]));
          r := StrToInt(strs_line[1]) / 10;
          PolarToDescart(r, a, x, y);
          x := x + Image1.Width div 2;
          y := Image1.Height div 2 - y;
          SetPoint(round(x), round(y), clGreen);
        end;
    end;
    SetPoint(Image1.Width div 2, Image1.Height div 2, clRed);
  end;
end;

procedure TfrmMain.listSensorsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var C: TColor;
begin
  if State = [] then
    if (ARow-1 < listSensors.Strings.Count) then
      if (listSensors.Strings.ValueFromIndex[ARow-1] = 'False') then
      begin
        C := listSensors.Canvas.Brush.Color;
        listSensors.Canvas.Brush.Color := $bfbfff;
        listSensors.Canvas.Pen.Color := $bfbfff;
        listSensors.Canvas.Rectangle(Rect);
        listSensors.Canvas.TextOut(Rect.left + 2, Rect.top + 2, listSensors.Cells[ACol, ARow]);
        listSensors.Canvas.Brush.Color := C;
      end else
      if (listSensors.Strings.ValueFromIndex[ARow-1] = 'True') then
      begin
        C := listSensors.Canvas.Brush.Color;
        listSensors.Canvas.Brush.Color := $d0f0c0;
        listSensors.Canvas.Pen.Color := $d0f0c0;
        listSensors.Canvas.Rectangle(Rect);
        listSensors.Canvas.TextOut(Rect.left + 2, Rect.top + 2, listSensors.Cells[ACol, ARow]);
        listSensors.Canvas.Brush.Color := C;
      end;
end;

procedure TfrmMain.actSensorsExecute(Sender: TObject);
var
  tmpStr: TStrings;
  params: TStrings;
  i: integer;
  
begin
  if Connected and (PageControl1.ActivePageIndex = 1) then
  begin
    params := TStringList.Create;

    tmpStr := GetDigitalSensors(Port);
    tmpStr.Insert(0, '____   Digital:   ____=');
    params.AddStrings(tmpStr);
    tmpStr.Free;

    tmpStr := GetAnalogSensors(Port);
    tmpStr.Insert(0, '____   Analog:   ____=');
    params.AddStrings(tmpStr);
    tmpStr.Free;

    tmpStr := GetButton(Port);
    tmpStr.Insert(0, '____   Buttons:   ____=');
    params.AddStrings(tmpStr);
    tmpStr.Free;

    tmpStr := GetCharger(Port);
    tmpStr.Insert(0, '____   Charger:   ____=');
    params.AddStrings(tmpStr);
    tmpStr.Free;

    barFuelPercent.Progress := GetFuelPercent(Port);
    
    for i:=0 to params.Count-1 do
      listSensors.Values[params.Names[i]] := params.ValueFromIndex[i];

    params.Free;

    if RemoteControl then
      FocusControl(PageControl1);
  end;
end;

procedure TfrmMain.chSensorAutoClick(Sender: TObject);
begin
  TimerSensors.Enabled := chSensorAuto.Checked;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  SendCmd(Port, 'SetWallFollower Enable');
end;

procedure TfrmMain.Button3Click(Sender: TObject);
begin
  SendCmd(Port, 'SetWallFollower Disable');
end;

procedure TfrmMain.btnSchEnClick(Sender: TObject);
begin
  SendCmd(Port, 'SetSchedule ON');
  lbSchState.Caption := LangManager.ConstantValue['textEnabled'];
  btnSchEn.Enabled := false;
  btnSchDis.Enabled := true;
end;

procedure TfrmMain.btnSchDisClick(Sender: TObject);
begin
  SendCmd(Port, 'SetSchedule OFF');
  lbSchState.Caption := LangManager.ConstantValue['textDisabled'];
  btnSchEn.Enabled := true;
  btnSchDis.Enabled := false;
end;

procedure TfrmMain.OnDeviceChange(var Msg: TMessage);
var
  DevId: string;
begin
  if Msg.WParam=DBT_DEVICEARRIVAL then
    if PDEV_BROADCAST_HDR(Msg.LParam)^.dbch_devicetype = DBT_DEVTYP_DEVICEINTERFACE then
    begin
      DevId := PChar(@ PDEV_BROADCAST_DEVICEINTERFACE(Msg.LParam)^.dbcc_name);
      DevId := Copy(DevId, 5, 21);
      //ShowMessage(DevId);
    end;
  //вставлен новый интерфейс: \\?\USB#Vid_2108&Pid_780b#6&320b4750&0&4#{a5dcbf10-6530-11d2-901f-00c04fb951ed}
end;

procedure TfrmMain.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  if (Action as TAction).Category = 'robot' then
    begin
      (Action as TAction).Enabled := Connected;
      Handled := true;
    end;
end;

procedure TfrmMain.actConnectExecute(Sender: TObject);
var
  N: string;
  E: integer;
  V: Real;
begin
  if not Connected then
  begin
    if chAutoDetectPort.Checked then
    begin
      N := FindCOMPort($2108, $780B);
      textComPortN.Text := N;
    end else
    begin
      if Copy(UpperCase(textComPortN.Text), 1, Length('\\?\COM')) = '\\?\COM' then
        N := textComPortN.Text else
        if Copy(UpperCase(textComPortN.Text), 1, Length('COM')) = 'COM' then
        begin
          N := '\\?\' + textComPortN.Text;
        end else
        begin
          N := '';
        end;
    end;

    if N = '' then
    begin
      if chAutoDetectPort.Checked then
        ShowMessage(LangManager.ConstantValue['ErrorComPortNotDetect']) else
        ShowMessage(LangManager.ConstantValue['ErrorInvalidComPortNumber']);
      exit;
    end;

    Port := OpenCOMPort(N);
    if Port = INVALID_HANDLE_VALUE then
    begin
      E := GetLastError;
      ShowMessage(LangManager.ConstantValue['ErrorCantOpenPortCOM'] + N + #13+
        'Error: ' + SysErrorMessage(GetLastError)+' '#13+
        'Error Code: '+IntToStr(E));
      exit;
    end;

    textVersion.Text := SendCmd(Port, 'GetVersion');
    barFuelPercent.Progress := GetFuelPercent(Port);
    V := GetBattV(Port);
    BattV_Nornal := V >= 12;
    lbWarnLowVoltage.Visible := not BattV_Nornal;

    SendCmd(Port, 'TestMode on');
    Connected := true;
  end;
end;

procedure TfrmMain.actDisconnectExecute(Sender: TObject);
begin
  if Connected then
  begin
    if Port <> INVALID_HANDLE_VALUE then
      SendCmd(Port, 'TestMode off');

    CloseHandle(Port);
    Port := INVALID_HANDLE_VALUE;
    Connected := false;
  end;
end;

procedure TfrmMain.actConnectUpdate(Sender: TObject);
begin
  actConnect.Enabled := not Connected;
end;

procedure TfrmMain.chAutoDetectPortClick(Sender: TObject);
begin
  lbComPortN.Enabled := not chAutoDetectPort.Checked;
  textComPortN.Enabled := not chAutoDetectPort.Checked;
end;

procedure TfrmMain.actLangLoadExecute(Sender: TObject);
begin
  listSchedule.ItemProps['Sun'].KeyDesc := LangManager.ConstantValue['Sunday'];
  listSchedule.ItemProps['Mon'].KeyDesc := LangManager.ConstantValue['Monday'];
  listSchedule.ItemProps['Tue'].KeyDesc := LangManager.ConstantValue['Tuesday'];
  listSchedule.ItemProps['Wed'].KeyDesc := LangManager.ConstantValue['Wednesday'];
  listSchedule.ItemProps['Thu'].KeyDesc := LangManager.ConstantValue['Thursda'];
  listSchedule.ItemProps['Fri'].KeyDesc := LangManager.ConstantValue['Friday'];
  listSchedule.ItemProps['Sat'].KeyDesc := LangManager.ConstantValue['Saturday'];
end;

procedure TfrmMain.actGetScheduleExecute(Sender: TObject);
var
  tmpStr: TStrings;
  r : TRegExpr;
begin
  r := TRegExpr.Create;
  r.ModifierM := true;
  r.ModifierI := true;
  r.Expression := '(\w+)[ ]+(\d+)[:](\d+)[ ]+(\w|[-])';
{$IFNDEF Debug}
  r.InputString := SendCmd(Port, 'GetSchedule');
{$ELSE}
  r.InputString :=
'Schedule is Enabled'#13#10+
'Sun 01:00 - None -'#13#10+
'Mon 02:00 - None -'#13#10+
'Tue 03:00 R'#13#10+
'Wed 04:00 H'#13#10+
'Thu 00:01 H'#13#10+
'Fri 00:02 H'#13#10+
'Sat 00:03 H';
{$ENDIF}
  if Pos('Schedule is Enabled', r.InputString)<>0 then Begin
    lbSchState.Caption := 'Enabled';
    btnSchDis.Enabled := true;
  enD;

  if Pos('Schedule is Disable', r.InputString)<>0 then Begin
    lbSchState.Caption := 'Disabled';
    btnSchEn.Enabled := true;
  enD;

  tmpStr := TStringList.Create;
  if r.Exec then
  repeat
    //tmpStr.Add(r.Match[1]+' '+r.Match[2]+' '+r.Match[3]+' '+r.Match[4]);
    if r.Match[4] = 'H' then
      tmpStr.Values[r.Match[1]] := r.Match[2]+':'+r.Match[3] else
      tmpStr.Values[r.Match[1]] := ' ';
  until not r.ExecNext;
  listSchedule.Strings.Text := tmpStr.Text;
  btnSetSchedule.Enabled := true;

  actLangLoad.Execute();

  tmpStr.Free;
  r.Free;
end;

procedure TfrmMain.actSetScheduleExecute(Sender: TObject);
var
  i: integer;
  t: TDateTime;
begin
  for i:= 0 to 6 do
  Begin
    if listSchedule.Strings.ValueFromIndex[i]=' ' then continue;
    try
      t := StrToTime(listSchedule.Strings.ValueFromIndex[i]);
      SendCmd(Port, 'SetSchedule Day '+IntToStr(i)+' Hour '+IntToStr(HourOf(t))+' Min '+IntToStr(MinuteOf(t))+' House');
    except
      on EConvertError do
        SendCmd(Port, 'SetSchedule Day '+IntToStr(i)+' Hour 12 Min 00 None');
    end;
  enD;
{
SetSchedule Day 0 Hour 16 Min 00 None
SetSchedule Day 0 Hour 16 Min 00 House
}
end;

procedure TfrmMain.actScanLDSExecute(Sender: TObject);
begin
  SendCmd(Port, 'SetLDSRotation on');
  ScanRun := true;
  TimerScan.Enabled := chkScanLDS.Checked;
end;

procedure TfrmMain.actSetCurrentTimeExecute(Sender: TObject);
var t: TDateTime;
begin
  t := Now;
  SendCmd(Port, 'SetTime'+
    ' Day '+IntToStr(DayOfTheWeek(t) mod 7)+
    ' Hour '+IntToStr(HourOf(t))+
    ' Min '+IntToStr(MinuteOf(t))+
    ' Sec '+IntToStr(SecondOf(t))
  );
  // SetTime [Day <Day_value>] [Hour <Hour_value>] [Min <Min_value>] [Sec <Sec_value>]
end;

procedure TfrmMain.actRemoteControlExecute(Sender: TObject);
begin
  RemoteControl := chRemoteControl.Checked and Connected;
  SendCmd(Port, 'SetMotor LWheelDisable RWheelDisable');
  if RemoteControl then
  begin
    FocusControl(PageControl1);
    PageControl1.ActivePageIndex:=2;
    State := stStop;
    Speed := 0;
  end;
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if RemoteControl then
    ControlRobot(Key);
end;

procedure TfrmMain.FormDeactivate(Sender: TObject);
begin
  chRemoteControl.Checked := false;
end;

procedure TfrmMain.ControlRobot(Key: Word);
begin
  case Key of
    VK_UP: begin
      if State = stBack then
      begin
        State := stStop;
        SendCmd(Port, 'SetMotor LWheelDisable RWheelDisable');
      end else
      begin
        if State = stForward then
        begin
          if Speed < 300 then
            Speed := Speed + 50;
          SendCmd(Port, 'SetMotor LWheelDist 5000 RWheelDist 5000 Speed '+ IntToStr(Speed));
        end else
        begin
          State := stForward;
          Speed := 50;
          SendCmd(Port, 'SetMotor RWheelEnable LWheelEnable');
          SendCmd(Port, 'SetMotor LWheelDist 5000 RWheelDist 5000 Speed '+ IntToStr(Speed));//+' Accel 1');
        end;
      end;
    end;
    VK_DOWN: begin
      if State = stStop then
      begin
        State := stBack;
        SendCmd(Port, 'SetMotor RWheelEnable LWheelEnable');
        SendCmd(Port, 'SetMotor LWheelDist -5000 RWheelDist -5000 Speed 100');
      end else
      begin
        State := stStop;
        SendCmd(Port, 'SetMotor LWheelDisable RWheelDisable');
      end;
    end;
    VK_LEFT: begin
      if State = stRight then
      begin
        State := stStop;
        SendCmd(Port, 'SetMotor LWheelDisable RWheelDisable');
      end else
      begin
        State := stLeft;
        SendCmd(Port, 'SetMotor RWheelEnable LWheelEnable');
        SendCmd(Port, 'SetMotor LWheelDist -2500 RWheelDist 2500 Speed 100');
      end;
    end;
    VK_RIGHT: begin
      if State = stLeft then
      begin
        State := stStop;
        SendCmd(Port, 'SetMotor LWheelDisable RWheelDisable');
      end else
      begin
        State := stRight;
        SendCmd(Port, 'SetMotor RWheelEnable LWheelEnable');
        SendCmd(Port, 'SetMotor LWheelDist 2500 RWheelDist -2500 Speed 100');
      end;
    end;
    VK_BACK: begin
      State := stStop;
      SendCmd(Port, 'SetMotor LWheelDisable RWheelDisable');
    end;
  end;
end;

procedure TfrmMain.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if RemoteControl then
  Begin
    PageControl1.ActivePageIndex := 2;
    AllowChange := false;
  enD;
end;

procedure TfrmMain.TimerGetTimeTimer(Sender: TObject);
var t:TTime;
begin
  if Connected then
  begin
    t:=GetTime(Port);
    if t<>-1 then lbRobotTime.Caption := TimeToStr(t);
  end;
end;

procedure TfrmMain.actChrSet100PercentBatteryExecute(Sender: TObject);
begin
  SendCmd(Port, 'SetFuelGauge 90');
end;

procedure TfrmMain.actChrEnableVaccumExecute(Sender: TObject);
begin
  if Connected then
  begin
    // выставляем 100% - иначе он выключается слишком рано
    SendCmd(Port, 'SetFuelGauge 100');
    // и включаем мотор - начинаем просаживать батарею
    SendCmd(Port, 'TestMode on');
    SendCmd(Port, 'SetMotor VacuumOn');

    // делаем диссконект сами - дисконект по умолчанию выключает тестовый режим
    CloseHandle(Port);
    Port := INVALID_HANDLE_VALUE;
    Connected := false;
  end;
end;

procedure TfrmMain.actChrEnableBrushExecute(Sender: TObject);
begin
  if Connected then
  begin
    // выставляем 100% - иначе он выключается слишком рано
    SendCmd(Port, 'SetFuelGauge 100');
    // и включаем мотор - начинаем просаживать батарею
    SendCmd(Port, 'TestMode on');
    SendCmd(Port, 'SetMotor BrushEnable');
    //todo: TEMP!!!!!!!!!!!!
    SendCmd(Port, 'SetMotor Brush RPM 50');
    //SendCmd(Port, 'SetMotor Brush RPM 250');

    // делаем диссконект сами - дисконект по умолчанию выключает тестовый режим
    CloseHandle(Port);
    Port := INVALID_HANDLE_VALUE;
    Connected := false;
  end;
end;

procedure TfrmMain.mnCopyClick(Sender: TObject);
var
  Str: string;
  i: integer;
begin
  for i := listSensors.Selection.Top-1 to listSensors.Selection.Bottom-1 do
    Str := Str + listSensors.Strings[i] + #13#10;
  Clipboard.AsText := Str;
end;

procedure TfrmMain.actChrCheck(Sender: TObject);
begin
  (Sender as TAction).Enabled := BattV_Nornal and Connected;
end;

end.
