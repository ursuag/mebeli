object F_Prodaja_edit: TF_Prodaja_edit
  Left = 0
  Top = 120
  AutoScroll = False
  Caption = #1054#1090#1075#1088#1091#1079#1082#1072' ('#1087#1088#1086#1076#1072#1078#1072') '#1075#1086#1090#1086#1074#1086#1081' '#1087#1088#1086#1076#1091#1082#1094#1080#1080
  ClientHeight = 682
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  PrintScale = poNone
  Scaled = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object P_Shapka: TPanel
    Left = 0
    Top = 0
    Width = 1177
    Height = 67
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 6
      Width = 53
      Height = 18
      Caption = #8470' '#1072#1082#1090#1072
    end
    object Label2: TLabel
      Left = 140
      Top = 6
      Width = 16
      Height = 18
      Caption = #1086#1090
    end
    object Label3: TLabel
      Left = 283
      Top = 6
      Width = 81
      Height = 18
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
    end
    object Label6: TLabel
      Left = 7
      Top = 39
      Width = 89
      Height = 18
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object L_Signed: TLabel
      Left = 854
      Top = 22
      Width = 295
      Height = 22
      Caption = #1042#1085#1080#1084#1072#1085#1080#1077', '#1076#1086#1082#1091#1084#1077#1085#1090' '#1087#1086#1076#1087#1080#1089#1072#1085'!'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object DBE_NOMER: TDBEdit
      Left = 66
      Top = 3
      Width = 63
      Height = 26
      TabStop = False
      DataField = 'ID'
      DataSource = DS_Prodaja_0_edit
      ReadOnly = True
      TabOrder = 0
    end
    object DBE_Date_pro: TDBEdit
      Left = 173
      Top = 3
      Width = 93
      Height = 26
      DataField = 'DATE_PRO'
      DataSource = DS_Prodaja_0_edit
      TabOrder = 1
    end
    object DBL_Contragent: TDBLookupComboBox
      Left = 374
      Top = 3
      Width = 427
      Height = 26
      DataField = 'KONTRAGENT_NAME'
      DataSource = DS_Prodaja_0_edit
      TabOrder = 2
    end
    object DBE_Description: TDBEdit
      Left = 100
      Top = 36
      Width = 701
      Height = 26
      DataField = 'PRIMECHANIE'
      DataSource = DS_Prodaja_0_edit
      TabOrder = 3
    end
  end
  object DBG_Gotovprod: TDBGrid
    Left = 1
    Top = 72
    Width = 1176
    Height = 561
    DataSource = DS_Prodaja_1_edit
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnEditButtonClick = DBG_GotovprodEditButtonClick
    OnKeyPress = DBG_GotovprodKeyPress
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'ID_ZAKAZ'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1047#1040#1050#1040#1047
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ARTICLE'
        Title.Alignment = taCenter
        Title.Caption = #1040#1088#1090'.'
        Width = 117
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GRUPA_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 301
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        DropDownRows = 10
        Expanded = False
        FieldName = 'GOTOVPROD_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1048#1047#1044#1045#1051#1048#1071
        Width = 287
        Visible = True
      end
      item
        DropDownRows = 10
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 1
    Top = 647
    Width = 1176
    Height = 50
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object B_Exit: TButton
      Left = 1056
      Top = 7
      Width = 103
      Height = 37
      Caption = '&'#1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = B_ExitClick
    end
    object B_Ok: TButton
      Left = 936
      Top = 6
      Width = 103
      Height = 37
      Caption = '&'#1047#1072#1087#1080#1089#1072#1090#1100
      TabOrder = 0
      OnClick = B_OkClick
    end
  end
  object IB_Prodaja_0_edit: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PRODAJA_GOTOVPROD_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PRODAJA_GOTOVPROD_0'
      '  (ID, DATE_PRO, ID_CONTRAGENT, PRIMECHANIE)'
      'values'
      '  (:ID, :DATE_PRO, :ID_CONTRAGENT, :PRIMECHANIE)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  DATE_PRO,'
      '  ID_CONTRAGENT,'
      '  PRIMECHANIE'
      'from PRODAJA_GOTOVPROD_0 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from PRODAJA_GOTOVPROD_0'
      'where id=:id_prodaja')
    ModifySQL.Strings = (
      'update PRODAJA_GOTOVPROD_0'
      'set'
      '  ID = :ID,'
      '  DATE_PRO = :DATE_PRO,'
      '  ID_CONTRAGENT = :ID_CONTRAGENT,'
      '  PRIMECHANIE = :PRIMECHANIE'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PRODAJA_GOTOVPROD_0_ID'
    Left = 72
    Top = 184
    object IB_Prodaja_0_editID: TIntegerField
      FieldName = 'ID'
      Origin = 'PRODAJA_GOTOVPROD_0.ID'
      Required = True
    end
    object IB_Prodaja_0_editDATE_PRO: TDateField
      FieldName = 'DATE_PRO'
      Origin = 'PRODAJA_GOTOVPROD_0.DATE_PRO'
      Required = True
    end
    object IB_Prodaja_0_editID_CONTRAGENT: TIntegerField
      FieldName = 'ID_CONTRAGENT'
      Origin = 'PRODAJA_GOTOVPROD_0.ID_CONTRAGENT'
      Required = True
    end
    object IB_Prodaja_0_editPRIMECHANIE: TIBStringField
      FieldName = 'PRIMECHANIE'
      Origin = 'PRODAJA_GOTOVPROD_0.PRIMECHANIE'
      Size = 200
    end
    object IB_Prodaja_0_editKONTRAGENT_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'KONTRAGENT_NAME'
      LookupDataSet = DM_Mebeli.IB_Contragenty_1
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_CONTRAGENT'
      Size = 70
      Lookup = True
    end
  end
  object DS_Prodaja_0_edit: TDataSource
    DataSet = IB_Prodaja_0_edit
    Left = 112
    Top = 184
  end
  object IB_Prodaja_1_edit: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    AutoCalcFields = False
    BeforePost = IB_Prodaja_1_editBeforePost
    OnCalcFields = IB_Prodaja_1_editCalcFields
    OnNewRecord = IB_Prodaja_1_editNewRecord
    OnPostError = IB_Prodaja_1_editPostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from prodaja_gotovprod_1'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into prodaja_gotovprod_1'
      
        '  (ID, ID_PARENT, ID_GOTOV_PROD, KOL_VO, ID_ZAKAZ, PRICE, SEBEST' +
        'OIMOSTI)'
      'values'
      
        '  (:ID, :ID_PARENT, :ID_GOTOV_PROD, :KOL_VO, :ID_ZAKAZ, :PRICE, ' +
        ':SEBESTOIMOSTI)')
    RefreshSQL.Strings = (
      'Select *'
      'from prodaja_gotovprod_1 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from prodaja_gotovprod_1'
      'where id_parent=:id')
    ModifySQL.Strings = (
      'update prodaja_gotovprod_1'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_GOTOV_PROD = :ID_GOTOV_PROD,'
      '  KOL_VO = :KOL_VO,'
      '  ID_ZAKAZ = :ID_ZAKAZ,'
      '  PRICE = :PRICE,'
      '  SEBESTOIMOSTI = :SEBESTOIMOSTI'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PRODAJA_GOTOVPROD_1_ID'
    DataSource = DS_Prodaja_0_edit
    Left = 72
    Top = 224
    object IB_Prodaja_1_editID: TIntegerField
      FieldName = 'ID'
      Origin = 'PRODAJA_GOTOVPROD_1.ID'
      Required = True
    end
    object IB_Prodaja_1_editID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'PRODAJA_GOTOVPROD_1.ID_PARENT'
      Required = True
    end
    object IB_Prodaja_1_editID_GOTOV_PROD: TIntegerField
      FieldName = 'ID_GOTOV_PROD'
      Origin = 'PRODAJA_GOTOVPROD_1.ID_GOTOV_PROD'
      Required = True
    end
    object IB_Prodaja_1_editKOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'PRODAJA_GOTOVPROD_1.KOL_VO'
      Required = True
    end
    object IB_Prodaja_1_editID_ZAKAZ: TIntegerField
      FieldName = 'ID_ZAKAZ'
      Origin = 'PRODAJA_GOTOVPROD_1.ID_ZAKAZ'
      Required = True
    end
    object IB_Prodaja_1_editPRICE: TIBBCDField
      FieldName = 'PRICE'
      Origin = 'PRODAJA_GOTOVPROD_1.PRICE'
      DisplayFormat = '### ##0.00'
      Precision = 18
      Size = 2
    end
    object IB_Prodaja_1_editSEBESTOIMOSTI: TIBBCDField
      FieldName = 'SEBESTOIMOSTI'
      Origin = 'PRODAJA_GOTOVPROD_1.SEBESTOIMOSTI'
      DisplayFormat = '### ##0.00'
      Precision = 18
      Size = 2
    end
    object IB_Prodaja_1_editSUMMA: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SUMMA'
      DisplayFormat = '### ##0.00'
      Calculated = True
    end
    object IB_Prodaja_1_editGRUPA_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'GRUPA_NAME'
      Size = 200
      Calculated = True
    end
    object IB_Prodaja_1_editGOTOVPROD_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'GOTOVPROD_NAME'
      Size = 200
      Calculated = True
    end
    object IB_Prodaja_1_editARTICLE: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ARTICLE'
      Calculated = True
    end
  end
  object DS_Prodaja_1_edit: TDataSource
    DataSet = IB_Prodaja_1_edit
    Left = 112
    Top = 224
  end
  object MainMenu1: TMainMenu
    Left = 392
    Top = 256
    object N1: TMenuItem
      Caption = #1055#1086#1076#1087#1080#1089#1080
      object N_Sign: TMenuItem
        Caption = #1055#1086#1076#1087#1080#1089#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
        OnClick = N_SignClick
      end
      object N_UnSign: TMenuItem
        Caption = #1057#1085#1103#1090#1100' '#1087#1086#1076#1087#1080#1089#1100
        OnClick = N_UnSignClick
      end
    end
  end
end
