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
  end;

var
  ModuleMain: TModuleMain;

implementation

{$R *.dfm}

uses uFrmMain;

procedure TModuleMain.TimerRunCmdTimer(Sender: TObject);
var i: integer;
begin
  with frmMain do
    for i:=Low(ConsoleRunCmdTimerCount) to High(ConsoleRunCmdTimerCount) do
    begin
      if ConsoleRunCmdTimerMaxCount[i]>0 then
      begin
        if ConsoleRunCmdTimerCount[i]>ConsoleRunCmdTimerMaxCount[i] then
        begin
          //ToDo:WIP
        end;
        Inc(ConsoleRunCmdTimerCount[i]);
      end;
    end;
end;

end.
