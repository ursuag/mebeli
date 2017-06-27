object F_Spisanie_jurnal: TF_Spisanie_jurnal
  Left = 8
  Top = 1
  AutoScroll = False
  Caption = #1046#1091#1088#1085#1072#1083' '#1072#1082#1090#1086#1074' '#1089#1087#1080#1089#1072#1085#1080#1103
  ClientHeight = 494
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object DBGrid1: TDBGrid
    Left = 1
    Top = 0
    Width = 1176
    Height = 241
    DataSource = DM_Mebeli.DS_Spisanie_0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1072#1082#1090#1072
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_SPIS'
        Title.Alignment = taCenter
        Title.Caption = #1044#1040#1058#1040
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SKLAD_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1057#1050#1051#1040#1044
        Width = 295
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIMECHANIE'
        Title.Alignment = taCenter
        Title.Caption = #1055#1056#1048#1052#1045#1063#1040#1053#1048#1045
        Width = 434
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 248
    Width = 545
    Height = 209
    DataSource = DM_Mebeli.DS_Spisanie_listy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'LISTY_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1051#1048#1057#1058#1067
        Width = 307
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 93
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 9
    Top = 618
    Width = 1160
    Height = 57
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object B_Exit: TButton
      Left = 1048
      Top = 12
      Width = 97
      Height = 33
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 0
      OnClick = B_ExitClick
    end
    object B_Insert: TButton
      Left = 12
      Top = 12
      Width = 97
      Height = 33
      Hint = #1042#1089#1090#1072#1074#1083#1103#1077#1090' '#1101#1090#1072#1087' '#1087#1086#1089#1083#1077' '#1090#1077#1082#1091#1097#1077#1075#1086
      Caption = #1053#1086#1074#1099#1081
      TabOrder = 1
      OnClick = B_InsertClick
    end
    object B_Edit: TButton
      Left = 116
      Top = 12
      Width = 97
      Height = 33
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 2
      OnClick = B_EditClick
    end
    object B_Delete: TButton
      Left = 220
      Top = 12
      Width = 97
      Height = 33
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 3
      OnClick = B_DeleteClick
    end
  end
  object DBGrid3: TDBGrid
    Left = 8
    Top = 464
    Width = 1169
    Height = 153
    DataSource = DM_Mebeli.DS_Spisanie_detali
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 292
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETALI_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1044#1045#1058#1040#1051#1068
        Width = 360
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDRABOT_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1042#1048#1044' '#1056#1040#1041#1054#1058
        Width = 167
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OPLATA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1054#1055#1051#1040#1058#1040
        Width = 138
        Visible = True
      end>
  end
  object DBGrid4: TDBGrid
    Left = 560
    Top = 248
    Width = 617
    Height = 209
    DataSource = DM_Mebeli.DS_Spisanie_furnitura
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'FURNITURA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1052#1055#1051#1045#1050#1058#1059#1070#1065#1048#1045
        Width = 299
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EDIZM_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1045#1044'.'#1048#1047#1052'.'
        Width = 88
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 128
    Top = 96
    object N_Period_of_view: TMenuItem
      Caption = #1055#1077#1088#1080#1086#1076' '#1087#1088#1086#1089#1084#1086#1090#1088#1072
      OnClick = N_Period_of_viewClick
    end
    object N_Print: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      object N_Print_akt: TMenuItem
        Caption = #1040#1082#1090' '#1089#1087#1080#1089#1072#1085#1080#1103
        OnClick = N_Print_aktClick
      end
      object N_Print_jurnal: TMenuItem
        Caption = #1046#1091#1088#1085#1072#1083' "'#1040#1082#1090#1086#1074' '#1089#1087#1080#1089#1072#1085#1080#1103'"'
        OnClick = N_Print_jurnalClick
      end
    end
  end
  object IB_Pilomat_detali: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select pg.name as grupa_name, pd.id as id_pilomat_detali, pd.nam' +
        'e as detali_name'
      'from pilomat_grupa pg, pilomat_detali pd'
      'where (pg.id=pd.id_grupa)')
    ModifySQL.Strings = (
      '')
    Active = True
    Left = 824
    Top = 544
  end
end
