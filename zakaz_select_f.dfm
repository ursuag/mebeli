object F_Zakaz_select: TF_Zakaz_select
  Left = 162
  Top = 93
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1079#1072#1082#1072#1079#1072
  ClientHeight = 681
  ClientWidth = 953
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 18
  object DBGrid1: TDBGrid
    Left = 1
    Top = 0
    Width = 952
    Height = 217
    DataSource = DS_Zakaz_0
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
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1079#1072#1082#1072#1079#1072
        Width = 193
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATE_Z'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIMECHANIE'
        Title.Alignment = taCenter
        Title.Caption = #1055#1056#1048#1052#1045#1063#1040#1053#1048#1045
        Width = 575
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 224
    Width = 953
    Height = 401
    DataSource = DS_Zakaz_1
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
    Columns = <
      item
        Expanded = False
        FieldName = 'ARTICLE'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 352
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GOTOVPROD_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1048#1047#1044#1045#1051#1048#1071
        Width = 317
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIORITET'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090
        Width = 101
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 632
    Width = 953
    Height = 49
    BevelInner = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 101
      Height = 18
      Caption = #1053#1086#1084#1077#1088' '#1079#1072#1082#1072#1079#1072
    end
    object B_Exit: TButton
      Left = 856
      Top = 8
      Width = 89
      Height = 33
      Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
      ModalResult = 2
      TabOrder = 0
      OnClick = B_ExitClick
    end
    object B_Select: TButton
      Left = 760
      Top = 8
      Width = 89
      Height = 33
      Caption = '&'#1042#1099#1073#1088#1072#1090#1100
      ModalResult = 1
      TabOrder = 1
      OnClick = B_SelectClick
    end
    object E_Zakaz: TEdit
      Left = 125
      Top = 14
      Width = 145
      Height = 26
      TabOrder = 2
      OnExit = E_ZakazExit
      OnKeyDown = E_ZakazKeyDown
    end
  end
  object IB_Zakaz_0: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from zakaz_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into zakaz_0'
      '  (ID, DATE_Z, ISCLOSED, PRIMECHANIE)'
      'values'
      '  (:ID, :DATE_Z, :ISCLOSED, :PRIMECHANIE)')
    RefreshSQL.Strings = (
      'Select *'
      'from zakaz_0 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *  from zakaz_0'
      'where id>0'
      'order by date_z')
    ModifySQL.Strings = (
      'update zakaz_0'
      'set'
      '  ID = :ID,'
      '  DATE_Z = :DATE_Z,'
      '  ISCLOSED = :ISCLOSED,'
      '  PRIMECHANIE = :PRIMECHANIE'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_ZAKAZ_0_ID'
    Left = 320
    Top = 72
  end
  object DS_Zakaz_0: TDataSource
    DataSet = IB_Zakaz_0
    Left = 416
    Top = 72
  end
  object IB_Zakaz_1: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from zakaz_1'
      'where'
      '  ID_PARENT = :OLD_ID_PARENT and'
      '  ID_GOTOV_PROD = :OLD_ID_GOTOV_PROD')
    InsertSQL.Strings = (
      'insert into zakaz_1'
      '  (ID_PARENT, ID_GOTOV_PROD, KOL_VO, PRIORITET)'
      'values'
      '  (:ID_PARENT, :ID_GOTOV_PROD, :KOL_VO, :PRIORITET)')
    RefreshSQL.Strings = (
      'Select *'
      'from zakaz_1 '
      'where'
      '  ID_PARENT = :ID_PARENT and'
      '  ID_GOTOV_PROD = :ID_GOTOV_PROD')
    SelectSQL.Strings = (
      
        'select gp0.article article , gpg.name grupa_name, gp0.name gotov' +
        'prod_name, z1.kol_vo kol_vo, z1.prioritet prioritet'
      'from zakaz_1 z1, gotov_prod_0 gp0, gotov_prod_grupa gpg'
      
        'where (z1.id_parent=:ID) and (gp0.id_grupa=gpg.id) and (z1.id_go' +
        'tov_prod=gp0.id)'
      'order by gpg.name, gp0.name')
    ModifySQL.Strings = (
      'update zakaz_1'
      'set'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_GOTOV_PROD = :ID_GOTOV_PROD,'
      '  KOL_VO = :KOL_VO,'
      '  PRIORITET = :PRIORITET'
      'where'
      '  ID_PARENT = :OLD_ID_PARENT and'
      '  ID_GOTOV_PROD = :OLD_ID_GOTOV_PROD')
    DataSource = DS_Zakaz_0
    Left = 200
    Top = 344
  end
  object DS_Zakaz_1: TDataSource
    DataSet = IB_Zakaz_1
    Left = 296
    Top = 344
  end
end
