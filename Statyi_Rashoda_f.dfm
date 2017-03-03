object F_Statyi_Rashoda: TF_Statyi_Rashoda
  Left = 0
  Top = 25
  AutoScroll = False
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' "'#1057#1090#1072#1090#1100#1080' '#1056#1072#1089#1093#1086#1076#1072'"'
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
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object DBGrid_Grupa: TDBGrid
    Left = 0
    Top = 0
    Width = 577
    Height = 601
    DataSource = DS_Statyi_Rashoda_0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
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
        Width = 424
        Visible = True
      end>
  end
  object DBGrid_Gotprod: TDBGrid
    Left = 584
    Top = 0
    Width = 577
    Height = 601
    DataSource = DS_Statyi_Rashoda_1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
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
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1057#1058#1040#1058#1068#1071' '#1056#1040#1057#1061#1054#1044#1040
        Width = 431
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 605
    Width = 1185
    Height = 57
    BevelInner = bvLowered
    TabOrder = 2
    object B_Exit: TButton
      Left = 1080
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
      Left = 984
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
  object DS_Statyi_Rashoda_0: TDataSource
    DataSet = IB_Statyi_Rashoda_0
    Left = 104
    Top = 40
  end
  object IB_Statyi_Rashoda_0: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from STATYI_RASHODA'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into STATYI_RASHODA'
      '  (ID, ID_PARENT, NAME, IS_SEBESTOIMOSTI)'
      'values'
      '  (:ID, :ID_PARENT, :NAME, :IS_SEBESTOIMOSTI)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_PARENT,'
      '  NAME,'
      '  IS_SEBESTOIMOSTI'
      'from STATYI_RASHODA '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from STATYI_RASHODA'
      'where id_parent is null'
      'order by name')
    ModifySQL.Strings = (
      'update STATYI_RASHODA'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  NAME = :NAME,'
      '  IS_SEBESTOIMOSTI = :IS_SEBESTOIMOSTI'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_STATYI_RASHODA_ID'
    Left = 72
    Top = 40
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
      Caption = #1057#1090#1072#1090#1100#1103
      object N_Statya_Insert: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        OnClick = N_Statya_InsertClick
      end
      object N_Statya_Edit: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        OnClick = N_Statya_EditClick
      end
      object N_Statya_Delete: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = N_Statya_DeleteClick
      end
    end
  end
  object DS_Statyi_Rashoda_1: TDataSource
    DataSet = IB_Statyi_Rashoda_1
    Left = 536
    Top = 56
  end
  object IB_Statyi_Rashoda_1: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from STATYI_RASHODA'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into STATYI_RASHODA'
      '  (ID, ID_PARENT, NAME, IS_SEBESTOIMOSTI, IS_RASHOD)'
      'values'
      '  (:ID, :ID_PARENT, :NAME, :IS_SEBESTOIMOSTI, :IS_RASHOD)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_PARENT,'
      '  NAME,'
      '  IS_SEBESTOIMOSTI,'
      '  IS_RASHOD'
      'from STATYI_RASHODA '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from STATYI_RASHODA'
      'where id_parent=:ID'
      'order by name')
    ModifySQL.Strings = (
      'update STATYI_RASHODA'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  NAME = :NAME,'
      '  IS_SEBESTOIMOSTI = :IS_SEBESTOIMOSTI,'
      '  IS_RASHOD = :IS_RASHOD'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_STATYI_RASHODA_ID'
    DataSource = DS_Statyi_Rashoda_0
    Left = 504
    Top = 56
  end
end
