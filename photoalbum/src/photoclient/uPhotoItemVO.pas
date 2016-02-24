unit uPhotoItemVO;

interface

uses System.Classes, System.SysUtils;

// 写真バリューオブジェクト
type
  TPhotoItemVO = class
  private
    FPhotoId: Integer;
    FPhotoTitle: string;
    FPhotoDesc: string;
    FCreatedDate: TDateTime;
    FPhotoData: TBytes;
    procedure SetCreatedDate(const DateTime: TDateTime);

  public // コンストラクタ
    constructor Create;
    property PhotoId: Integer read FPhotoId write FPhotoId;
    property PhotoTitle: string read FPhotoTitle write FPhotoTitle;
    property PhotoDesc: string read FPhotoDesc write FPhotoDesc;
    property CreatedDate: TDateTime read FCreatedDate write SetCreatedDate;
    property PhotoData: TBytes read FPhotoData write FPhotoData;
    procedure SetPhotoDataFromStream(const Stream: TMemoryStream);
    function GetPhotoDataAsStream(): TMemoryStream;
  end;

implementation

// コンストラクタ
constructor TPhotoItemVO.Create;
begin
  inherited Create;
  FCreatedDate := Now;
end;

procedure TPhotoItemVO.SetCreatedDate(const DateTime: TDateTime);
begin
  FCreatedDate := DateTime;
end;

procedure TPhotoItemVO.SetPhotoDataFromStream(const Stream: TMemoryStream);
begin
  SetLength(FPhotoData, Stream.Size);
  Stream.Position := 0;
  Stream.Read(FPhotoData[0], Stream.Size);
end;

// 呼び出し元でメモリ開放
function TPhotoItemVO.GetPhotoDataAsStream(): TMemoryStream;
begin
  Result := TMemoryStream.Create;
  Result.Write(PhotoData, length(PhotoData));
end;

end.
