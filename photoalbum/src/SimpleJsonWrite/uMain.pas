unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FMX.Controls.Presentation, FMX.StdCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uPhotoItemVO, FMX.ScrollBox, FMX.Memo;

type
  TForm2 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    Button1: TButton;
    FDQuery1PHOTOID: TIntegerField;
    FDQuery1PHOTOTITLE: TWideStringField;
    FDQuery1PHOTODESC: TWideStringField;
    FDQuery1CREATEDDATE: TSQLTimeStampField;
    FDQuery1PHOTODATA: TBlobField;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { private êÈåæ }
  public
    { public êÈåæ }
  end;

var
  Form2: TForm2;

implementation

uses Data.SqlTimSt, REST.JSON, uPhotoListVO;

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
var
  photo: TPhotoItemVO;
  photolist: TPhotoListVO;
  wrk: string;

begin
  photolist := TPhotoListVO.Create;

  FDQuery1.Active := True;
  FDQuery1.First;
  photo := TPhotoItemVO.Create;
  photo.PhotoId := FDQuery1PHOTOID.Value;
  photo.PhotoTitle := FDQuery1PHOTOTITLE.Value;
  photo.PhotoDesc := FDQuery1PHOTODESC.Value;
  photo.CreatedDate := SQLTimeStampToDateTime(FDQuery1CREATEDDATE.Value);

  photo.PhotoData := FDQuery1PHOTODATA.Value;

  photolist.InsertItem(0, photo);

  wrk := TJson.ObjectToJsonString(photolist);
  Memo1.Lines.Text := wrk;

end;

end.
