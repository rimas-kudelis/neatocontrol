program NeatoControl;

uses
  Forms,
  uFrmMain in 'uFrmMain.pas' {frmMain},
  uDataModule in 'uDataModule.pas' {ModuleMain: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TModuleMain, ModuleMain);
  Application.Run;
end.
