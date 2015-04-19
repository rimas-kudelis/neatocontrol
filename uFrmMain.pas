unit uFrmMain;

interface

{.$DEFINE Debug}
{$IFNDEF Debug}
{$ELSE}
{$ENDIF}

uses
  TntMenus, TntActnList,
  TntExtCtrls, TntStdCtrls, TntComCtrls,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, CheckLst, ActnList, ComCtrls, Grids, ValEdit,
  uArrayAsPHP,
  Gauges, Menus, Clipbrd, XPMan, ImgList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdException;

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
    PageControl1: TTntPageControl;
    tabScan: TTntTabSheet;
    TabSheet2: TTntTabSheet;
    Image1: TImage;
    ActionList1: TTntActionList;
    TabSheet3: TTntTabSheet;
    actScan: TTntAction;
    Panel1: TTntPanel;
    chkScanLDS: TTntCheckBox;
    TimerScan: TTimer;
    actSensors: TTntAction;
    TimerSensors: TTimer;
    GroupBox2: TTntGroupBox;
    Button2: TTntButton;
    Button3: TTntButton;
    actConnect: TTntAction;
    actDisconnect: TTntAction;
    GroupBox4: TTntGroupBox;
    listSchedule: TValueListEditor;
    btnSetSchedule: TTntButton;
    btnGetSchedule: TTntButton;
    btnTimeUpdate: TTntButton;
    lbSchState: TTntLabel;
    btnSchEn: TTntButton;
    btnSchDis: TTntButton;
    Label1: TTntLabel;
    GroupBox3: TTntGroupBox;
    textComPortN: TTntComboBox;
    Button4: TTntButton;
    Button5: TTntButton;
    lbComPortN: TTntLabel;
    chAutoDetectPort: TTntCheckBox;
    chAutoConnect: TTntCheckBox;
    GroupBox5: TTntGroupBox;
    textVersion: TTntMemo;
    Panel2: TTntPanel;
    chSensorAuto: TTntCheckBox;
    listSensors: TValueListEditor;
    cbLanguage: TTntComboBox;
    lblLang: TTntLabel;
    actSetSchedule: TTntAction;
    actGetSchedule: TTntAction;
    actSetCurrentTime: TTntAction;
    actScanLDS: TTntAction;
    chRemoteControl: TTntCheckBox;
    actRemoteControl: TTntAction;
    TabSheet4: TTntTabSheet;
    TabSheet5: TTntTabSheet;
    barFuelPercent: TGauge;
    MemoAbout: TTntMemo;
    TimerGetTime: TTimer;
    lbRobotTime2: TTntLabel;
    lbRobotTime: TTntLabel;
    actChrSet100PercentBattery: TTntAction;
    actChrEnableVaccum: TTntAction;
    actChrEnableBrush: TTntAction;
    PopupMenu1: TTntPopupMenu;
    mnCopy: TTntMenuItem;
    ScrollBox1: TScrollBox;
    Memo2: TTntMemo;
    Memo1: TTntMemo;
    Memo3: TTntMemo;
    btnSet100PercentBattery: TTntButton;
    Label2: TTntLabel;
    Label3: TTntLabel;
    Label4: TTntLabel;
    Label5: TTntLabel;
    btnEnableBrush: TTntButton;
    btnEnableVaccum: TTntButton;
    Label6: TTntLabel;
    Memo5: TTntMemo;
    Memo4: TTntMemo;
    lbWarnLowVoltage: TTntPanel;
    Memo6: TTntMemo;
    TabSheet6: TTntTabSheet;
    ScrollBox2: TScrollBox;
    paintSpectre: TPaintBox;
    memoConsole: TTntMemo;
    Panel3: TTntPanel;
    LabelR5: TTntLabel;
    actResizeScanZone: TTntAction;
    edCmd5: TTntComboBox;
    btnCmd5: TTntButton;
    LabelR6: TTntLabel;
    edCmd6: TTntComboBox;
    btnCmd6: TTntButton;
    LabelR7: TTntLabel;
    edCmd7: TTntComboBox;
    btnCmd7: TTntButton;
    LabelR8: TTntLabel;
    edCmd8: TTntComboBox;
    btnCmd8: TTntButton;
    LabelR4: TTntLabel;
    edCmd4: TTntComboBox;
    btnCmd4: TTntButton;
    LabelR9: TTntLabel;
    edCmd9: TTntComboBox;
    btnCmd9: TTntButton;
    Label13: TTntLabel;
    Panel4: TTntPanel;
    edLogFileName: TTntComboBox;
    btnSelectLogFileName: TTntButton;
    chSaveLogToFile: TTntCheckBox;
    GroupBoxTimers: TTntGroupBox;
    cbRepeatTime4: TTntComboBox;
    cbRepeatTime5: TTntComboBox;
    cbRepeatTime6: TTntComboBox;
    cbRepeatTime7: TTntComboBox;
    cbRepeatTime8: TTntComboBox;
    cbRepeatTime9: TTntComboBox;
    Button1: TButton;
    btnConnectOptions: TTntButton;
    chButtonTest: TTntCheckBox;
    TntTabSheet1: TTntTabSheet;
    ScrollBox3: TScrollBox;
    Button6: TButton;
    actCopySensorData: TTntAction;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OnDeviceChange(var Msg: TMessage); message WM_DEVICECHANGE;

    //old:
    procedure LngLanguageChanged(Sender: TObject);

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
    procedure paintSpectrePaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure actResizeScanZoneExecute(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure lbWarnLowVoltageMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnSelectLogFileNameClick(Sender: TObject);
    procedure cbRepeatTimeChange(Sender: TObject);
    procedure chSaveLogToFileClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCmd_KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actBtnRunExecute(Sender: TObject);
    procedure cbLanguageWarn(Sender: TObject);
    procedure btnConnectOptionsClick(Sender: TObject);
    procedure ClientSocketTelnetDisconnected(Sender: TObject);
    procedure chButtonTestClick(Sender: TObject);
    procedure actCopySensorDataExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Points: array of TLocatePoint;
    
    ConsoleRunCmd: array [4..9] of TTntComboBox;
    ConsoleRunCmdTimer: array [4..9] of TTntComboBox;
    ConsoleRunCmdTimerCount: array [4..9] of integer;
    ConsoleRunCmdTimerMaxCount: array [4..9] of integer;

    Connected: boolean;
    SendCmdActive: boolean;
    BattV_Nornal: boolean;
    ScanRun: boolean;
    COMPort: THandle;

    TestModeEnabled: boolean;
    RemoteControl: boolean;
    Speed: Integer;
    State: (stStop, stForward, stLeft, stRight, stBack);
    ScanData: Array [0..359] of ArrOfStr;

    ScanParseError: boolean;

    procedure SetPoint(X, Y: integer; C: TColor = clBlack);
    procedure ControlRobot(Key: Word);
    function SendCmdSmart(Cmd: String): string;
  end;

var
  frmMain: TfrmMain;

procedure FatalError(Text: string);

implementation

{$R *.dfm}

uses
  uDataModule,
  SetupAPI,
  DateUtils,
  RegExpr,
  uMathLib,
  uVectors, StrUtils, uFrmConnectionOptions;

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

////////////////////////////////////////////////////


procedure TfrmMain.FormCreate(Sender: TObject);
var
  NF: TDEV_BROADCAST_DEVICEINTERFACE;
begin
  PageControl1.ActivePageIndex := 0;

  Caption := Caption + '   ver ' + GetMyVersion(2);

  // регаем нотификацию "вставки" устройства
  NF.dbcc_size:=sizeof(TDEV_BROADCAST_DEVICEINTERFACE);
  NF.dbcc_devicetype:=DBT_DEVTYP_DEVICEINTERFACE;
  RegisterDeviceNotification(Handle,@NF,DEVICE_NOTIFY_ALL_INTERFACE_CLASSES);

  // init
  ConsoleRunCmd[4]:=edCmd4;
  ConsoleRunCmd[5]:=edCmd5;
  ConsoleRunCmd[6]:=edCmd6;
  ConsoleRunCmd[7]:=edCmd7;
  ConsoleRunCmd[8]:=edCmd8;
  ConsoleRunCmd[9]:=edCmd9;
  ConsoleRunCmdTimer[4]:=cbRepeatTime4;
  ConsoleRunCmdTimer[5]:=cbRepeatTime5;
  ConsoleRunCmdTimer[6]:=cbRepeatTime6;
  ConsoleRunCmdTimer[7]:=cbRepeatTime7;
  ConsoleRunCmdTimer[8]:=cbRepeatTime8;
  ConsoleRunCmdTimer[9]:=cbRepeatTime9;

  COMPort := INVALID_HANDLE_VALUE;
  ScanRun := false;
  Connected := false;
end;

procedure TfrmMain.LngLanguageChanged(Sender: TObject);
begin
{
  listSchedule.ItemProps['Sun'].KeyDesc := LangManager.ConstantValue['sunday'];
  listSchedule.ItemProps['Mon'].KeyDesc := LangManager.ConstantValue['Monday'];
  listSchedule.ItemProps['Tue'].KeyDesc := LangManager.ConstantValue['Tuesday'];
  listSchedule.ItemProps['Wed'].KeyDesc := LangManager.ConstantValue['Wednesday'];
  listSchedule.ItemProps['Thu'].KeyDesc := LangManager.ConstantValue['Thursda'];
  listSchedule.ItemProps['Fri'].KeyDesc := LangManager.ConstantValue['Friday'];
  listSchedule.ItemProps['Sat'].KeyDesc := LangManager.ConstantValue['Saturday'];
  listSchedule.Refresh;
  Caption := Caption + '   ver ' + GetMyVersion(2);

  cbRepeatTime4.Hint:=GroupBoxTimers.Hint;
  cbRepeatTime5.Hint:=GroupBoxTimers.Hint;
  cbRepeatTime6.Hint:=GroupBoxTimers.Hint;
  cbRepeatTime7.Hint:=GroupBoxTimers.Hint;
  cbRepeatTime8.Hint:=GroupBoxTimers.Hint;
  cbRepeatTime9.Hint:=GroupBoxTimers.Hint;

  btnCmd5.Caption := btnCmd4.Caption;
  btnCmd6.Caption := btnCmd4.Caption;
  btnCmd7.Caption := btnCmd4.Caption;
  btnCmd8.Caption := btnCmd4.Caption;
  btnCmd9.Caption := btnCmd4.Caption;
}
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

procedure TfrmMain.actScanExecute(Sender: TObject);
var
  str: string;
  strs, strs_line: ArrOfStr;
  i, aint: integer;
  a, r, x, y: double;
begin
  if Connected then
  begin
    {$IFNDEF Debug}
    str := frmMain.SendCmdSmart('GetLDSScan');
    {$ELSE}
    str :=
      'AngleInDegrees,DistInMM,Intensity,ErrorCodeHEX'#13#10+
      '0,221,1400,0'#13#10+
      '10,223,1396,0'#13#10+
      '20,228,1273,0';//#13#10;
    {$ENDIF}

    EasyFade(Image1.Picture.Bitmap, 16);

    // центр робота
    ModuleMain.ImageListNeato.Draw(
      Image1.Picture.Bitmap.Canvas,
      (Image1.Width div 2)-10,
      (Image1.Height div 2)-16,
      0);
    SetPoint(Image1.Width div 2, Image1.Height div 2, clRed);
    
    SetLength(strs, 0);
    // нарезали на строчки
    strs := explode(#13#10, str);
    SetLength(strs_line, 0);
    for i := Low(strs) to High(strs) do
    begin
      // нарезали строчку на элементы
      strs_line := explode(',', strs[i]);
      if Length(strs_line) = 4 then
        if StrToIntDef(strs_line[0], -1) <> -1 then
        begin
          aint := StrToIntDef(strs_line[0], -1);
          if (aint>=0) and (aint<=359) then
          begin
            // перевели координаты из полярных в обычные
            // незнаю почему но у моего робота наблюдается скос на 5 градусов, если вычесть то получается все точно
            //a := DegreeToRadian(aint-5);
            a := DegreeToRadian(aint);
            r := StrToInt(strs_line[1]) / 10;
            if r>0 then
            begin
              PolarToDescart(r, a, x, y);
              // ставим точку относительно центра холста
              x := x + Image1.Width div 2;
              y := Image1.Height div 2 - y;
              SetPoint(round(x), round(y), clGreen);
            end;
            // заполняем 'спектр'
            ScanData[aint]:=strs_line;
          end else
          begin
            ScanParseError := true;
          end;
        end;
    end;
    paintSpectre.Repaint;
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

    if TestModeEnabled then
    begin
      tmpStr := GetButton();
      tmpStr.Insert(0, '____   Buttons:   ____=');
      params.AddStrings(tmpStr);
      tmpStr.Free;
    end;

    tmpStr := GetDigitalSensors();
    tmpStr.Insert(0, '____   Discrete:   ____=');
    params.AddStrings(tmpStr);
    tmpStr.Free;

    tmpStr := GetAnalogSensors();
    tmpStr.Insert(0, '____   Analog:   ____=');
    params.AddStrings(tmpStr);
    tmpStr.Free;

    tmpStr := GetCharger();
    tmpStr.Insert(0, '____   Charger:   ____=');
    params.AddStrings(tmpStr);
    tmpStr.Free;

    barFuelPercent.Progress := GetFuelPercent();
    
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

procedure TfrmMain.chButtonTestClick(Sender: TObject);
begin
  if chButtonTest.Checked then
    SetTestMode(true) else
    SetTestMode(false);
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  SendCmdSmart('SetWallFollower Enable');
end;

procedure TfrmMain.Button3Click(Sender: TObject);
begin
  SendCmdSmart('SetWallFollower Disable');
end;

procedure TfrmMain.btnSchEnClick(Sender: TObject);
begin
  SendCmdSmart('SetSchedule ON');
  //lbSchState.Caption := LangManager.ConstantValue['textEnabled'];
  btnSchEn.Enabled := false;
  btnSchDis.Enabled := true;
end;

procedure TfrmMain.btnSchDisClick(Sender: TObject);
begin
  SendCmdSmart('SetSchedule OFF');
  //lbSchState.Caption := LangManager.ConstantValue['textDisabled'];
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
  if (Action as TTntAction).Category = 'robot' then
    begin
      (Action as TTntAction).Enabled := Connected;
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
    if (not chAutoDetectPort.Checked) and
      (Copy(UpperCase(textComPortN.Text), 1, Length('TCP:')) = 'TCP:') then
    begin
      E := PosEx(':', textComPortN.Text, 5);
      if E = 0 then
        ModuleMain.ClientSocketTelnet.Host := Copy(textComPortN.Text, 5, 1000) else
        ModuleMain.ClientSocketTelnet.Host := Copy(textComPortN.Text, 5, E-5);
      if E <> 0 then
        ModuleMain.ClientSocketTelnet.Port := StrToIntDef(Copy(textComPortN.Text, E+1, 100), 21);

      ModuleMain.ClientSocketTelnet.Connect(1000);
      // если порт не откроется,
      // то произойдет исключение,
      // и мы выйдем из процедуры прямо из этой точки.
    end else
    begin
    
      // Auto or Manual:
      if chAutoDetectPort.Checked then
      begin
        // Neato XV-21, XV-12
        N := FindCOMPort($2108, $780B);
        // Neato BotVac
        if N='' then
          N := FindCOMPort($2108, $780C);
        // Neato Vorwerk vr100 vr200
        //if N='' then
        //  N := FindCOMPort($21??, $78??);
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
          ShowMessage('Error - Com Port Not Detect') else
          //ShowMessage(LangManager.ConstantValue['ErrorComPortNotDetect']) else
          ShowMessage('Error - Invalid Com Port Number');
          //ShowMessage(LangManager.ConstantValue['ErrorInvalidComPortNumber']);
        exit;
      end;

      COMPort := OpenCOMPort(N);
      if COMPort = INVALID_HANDLE_VALUE then
      begin
        E := GetLastError;
        ShowMessage('Error - Cant Open Port COM' + N + #13+
        //ShowMessage(LangManager.ConstantValue['ErrorCantOpenPortCOM'] + N + #13+
          'Error: ' + SysErrorMessage(GetLastError)+' '#13+
          'Error Code: '+IntToStr(E));
        exit;
      end;
    end;

    Connected := true;
    textVersion.Text := SendCmdSmart('GetVersion');
    barFuelPercent.Progress := GetFuelPercent();
    V := GetBattV();
    BattV_Nornal := V >= 12;
    lbWarnLowVoltage.Visible := not BattV_Nornal;

    //OLD: SetTestMode(true);
  end;
end;

procedure TfrmMain.actDisconnectExecute(Sender: TObject);
begin
  if Connected then
  begin
    //todo: OFF?
    SetTestMode(false);

    //todo: net...
    CloseHandle(COMPort);
    COMPort := INVALID_HANDLE_VALUE;
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
  r.InputString := SendCmdSmart('GetSchedule');
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

  // обновить перевод расписания
  LngLanguageChanged(nil);

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
      SendCmdSmart('SetSchedule Day '+IntToStr(i)+' Hour '+IntToStr(HourOf(t))+' Min '+IntToStr(MinuteOf(t))+' House');
    except
      // if bad data format then just disable this day in schedule
      on EConvertError do
        SendCmdSmart('SetSchedule Day '+IntToStr(i)+' Hour 12 Min 00 None');
    end;
  enD;
{
SetSchedule Day 0 Hour 16 Min 00 None
SetSchedule Day 0 Hour 16 Min 00 House
}
end;

procedure TfrmMain.actScanLDSExecute(Sender: TObject);
begin
  if chkScanLDS.Checked and TestModeEnabled then
  begin
    SetTestMode(true);
    SendCmdSmart('SetLDSRotation on');
    ScanRun := true;
    TimerScan.Enabled := true;
  end else
  begin
    SendCmdSmart('SetLDSRotation off');
    SetTestMode(false);
    ScanRun := false;
    TimerScan.Enabled := false;
  end;
end;

procedure TfrmMain.actSetCurrentTimeExecute(Sender: TObject);
var t: TDateTime;
begin
  t := Now;
  SendCmdSmart('SetTime'+
    ' Day '+IntToStr(DayOfTheWeek(t) mod 7)+
    ' Hour '+IntToStr(HourOf(t))+
    ' Min '+IntToStr(MinuteOf(t))+
    ' Sec '+IntToStr(SecondOf(t))
  );
  // SetTime [Day <Day_value>] [Hour <Hour_value>] [Min <Min_value>] [Sec <Sec_value>]
end;

procedure TfrmMain.actRemoteControlExecute(Sender: TObject);
begin
  if chRemoteControl.Checked then
  begin
    SetTestMode(true);
    RemoteControl := chRemoteControl.Checked and Connected and TestModeEnabled;
    SendCmdSmart('SetMotor LWheelDisable RWheelDisable');

    if RemoteControl then
    begin
      FocusControl(PageControl1);
      PageControl1.ActivePageIndex:=2;
      State := stStop;
      Speed := 0;
    end;
  end else
    SetTestMode(false);
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
        SendCmdSmart('SetMotor LWheelDisable RWheelDisable');
      end else
      begin
        if State = stForward then
        begin
          if Speed < 300 then
            Speed := Speed + 50;
          SendCmdSmart('SetMotor LWheelDist 5000 RWheelDist 5000 Speed '+ IntToStr(Speed));
        end else
        begin
          State := stForward;
          Speed := 50;
          SendCmdSmart('SetMotor RWheelEnable LWheelEnable');
          SendCmdSmart('SetMotor LWheelDist 5000 RWheelDist 5000 Speed '+ IntToStr(Speed));//+' Accel 1');
        end;
      end;
    end;
    VK_DOWN: begin
      if State = stStop then
      begin
        State := stBack;
        SendCmdSmart('SetMotor RWheelEnable LWheelEnable');
        SendCmdSmart('SetMotor LWheelDist -5000 RWheelDist -5000 Speed 100');
      end else
      begin
        State := stStop;
        SendCmdSmart('SetMotor LWheelDisable RWheelDisable');
      end;
    end;
    VK_LEFT: begin
      if State = stRight then
      begin
        State := stStop;
        SendCmdSmart('SetMotor LWheelDisable RWheelDisable');
      end else
      begin
        State := stLeft;
        SendCmdSmart('SetMotor RWheelEnable LWheelEnable');
        SendCmdSmart('SetMotor LWheelDist -2500 RWheelDist 2500 Speed 100');
      end;
    end;
    VK_RIGHT: begin
      if State = stLeft then
      begin
        State := stStop;
        SendCmdSmart('SetMotor LWheelDisable RWheelDisable');
      end else
      begin
        State := stRight;
        SendCmdSmart('SetMotor RWheelEnable LWheelEnable');
        SendCmdSmart('SetMotor LWheelDist 2500 RWheelDist -2500 Speed 100');
      end;
    end;
    VK_BACK: begin
      State := stStop;
      SendCmdSmart('SetMotor LWheelDisable RWheelDisable');
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
    t:=GetRobotTime();
    if t<>-1 then lbRobotTime.Caption := TimeToStr(t);
  end;
end;

procedure TfrmMain.actChrSet100PercentBatteryExecute(Sender: TObject);
begin
  SendCmdSmart('SetFuelGauge 90');
end;

procedure TfrmMain.actChrEnableVaccumExecute(Sender: TObject);
begin
  if Connected then
  begin
    // выставляем 100% - иначе он выключается слишком рано
    SendCmdSmart('SetFuelGauge 100');
    // и включаем мотор - начинаем просаживать батарею
    SetTestMode(true);
    SendCmdSmart('SetMotor VacuumOn');

    // делаем диссконект сами - дисконект по умолчанию выключает тестовый режим
    //todo: net
    CloseHandle(COMPort);
    COMPort := INVALID_HANDLE_VALUE;
    Connected := false;
  end;
end;

procedure TfrmMain.actChrEnableBrushExecute(Sender: TObject);
begin
  if Connected then
  begin
    // выставляем 100% - иначе он выключается слишком рано
    SendCmdSmart('SetFuelGauge 100');
    // и включаем мотор - начинаем просаживать батарею
    SetTestMode(true);
    SendCmdSmart('SetMotor BrushEnable');
    SendCmdSmart('SetMotor Brush RPM 250');

    // делаем диссконект сами - дисконект по умолчанию выключает тестовый режим
    //todo: net
    CloseHandle(COMPort);
    COMPort := INVALID_HANDLE_VALUE;
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
  (Sender as TTntAction).Enabled := BattV_Nornal and Connected;
end;

procedure TfrmMain.paintSpectrePaint(Sender: TObject);
var
  i, inten, dist: integer;
  pixwidht: float;
begin
  // AngleInDegrees, DistInMM, Intensity,ErrorCodeHEX
  // 0,              221,      1400,     0

  paintSpectre.Canvas.Pen.Style := psClear;
  paintSpectre.Canvas.Brush.Style := bsSolid;
  paintSpectre.Canvas.Brush.Color := clBlack;
  pixwidht := paintSpectre.ClientWidth / 360;
  // рисуем 'спектр'
  for i:=0 to 359 do
  begin
    if Length(ScanData[i])=0 then
      paintSpectre.Canvas.Brush.Color := clWhite;
    if Length(ScanData[i])=4 then
    begin
      paintSpectre.Canvas.Brush.Color := clBlack;
      paintSpectre.Canvas.Rectangle(round(i*pixwidht), 0, round((i+1)*pixwidht)+1, paintSpectre.ClientHeight);

      inten := StrToIntDef(ScanData[i][2], 0);
      dist := StrToIntDef(ScanData[i][1], 0);

      // рисуем интенсивность
      if (inten > 0) then
      begin
        paintSpectre.Canvas.Brush.Color := RGB(0, Trunc(Interpolation2Clamp(0, 1400, 0, 255, inten)), 0);
        paintSpectre.Canvas.Rectangle(round(i*pixwidht), 0, round((i+1)*pixwidht)+1, paintSpectre.ClientHeight div 2);
      end;

      // рисуем дистанцию
      if (dist > 0) then
      begin
        paintSpectre.Canvas.Brush.Color := RGB(0, 0, Trunc(Interpolation2Clamp(150, 4000, 255, 0, dist)));
        paintSpectre.Canvas.Rectangle(round(i*pixwidht), paintSpectre.ClientHeight div 2, round((i+1)*pixwidht)+1, paintSpectre.ClientHeight);
      end;

      // если есть ошибка
      if (ScanData[i][3] <> '0') then
      begin
        paintSpectre.Canvas.Brush.Color := clRed;
        paintSpectre.Canvas.Rectangle(round(i*pixwidht), 0, round((i+1)*pixwidht)+1, paintSpectre.ClientHeight div 3);
        paintSpectre.Canvas.Brush.Color := clBlack;
      end;

    end else
      paintSpectre.Canvas.Brush.Color := clMaroon;
    if (pixwidht > 2.8) then
      paintSpectre.Canvas.Pixels[round(i*pixwidht), 0] := clBlack;
  end;
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  actResizeScanZone.Execute();
end;

procedure TfrmMain.actResizeScanZoneExecute(Sender: TObject);
begin
  // картинка сканера
  Image1.Picture.Bitmap.Height := Image1.Height;
  Image1.Picture.Bitmap.Width := Image1.Width;
  Image1.Picture.Bitmap.Canvas.Brush.Color := clWhite;
  Image1.Picture.Bitmap.Canvas.Rectangle(0, 0, Image1.Width, Image1.Height);
end;

procedure TfrmMain.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage.Name = 'tabScan' then
    actResizeScanZone.Execute();
end;

procedure TfrmMain.lbWarnLowVoltageMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // секретная комбинация - выключает проверку на напряжение
  if (ssCtrl in Shift) and (ssAlt in Shift) then
  begin
    lbWarnLowVoltage.Visible := false;
    BattV_Nornal := true;
  end;
end;

procedure TfrmMain.btnSelectLogFileNameClick(Sender: TObject);
begin
  if ModuleMain.SaveDialogLogFile.Execute then
    edLogFileName.Text := ModuleMain.SaveDialogLogFile.FileName;
end;

procedure TfrmMain.cbRepeatTimeChange(Sender: TObject);
var c: TTntComboBox;
begin
  if (Sender is TTntComboBox) then
  begin
    c := Sender as TTntComboBox;
    ConsoleRunCmdTimerMaxCount[c.Tag] := StrToIntDef(c.Text, 0);
  end;
end;

procedure TfrmMain.chSaveLogToFileClick(Sender: TObject);
begin
  edLogFileName.Enabled := chSaveLogToFile.Checked;
  btnSelectLogFileName.Enabled := chSaveLogToFile.Checked;
end;

procedure TfrmMain.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key >= VK_F4) and (Key <= VK_F9) then
    ModuleMain.RunCmdFn(Key - VK_F1 + 1);
end;

procedure TfrmMain.edCmd_KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if (Sender is TComponent) then
    begin
      ModuleMain.RunCmdFn((Sender as TComponent).Tag);
    end;
  end;
end;

procedure TfrmMain.actBtnRunExecute(Sender: TObject);
begin
  ModuleMain.RunCmdFn((Sender as TComponent).Tag);
end;

procedure TfrmMain.cbLanguageWarn(Sender: TObject);
begin
  {
   Мне надоели глюки DKLang и его огромные коды.
   Я потратил в течении месяца все доступные свободные часы (а их немного)
   и потратил их не на улучшение программы а на затяжную войну с DKLang,XE6,TNT,UTF8,RES...
   Все хватит, надоело, лучше потом какнибудь приделаю самодельный перевод...
   А вот TNT контролы оставлю пока - посмотрим может они нормальные. 

   Нет, серьезно, 150 килобайт это просто непомерно огромный код
   для такой простой функции как присваивание текста в контролы из файла!
  }
  
  ShowMessage('Sorry, translation disabled. =('+#13+
     '(it''s temporarily)');
end;

function TfrmMain.SendCmdSmart(Cmd: String): string;
var
  c: Char;
  t: DWORD;
begin
  Result := '';
  if (not SendCmdActive) and Connected then
  try
    SendCmdActive := true;
{
work only in TestMode:
  TestMode
  SetMotor
  SetLED
  SetLCD
  SetLDSRotation
  SetSystemMode
  TestLDS
}

    Cmd := Trim(Cmd);
    if UpperCase(Cmd)='TESTMODE ON' then TestModeEnabled := true;
    if UpperCase(Cmd)='TESTMODE OFF' then TestModeEnabled := false;
    //if IsTestModeCmd(Cmd) and not TestModeEnabled then exit;

    // добавляем перенос строки
    Cmd := Cmd + #13;

    if ModuleMain.ClientSocketTelnet.Connected and Connected
    then
      begin
        ModuleMain.ClientSocketTelnet.Write(Cmd);

        t := GetTickCount+10000;
        // пытаемся получить данные
        while c <> #$1A do
        begin
          try
            ModuleMain.ClientSocketTelnet.ReadBuffer(c, 1);
          except
            on EIdReadTimeOut do
            begin
              Connected := false;
              ShowMessage('network: Read is time out. Disconected.');
              Result := '';
              break;
            end;
          end;
          Result := Result + c;
          // обрабатываем сообщения - плохая идея, могут быть проблемы с двойной посылкой сообщений и тд.
          Application.ProcessMessages;
          // выходим если 10 секунд нет ответа
          if GetTickCount > t then
          begin
            Result := '';
            break;
          end;
        end;
      end
    else
    begin
      //ToDo: нужно както по другому проверять хэндл
      //if Port <> INVALID_HANDLE_VALUE then

      if COMPort <> INVALID_HANDLE_VALUE then
        Result := SendCmd(COMPort, Cmd);
    end;


    // отрезаем #1A в конце
    if (Result<>'') and (Result[Length(Result)]=#$1A) then
      SetLength(Result, Length(Result)-1);

  finally
    SendCmdActive := false;
  end;
end;

procedure TfrmMain.btnConnectOptionsClick(Sender: TObject);
begin
  if frmConnectionOptions.ShowModal = mrOk then
  begin
    //WIP...
  end;
end;

procedure TfrmMain.ClientSocketTelnetDisconnected(Sender: TObject);
begin
  Connected := false;
end;

procedure TfrmMain.actCopySensorDataExecute(Sender: TObject);
begin
  if Connected then
    Clipboard.AsText := listSensors.Strings.Text;
end;

end.
