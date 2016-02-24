unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Vcl.DBCtrls, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.IBBase,
  FireDAC.Comp.UI, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDQuery1: TFDQuery;
    FDQuery1PHOTOID: TIntegerField;
    FDQuery1PHOTOTITLE: TWideStringField;
    FDQuery1PHOTODESC: TWideStringField;
    FDQuery1CREATEDDATE: TSQLTimeStampField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBNavigator1: TDBNavigator;
    Label6: TLabel;
    FDQuery1PHOTODATA: TBlobField;
    Label7: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  Stream: TStream;
  MS: TMemoryStream;
begin
  FDQuery1.Active := True;
  FDQuery1.Open('select * from photoalbum where PHOTOID = 3');
  FDQuery1.First;
  Stream := FDQuery1.CreateBlobStream(FDQuery1.FieldByName('photodata'),
    TBlobStreamMode.bmRead);
  MS := TMemoryStream.Create;
  MS.LoadFromStream(Stream);
  MS.SaveToFile('c:\Temp\test.png');

  FreeAndNil(Stream);
  FreeAndNil(MS);

  FDQuery1.Close;

end;

end.
