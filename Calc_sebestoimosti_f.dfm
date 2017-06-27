object F_Calc_sebestoimosti: TF_Calc_sebestoimosti
  Left = 0
  Top = 0
  Width = 1200
  Height = 724
  Caption = #1046#1091#1088#1085#1072#1083' "'#1050#1072#1083#1100#1082#1091#1083#1103#1094#1080#1103' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1080' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074'"'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Panel1: TPanel
    Left = 1
    Top = 613
    Width = 1176
    Height = 57
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object B_Exit: TButton
      Left = 1072
      Top = 12
      Width = 97
      Height = 33
      Cancel = True
      Caption = '&'#1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 0
    end
    object B_Refresh: TButton
      Left = 16
      Top = 12
      Width = 97
      Height = 33
      Caption = '&'#1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 1
      TabStop = False
    end
  end
  object DBGrid1: TDBGrid
    Left = 1
    Top = 5
    Width = 1176
    Height = 297
    DataSource = DS_Calc_Sebest_Jurnal
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1076#1086#1082
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_DOC'
        Title.Alignment = taCenter
        Title.Caption = #1044#1040#1058#1040
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Alignment = taCenter
        Title.Caption = #1055#1056#1048#1052#1045#1063#1040#1053#1048#1045
        Width = 642
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 1
    Top = 309
    Width = 1176
    Height = 297
    HelpType = htKeyword
    DataSource = DS_Calc_Sebest_1
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 425
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GOTOVPROD_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1054#1058#1054#1042#1040#1071' '#1055#1056#1054#1044#1059#1050#1062#1048#1071
        Width = 511
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Title.Alignment = taCenter
        Title.Caption = #1057#1077#1073#1077#1089#1090
        Width = 119
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 216
    Top = 112
    object N_Docs: TMenuItem
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      object N_Insert_main: TMenuItem
        Caption = #1053#1086#1074#1072#1103' '#1082#1072#1083#1100#1082#1091#1083#1103#1094#1080#1103
        OnClick = N_Insert_mainClick
      end
      object N_Edit_main: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1072#1083#1100#1082#1091#1083#1103#1094#1080#1102
        OnClick = N_Edit_mainClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object N_Delete_Main: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = N_Delete_MainClick
      end
    end
    object N_Period_of_view: TMenuItem
      Caption = #1055#1077#1088#1080#1086#1076' '#1087#1088#1086#1089#1084#1086#1090#1088#1072
    end
  end
  object IB_Calc_Sebest_Jurnal: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from calc_sebest_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into calc_sebest_0'
      '  (ID, DATE_DOC, DESCRIPTION)'
      'values'
      '  (:ID, :DATE_DOC, :DESCRIPTION)')
    RefreshSQL.Strings = (
      'Select *'
      'from calc_sebest_0 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from calc_sebest_0'
      'where date_doc>= :date_start'
      'order by date_doc')
    ModifySQL.Strings = (
      'update calc_sebest_0'
      'set'
      '  ID = :ID,'
      '  DATE_DOC = :DATE_DOC,'
      '  DESCRIPTION = :DESCRIPTION'
      'where'
      '  ID = :OLD_ID')
    Left = 432
    Top = 128
  end
  object DS_Calc_Sebest_Jurnal: TDataSource
    AutoEdit = False
    DataSet = IB_Calc_Sebest_Jurnal
    Left = 472
    Top = 128
  end
  object PopupMenu1: TPopupMenu
    Left = 728
    Top = 176
    object N_Insert_popup: TMenuItem
      Caption = #1053#1086#1074#1072#1103' '#1082#1072#1083#1100#1082#1091#1083#1103#1094#1080#1103
      OnClick = N_Insert_popupClick
    end
    object N_Edit_popup: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1072#1083#1100#1082#1091#1083#1103#1094#1080#1102
      OnClick = N_Edit_popupClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N_Delete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = N_DeleteClick
    end
  end
  object IB_Calc_Sebest_1: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from calc_sebest_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into calc_sebest_0'
      '  (ID, DATE_DOC, DESCRIPTION)'
      'values'
      '  (:ID, :DATE_DOC, :DESCRIPTION)')
    RefreshSQL.Strings = (
      'Select *'
      'from calc_sebest_0 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      
        'select gpg.name grupa_name, gp.name gotovprod_name, cs1.price_se' +
        'best price'
      
        'from gotov_prod_grupa gpg, gotov_prod_0 gp, calc_sebest_0 cs0, c' +
        'alc_sebest_1 cs1'
      
        'where (gpg.id=gp.id_grupa) and (gp.id=cs1.id_gotovprod) and (cs0' +
        '.id=cs1.id_parent) and (cs1.id_parent= :id)'
      'order by gpg.name, gp.name'
      '')
    ModifySQL.Strings = (
      'update calc_sebest_0'
      'set'
      '  ID = :ID,'
      '  DATE_DOC = :DATE_DOC,'
      '  DESCRIPTION = :DESCRIPTION'
      'where'
      '  ID = :OLD_ID')
    DataSource = DS_Calc_Sebest_Jurnal
    Left = 528
    Top = 392
  end
  object DS_Calc_Sebest_1: TDataSource
    AutoEdit = False
    DataSet = IB_Calc_Sebest_1
    Left = 568
    Top = 392
  end
end
