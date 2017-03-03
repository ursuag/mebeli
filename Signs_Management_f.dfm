object F_Signs_Management: TF_Signs_Management
  Left = 209
  Top = 119
  Width = 1037
  Height = 563
  Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1076#1087#1080#1089#1103#1084#1080
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 18
  object Panel1: TPanel
    Left = 0
    Top = 468
    Width = 1017
    Height = 57
    BevelInner = bvLowered
    TabOrder = 0
    object B_Exit: TButton
      Left = 909
      Top = 11
      Width = 105
      Height = 36
      Caption = '&'#1047#1072#1082#1088#1099#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = B_ExitClick
    end
  end
  object DBG_Listy: TDBGrid
    Left = 4
    Top = 0
    Width = 1013
    Height = 241
    TabStop = False
    DataSource = DS_Tables_DB
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
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
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Alignment = taCenter
        Title.Caption = #1044#1054#1050#1059#1052#1045#1053#1058
        Width = 588
        Visible = True
      end>
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 248
    Width = 857
    Height = 193
    TabStop = False
    DataSource = DS_USER_SIGN_RIGHTS
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    OnExit = DBGrid1Exit
    Columns = <
      item
        Expanded = False
        FieldName = 'USER_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1055#1054#1051#1068#1047#1054#1042#1040#1058#1045#1051#1068
        Width = 728
        Visible = True
      end>
  end
  object IB_Tables_DB: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from AKT_RASPIL_listy'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into AKT_RASPIL_listy'
      '  (ID, ID_PARENT, ID_PILOMAT_LISTY, KOL_VO)'
      'values'
      '  (:ID, :ID_PARENT, :ID_PILOMAT_LISTY, :KOL_VO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  ID_PILOMAT_LISTY,'
      '  KOL_VO,'
      '  ID'
      'from AKT_RASPIL_listy '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from tables_db'
      'order by description')
    ModifySQL.Strings = (
      'update AKT_RASPIL_listy'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_PILOMAT_LISTY = :ID_PILOMAT_LISTY,'
      '  KOL_VO = :KOL_VO'
      'where'
      '  ID = :OLD_ID')
    DataSource = DM_Mebeli.DS_Akt_raspil
    Left = 32
    Top = 64
  end
  object DS_Tables_DB: TDataSource
    AutoEdit = False
    DataSet = IB_Tables_DB
    Left = 80
    Top = 64
  end
  object IB_UsersDB: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from AKT_RASPIL_listy'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into AKT_RASPIL_listy'
      '  (ID, ID_PARENT, ID_PILOMAT_LISTY, KOL_VO)'
      'values'
      '  (:ID, :ID_PARENT, :ID_PILOMAT_LISTY, :KOL_VO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  ID_PILOMAT_LISTY,'
      '  KOL_VO,'
      '  ID'
      'from AKT_RASPIL_listy '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from users_db'
      'order by name')
    ModifySQL.Strings = (
      'update AKT_RASPIL_listy'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_PILOMAT_LISTY = :ID_PILOMAT_LISTY,'
      '  KOL_VO = :KOL_VO'
      'where'
      '  ID = :OLD_ID')
    Active = True
    DataSource = DM_Mebeli.DS_Akt_raspil
    Left = 880
    Top = 336
  end
  object DS_UsersDB: TDataSource
    AutoEdit = False
    DataSet = IB_UsersDB
    Left = 928
    Top = 336
  end
  object IB_USER_SIGN_RIGHTS: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    OnNewRecord = IB_USER_SIGN_RIGHTSNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from USER_SIGN_RIGHTS'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into USER_SIGN_RIGHTS'
      '  (ID, ID_USER, TABLE_ID)'
      'values'
      '  (:ID, :ID_USER, :TABLE_ID)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_USER,'
      '  TABLE_ID'
      'from USER_SIGN_RIGHTS '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from USER_SIGN_RIGHTS'
      'where table_id=:id')
    ModifySQL.Strings = (
      'update USER_SIGN_RIGHTS'
      'set'
      '  ID = :ID,'
      '  ID_USER = :ID_USER,'
      '  TABLE_ID = :TABLE_ID'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_USER_SIGN_RIGHTS_ID'
    DataSource = DS_Tables_DB
    Left = 56
    Top = 328
    object IB_USER_SIGN_RIGHTSID: TIntegerField
      FieldName = 'ID'
      Origin = 'USER_SIGN_RIGHTS.ID'
      Required = True
    end
    object IB_USER_SIGN_RIGHTSID_USER: TIntegerField
      FieldName = 'ID_USER'
      Origin = 'USER_SIGN_RIGHTS.ID_USER'
    end
    object IB_USER_SIGN_RIGHTSTABLE_ID: TIntegerField
      FieldName = 'TABLE_ID'
      Origin = 'USER_SIGN_RIGHTS.TABLE_ID'
    end
    object IB_USER_SIGN_RIGHTSUSER_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'USER_NAME'
      LookupDataSet = IB_UsersDB
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_USER'
      Size = 100
      Lookup = True
    end
  end
  object DS_USER_SIGN_RIGHTS: TDataSource
    DataSet = IB_USER_SIGN_RIGHTS
    Left = 104
    Top = 328
  end
end
