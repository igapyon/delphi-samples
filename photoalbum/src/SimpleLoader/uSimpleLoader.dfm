object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #21336#32020#12395#65297#34892#12434#36861#21152#12377#12427
  ClientHeight = 211
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 56
    Top = 144
    Width = 281
    Height = 49
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Temp\tiny-photoalbum\meta\db\PHOTOALBUM.GDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=utf8'
      'DriverID=iB')
    Connected = True
    LoginPrompt = False
    Left = 152
    Top = 32
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 352
    Top = 96
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 352
    Top = 40
  end
  object FDTable1: TFDTable
    IndexFieldNames = 'PHOTOID'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'PHOTOALBUM'
    TableName = 'PHOTOALBUM'
    Left = 144
    Top = 96
    object FDTable1PHOTOID: TIntegerField
      FieldName = 'PHOTOID'
      Origin = 'PHOTOID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
end
