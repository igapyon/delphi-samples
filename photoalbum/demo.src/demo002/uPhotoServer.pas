unit uPhotoServer;

// EMS Resource Module

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase;

type

  [ResourceName('photoserver')]
  TPhotoserverResource1 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDQueryGetAll: TFDQuery;
    FDQueryGetAllPHOTOID: TIntegerField;
    FDQueryGetAllPHOTOTITLE: TWideStringField;
    FDQueryGetAllPHOTODESC: TWideStringField;
    FDQueryGetAllCREATEDDATE: TSQLTimeStampField;
    FDQueryGetAllPHOTODATA: TBlobField;
    FDTable1: TFDTable;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDTable1PHOTOID: TIntegerField;
    FDTable1PHOTOTITLE: TWideStringField;
    FDTable1PHOTODESC: TWideStringField;
    FDTable1CREATEDDATE: TSQLTimeStampField;
    FDTable1PHOTODATA: TBlobField;
    FDQueryGetMax: TFDQuery;
    FDQueryGetMaxMAX: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  published
    procedure Get(const AContext: TEndpointContext;
      const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
    procedure Post(const AContext: TEndpointContext;
      const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  end;

implementation

uses Data.SqlTimSt, REST.JSON, uPhotoListVO, uPhotoItemVO;

{ %CLASSGROUP 'System.Classes.TPersistent' }

{$R *.dfm}

procedure TPhotoserverResource1.DataModuleCreate(Sender: TObject);
begin

end;

// 写真一覧を取得します。
procedure TPhotoserverResource1.Get(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  photolist: TPhotoListVO;
  photoitem: TPhotoItemVO;

begin
  photolist := TPhotoListVO.Create;

  FDQueryGetAll.Active := True;

  FDQueryGetAll.First;

  while not FDQueryGetAll.Eof do
  begin
    photoitem := TPhotoItemVO.Create;
    photoitem.PhotoId := FDQueryGetAllPHOTOID.Value;
    photoitem.PhotoTitle := FDQueryGetAllPHOTOTITLE.Value;
    photoitem.PhotoDesc := FDQueryGetAllPHOTODESC.Value;
    photoitem.CreatedDate := SQLTimeStampToDateTime
      (FDQueryGetAllCREATEDDATE.Value);
    photoitem.PhotoData := FDQueryGetAllPHOTODATA.Value;

    photolist.AddItem(photoitem);

    FDQueryGetAll.Next;
  end;

  AResponse.Body.SetValue(TJson.ObjectToJsonObject(photolist), True);
end;

// 新たに写真を１つ追加します。
procedure TPhotoserverResource1.Post(const AContext: TEndpointContext;
  const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
begin
  // ここにコードを記述
end;

procedure Register;
begin
  RegisterResource(TypeInfo(TPhotoserverResource1));
end;

initialization

Register;

end.
