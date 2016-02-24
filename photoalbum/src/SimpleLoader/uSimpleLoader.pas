unit uSimpleLoader;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase,
  Data.DB, Vcl.StdCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    Button1: TButton;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDTable1: TFDTable;
    FDTable1PHOTOID: TIntegerField;
    FDTable1PHOTOTITLE: TWideStringField;
    FDTable1PHOTODESC: TWideStringField;
    FDTable1CREATEDDATE: TSQLTimeStampField;
    FDTable1PHOTODATA: TBlobField;
    procedure Button1Click(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  FDTable1.Active := True;
  FDTable1.Append;
  FDTable1PHOTOID.Value := 3;
  FDTable1PHOTOTITLE.Value := 'ãﬂåi';
  FDTable1PHOTODESC.Value := 'Ç‡ÇÕÇ‚10îNëOÇÃé ê^';
  FDTable1CREATEDDATE.AsDateTime := Now;
  FDTable1PHOTODATA.LoadFromFile('C:\Users\user1\Pictures\iga200306.png');
  FDTable1.Post;

  FDTable1.Active := False;
end;

end.
