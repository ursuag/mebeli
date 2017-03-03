object F_Prihod_detali_edit: TF_Prihod_detali_edit
  Left = 111
  Top = 0
  BorderStyle = bsSingle
  Caption = #1055#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077' '#1076#1077#1090#1072#1083#1077#1081
  ClientHeight = 690
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 18
  object P_Shapka: TPanel
    Left = 0
    Top = 0
    Width = 1177
    Height = 89
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 53
      Height = 18
      Caption = #8470' '#1072#1082#1090#1072
    end
    object Label2: TLabel
      Left = 165
      Top = 8
      Width = 16
      Height = 18
      Caption = #1086#1090
    end
    object Label3: TLabel
      Left = 8
      Top = 63
      Width = 45
      Height = 18
      Caption = #1057#1082#1083#1072#1076
    end
    object Label4: TLabel
      Left = 400
      Top = 63
      Width = 182
      Height = 18
      Caption = #1055#1086#1089#1083#1077' '#1082#1072#1082#1086#1075#1086' '#1074#1080#1076#1072' '#1088#1072#1073#1086#1090
    end
    object Label5: TLabel
      Left = 200
      Top = 35
      Width = 89
      Height = 18
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object Label8: TLabel
      Left = 3
      Top = 34
      Width = 69
      Height = 18
      Caption = #8470' '#1079#1072#1082#1072#1079#1072
    end
    object B_Select_Zakaz: TSpeedButton
      Left = 151
      Top = 30
      Width = 33
      Height = 24
      Hint = #1042#1099#1073#1086#1088' '#1079#1072#1082#1072#1079#1072
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
      OnClick = B_Select_ZakazClick
    end
    object DBE_ID: TDBEdit
      Left = 75
      Top = 4
      Width = 89
      Height = 26
      DataField = 'ID'
      DataSource = DM_Mebeli.DS_Prihod_detali_0
      ReadOnly = True
      TabOrder = 0
    end
    object DBE_Date_p: TDBEdit
      Left = 189
      Top = 4
      Width = 121
      Height = 26
      DataField = 'DATE_P'
      DataSource = DM_Mebeli.DS_Prihod_detali_0
      TabOrder = 1
      OnExit = DBE_Date_pExit
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 64
      Top = 59
      Width = 329
      Height = 26
      DataField = 'SKLAD_NAME'
      DataSource = DM_Mebeli.DS_Prihod_detali_0
      DropDownRows = 20
      TabOrder = 3
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 592
      Top = 59
      Width = 433
      Height = 26
      DataField = 'VID_RABOT_NAME'
      DataSource = DM_Mebeli.DS_Prihod_detali_0
      DropDownRows = 20
      TabOrder = 4
      OnEnter = DBLookupComboBox3Enter
    end
    object DBEdit1: TDBEdit
      Left = 296
      Top = 31
      Width = 729
      Height = 26
      DataField = 'PRIMECHANIE'
      DataSource = DM_Mebeli.DS_Prihod_detali_0
      TabOrder = 5
      OnExit = DBE_Date_pExit
    end
    object DBE_ID_Zakaz: TDBEdit
      Left = 75
      Top = 30
      Width = 73
      Height = 26
      DataField = 'ID_ZAKAZ'
      DataSource = DM_Mebeli.DS_Prihod_detali_0
      ReadOnly = True
      TabOrder = 2
    end
  end
  object DBGrid1: TDBGrid
    Left = 1
    Top = 96
    Width = 1176
    Height = 529
    DataSource = DS_Prihod_detali_F_1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnEditButtonClick = DBGrid1EditButtonClick
    OnEnter = DBGrid1Enter
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'ID_PILOMAT_DETALI'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 335
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'DETALI_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1044#1045#1058#1040#1051#1048
        Width = 324
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 1
    Top = 640
    Width = 1184
    Height = 45
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object B_Exit: TButton
      Left = 1080
      Top = 6
      Width = 97
      Height = 33
      Caption = '&'#1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
      OnClick = B_ExitClick
    end
    object B_Ok: TButton
      Left = 976
      Top = 6
      Width = 97
      Height = 33
      Caption = '&'#1047#1072#1087#1080#1089#1072#1090#1100
      Default = True
      TabOrder = 0
      OnClick = B_OkClick
    end
  end
  object DS_Prihod_detali_F_1: TDataSource
    DataSet = IB_Prihod_detali_F_1
    Left = 104
    Top = 216
  end
  object IB_Prihod_detali_F_1: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    OnNewRecord = IB_Prihod_detali_F_1NewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PRIHOD_DETALI_1'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PRIHOD_DETALI_1'
      '  (ID, ID_PARENT, ID_PILOMAT_DETALI, KOL_VO, SUMMA)'
      'values'
      '  (:ID, :ID_PARENT, :ID_PILOMAT_DETALI, :KOL_VO, :SUMMA)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_PARENT,'
      '  ID_PILOMAT_DETALI,'
      '  KOL_VO,'
      '  SUMMA'
      'from PRIHOD_DETALI_1 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from PRIHOD_DETALI_1'
      'where id_parent=:ID')
    ModifySQL.Strings = (
      'update PRIHOD_DETALI_1'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_PILOMAT_DETALI = :ID_PILOMAT_DETALI,'
      '  KOL_VO = :KOL_VO,'
      '  SUMMA = :SUMMA'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PRIHOD_DETALI_1_ID'
    DataSource = DM_Mebeli.DS_Prihod_detali_0
    Left = 64
    Top = 216
    object IB_Prihod_detali_F_1ID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'PRIHOD_DETALI_1.ID_PARENT'
      Required = True
    end
    object IB_Prihod_detali_F_1ID_PILOMAT_DETALI: TIntegerField
      FieldName = 'ID_PILOMAT_DETALI'
      Origin = 'PRIHOD_DETALI_1.ID_PILOMAT_DETALI'
      Required = True
    end
    object IB_Prihod_detali_F_1KOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'PRIHOD_DETALI_1.KOL_VO'
      Required = True
    end
    object IB_Prihod_detali_F_1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PRIHOD_DETALI_1.ID'
      Required = True
    end
    object IB_Prihod_detali_F_1SUMMA: TIBBCDField
      FieldName = 'SUMMA'
      Origin = 'PRIHOD_DETALI_1.SUMMA'
      DisplayFormat = '0.00'
      EditFormat = '0.00'
      Precision = 18
      Size = 3
    end
    object IB_Prihod_detali_F_1GRUPA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'GRUPA_NAME'
      LookupDataSet = IB_Pilomat_Detali_F
      LookupKeyFields = 'ID_PILOMAT_DETALI'
      LookupResultField = 'GRUPA_NAME'
      KeyFields = 'ID_PILOMAT_DETALI'
      Size = 200
      Lookup = True
    end
    object IB_Prihod_detali_F_1DETALI_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'DETALI_NAME'
      LookupDataSet = IB_Pilomat_Detali_F
      LookupKeyFields = 'ID_PILOMAT_DETALI'
      LookupResultField = 'DETALY_NAME'
      KeyFields = 'ID_PILOMAT_DETALI'
      Size = 200
      Lookup = True
    end
  end
  object IB_Pilomat_Detali_F: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from AKT_RASPIL_listy'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into AKT_RASPIL_listy'
      '  (ID_PARENT, ID_PILOMAT_LISTY, KOL_VO, ID)'
      'values'
      '  (:ID_PARENT, :ID_PILOMAT_LISTY, :KOL_VO, :ID)')
    RefreshSQL.Strings = (
      'Select *'
      'from AKT_RASPIL_listy '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      
        'select pg.name grupa_name, pd.id  ID_PILOMAT_DETALI, pd.name det' +
        'aly_name'
      'from pilomat_grupa pg, pilomat_detali pd'
      'where pd.id_grupa=pg.id')
    ModifySQL.Strings = (
      'update AKT_RASPIL_listy'
      'set'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_PILOMAT_LISTY = :ID_PILOMAT_LISTY,'
      '  KOL_VO = :KOL_VO,'
      '  ID = :ID'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_AKT_RASPIL_LISTY_ID'
    DataSource = DM_Mebeli.DS_Akt_raspil
    Left = 248
    Top = 216
  end
end
