program PrjPhotoClient;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {Form2},
  uPhotoItemVO in 'uPhotoItemVO.pas',
  uPhotoListVO in 'uPhotoListVO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
