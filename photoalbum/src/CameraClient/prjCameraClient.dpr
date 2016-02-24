program prjCameraClient;

uses
  System.StartUpCopy,
  FMX.Forms,
  uCameraMain in 'uCameraMain.pas' {frmMain},
  uPhotoItemVO in 'uPhotoItemVO.pas',
  uPhotoListVO in 'uPhotoListVO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
