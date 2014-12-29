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

uses uFrmMain;

procedure TModuleMain.RunCmdFn(N: byte);
var
  s: String;
begin
  // выполняем команду из поля
  with frmMain do
    if (Trim(ConsoleRunCmd[N].Text) <> '') then
    begin
      s := SendCmd(frmMain.Port, Trim(ConsoleRunCmd[N].Text));
      if s<>'' then
      begin
        // добавляем результат в консольный вывод
        memoConsole.Lines.Text := memoConsole.Lines.Text + s;
        // если строк слишком много то режем их
        while memoConsole.Lines.Count > 1000 do
          memoConsole.Lines.Delete(0);
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
