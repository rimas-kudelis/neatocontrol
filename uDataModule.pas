unit uDataModule;

interface

uses
  SysUtils, Classes, XPMan, Dialogs, ExtCtrls;

type
  TModuleMain = class(TDataModule)
    XPManifest1: TXPManifest;
    SaveDialogLogFile: TSaveDialog;
    TimerRunCmd: TTimer;
    procedure TimerRunCmdTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RunCmdFn(N: byte);
  end;

var
  ModuleMain: TModuleMain;

implementation

{$R *.dfm}

uses
  {lazarus: JwaWinUser}
  Windows,
  Messages,
  uFrmMain;

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
          s := SendCmd(frmMain.Port, cmd);
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
