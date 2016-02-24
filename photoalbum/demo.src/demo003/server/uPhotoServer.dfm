object PhotoserverResource1: TPhotoserverResource1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 301
  Width = 398
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Temp\tiny-photoalbum\meta\db\PHOTOALBUM.GDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=utf8'
      'DriverID=IB')
    LoginPrompt = False
    Left = 56
    Top = 32
  end
  object FDQueryGetAll: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from PhotoAlbum order by CreatedDate DESC')
    Left = 56
    Top = 96
    object FDQueryGetAllPHOTOID: TIntegerField
      FieldName = 'PHOTOID'
      Origin = 'PHOTOID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryGetAllPHOTOTITLE: TWideStringField
      FieldName = 'PHOTOTITLE'
      Origin = 'PHOTOTITLE'
      Required = True
      Size = 200
    end
    object FDQueryGetAllPHOTODESC: TWideStringField
      FieldName = 'PHOTODESC'
      Origin = 'PHOTODESC'
      Size = 1000
    end
    object FDQueryGetAllCREATEDDATE: TSQLTimeStampField
      FieldName = 'CREATEDDATE'
      Origin = 'CREATEDDATE'
      Required = True
    end
    object FDQueryGetAllPHOTODATA: TBlobField
      FieldName = 'PHOTODATA'
      Origin = 'PHOTODATA'
    end
  end
  object FDTable1: TFDTable
    IndexFieldNames = 'PHOTOID'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'PHOTOALBUM'
    TableName = 'PHOTOALBUM'
    Left = 56
    Top = 160
    object FDTable1PHOTOID: TIntegerField
      FieldName = 'PHOTOID'
      Origin = 'PHOTOID'
      Required = True
    end
    object FDTable1PHOTOTITLE: TWideStringField
      FieldName = 'PHOTOTITLE'
      Origin = 'PHOTOTITLE'
      Required = True
      Size = 200
    end
    object FDTable1PHOTODESC: TWideStringField
      FieldName = 'PHOTODESC'
      Origin = 'PHOTODESC'
      Size = 1000
    end
    object FDTable1CREATEDDATE: TSQLTimeStampField
      FieldName = 'CREATEDDATE'
      Origin = 'CREATEDDATE'
      Required = True
    end
    object FDTable1PHOTODATA: TBlobField
      FieldName = 'PHOTODATA'
      Origin = 'PHOTODATA'
    end
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 208
    Top = 32
  end
  object FDQueryGetMax: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT MAX(PHOTOID) from PhotoAlbum')
    Left = 160
    Top = 96
    object FDQueryGetMaxMAX: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MAX'
      Origin = '"MAX"'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
