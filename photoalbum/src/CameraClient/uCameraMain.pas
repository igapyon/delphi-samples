unit uCameraMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions,
  FMX.ActnList, FMX.StdActns, FMX.MediaLibrary.Actions, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  IPPeerClient, REST.Backend.ServiceTypes, System.JSON,
  REST.Backend.EMSServices, REST.Backend.EMSProvider, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Client, REST.Backend.EndPoint, FMX.Edit,
  FMX.Layouts;

type
  TfrmMain = class(TForm)
    Image1: TImage;
    ActionList1: TActionList;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    toolbarTop: TToolBar;
    btnTake: TButton;
    TabControl1: TTabControl;
    tabitemTake: TTabItem;
    tabitemList: TTabItem;
    ToolBar1: TToolBar;
    btnList: TButton;
    ListView1: TListView;
    backGetAll: TBackendEndpoint;
    EMSProvider1: TEMSProvider;
    backPostItem: TBackendEndpoint;
    Layout1: TLayout;
    edtTitle: TEdit;
    edtDesc: TEdit;
    Layout2: TLayout;
    Layout3: TLayout;

    procedure btnListClick(Sender: TObject);
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
  private
    { private 宣言 }
  public
    { public 宣言 }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses uPhotoItemVO, uPhotoListVO, uDMAlbum, REST.JSON, REST.Types;

procedure TfrmMain.btnListClick(Sender: TObject);
var
  photolist: TPhotoListVO;
  photoitem: TPhotoItemVO;
  photoListSize: Integer;
  index: Integer;
  listviewitem: TListViewItem;
  ms: TMemoryStream;
begin
  // いったんクリアします。
  // ここにコメントを書く。
  ListView1.Items.Clear;

  ms := TMemoryStream.Create;
  backGetAll.Execute;

  photolist := TJson.JsonToObject<TPhotoListVO>(backGetAll.Response.JSONText);

  photoListSize := Length(photolist.GetItems);
  for index := 0 to photoListSize - 1 do
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

procedure TfrmMain.TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
var
  photoitem: TPhotoItemVO;
  ms: TMemoryStream;
begin
  Image1.Bitmap.Assign(Image);

  photoitem := TPhotoItemVO.Create;
  photoitem.PhotoTitle := edtTitle.Text;
  photoitem.PhotoDesc := edtDesc.Text;

  ms := TMemoryStream.Create;
  Image1.Bitmap.CreateThumbnail(50, 50).SaveToStream(ms);

  photoitem.SetPhotoDataFromStream(ms);
  FreeAndNil(ms);

  backPostItem.ClearBody;
  backPostItem.AddBody(TJson.ObjectToJsonObject(photoitem).ToString,
    TRESTContentType.ctAPPLICATION_JSON);
  backPostItem.Execute;

end;

end.
