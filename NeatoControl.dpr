program NeatoControl;

uses
  Forms,
  uFrmMain in 'uFrmMain.pas' {frmMain},
  uDataModule in 'uDataModule.pas' {ModuleMain: TDataModule},
  uFrmConnectionOptions in 'uFrmConnectionOptions.pas' {frmConnectionOptions};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TModuleMain, ModuleMain);
  Application.CreateForm(TfrmConnectionOptions, frmConnectionOptions);
  Application.Run;
end.
