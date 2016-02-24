unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FMX.Controls.Presentation, FMX.StdCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.Objects;

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
    DataSource1: TDataSource;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { private êÈåæ }
  public
    { public êÈåæ }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
var   MS: TMemoryStream;
begin
MS:=TMemoryStream.Create;
FDQuery1.First;
FDQuery1PHOTODATA.SaveToStream(MS);
MS.Seek(0,0);
Image1.Bitmap.LoadFromStream(MS);

end;

end.
