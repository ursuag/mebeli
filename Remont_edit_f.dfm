object F_Remont_edit: TF_Remont_edit
  Left = 0
  Top = 78
  AutoScroll = False
  Caption = #1056#1077#1084#1086#1085#1090' '#1087#1088#1086#1076#1091#1082#1094#1080#1080
  ClientHeight = 702
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
    Top = 8
    Width = 53
    Height = 18
    Caption = #8470' '#1072#1082#1090#1072
  end
  object Label2: TLabel
    Left = 136
    Top = 8
    Width = 16
    Height = 18
    Caption = #1086#1090
  end
  object Label3: TLabel
    Left = 5
    Top = 40
    Width = 81
    Height = 18
    Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
  end
  object B_Select_GotovProd: TSpeedButton
    Left = 926
    Top = 4
    Width = 33
    Height = 24
    Hint = #1042#1099#1073#1086#1088' '#1096#1082#1072#1092#1072' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
      300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
      330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
      333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
      339977FF777777773377000BFB03333333337773FF733333333F333000333333
      3300333777333333337733333333333333003333333333333377333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
    OnClick = B_Select_GotovProdClick
  end
  object Label4: TLabel
    Left = 290
    Top = 8
    Width = 111
    Height = 18
    Caption = #1056#1077#1084#1086#1085#1090' '#1096#1082#1072#1092#1072':'
  end
  object Label5: TLabel
    Left = 965
    Top = 8
    Width = 52
    Height = 19
    Caption = #1057#1091#1084#1084#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 389
    Top = 40
    Width = 130
    Height = 18
    Caption = #1057#1090#1072#1090#1100#1103' '#1088#1072#1089#1093#1086#1076#1086#1074':'
  end
  object Label7: TLabel
    Left = 773
    Top = 40
    Width = 122
    Height = 18
    Caption = #1057#1090#1072#1090#1100#1103' '#1076#1086#1093#1086#1076#1086#1074':'
  end
  object P_OK_Cancel: TPanel
    Left = -1
    Top = 652
    Width = 1185
    Height = 45
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
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
  object DBG_Vidrabot: TDBGrid
    Left = 8
    Top = 72
    Width = 1153
    Height = 185
    DataSource = DS_Remont_Rabota
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'VIDRABOT_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090
        Width = 382
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOTRUDNIK_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
        Width = 386
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA_RABOT'
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 200
        Visible = True
      end>
  end
  object DBE_NOMER: TDBEdit
    Left = 64
    Top = 4
    Width = 65
    Height = 26
    DataField = 'ID'
    DataSource = DS_Remont_0
    ReadOnly = True
    TabOrder = 2
  end
  object DBE_Date_a: TDBEdit
    Left = 160
    Top = 4
    Width = 129
    Height = 26
    DataField = 'DATE_REM'
    DataSource = DS_Remont_0
    TabOrder = 3
  end
  object E_Gotov_prod: TEdit
    Left = 402
    Top = 4
    Width = 519
    Height = 26
    TabStop = False
    ReadOnly = True
    TabOrder = 4
    Text = 'E_Gotov_prod'
  end
  object DBL_Contragent: TDBLookupComboBox
    Left = 96
    Top = 35
    Width = 289
    Height = 26
    DataField = 'CONTRAGENT_NAME'
    DataSource = DS_Remont_0
    TabOrder = 5
  end
  object DBE_Summa: TDBEdit
    Left = 1024
    Top = 4
    Width = 153
    Height = 26
    DataField = 'SUMMA_PRODAJA'
    DataSource = DS_Remont_0
    TabOrder = 6
  end
  object DBL_Statya_Rashodov: TDBLookupComboBox
    Left = 520
    Top = 35
    Width = 249
    Height = 26
    DataField = 'STATYA_RASH_NAME'
    DataSource = DS_Remont_0
    TabOrder = 7
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 896
    Top = 35
    Width = 281
    Height = 26
    DataField = 'STATYA_DOHODA_NAME'
    DataSource = DS_Remont_0
    TabOrder = 8
  end
  object DBG_Furnitura: TDBGrid
    Left = 8
    Top = 263
    Width = 1153
    Height = 185
    DataSource = DS_Rashod_Furnitura
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    OnEditButtonClick = DBG_FurnituraEditButtonClick
    OnEnter = DBG_FurnituraEnter
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 331
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'FURNITURA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1052#1040#1058#1045#1056#1048#1040#1051#1067
        Width = 368
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EDIZM_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1045#1076'.'#1080#1079#1084'.'
        Width = 114
        Visible = True
      end>
  end
  object DBG_Detali: TDBGrid
    Left = 8
    Top = 463
    Width = 1153
    Height = 185
    DataSource = DS_Rashod_Detali
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    OnEditButtonClick = DBG_DetaliEditButtonClick
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 325
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'DETALI_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1044#1045#1058#1040#1051#1048
        Width = 370
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Width = 200
        Visible = True
      end>
  end
  object IB_Remont_0: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from remont_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into remont_0'
      
        '  (ID, DATE_REM, ID_CONTRAGENT, ID_STATYA_RASHODA, ID_STATYA_DOH' +
        'ODA, SUMMA_PRODAJA, '
      '   ID_GOTOV_PROD, DESCRIPTION)'
      'values'
      
        '  (:ID, :DATE_REM, :ID_CONTRAGENT, :ID_STATYA_RASHODA, :ID_STATY' +
        'A_DOHODA, '
      '   :SUMMA_PRODAJA, :ID_GOTOV_PROD, :DESCRIPTION)')
    RefreshSQL.Strings = (
      'Select *'
      'from remont_0 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from remont_0'
      'where id=:ID')
    ModifySQL.Strings = (
      'update remont_0'
      'set'
      '  ID = :ID,'
      '  DATE_REM = :DATE_REM,'
      '  ID_CONTRAGENT = :ID_CONTRAGENT,'
      '  ID_STATYA_RASHODA = :ID_STATYA_RASHODA,'
      '  ID_STATYA_DOHODA = :ID_STATYA_DOHODA,'
      '  SUMMA_PRODAJA = :SUMMA_PRODAJA,'
      '  ID_GOTOV_PROD = :ID_GOTOV_PROD,'
      '  DESCRIPTION = :DESCRIPTION'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_REMONT_0_ID'
    Left = 1016
    Top = 64
    object IB_Remont_0ID: TIntegerField
      FieldName = 'ID'
      Origin = 'REMONT_0.ID'
      Required = True
    end
    object IB_Remont_0DATE_REM: TDateField
      FieldName = 'DATE_REM'
      Origin = 'REMONT_0.DATE_REM'
      Required = True
    end
    object IB_Remont_0ID_CONTRAGENT: TIntegerField
      FieldName = 'ID_CONTRAGENT'
      Origin = 'REMONT_0.ID_CONTRAGENT'
    end
    object IB_Remont_0ID_STATYA_RASHODA: TIntegerField
      FieldName = 'ID_STATYA_RASHODA'
      Origin = 'REMONT_0.ID_STATYA_RASHODA'
    end
    object IB_Remont_0ID_STATYA_DOHODA: TIntegerField
      FieldName = 'ID_STATYA_DOHODA'
      Origin = 'REMONT_0.ID_STATYA_DOHODA'
    end
    object IB_Remont_0SUMMA_PRODAJA: TIBBCDField
      FieldName = 'SUMMA_PRODAJA'
      Origin = 'REMONT_0.SUMMA_PRODAJA'
      Precision = 18
      Size = 2
    end
    object IB_Remont_0ID_GOTOV_PROD: TIntegerField
      FieldName = 'ID_GOTOV_PROD'
      Origin = 'REMONT_0.ID_GOTOV_PROD'
      Required = True
    end
    object IB_Remont_0DESCRIPTION: TIBStringField
      FieldName = 'DESCRIPTION'
      Origin = 'REMONT_0.DESCRIPTION'
      Size = 150
    end
    object IB_Remont_0CONTRAGENT_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'CONTRAGENT_NAME'
      LookupDataSet = DM_Mebeli.IB_Contragenty_1
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_CONTRAGENT'
      Size = 200
      Lookup = True
    end
    object IB_Remont_0STATYA_RASH_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'STATYA_RASH_NAME'
      LookupDataSet = DM_Mebeli.IB_Statyi_Rashoda
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_STATYA_RASHODA'
      Size = 200
      Lookup = True
    end
    object IB_Remont_0STATYA_DOHODA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'STATYA_DOHODA_NAME'
      LookupDataSet = DM_Mebeli.IB_Statyi_Dohoda
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_STATYA_DOHODA'
      Size = 200
      Lookup = True
    end
  end
  object DS_Remont_0: TDataSource
    DataSet = IB_Remont_0
    Left = 1048
    Top = 64
  end
  object IB_Remont_Rabota: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    OnNewRecord = IB_Remont_RabotaNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from remont_rabota'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into remont_rabota'
      '  (ID, ID_VID_RABOT, ID_SOTRUDNIK, SUMMA_RABOT, ID_PARENT)'
      'values'
      '  (:ID, :ID_VID_RABOT, :ID_SOTRUDNIK, :SUMMA_RABOT, :ID_PARENT)')
    RefreshSQL.Strings = (
      'Select *'
      'from remont_rabota '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from remont_rabota'
      'where id_parent=:ID')
    ModifySQL.Strings = (
      'update remont_rabota'
      'set'
      '  ID = :ID,'
      '  ID_VID_RABOT = :ID_VID_RABOT,'
      '  ID_SOTRUDNIK = :ID_SOTRUDNIK,'
      '  SUMMA_RABOT = :SUMMA_RABOT,'
      '  ID_PARENT = :ID_PARENT'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_REMONT_RABOTA_ID'
    DataSource = DS_Remont_0
    Left = 1096
    Top = 120
    object IB_Remont_RabotaID: TIntegerField
      FieldName = 'ID'
      Origin = 'REMONT_RABOTA.ID'
      Required = True
    end
    object IB_Remont_RabotaID_VID_RABOT: TIntegerField
      FieldName = 'ID_VID_RABOT'
      Origin = 'REMONT_RABOTA.ID_VID_RABOT'
      Required = True
    end
    object IB_Remont_RabotaID_SOTRUDNIK: TIntegerField
      FieldName = 'ID_SOTRUDNIK'
      Origin = 'REMONT_RABOTA.ID_SOTRUDNIK'
      Required = True
    end
    object IB_Remont_RabotaSUMMA_RABOT: TIBBCDField
      FieldName = 'SUMMA_RABOT'
      Origin = 'REMONT_RABOTA.SUMMA_RABOT'
      Precision = 18
      Size = 2
    end
    object IB_Remont_RabotaID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'REMONT_RABOTA.ID_PARENT'
    end
    object IB_Remont_RabotaSOTRUDNIK_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'SOTRUDNIK_NAME'
      LookupDataSet = DM_Mebeli.IB_Sotrudniki
      LookupKeyFields = 'ID'
      LookupResultField = 'FIO'
      KeyFields = 'ID_SOTRUDNIK'
      Size = 200
      Lookup = True
    end
    object IB_Remont_RabotaVIDRABOT_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'VIDRABOT_NAME'
      LookupDataSet = DM_Mebeli.IB_Vidy_rabot
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_VID_RABOT'
      Size = 200
      Lookup = True
    end
  end
  object DS_Remont_Rabota: TDataSource
    DataSet = IB_Remont_Rabota
    Left = 1136
    Top = 120
  end
  object IB_Rashod_Furnitura: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BeforePost = IB_Rashod_FurnituraBeforePost
    OnCalcFields = IB_Rashod_FurnituraCalcFields
    OnNewRecord = IB_Rashod_FurnituraNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from rashod_furnitura'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into rashod_furnitura'
      
        '  (ID, ID_FURNITURA, KOL_VO, DATE_R, ID_AKT_VIP_PROD, ID_AKT_VIP' +
        '_RABOT, '
      '   ID_GOTOV_PROD, ID_SKLAD, ID_PRODAJA, KOLVO_NORMA, ID_REMONT)'
      'values'
      
        '  (:ID, :ID_FURNITURA, :KOL_VO, :DATE_R, :ID_AKT_VIP_PROD, :ID_A' +
        'KT_VIP_RABOT, '
      
        '   :ID_GOTOV_PROD, :ID_SKLAD, :ID_PRODAJA, :KOLVO_NORMA, :ID_REM' +
        'ONT)')
    RefreshSQL.Strings = (
      'Select *'
      'from rashod_furnitura '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from rashod_furnitura'
      'where id_remont=:ID')
    ModifySQL.Strings = (
      'update rashod_furnitura'
      'set'
      '  ID = :ID,'
      '  ID_FURNITURA = :ID_FURNITURA,'
      '  KOL_VO = :KOL_VO,'
      '  DATE_R = :DATE_R,'
      '  ID_AKT_VIP_PROD = :ID_AKT_VIP_PROD,'
      '  ID_AKT_VIP_RABOT = :ID_AKT_VIP_RABOT,'
      '  ID_GOTOV_PROD = :ID_GOTOV_PROD,'
      '  ID_SKLAD = :ID_SKLAD,'
      '  ID_PRODAJA = :ID_PRODAJA,'
      '  KOLVO_NORMA = :KOLVO_NORMA,'
      '  ID_REMONT = :ID_REMONT'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_RASHOD_FURNITURA_ID'
    DataSource = DS_Remont_0
    Left = 1088
    Top = 272
    object IB_Rashod_FurnituraID: TIntegerField
      FieldName = 'ID'
      Origin = 'RASHOD_FURNITURA.ID'
      Required = True
    end
    object IB_Rashod_FurnituraID_FURNITURA: TIntegerField
      FieldName = 'ID_FURNITURA'
      Origin = 'RASHOD_FURNITURA.ID_FURNITURA'
      Required = True
    end
    object IB_Rashod_FurnituraKOL_VO: TIBBCDField
      FieldName = 'KOL_VO'
      Origin = 'RASHOD_FURNITURA.KOL_VO'
      Required = True
      Precision = 9
      Size = 3
    end
    object IB_Rashod_FurnituraDATE_R: TDateField
      FieldName = 'DATE_R'
      Origin = 'RASHOD_FURNITURA.DATE_R'
      Required = True
    end
    object IB_Rashod_FurnituraID_AKT_VIP_PROD: TIntegerField
      FieldName = 'ID_AKT_VIP_PROD'
      Origin = 'RASHOD_FURNITURA.ID_AKT_VIP_PROD'
    end
    object IB_Rashod_FurnituraID_AKT_VIP_RABOT: TIntegerField
      FieldName = 'ID_AKT_VIP_RABOT'
      Origin = 'RASHOD_FURNITURA.ID_AKT_VIP_RABOT'
    end
    object IB_Rashod_FurnituraID_GOTOV_PROD: TIntegerField
      FieldName = 'ID_GOTOV_PROD'
      Origin = 'RASHOD_FURNITURA.ID_GOTOV_PROD'
    end
    object IB_Rashod_FurnituraID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Origin = 'RASHOD_FURNITURA.ID_SKLAD'
    end
    object IB_Rashod_FurnituraID_PRODAJA: TIntegerField
      FieldName = 'ID_PRODAJA'
      Origin = 'RASHOD_FURNITURA.ID_PRODAJA'
    end
    object IB_Rashod_FurnituraKOLVO_NORMA: TIBBCDField
      FieldName = 'KOLVO_NORMA'
      Origin = 'RASHOD_FURNITURA.KOLVO_NORMA'
      Precision = 9
      Size = 3
    end
    object IB_Rashod_FurnituraID_REMONT: TIntegerField
      FieldName = 'ID_REMONT'
      Origin = 'RASHOD_FURNITURA.ID_REMONT'
    end
    object IB_Rashod_FurnituraGRUPA_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'GRUPA_NAME'
      Size = 200
      Calculated = True
    end
    object IB_Rashod_FurnituraFURNITURA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'FURNITURA_NAME'
      LookupDataSet = DM_Mebeli.IB_Furnitura
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_FURNITURA'
      Size = 200
      Lookup = True
    end
    object IB_Rashod_FurnituraEDIZM_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'EDIZM_NAME'
      LookupDataSet = DM_Mebeli.IB_Furnitura
      LookupKeyFields = 'ID'
      LookupResultField = 'ED_IZM'
      KeyFields = 'ID_FURNITURA'
      Size = 200
      Lookup = True
    end
  end
  object DS_Rashod_Furnitura: TDataSource
    DataSet = IB_Rashod_Furnitura
    Left = 1128
    Top = 272
  end
  object IB_Rashod_Detali: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    OnCalcFields = IB_Rashod_DetaliCalcFields
    OnNewRecord = IB_Rashod_DetaliNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from rashod_detali'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into rashod_detali'
      
        '  (ID, ID_PILOMAT_DETALI, KOL_VO, DATE_R, ID_AKT_VIP_PROD, ID_GO' +
        'TOV_PROD, '
      '   AREA, ID_SKLAD, ID_REMONT)'
      'values'
      
        '  (:ID, :ID_PILOMAT_DETALI, :KOL_VO, :DATE_R, :ID_AKT_VIP_PROD, ' +
        ':ID_GOTOV_PROD, '
      '   :AREA, :ID_SKLAD, :ID_REMONT)')
    RefreshSQL.Strings = (
      'Select *'
      'from rashod_detali '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from rashod_detali'
      'where id_remont=:ID')
    ModifySQL.Strings = (
      'update rashod_detali'
      'set'
      '  ID = :ID,'
      '  ID_PILOMAT_DETALI = :ID_PILOMAT_DETALI,'
      '  KOL_VO = :KOL_VO,'
      '  DATE_R = :DATE_R,'
      '  ID_AKT_VIP_PROD = :ID_AKT_VIP_PROD,'
      '  ID_GOTOV_PROD = :ID_GOTOV_PROD,'
      '  AREA = :AREA,'
      '  ID_SKLAD = :ID_SKLAD,'
      '  ID_REMONT = :ID_REMONT'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_RASHOD_DETALI_ID'
    DataSource = DS_Remont_0
    Left = 1080
    Top = 496
    object IB_Rashod_DetaliID: TIntegerField
      FieldName = 'ID'
      Origin = 'RASHOD_DETALI.ID'
      Required = True
    end
    object IB_Rashod_DetaliID_PILOMAT_DETALI: TIntegerField
      FieldName = 'ID_PILOMAT_DETALI'
      Origin = 'RASHOD_DETALI.ID_PILOMAT_DETALI'
      Required = True
    end
    object IB_Rashod_DetaliKOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'RASHOD_DETALI.KOL_VO'
      Required = True
    end
    object IB_Rashod_DetaliDATE_R: TDateField
      FieldName = 'DATE_R'
      Origin = 'RASHOD_DETALI.DATE_R'
      Required = True
    end
    object IB_Rashod_DetaliID_GOTOV_PROD: TIntegerField
      FieldName = 'ID_GOTOV_PROD'
      Origin = 'RASHOD_DETALI.ID_GOTOV_PROD'
    end
    object IB_Rashod_DetaliAREA: TIntegerField
      FieldName = 'AREA'
      Origin = 'RASHOD_DETALI.AREA'
    end
    object IB_Rashod_DetaliID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Origin = 'RASHOD_DETALI.ID_SKLAD'
    end
    object IB_Rashod_DetaliID_REMONT: TIntegerField
      FieldName = 'ID_REMONT'
      Origin = 'RASHOD_DETALI.ID_REMONT'
    end
    object IB_Rashod_DetaliGRUPA_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'GRUPA_NAME'
      Size = 200
      Calculated = True
    end
    object IB_Rashod_DetaliID_AKT_VIP_PROD: TIntegerField
      FieldName = 'ID_AKT_VIP_PROD'
      Origin = 'RASHOD_DETALI.ID_AKT_VIP_PROD'
    end
    object IB_Rashod_DetaliDETALI_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'DETALI_NAME'
      Size = 200
      Calculated = True
    end
  end
  object DS_Rashod_Detali: TDataSource
    DataSet = IB_Rashod_Detali
    Left = 1120
    Top = 496
  end
end
