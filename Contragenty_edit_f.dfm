object F_Contragenty_edit: TF_Contragenty_edit
  Left = 98
  Top = 150
  Width = 859
  Height = 434
  Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 204
    Height = 18
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 91
    Top = 95
    Width = 121
    Height = 18
    Caption = #1060#1080#1089#1082#1072#1083#1100#1085#1099#1081' '#1082#1086#1076':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 165
    Top = 14
    Width = 49
    Height = 18
    Caption = #1043#1088#1091#1087#1087#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 228
    Top = 56
    Width = 428
    Height = 26
    DataField = 'NAME'
    DataSource = DS_Contragenty_1
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 228
    Top = 95
    Width = 191
    Height = 26
    DataField = 'CODFISCAL'
    DataSource = DS_Contragenty_1
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 331
    Width = 843
    Height = 57
    BevelInner = bvLowered
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object B_Ok: TButton
      Left = 592
      Top = 16
      Width = 105
      Height = 33
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = B_OkClick
    end
    object B_Cancel: TButton
      Left = 716
      Top = 16
      Width = 105
      Height = 33
      Caption = #1054#1090#1084#1077#1085#1072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = B_CancelClick
    end
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 228
    Top = 10
    Width = 429
    Height = 26
    DataField = 'GRUPA_NAME'
    DataSource = DS_Contragenty_1
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object IB_Contragenty_0: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from contragenty_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into contragenty_0'
      '  (ID, NAME)'
      'values'
      '  (:ID, :NAME)')
    RefreshSQL.Strings = (
      'Select *'
      'from contragenty_0 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *  from contragenty_0'
      'order by NAME')
    ModifySQL.Strings = (
      'update contragenty_0'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_CONTRAGENTY_0_ID'
    Active = True
    Left = 496
    Top = 107
  end
  object DS_Contragenty_1: TDataSource
    DataSet = IB_Contragenty_1
    Left = 576
    Top = 155
  end
  object IB_Contragenty_1: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from contragenty_1'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into contragenty_1'
      '  (ID, ID_PARENT, NAME, CODFISCAL)'
      'values'
      '  (:ID, :ID_PARENT, :NAME, :CODFISCAL)')
    RefreshSQL.Strings = (
      'Select *'
      'from contragenty_1 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *  from contragenty_1'
      'where id=:id_contragent')
    ModifySQL.Strings = (
      'update contragenty_1'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  NAME = :NAME,'
      '  CODFISCAL = :CODFISCAL'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_CONTRAGENTY_1_ID'
    Left = 496
    Top = 155
    object IB_Contragenty_1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'CONTRAGENTY_1.ID'
      Required = True
    end
    object IB_Contragenty_1ID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'CONTRAGENTY_1.ID_PARENT'
    end
    object IB_Contragenty_1NAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'CONTRAGENTY_1.NAME'
      Required = True
      Size = 50
    end
    object IB_Contragenty_1CODFISCAL: TIBStringField
      FieldName = 'CODFISCAL'
      Origin = 'CONTRAGENTY_1.CODFISCAL'
    end
    object IB_Contragenty_1GRUPA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'GRUPA_NAME'
      LookupDataSet = IB_Contragenty_0
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_PARENT'
      Size = 200
      Lookup = True
    end
  end
end
