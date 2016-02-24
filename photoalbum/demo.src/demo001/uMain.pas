unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Actions, FMX.ActnList,
  FMX.StdActns, FMX.MediaLibrary.Actions, FMX.Objects;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ActionList1: TActionList;
    Image1: TImage;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    ToolBar1: TToolBar;
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
  private
    { private êÈåæ }
  public
    { public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
begin
  Image1.Bitmap.Assign(Image);
end;

end.
