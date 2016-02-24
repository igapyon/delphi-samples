unit uPhotoListVO;

interface

uses System.SysUtils, System.Generics.Collections, uPhotoItemVO;

type
  TPhotoListVO = class
  private
    FItems: array of TPhotoItemVO;

  public
    function GetItems: TArray<TPhotoItemVO>;
    procedure InsertItem(Index: Integer; const item: TPhotoItemVO);
    procedure AddItem(const item: TPhotoItemVO);
    procedure DeleteItem(Index: Integer);
  end;

implementation

function TPhotoListVO.GetItems: TArray<TPhotoItemVO>;
begin
  Result := TArray<TPhotoItemVO>(FItems);
end;

procedure TPhotoListVO.InsertItem(Index: Integer; const item: TPhotoItemVO);
var
  WrkList: TList<TPhotoItemVO>;
  i: Integer;
begin
  try
    WrkList := TList<TPhotoItemVO>.Create;
    WrkList.AddRange(FItems);
    WrkList.Insert(Index, item);
    SetLength(FItems, WrkList.Count);
    for i := 0 to WrkList.Count - 1 do
    begin
      FItems[i] := WrkList.Items[i];
    end;
  finally
    FreeAndNil(WrkList);
  end;
end;

// 注文アイテムを追加
procedure TPhotoListVO.AddItem(const item: TPhotoItemVO);
begin
  InsertItem(Length(FItems), item);
end;

// 注文アイテムを削除
procedure TPhotoListVO.DeleteItem(Index: Integer);
var
  WrkList: TList<TPhotoItemVO>;
  i: Integer;
begin
  try
    WrkList := TList<TPhotoItemVO>.Create;
    WrkList.AddRange(FItems);
    WrkList.Delete(Index);
    SetLength(FItems, WrkList.Count);
    for i := 0 to WrkList.Count - 1 do
    begin
      FItems[i] := WrkList.Items[i];
    end;
  finally
    FreeAndNil(WrkList);
  end;
end;

end.
