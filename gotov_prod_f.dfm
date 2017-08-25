object F_Gotov_prod: TF_Gotov_prod
  Left = 47
  Top = 63
  Anchors = []
  AutoScroll = False
  Caption = #1043#1086#1090#1086#1074#1072#1103' '#1087#1088#1086#1076#1091#1082#1094#1080#1103
  ClientHeight = 670
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
  Scaled = False
  ShowHint = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Panel1: TPanel
    Left = 0
    Top = 610
    Width = 1169
    Height = 57
    BevelInner = bvLowered
    TabOrder = 2
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
      OnClick = B_SelectClick
    end
    object E_Grupa_Filter: TEdit
      Left = 8
      Top = 16
      Width = 385
      Height = 26
      TabStop = False
      TabOrder = 2
      Text = #1042#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1087#1086' '#1075#1088#1091#1087#1087#1077
      OnEnter = E_Grupa_FilterEnter
      OnExit = E_Grupa_FilterExit
      OnKeyUp = E_Grupa_FilterKeyUp
    end
    object E_Gotovprod_Filter: TEdit
      Left = 536
      Top = 16
      Width = 385
      Height = 26
      TabStop = False
      TabOrder = 3
      Text = #1042#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1096#1082#1072#1092#1072
      OnEnter = E_Gotovprod_FilterEnter
      OnExit = E_Gotovprod_FilterExit
      OnKeyUp = E_Gotovprod_FilterKeyUp
    end
  end
  object DBGrid_Grupa: TDBGrid
    Left = 0
    Top = 0
    Width = 521
    Height = 593
    DataSource = DM_Mebeli.DS_Gotov_prod_grupa
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
    OnDblClick = DBGrid_GrupaDblClick
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
    Left = 528
    Top = 0
    Width = 641
    Height = 601
    DataSource = DM_Mebeli.DS_Gotov_prod_0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
    OnDblClick = DBGrid_GotprodDblClick
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
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1088#1086#1076#1091#1082#1094#1080#1080
        Width = 431
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 8
    object N1: TMenuItem
      Caption = #1043#1088#1091#1087#1087#1072
      object N_Grupa_Insert: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        OnClick = N_Grupa_InsertClick
      end
      object N_Grupa_Edit: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        OnClick = N_Grupa_EditClick
      end
      object N_Grupa_Delete: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = N_Grupa_DeleteClick
      end
    end
    object N2: TMenuItem
      Caption = #1055#1088#1086#1076#1091#1082#1094#1080#1103
      object N_GotovProd_Insert: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        OnClick = N_GotovProd_InsertClick
      end
      object N_GotovProd_Edit: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        OnClick = N_GotovProd_EditClick
      end
      object N_GotovProd_Delete: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = N_GotovProd_DeleteClick
      end
    end
    object N3: TMenuItem
      Caption = #1055#1086#1080#1089#1082
      object N_Search_gotovprod_article: TMenuItem
        Caption = #1048#1089#1082#1072#1090#1100' '#1096#1082#1072#1092' '#1087#1086' '#1040#1088#1090#1080#1082#1091#1083#1091
        OnClick = N_Search_gotovprod_articleClick
      end
    end
    object N4: TMenuItem
      Caption = #1048#1084#1087#1086#1088#1090
      Enabled = False
      object N_Import_Photos: TMenuItem
        Caption = #1048#1084#1087#1086#1088#1090' '#1092#1086#1090#1086#1075#1088#1072#1092#1080#1081
        OnClick = N_Import_PhotosClick
      end
    end
  end
  object IB_Image: TIBDataSet
    Database = DM_Mebeli.DB_Images
    Transaction = DM_Mebeli.Transaction_Images
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from GOTOVPROD_IMAGES'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into GOTOVPROD_IMAGES'
      '  (ID, ID_GOTOVPROD, ARTICLE, IMAGE_JPG)'
      'values'
      '  (:ID, :ID_GOTOVPROD, :ARTICLE, :IMAGE_JPG)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_GOTOVPROD,'
      '  ARTICLE,'
      '  IMAGE_JPG'
      'from GOTOVPROD_IMAGES '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from GOTOVPROD_IMAGES'
      'where ID_GOTOVPROD= :ID_GOTOVPROD')
    ModifySQL.Strings = (
      'update GOTOVPROD_IMAGES'
      'set'
      '  ID = :ID,'
      '  ID_GOTOVPROD = :ID_GOTOVPROD,'
      '  ARTICLE = :ARTICLE,'
      '  IMAGE_JPG = :IMAGE_JPG'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_GOTOVPROD_IMAGES_ID'
    Left = 1064
    Top = 48
  end
  object DS_Image: TDataSource
    AutoEdit = False
    DataSet = IB_Image
    Left = 1096
    Top = 48
  end
end
