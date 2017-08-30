object F_Pilomat: TF_Pilomat
  Left = 0
  Top = 0
  AutoScroll = False
  Caption = #1055#1080#1083#1086#1084#1072#1090#1077#1088#1080#1072#1083#1099
  ClientHeight = 687
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
  ShowHint = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object DBG_Grupa: TDBGrid
    Left = 0
    Top = 0
    Width = 497
    Height = 569
    DataSource = DM_Mebeli.DS_Pilomat_grupa
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PM_Add_detali_in_list
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBG_GrupaDblClick
    OnKeyUp = DBG_GrupaKeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'ARTICLE'
        Title.Alignment = taCenter
        Title.Caption = #1040#1088#1090
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 302
        Visible = True
      end>
  end
  object DBG_Listy: TDBGrid
    Left = 504
    Top = 3
    Width = 673
    Height = 246
    DataSource = DM_Mebeli.DS_Pilomat_listy
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBG_ListyDblClick
    OnKeyUp = DBG_ListyKeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1055#1080#1083#1086#1084#1072#1090#1077#1088#1080#1072#1083' '#1083#1080#1089#1090#1099
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 383
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LIST_OSTATOK'
        Title.Alignment = taCenter
        Title.Caption = #1054#1057#1058#1040#1058#1054#1050
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 109
        Visible = True
      end>
  end
  object DBG_Detali: TDBGrid
    Left = 504
    Top = 296
    Width = 673
    Height = 273
    DataSource = DM_Mebeli.DS_Pilomat_detali
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PM_Add_detali_in_list
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBG_DetaliDblClick
    OnKeyUp = DBG_DetaliKeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1055#1080#1083#1086#1084#1072#1090#1077#1088#1080#1072#1083' '#1076#1077#1090#1072#1083#1080
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 511
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 1
    Top = 624
    Width = 1176
    Height = 57
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object B_Exit: TButton
      Left = 1064
      Top = 12
      Width = 97
      Height = 33
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 0
    end
  end
  object P_Select: TPanel
    Left = 1
    Top = 613
    Width = 1176
    Height = 57
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object B_Cancel_select: TButton
      Left = 1064
      Top = 12
      Width = 97
      Height = 33
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 1
    end
    object B_Select: TButton
      Left = 960
      Top = 12
      Width = 97
      Height = 33
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ModalResult = 1
      TabOrder = 0
      OnClick = B_SelectClick
    end
  end
  object E_Grupa_Search: TEdit
    Left = 8
    Top = 576
    Width = 441
    Height = 26
    Hint = 
      #1042#1074#1077#1076#1080#1090#1077' '#1092#1080#1083#1100#1090#1088' '#1080' '#1085#1072#1078#1084#1080#1090#1077' Enter. '#1044#1083#1103' '#1086#1090#1084#1077#1085#1099' '#1092#1080#1083#1100#1090#1088#1072' '#1086#1095#1080#1089#1090#1080#1090#1077' '#1087#1086#1083#1077 +
      ' '#1080' '#1085#1072#1078#1084#1080#1090#1077' Enter'
    TabOrder = 5
    Text = #1054#1090#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1075#1088#1091#1087#1087#1091
    OnEnter = E_Grupa_SearchEnter
    OnExit = E_Grupa_SearchExit
    OnKeyUp = E_Grupa_SearchKeyUp
  end
  object E_Detali_Search: TEdit
    Left = 520
    Top = 576
    Width = 441
    Height = 26
    Hint = 
      #1042#1074#1077#1076#1080#1090#1077' '#1092#1080#1083#1100#1090#1088' '#1080' '#1085#1072#1078#1084#1080#1090#1077' Enter. '#1044#1083#1103' '#1086#1090#1084#1077#1085#1099' '#1092#1080#1083#1100#1090#1088#1072' '#1086#1095#1080#1089#1090#1080#1090#1077' '#1087#1086#1083#1077 +
      ' '#1080' '#1085#1072#1078#1084#1080#1090#1077' Enter'
    TabOrder = 6
    Text = #1054#1090#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1076#1077#1090#1072#1083#1080
    OnEnter = E_Detali_SearchEnter
    OnExit = E_Detali_SearchExit
    OnKeyUp = E_Detali_SearchKeyUp
  end
  object E_Listy_Search: TEdit
    Left = 520
    Top = 256
    Width = 441
    Height = 26
    Hint = 
      #1042#1074#1077#1076#1080#1090#1077' '#1092#1080#1083#1100#1090#1088' '#1080' '#1085#1072#1078#1084#1080#1090#1077' Enter. '#1044#1083#1103' '#1086#1090#1084#1077#1085#1099' '#1092#1080#1083#1100#1090#1088#1072' '#1086#1095#1080#1089#1090#1080#1090#1077' '#1087#1086#1083#1077 +
      ' '#1080' '#1085#1072#1078#1084#1080#1090#1077' Enter'
    TabOrder = 7
    Text = #1054#1090#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1083#1080#1089#1090#1099
    OnEnter = E_Listy_SearchEnter
    OnExit = E_Listy_SearchExit
    OnKeyUp = E_Listy_SearchKeyUp
  end
  object MainMenu1: TMainMenu
    Left = 88
    Top = 88
    object N_Insert: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      object N_Insert_grupa: TMenuItem
        Caption = #1043#1088#1091#1087#1087#1091
        OnClick = N_Insert_grupaClick
      end
      object N_Insert_listy: TMenuItem
        Caption = #1051#1080#1089#1090#1099
        OnClick = N_Insert_listyClick
      end
      object N_Insert_detali: TMenuItem
        Caption = #1044#1077#1090#1072#1083#1080
        OnClick = N_Insert_detaliClick
      end
    end
    object N_Edit: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      object N_edit_grupa: TMenuItem
        Caption = #1043#1088#1091#1087#1087#1091
        OnClick = N_edit_grupaClick
      end
      object N_edit_listy: TMenuItem
        Caption = #1051#1080#1089#1090#1099
        OnClick = N_edit_listyClick
      end
      object N_edit_detali: TMenuItem
        Caption = #1044#1077#1090#1072#1083#1080
        OnClick = N_edit_detaliClick
      end
    end
    object N_Delete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      object N_Delete_grupa: TMenuItem
        Caption = #1043#1088#1091#1087#1087#1091
        OnClick = N_Delete_grupaClick
      end
      object N_Delete_listy: TMenuItem
        Caption = #1051#1080#1089#1090#1099
        OnClick = N_Delete_listyClick
      end
      object N_Delete_detali: TMenuItem
        Caption = #1044#1077#1090#1072#1083#1080
        OnClick = N_Delete_detaliClick
      end
    end
    object N_Exit: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnClick = N_ExitClick
    end
    object N1: TMenuItem
      Caption = #1048#1084#1087#1086#1088#1090
      object N_Import_listy: TMenuItem
        Caption = #1048#1084#1087#1086#1088#1090' '#1083#1080#1089#1090#1099
        OnClick = N_Import_listyClick
      end
      object N_Import_detali: TMenuItem
        Caption = #1048#1084#1087#1086#1088#1090' '#1076#1077#1090#1072#1083#1080
        OnClick = N_Import_detaliClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object N_Import_grupa_name: TMenuItem
        Caption = #1053#1072#1079#1074#1072#1085#1080#1103' '#1075#1088#1091#1087#1087#1072' '#1080#1079' 1'#1057
        OnClick = N_Import_grupa_nameClick
      end
    end
  end
  object IB_Pilomat_grupa_F: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PILOMAT_GRUPA'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PILOMAT_GRUPA'
      '  (ID, NAME)'
      'values'
      '  (:ID, :NAME)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  NAME'
      'from PILOMAT_GRUPA '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select pg.id, pg.name'
      'from pilomat_grupa pg'
      'where exists ('
      'select list_id from GET_LISTY_ESTI_OSTATOK(pg.id)'
      ')'
      'and pg.name like :grupa_name'
      'order by pg.name')
    ModifySQL.Strings = (
      'update PILOMAT_GRUPA'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME'
      'where'
      '  ID = :OLD_ID')
    Left = 88
    Top = 166
  end
  object IB_Pilomat_listy_F: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PILOMAT_GRUPA'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PILOMAT_GRUPA'
      '  (ID, NAME)'
      'values'
      '  (:ID, :NAME)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  NAME'
      'from PILOMAT_GRUPA '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select list_id id, list_name name, list_ostatok '
      
        'from GET_LISTY_ESTI_OSTATOK(:id) where list_name like :listy_nam' +
        'e'
      'order by list_name')
    ModifySQL.Strings = (
      'update PILOMAT_GRUPA'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME'
      'where'
      '  ID = :OLD_ID')
    DataSource = DS_Pilomat_grupa_F
    Left = 536
    Top = 70
  end
  object DS_Pilomat_listy_F: TDataSource
    AutoEdit = False
    DataSet = IB_Pilomat_listy_F
    Left = 592
    Top = 72
  end
  object IB_Pilomat_Detali_F: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PILOMAT_GRUPA'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PILOMAT_GRUPA'
      '  (ID, NAME)'
      'values'
      '  (:ID, :NAME)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  NAME'
      'from PILOMAT_GRUPA '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select id, name'
      'from pilomat_detali'
      'where (id_grupa= :id) and (upper(name) like upper(:detali_name))'
      'order by name')
    ModifySQL.Strings = (
      'update PILOMAT_GRUPA'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME'
      'where'
      '  ID = :OLD_ID')
    DataSource = DS_Pilomat_grupa_F
    Left = 960
    Top = 342
  end
  object DS_Pilomat_Detali_F: TDataSource
    AutoEdit = False
    DataSet = IB_Pilomat_Detali_F
    Left = 1016
    Top = 344
  end
  object DS_Pilomat_grupa_F: TDataSource
    AutoEdit = False
    DataSet = IB_Pilomat_grupa_F
    Left = 128
    Top = 168
  end
  object OpenDialog1: TOpenDialog
    Left = 368
    Top = 96
  end
  object PM_Add_detali_in_list: TPopupMenu
    OnPopup = PM_Add_detali_in_listPopup
    Left = 912
    Top = 464
    object N_Add_detali_to_List: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1077#1090#1072#1083#1100' '#1074' '#1089#1087#1080#1089#1086#1082' '#1076#1083#1103' '#1072#1085#1072#1083#1080#1079#1072
      OnClick = N_Add_detali_to_ListClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N_Add_grupa_to_List: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091' '#1074' '#1089#1087#1080#1089#1086#1082' '#1076#1083#1103' '#1072#1085#1072#1083#1080#1079#1072
      OnClick = N_Add_grupa_to_ListClick
    end
  end
end
