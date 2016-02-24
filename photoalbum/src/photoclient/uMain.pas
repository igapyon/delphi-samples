unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  REST.Backend.ServiceTypes, System.JSON, REST.Backend.EMSServices,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Client,
  REST.Backend.EndPoint, FMX.Controls.Presentation, FMX.StdCtrls,
  REST.Backend.EMSProvider, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView;

type
  TForm2 = class(TForm)
    EMSProvider1: TEMSProvider;
    Button1: TButton;
    backGetAll: TBackendEndpoint;
    ListView1: TListView;
    backPostItem: TBackendEndpoint;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { private êÈåæ }
  public
    { public êÈåæ }
  end;

var
  Form2: TForm2;

implementation

uses REST.JSON, REST.Types, uPhotoItemVO, uPhotoListVO;

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
var
  photolist: TPhotoListVO;
  photoitem: TPhotoItemVO;
  index: Integer;
  listviewitem: TListViewItem;
  ms: TMemoryStream;
begin
  ms := TMemoryStream.Create;
  backGetAll.Execute;

  photolist := TJson.JsonToObject<TPhotoListVO>(backGetAll.Response.JSONText);

  ListView1.Items.Clear;
  for index := 0 to Length(photolist.GetItems) - 1 do
  begin
    photoitem := photolist.GetItems[index];
    listviewitem := ListView1.Items.Add;
    listviewitem.Text := '(' + IntToStr(photoitem.PhotoId) + ') ' +
      photoitem.PhotoTitle;
    listviewitem.Detail := photoitem.PhotoDesc;
    ms := photoitem.GetPhotoDataAsStream;
    listviewitem.Bitmap.LoadFromStream(ms);
    ms.Free;
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);

var
  photoitem: TPhotoItemVO;
begin
  photoitem := TPhotoItemVO.Create;
  photoitem.PhotoId:=5;


  backPostItem.ClearBody;
  backPostItem.AddBody(TJson.ObjectToJsonObject(photoitem).ToString,
    TRESTContentType.ctAPPLICATION_JSON);
  backPostItem.Execute;

end;

end.
