object F_Lavoare_list: TF_Lavoare_list
  Left = -12
  Top = 53
  Width = 1200
  Height = 740
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' "'#1059#1084#1099#1074#1072#1083#1100#1085#1080#1082#1080'"'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Panel1: TPanel
    Left = 0
    Top = 618
    Width = 1169
    Height = 57
    BevelInner = bvLowered
    TabOrder = 0
    object B_Exit: TButton
      Left = 1064
      Top = 12
      Width = 89
      Height = 33
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 0
      OnClick = B_ExitClick
    end
    object B_Select: TButton
      Left = 968
      Top = 12
      Width = 89
      Height = 33
      Cancel = True
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 1
      Visible = False
    end
  end
  object DBGrid_Grupa: TDBGrid
    Left = 0
    Top = 0
    Width = 521
    Height = 617
    DataSource = DS_Lavoare_Grupa
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1043#1056#1059#1055#1055#1067
        Width = 452
        Visible = True
      end>
  end
  object DBGrid_Gotprod: TDBGrid
    Left = 526
    Top = 0
    Width = 641
    Height = 321
    DataSource = DS_Lavoare_1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'ARTICLE'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1040#1088#1090#1080#1082#1091#1083
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1091#1084#1099#1074#1072#1083#1100#1085#1080#1082#1072
        Width = 431
        Visible = True
      end>
  end
  object DBGrid1: TDBGrid
    Left = 526
    Top = 328
    Width = 641
    Height = 281
    DataSource = DS_Lavoare_gotovprod
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'ARTICLE'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1040#1088#1090#1080#1082#1091#1083
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1096#1082#1072#1092#1072
        Width = 431
        Visible = True
      end>
  end
  object DS_Lavoare_Grupa: TDataSource
    AutoEdit = False
    DataSet = IB_Lavoare_Grupa
    Left = 88
    Top = 88
  end
  object IB_Lavoare_Grupa: TIBDataSet
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
    Left = 48
    Top = 88
  end
  object DS_Lavoare_1: TDataSource
    AutoEdit = False
    DataSet = IB_Lavoare_1
    Left = 1088
    Top = 128
  end
  object IB_Lavoare_1: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from lavoare_1'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into lavoare_1'
      '  (ID)'
      'values'
      '  (:ID)')
    RefreshSQL.Strings = (
      'Select *'
      'from lavoare_1 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from lavoare_1'
      'where id_parent= :id'
      'order by name')
    ModifySQL.Strings = (
      'update lavoare_1'
      'set'
      '  ID = :ID'
      'where'
      '  ID = :OLD_ID')
    DataSource = DS_Lavoare_Grupa
    Left = 1048
    Top = 128
  end
  object MainMenu1: TMainMenu
    Left = 240
    Top = 240
    object N1: TMenuItem
      Caption = #1043#1088#1091#1087#1087#1072
      object N_InsertGrupa_main: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
        OnClick = N_InsertGrupa_mainClick
      end
      object N_EditGrupa_main: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object N_DeleteGrupa_main: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
        OnClick = N_DeleteGrupa_mainClick
      end
    end
    object N2: TMenuItem
      Caption = #1059#1084#1099#1074#1072#1083#1100#1085#1080#1082
      object N_InsertLavoar_main: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1084#1099#1074#1072#1083#1100#1085#1080#1082
        OnClick = N_InsertLavoar_mainClick
      end
      object N_EditLavoar_main: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1091#1084#1099#1074#1072#1083#1100#1085#1080#1082
        OnClick = N_EditLavoar_mainClick
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object N_Deletelavoar_main: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1091#1084#1099#1074#1072#1083#1100#1085#1080#1082
        OnClick = N_Deletelavoar_mainClick
      end
    end
    object N_Import: TMenuItem
      Caption = #1048#1084#1087#1086#1088#1090
      object N_Import_lavoare: TMenuItem
        Caption = #1048#1084#1087#1086#1088#1090' '#1091#1084#1099#1074#1072#1083#1100#1085#1080#1082#1086#1074
        Enabled = False
        OnClick = N_Import_lavoareClick
      end
      object N_Import_lavoare_gotovprod: TMenuItem
        Caption = #1048#1084#1087#1086#1088#1090' '#1096#1082#1072#1092#1086#1074' '#1082' '#1091#1084#1099#1074#1072#1083#1100#1085#1080#1082#1072#1084
        OnClick = N_Import_lavoare_gotovprodClick
      end
    end
  end
  object DS_Lavoare_gotovprod: TDataSource
    AutoEdit = False
    DataSet = IB_Lavoare_gotovprod
    Left = 1104
    Top = 488
  end
  object IB_Lavoare_gotovprod: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from lavoare_1'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into lavoare_1'
      '  (ID)'
      'values'
      '  (:ID)')
    RefreshSQL.Strings = (
      'Select *'
      'from lavoare_1 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select gp0.article, gp0.name'
      'from LAVOARE_GOTOVPROD lg, gotov_prod_0 gp0'
      'where (lg.id_gotovprod=gp0.id) and (lg.id_lavoar=:id)'
      'order by gp0.name')
    ModifySQL.Strings = (
      'update lavoare_1'
      'set'
      '  ID = :ID'
      'where'
      '  ID = :OLD_ID')
    DataSource = DS_Lavoare_1
    Left = 1064
    Top = 488
  end
end
