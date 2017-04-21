object F_Akt_raspil_edit: TF_Akt_raspil_edit
  Left = 1
  Top = 66
  AutoScroll = False
  Caption = #1040#1082#1090' '#1088#1072#1089#1087#1080#1083#1072
  ClientHeight = 702
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
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
  PixelsPerInch = 96
  TextHeight = 16
  object Label4: TLabel
    Left = 128
    Top = 500
    Width = 198
    Height = 16
    Caption = #1054#1057#1058#1040#1058#1050#1048' '#1055#1054' '#1050#1040#1056#1058#1045' '#1050#1056#1054#1071
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGR_LISTY: TDBGrid
    Left = 1
    Top = 160
    Width = 503
    Height = 329
    DataSource = DS_Akt_raspil_listy
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    OnEditButtonClick = DBGR_LISTYEditButtonClick
    OnExit = DBGR_LISTYExit
    OnKeyPress = DBGR_LISTYKeyPress
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GRUPA_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 250
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        DropDownRows = 20
        Expanded = False
        FieldName = 'LISTY_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1051#1048#1057#1058#1067
        Width = 153
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 69
        Visible = True
      end>
  end
  object DBGR_DETALI: TDBGrid
    Left = 512
    Top = 0
    Width = 673
    Height = 633
    DataSource = DS_Akt_raspil_detali
    PopupMenu = PMenu_Detali
    TabOrder = 2
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    OnEditButtonClick = DBGR_DETALIEditButtonClick
    OnEnter = DBGR_DETALIEnter
    OnExit = DBGR_DETALIExit
    OnKeyPress = DBGR_DETALIKeyPress
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GRUPA_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 209
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'DETALI_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1044#1045#1058#1040#1051#1048
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 247
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMONT_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1056#1045#1052#1054#1053#1058
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 60
        Visible = True
      end>
  end
  object P_Buttons: TPanel
    Left = 0
    Top = 640
    Width = 1185
    Height = 57
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object B_Exit: TButton
      Left = 1083
      Top = 12
      Width = 97
      Height = 33
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 1
      OnClick = B_ExitClick
    end
    object B_Ok: TButton
      Left = 979
      Top = 12
      Width = 97
      Height = 33
      Hint = '[Ctrl+End] '#1089#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1074#1099#1081#1090#1080
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      TabOrder = 0
      OnClick = B_OkClick
    end
    object Button1: TButton
      Left = 27
      Top = 12
      Width = 97
      Height = 33
      Hint = '[Ctrl+End] '#1089#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1074#1099#1081#1090#1080
      Caption = 'Refresh'
      Default = True
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object P_Shapka: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 145
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    OnExit = P_ShapkaExit
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 42
      Height = 16
      Caption = #1040#1082#1090' '#8470' '
    end
    object Label2: TLabel
      Left = 120
      Top = 12
      Width = 12
      Height = 16
      Caption = #1086#1090
    end
    object Label3: TLabel
      Left = 8
      Top = 40
      Width = 47
      Height = 16
      Caption = #1054#1089#1090#1072#1090#1086#1082
    end
    object Label5: TLabel
      Left = 192
      Top = 40
      Width = 41
      Height = 16
      Caption = #1054#1090#1093#1086#1076':'
    end
    object Label6: TLabel
      Left = 8
      Top = 67
      Width = 50
      Height = 16
      Caption = #1055#1088#1080#1084#1077#1095'.'
    end
    object Label8: TLabel
      Left = 272
      Top = 12
      Width = 57
      Height = 16
      Caption = #8470' '#1079#1072#1082#1072#1079#1072
    end
    object B_Select_Zakaz: TSpeedButton
      Left = 416
      Top = 8
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
    object Label9: TLabel
      Left = 8
      Top = 96
      Width = 55
      Height = 16
      Caption = #1048#1089#1087#1086#1083#1085'.1'
    end
    object Label10: TLabel
      Left = 8
      Top = 121
      Width = 55
      Height = 16
      Caption = #1048#1089#1087#1086#1083#1085'.2'
    end
    object B_Sotrudnik2_clear: TSpeedButton
      Left = 470
      Top = 116
      Width = 27
      Height = 24
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100' 2'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = B_Sotrudnik2_clearClick
    end
    object Label7: TLabel
      Left = 448
      Top = 40
      Width = 21
      Height = 16
      Caption = #1083#1077#1081
    end
    object Label11: TLabel
      Left = 323
      Top = 40
      Width = 18
      Height = 16
      Caption = 'm2'
    end
    object DBEdit1: TDBEdit
      Left = 48
      Top = 8
      Width = 65
      Height = 24
      DataField = 'ID'
      DataSource = DM_Mebeli.DS_Akt_raspil
      ReadOnly = True
      TabOrder = 0
    end
    object DBE_Date_R: TDBEdit
      Left = 145
      Top = 8
      Width = 120
      Height = 24
      DataField = 'DATE_R'
      DataSource = DM_Mebeli.DS_Akt_raspil
      ReadOnly = True
      TabOrder = 1
      OnExit = DBE_Date_RExit
    end
    object DBEdit3: TDBEdit
      Left = 234
      Top = 36
      Width = 89
      Height = 24
      AutoSize = False
      DataField = 'OTHOD_M2'
      DataSource = DM_Mebeli.DS_Akt_raspil
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 72
      Top = 63
      Width = 425
      Height = 26
      DataField = 'PRIMECHANIE'
      DataSource = DM_Mebeli.DS_Akt_raspil
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Unicode MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DBE_ID_Zakaz: TDBEdit
      Left = 340
      Top = 8
      Width = 73
      Height = 24
      DataField = 'ID_ZAKAZ'
      DataSource = DM_Mebeli.DS_Akt_raspil
      ReadOnly = True
      TabOrder = 2
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 72
      Top = 93
      Width = 425
      Height = 24
      DataField = 'SOTRUDNIK1_NAME'
      DataSource = DM_Mebeli.DS_Akt_raspil
      TabOrder = 5
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 72
      Top = 118
      Width = 393
      Height = 24
      DataField = 'SOTRUDNIK2_NAME'
      DataSource = DM_Mebeli.DS_Akt_raspil
      TabOrder = 6
    end
    object E_Ostatok: TEdit
      Left = 72
      Top = 36
      Width = 113
      Height = 24
      ReadOnly = True
      TabOrder = 7
      Text = 'E_Ostatok'
    end
    object DBE_OTHOD_SUMMA: TDBEdit
      Left = 354
      Top = 36
      Width = 89
      Height = 24
      TabStop = False
      AutoSize = False
      DataField = 'OTHOD_SUMMA'
      DataSource = DM_Mebeli.DS_Akt_raspil
      ReadOnly = True
      TabOrder = 8
    end
  end
  object DBGR_OSTATKI: TDBGrid
    Left = 9
    Top = 520
    Width = 504
    Height = 113
    DataSource = DM_Mebeli.DS_Akt_raspil_ostatok
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
        Width = 256
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZMER_X'
        Title.Alignment = taCenter
        Title.Caption = 'X, '#1084#1084
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZMER_Y'
        Title.Alignment = taCenter
        Title.Caption = 'Y, '#1084#1084
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 71
        Visible = True
      end>
  end
  object IB_Akt_raspil_detali: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    OnCalcFields = IB_Akt_raspil_detaliCalcFields
    OnDeleteError = IB_Akt_raspil_detaliDeleteError
    OnNewRecord = IB_Akt_raspil_detaliNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from AKT_RASPIL_DETALI'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into AKT_RASPIL_DETALI'
      
        '  (ID_PARENT, ID_PILOMAT_DETALI, KOL_VO, ID_SKLAD, ID, IS_REMONT' +
        ')'
      'values'
      
        '  (:ID_PARENT, :ID_PILOMAT_DETALI, :KOL_VO, :ID_SKLAD, :ID, :IS_' +
        'REMONT)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  ID_PILOMAT_DETALI,'
      '  KOL_VO,'
      '  ID_SKLAD,'
      '  ID,'
      '  IS_REMONT'
      'from AKT_RASPIL_DETALI '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from akt_raspil_detali'
      'where (id_parent=:ID)')
    ModifySQL.Strings = (
      'update AKT_RASPIL_DETALI'
      'set'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_PILOMAT_DETALI = :ID_PILOMAT_DETALI,'
      '  KOL_VO = :KOL_VO,'
      '  ID_SKLAD = :ID_SKLAD,'
      '  ID = :ID,'
      '  IS_REMONT = :IS_REMONT'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_AKT_RASPIL_DETALI_ID'
    DataSource = DM_Mebeli.DS_Akt_raspil
    Left = 608
    Top = 136
    object IB_Akt_raspil_detaliID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'AKT_RASPIL_DETALI.ID_PARENT'
      Required = True
    end
    object IB_Akt_raspil_detaliID_PILOMAT_DETALI: TIntegerField
      FieldName = 'ID_PILOMAT_DETALI'
      Origin = 'AKT_RASPIL_DETALI.ID_PILOMAT_DETALI'
      Required = True
    end
    object IB_Akt_raspil_detaliKOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'AKT_RASPIL_DETALI.KOL_VO'
    end
    object IB_Akt_raspil_detaliID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Origin = 'AKT_RASPIL_DETALI.ID_SKLAD'
    end
    object IB_Akt_raspil_detaliID: TIntegerField
      FieldName = 'ID'
      Origin = 'AKT_RASPIL_DETALI.ID'
    end
    object IB_Akt_raspil_detaliGRUPA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'GRUPA_NAME'
      LookupDataSet = IB_Pilomat_Detali_F
      LookupKeyFields = 'ID_PILOMAT_DETALI'
      LookupResultField = 'GRUPA_NAME'
      KeyFields = 'ID_PILOMAT_DETALI'
      Size = 100
      Lookup = True
    end
    object IB_Akt_raspil_detaliDETALY_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'DETALI_NAME'
      LookupDataSet = IB_Pilomat_Detali_F
      LookupKeyFields = 'ID_PILOMAT_DETALI'
      LookupResultField = 'DETALY_NAME'
      KeyFields = 'ID_PILOMAT_DETALI'
      Size = 100
      Lookup = True
    end
    object IB_Akt_raspil_detaliIS_REMONT: TSmallintField
      FieldName = 'IS_REMONT'
      Origin = 'AKT_RASPIL_DETALI.IS_REMONT'
    end
    object IB_Akt_raspil_detaliREMONT_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'REMONT_NAME'
      Size = 3
      Calculated = True
    end
  end
  object DS_Akt_raspil_detali: TDataSource
    DataSet = IB_Akt_raspil_detali
    Left = 656
    Top = 136
  end
  object IB_Akt_raspil_listy: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    AutoCalcFields = False
    BeforePost = IB_Akt_raspil_listyBeforePost
    OnNewRecord = IB_Akt_raspil_listyNewRecord
    OnPostError = IB_Akt_raspil_listyPostError
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
      'select * from AKT_RASPIL_listy'
      'where (id_parent=:ID)')
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
    Left = 64
    Top = 280
    object IB_Akt_raspil_listyID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'AKT_RASPIL_LISTY.ID_PARENT'
      Required = True
    end
    object IB_Akt_raspil_listyID_PILOMAT_LISTY: TIntegerField
      FieldName = 'ID_PILOMAT_LISTY'
      Origin = 'AKT_RASPIL_LISTY.ID_PILOMAT_LISTY'
      Required = True
    end
    object IB_Akt_raspil_listyKOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'AKT_RASPIL_LISTY.KOL_VO'
    end
    object IB_Akt_raspil_listyID: TIntegerField
      FieldName = 'ID'
      Origin = 'AKT_RASPIL_LISTY.ID'
      Required = True
    end
    object IB_Akt_raspil_listyGRUPA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'GRUPA_NAME'
      LookupDataSet = IB_Pilomat_Listy_F
      LookupKeyFields = 'ID_PILOMAT_LISTY'
      LookupResultField = 'GRUPA_NAME'
      KeyFields = 'ID_PILOMAT_LISTY'
      Size = 100
      Lookup = True
    end
    object IB_Akt_raspil_listyLISTY_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'LISTY_NAME'
      LookupDataSet = IB_Pilomat_Listy_F
      LookupKeyFields = 'ID_PILOMAT_LISTY'
      LookupResultField = 'LISTY_NAME'
      KeyFields = 'ID_PILOMAT_LISTY'
      Size = 100
      Lookup = True
    end
  end
  object DS_Akt_raspil_listy: TDataSource
    DataSet = IB_Akt_raspil_listy
    Left = 104
    Top = 280
  end
  object IB_Pilomat_Listy_F: TIBDataSet
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
      
        'select pg.name grupa_name, pl.id  ID_PILOMAT_LISTY, pl.name list' +
        'y_name'
      'from pilomat_grupa pg, pilomat_listy pl'
      'where pl.id_grupa=pg.id')
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
    Left = 424
    Top = 240
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
    Left = 952
    Top = 72
  end
  object PMenu_Detali: TPopupMenu
    Left = 736
    Top = 144
    object N_Clear_Remont: TMenuItem
      Caption = #1054#1073#1099#1095#1085#1072#1103
      OnClick = N_Clear_RemontClick
    end
    object N_Set_Remont: TMenuItem
      Caption = #1056#1077#1084#1086#1085#1090
      OnClick = N_Set_RemontClick
    end
  end
end
