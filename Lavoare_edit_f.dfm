object F_Lavoare_edit: TF_Lavoare_edit
  Left = 56
  Top = 95
  AutoScroll = False
  Caption = #1059#1084#1099#1074#1072#1083#1100#1085#1080#1082
  ClientHeight = 690
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 49
    Height = 18
    Caption = #1043#1088#1091#1087#1087#1072
  end
  object Label2: TLabel
    Left = 408
    Top = 16
    Width = 90
    Height = 18
    Caption = #1059#1084#1099#1074#1072#1083#1100#1085#1080#1082
  end
  object Label3: TLabel
    Left = 8
    Top = 48
    Width = 116
    Height = 18
    Caption = #1050#1086#1076' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
  end
  object Label4: TLabel
    Left = 944
    Top = 16
    Width = 57
    Height = 18
    Caption = #1040#1088#1090#1080#1082#1091#1083
  end
  object P_OK_Cancel: TPanel
    Left = 0
    Top = 645
    Width = 1185
    Height = 45
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 5
    object B_Exit: TButton
      Left = 1080
      Top = 6
      Width = 97
      Height = 33
      Caption = '&'#1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = B_ExitClick
    end
    object B_Ok: TButton
      Left = 968
      Top = 6
      Width = 97
      Height = 33
      Hint = '[Ctrl+End] '#1089#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1074#1099#1081#1090#1080
      Caption = '&'#1047#1072#1087#1080#1089#1072#1090#1100
      TabOrder = 0
      OnClick = B_OkClick
    end
  end
  object DBE_Lavoar: TDBEdit
    Left = 512
    Top = 12
    Width = 425
    Height = 26
    DataField = 'NAME'
    DataSource = DS_Lavoare_1
    TabOrder = 0
  end
  object DBL_Grupa: TDBLookupComboBox
    Left = 64
    Top = 12
    Width = 337
    Height = 26
    DataField = 'GRUPA_NAME'
    DataSource = DS_Lavoare_1
    TabOrder = 4
    TabStop = False
  end
  object DBE_Cod_manufacturer: TDBEdit
    Left = 128
    Top = 44
    Width = 273
    Height = 26
    DataField = 'MANUFACTURER_CODE'
    DataSource = DS_Lavoare_1
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 88
    Width = 1161
    Height = 545
    DataSource = DS_Lavoare_Gotovprod
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    OnEditButtonClick = DBGrid1EditButtonClick
    OnExit = DBGrid1Exit
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GOTOVPROD_GRUPA'
        Title.Alignment = taCenter
        Title.Caption = #1043#1088#1091#1087#1087#1072
        Width = 452
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GOTOVPROD_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1064#1082#1072#1092#1099
        Width = 453
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 200
        Visible = True
      end>
  end
  object DBE_Articul: TDBEdit
    Left = 1008
    Top = 12
    Width = 169
    Height = 26
    DataField = 'ARTICLE'
    DataSource = DS_Lavoare_1
    TabOrder = 1
  end
  object IB_Lavoare_grupa: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from lavoare_grupa'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into lavoare_grupa'
      '  (ID, NAME)'
      'values'
      '  (:ID, :NAME)')
    RefreshSQL.Strings = (
      'Select *'
      'from lavoare_grupa '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from lavoare_grupa'
      'order by name')
    ModifySQL.Strings = (
      'update lavoare_grupa'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME'
      'where'
      '  ID = :OLD_ID')
    Active = True
    Left = 520
    Top = 48
  end
  object IB_Lavoare_1: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    AutoCalcFields = False
    OnNewRecord = IB_Lavoare_1NewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from lavoare_1'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into lavoare_1'
      '  (ID, NAME, ID_PARENT, ARTICLE, MANUFACTURER_CODE)'
      'values'
      '  (:ID, :NAME, :ID_PARENT, :ARTICLE, :MANUFACTURER_CODE)')
    RefreshSQL.Strings = (
      'Select *'
      'from lavoare_1 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from lavoare_1'
      'where id= :id')
    ModifySQL.Strings = (
      'update lavoare_1'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME,'
      '  ID_PARENT = :ID_PARENT,'
      '  ARTICLE = :ARTICLE,'
      '  MANUFACTURER_CODE = :MANUFACTURER_CODE'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_LAVOARE_1_ID'
    Left = 424
    Top = 48
    object IB_Lavoare_1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'LAVOARE_1.ID'
      Required = True
    end
    object IB_Lavoare_1NAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'LAVOARE_1.NAME'
      Required = True
      Size = 100
    end
    object IB_Lavoare_1ID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'LAVOARE_1.ID_PARENT'
      Required = True
    end
    object IB_Lavoare_1ARTICLE: TIntegerField
      FieldName = 'ARTICLE'
      Origin = 'LAVOARE_1.ARTICLE'
    end
    object IB_Lavoare_1GRUPA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'GRUPA_NAME'
      LookupDataSet = IB_Lavoare_grupa
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_PARENT'
      Size = 200
      Lookup = True
    end
    object IB_Lavoare_1MANUFACTURER_CODE: TIBStringField
      FieldName = 'MANUFACTURER_CODE'
      Origin = 'LAVOARE_1.MANUFACTURER_CODE'
      Size = 100
    end
  end
  object DS_Lavoare_1: TDataSource
    DataSet = IB_Lavoare_1
    Left = 464
    Top = 48
  end
  object IB_Lavoare_Gotovprod: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    OnCalcFields = IB_Lavoare_GotovprodCalcFields
    OnNewRecord = IB_Lavoare_GotovprodNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from lavoare_gotovprod'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into lavoare_gotovprod'
      '  (ID, DESCRIPTION, ID_LAVOAR, ID_GOTOVPROD)'
      'values'
      '  (:ID, :DESCRIPTION, :ID_LAVOAR, :ID_GOTOVPROD)')
    RefreshSQL.Strings = (
      'Select *'
      'from lavoare_gotovprod '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from lavoare_gotovprod'
      'where id_lavoar= :id')
    ModifySQL.Strings = (
      'update lavoare_gotovprod'
      'set'
      '  ID = :ID,'
      '  DESCRIPTION = :DESCRIPTION,'
      '  ID_LAVOAR = :ID_LAVOAR,'
      '  ID_GOTOVPROD = :ID_GOTOVPROD'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_LAVOARE_GOTOVPROD_ID'
    DataSource = DS_Lavoare_1
    Left = 952
    Top = 96
    object IB_Lavoare_GotovprodID: TIntegerField
      FieldName = 'ID'
      Origin = 'LAVOARE_GOTOVPROD.ID'
      Required = True
    end
    object IB_Lavoare_GotovprodDESCRIPTION: TIBStringField
      FieldName = 'DESCRIPTION'
      Origin = 'LAVOARE_GOTOVPROD.DESCRIPTION'
      Size = 100
    end
    object IB_Lavoare_GotovprodID_LAVOAR: TIntegerField
      FieldName = 'ID_LAVOAR'
      Origin = 'LAVOARE_GOTOVPROD.ID_LAVOAR'
      Required = True
    end
    object IB_Lavoare_GotovprodID_GOTOVPROD: TIntegerField
      FieldName = 'ID_GOTOVPROD'
      Origin = 'LAVOARE_GOTOVPROD.ID_GOTOVPROD'
      Required = True
    end
    object IB_Lavoare_GotovprodGOTOVPROD_GRUPA: TStringField
      FieldKind = fkCalculated
      FieldName = 'GOTOVPROD_GRUPA'
      Size = 200
      Calculated = True
    end
    object IB_Lavoare_GotovprodGOTOVPROD_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'GOTOVPROD_NAME'
      LookupDataSet = DM_Mebeli.IB_Gotov_prod_0
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_GOTOVPROD'
      Size = 200
      Lookup = True
    end
  end
  object DS_Lavoare_Gotovprod: TDataSource
    DataSet = IB_Lavoare_Gotovprod
    Left = 992
    Top = 96
  end
end
