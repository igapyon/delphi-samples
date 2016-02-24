object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 551
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 120
    Top = 192
    Width = 46
    Height = 13
    Caption = 'PHOTOID'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 120
    Top = 232
    Width = 62
    Height = 13
    Caption = 'PHOTOTITLE'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 120
    Top = 272
    Width = 61
    Height = 13
    Caption = 'PHOTODESC'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 120
    Top = 312
    Width = 72
    Height = 13
    Caption = 'CREATEDDATE'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 120
    Top = 352
    Width = 62
    Height = 13
    Caption = 'PHOTODATA'
  end
  object Label6: TLabel
    Left = 112
    Top = 424
    Width = 31
    Height = 13
    Caption = 'Label6'
  end
  object Label7: TLabel
    Left = 296
    Top = 424
    Width = 62
    Height = 13
    Caption = 'PHOTODATA'
  end
  object DBEdit1: TDBEdit
    Left = 120
    Top = 208
    Width = 134
    Height = 21
    DataField = 'PHOTOID'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 120
    Top = 248
    Width = 2604
    Height = 21
    DataField = 'PHOTOTITLE'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 120
    Top = 288
    Width = 13004
    Height = 21
    DataField = 'PHOTODESC'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 120
    Top = 328
    Width = 446
    Height = 21
    DataField = 'CREATEDDATE'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBNavigator1: TDBNavigator
    Left = 168
    Top = 384
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 4
  end
  object Button1: TButton
    Left = 464
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 5
    OnClick = Button1Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Temp\tiny-photoalbum\meta\db\PHOTOALBUM.GDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=utf8'
      'DriverID=IB')
    Connected = True
    LoginPrompt = False
    Left = 104
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 352
    Top = 80
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 344
    Top = 24
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from photoalbum'
      'where photoid = 3')
    Left = 112
    Top = 80
    object FDQuery1PHOTOID: TIntegerField
      FieldName = 'PHOTOID'
      Origin = 'PHOTOID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1PHOTOTITLE: TWideStringField
      FieldName = 'PHOTOTITLE'
      Origin = 'PHOTOTITLE'
      Required = True
      Size = 200
    end
    object FDQuery1PHOTODESC: TWideStringField
      FieldName = 'PHOTODESC'
      Origin = 'PHOTODESC'
      Size = 1000
    end
    object FDQuery1CREATEDDATE: TSQLTimeStampField
      FieldName = 'CREATEDDATE'
      Origin = 'CREATEDDATE'
      Required = True
    end
    object FDQuery1PHOTODATA: TBlobField
      FieldName = 'PHOTODATA'
      Origin = 'PHOTODATA'
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 280
    Top = 224
  end
end
