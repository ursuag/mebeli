object DM_Mebeli: TDM_Mebeli
  OldCreateOrder = False
  Left = 13
  Top = 83
  Height = 724
  Width = 1117
  object DB_Mebeli: TIBDatabase
    Connected = True
    DatabaseName = 'D:\'#1052#1086#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1099'\'#1055#1056#1054#1043#1056#1040#1052#1052#1067'\'#1052#1077#1073#1077#1083#1100' '#1089#1082#1083#1072#1076'\mebeli\MEBELI.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=miscacosolapii'
      'sql_role_name=admin'
      '')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    AllowStreamedConnected = False
    Left = 16
    Top = 8
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = DB_Mebeli
    DefaultAction = TARollbackRetaining
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 72
    Top = 8
  end
  object DS_Sklad: TDataSource
    DataSet = IB_Sklad
    Left = 120
    Top = 88
  end
  object DS_Sotrudniki: TDataSource
    DataSet = IB_Sotrudniki
    Left = 120
    Top = 144
  end
  object DS_Vidy_rabot: TDataSource
    DataSet = IB_Vidy_rabot
    Left = 120
    Top = 200
  end
  object DS_Pilomat_grupa: TDataSource
    DataSet = IB_Pilomat_grupa
    Left = 120
    Top = 304
  end
  object DS_Pilomat_grupa_vidrabot: TDataSource
    DataSet = IB_Pilomat_grupa_vidrabot
    Left = 120
    Top = 352
  end
  object DS_Pilomat_listy: TDataSource
    DataSet = IB_Pilomat_listy
    Left = 120
    Top = 400
  end
  object DS_Pilomat_detali: TDataSource
    DataSet = IB_Pilomat_detali
    Left = 128
    Top = 456
  end
  object DS_Gotov_prod_0: TDataSource
    DataSet = IB_Gotov_prod_0
    Left = 312
    Top = 360
  end
  object DS_Gotov_prod_1: TDataSource
    DataSet = IB_Gotov_prod_1
    Left = 312
    Top = 408
  end
  object DS_Zakaz_0: TDataSource
    DataSet = IB_Zakaz_0
    Left = 616
    Top = 16
  end
  object DS_Zakaz_1: TDataSource
    DataSet = IB_Zakaz_1
    Left = 616
    Top = 64
  end
  object DS_Akt_vip_rabot_0: TDataSource
    DataSet = IB_Akt_vip_rabot_0
    Left = 616
    Top = 112
  end
  object DS_Akt_vip_prod_0: TDataSource
    DataSet = IB_Akt_vip_prod_0
    Left = 616
    Top = 280
  end
  object DS_Akt_vip_rabot_1: TDataSource
    DataSet = IB_Akt_vip_rabot_1
    Left = 616
    Top = 160
  end
  object DS_Akt_vip_prod_1: TDataSource
    DataSet = IB_Akt_vip_prod_1
    Left = 616
    Top = 328
  end
  object SQL_Report_vipusk_prod: TIBQuery
    Database = DB_Mebeli
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from sklad')
    Left = 984
    Top = 472
  end
  object DS_Akt_raspil: TDataSource
    DataSet = IB_Akt_raspil
    Left = 616
    Top = 400
  end
  object DS_Akt_raspil_listy: TDataSource
    DataSet = IB_Akt_raspil_listy
    Left = 616
    Top = 448
  end
  object DS_Akt_raspil_detali: TDataSource
    DataSet = IB_Akt_raspil_detali
    Left = 616
    Top = 496
  end
  object DS_Prihod_listy_0: TDataSource
    DataSet = IB_Prihod_listy_0
    Left = 832
    Top = 16
  end
  object DS_Prihod_listy_1: TDataSource
    DataSet = IB_Prihod_listy_1
    Left = 832
    Top = 64
  end
  object DS_Prihod_detali_0: TDataSource
    DataSet = IB_Prihod_detali_0
    Left = 832
    Top = 112
  end
  object DS_Prihod_detali_1: TDataSource
    DataSet = IB_Prihod_detali_1
    Left = 832
    Top = 160
  end
  object DS_Prihod_furnitura_0: TDataSource
    DataSet = IB_Prihod_furnitura_0
    Left = 832
    Top = 208
  end
  object DS_Prihod_furnitura_1: TDataSource
    DataSet = IB_Prihod_furnitura_1
    Left = 832
    Top = 256
  end
  object IB_Sklad: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from sklad '
      'where ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into sklad'
      '  (ID, NAME)'
      'values'
      '  (:ID, :NAME)')
    RefreshSQL.Strings = (
      'Select *'
      'from sklad '
      'where'
      '  ID = :ID'
      'order by ID')
    SelectSQL.Strings = (
      'select * from sklad'
      'order by ID')
    ModifySQL.Strings = (
      'update sklad'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME'
      'where'
      '  ID = :OLD_ID')
    Left = 48
    Top = 88
  end
  object IB_Sotrudniki: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from SOTRUDNIKI'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into SOTRUDNIKI'
      '  (FIO, ID)'
      'values'
      '  (:FIO, :ID)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  FIO'
      'from SOTRUDNIKI '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *  from SOTRUDNIKI order by FIO')
    ModifySQL.Strings = (
      'update SOTRUDNIKI'
      'set'
      '  FIO = :FIO,'
      '  ID = :ID'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_SOTRUDNIKI_ID'
    Left = 48
    Top = 144
  end
  object IB_Vidy_rabot: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    AfterPost = IB_Vidy_rabotAfterPost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from VIDY_RABOT'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into VIDY_RABOT'
      '  (ID, NAME)'
      'values'
      '  (:ID, :NAME)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  NAME'
      'from VIDY_RABOT '
      'where'
      '  ID = :ID'
      'order by ID')
    SelectSQL.Strings = (
      'select *  from  VIDY_RABOT'
      'order by ID')
    ModifySQL.Strings = (
      'update VIDY_RABOT'
      'set'
      '  NAME = :NAME'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_VIDYRABOT_ID'
    Left = 48
    Top = 200
    object IB_Vidy_rabotID: TIntegerField
      FieldName = 'ID'
      Origin = 'VIDY_RABOT.ID'
    end
    object IB_Vidy_rabotNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'VIDY_RABOT.NAME'
      Size = 50
    end
  end
  object IB_Pilomat_grupa: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PILOMAT_GRUPA'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PILOMAT_GRUPA'
      '  (ID, NAME, ARTICLE, MANUFACTURER_CODE)'
      'values'
      '  (:ID, :NAME, :ARTICLE, :MANUFACTURER_CODE)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  NAME,'
      '  ARTICLE,'
      '  MANUFACTURER_CODE'
      'from PILOMAT_GRUPA '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from PILOMAT_GRUPA'
      'where Upper(name) like upper( :grupa_name)'
      'order by name')
    ModifySQL.Strings = (
      'update PILOMAT_GRUPA'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME,'
      '  ARTICLE = :ARTICLE,'
      '  MANUFACTURER_CODE = :MANUFACTURER_CODE'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PILOMAT_GRUPA_ID'
    Left = 48
    Top = 304
    object IB_Pilomat_grupaID: TIntegerField
      FieldName = 'ID'
      Origin = 'PILOMAT_GRUPA.ID'
      Required = True
    end
    object IB_Pilomat_grupaARTICLE: TIntegerField
      FieldName = 'ARTICLE'
      Origin = 'PILOMAT_GRUPA.ARTICLE'
    end
    object IB_Pilomat_grupaNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'PILOMAT_GRUPA.NAME'
      Required = True
      Size = 100
    end
    object IB_Pilomat_grupaMANUFACTURER_CODE: TIBStringField
      FieldName = 'MANUFACTURER_CODE'
      Origin = 'PILOMAT_GRUPA.MANUFACTURER_CODE'
      Size = 100
    end
  end
  object IB_Pilomat_grupa_vidrabot: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnNewRecord = IB_Pilomat_grupa_vidrabotNewRecord
    OnPostError = IB_Pilomat_grupa_vidrabotPostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PILOMAT_GRUPA_VIDRABOT'
      'where'
      '  ID_GRUPA = :OLD_ID_GRUPA and'
      '  ID_VID_RABOT = :OLD_ID_VID_RABOT')
    InsertSQL.Strings = (
      'insert into PILOMAT_GRUPA_VIDRABOT'
      '  (ID_GRUPA, ID_VID_RABOT)'
      'values'
      '  (:ID_GRUPA, :ID_VID_RABOT)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_GRUPA,'
      '  ID_VID_RABOT'
      'from PILOMAT_GRUPA_VIDRABOT '
      'where'
      '  ID_GRUPA = :ID_GRUPA and'
      '  ID_VID_RABOT = :ID_VID_RABOT')
    SelectSQL.Strings = (
      'select *    from PILOMAT_GRUPA_VIDRABOT'
      'where id_grupa=:ID'
      'order by id_vid_rabot')
    ModifySQL.Strings = (
      'update PILOMAT_GRUPA_VIDRABOT'
      'set'
      '  ID_GRUPA = :ID_GRUPA,'
      '  ID_VID_RABOT = :ID_VID_RABOT'
      'where'
      '  ID_GRUPA = :OLD_ID_GRUPA and'
      '  ID_VID_RABOT = :OLD_ID_VID_RABOT')
    DataSource = DS_Pilomat_grupa
    Left = 48
    Top = 352
    object IB_Pilomat_grupa_vidrabotID_GRUPA: TIntegerField
      FieldName = 'ID_GRUPA'
      Origin = 'PILOMAT_GRUPA_VIDRABOT.ID_GRUPA'
      Required = True
    end
    object IB_Pilomat_grupa_vidrabotID_VID_RABOT: TIntegerField
      FieldName = 'ID_VID_RABOT'
      Origin = 'PILOMAT_GRUPA_VIDRABOT.ID_VID_RABOT'
      Required = True
    end
    object IB_Pilomat_grupa_vidrabotVid_rabot: TStringField
      FieldKind = fkLookup
      FieldName = 'Vid_rabot'
      LookupDataSet = IB_Vidy_rabot
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_VID_RABOT'
      Size = 50
      Lookup = True
    end
  end
  object IB_Pilomat_detali: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    BeforePost = IB_Pilomat_detaliBeforePost
    OnDeleteError = IB_Pilomat_detaliDeleteError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PILOMAT_detali'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PILOMAT_detali'
      '  (AREA, ID, ID_GRUPA, NAME, RAZMER_X, RAZMER_Y)'
      'values'
      '  (:AREA, :ID, :ID_GRUPA, :NAME, :RAZMER_X, :RAZMER_Y)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  RAZMER_X,'
      '  RAZMER_Y,'
      '  NAME,'
      '  AREA,'
      '  ID_GRUPA'
      'from PILOMAT_detali '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from PILOMAT_detali'
      ''
      'order by name')
    ModifySQL.Strings = (
      'update PILOMAT_detali'
      'set'
      '  AREA = :AREA,'
      '  ID = :ID,'
      '  ID_GRUPA = :ID_GRUPA,'
      '  NAME = :NAME,'
      '  RAZMER_X = :RAZMER_X,'
      '  RAZMER_Y = :RAZMER_Y'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PILOMAT_DETALI_ID'
    DataSource = DS_Pilomat_grupa
    Left = 48
    Top = 456
    object IB_Pilomat_detaliID: TIntegerField
      FieldName = 'ID'
      Origin = 'PILOMAT_DETALI.ID'
    end
    object IB_Pilomat_detaliRAZMER_X: TIntegerField
      FieldName = 'RAZMER_X'
      Origin = 'PILOMAT_DETALI.RAZMER_X'
    end
    object IB_Pilomat_detaliRAZMER_Y: TIntegerField
      FieldName = 'RAZMER_Y'
      Origin = 'PILOMAT_DETALI.RAZMER_Y'
    end
    object IB_Pilomat_detaliAREA: TIntegerField
      FieldName = 'AREA'
      Origin = 'PILOMAT_DETALI.AREA'
    end
    object IB_Pilomat_detaliID_GRUPA: TIntegerField
      FieldName = 'ID_GRUPA'
      Origin = 'PILOMAT_DETALI.ID_GRUPA'
    end
    object IB_Pilomat_detaliNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'PILOMAT_DETALI.NAME'
      Required = True
      Size = 100
    end
  end
  object IB_Gotov_prod_0: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnNewRecord = IB_Gotov_prod_0NewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from GOTOV_PROD_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into GOTOV_PROD_0'
      
        '  (ID, NAME, ID_GRUPA, ID_CATEGORY, VES, ID_LINKED_GOTOVPROD, AR' +
        'TICLE)'
      'values'
      
        '  (:ID, :NAME, :ID_GRUPA, :ID_CATEGORY, :VES, :ID_LINKED_GOTOVPR' +
        'OD, :ARTICLE)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  NAME,'
      '  ID_GRUPA,'
      '  ID_CATEGORY,'
      '  VES,'
      '  ID_LINKED_GOTOVPROD,'
      '  ARTICLE'
      'from GOTOV_PROD_0 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *  from GOTOV_PROD_0'
      ''
      'order by NAME')
    ModifySQL.Strings = (
      'update GOTOV_PROD_0'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME,'
      '  ID_GRUPA = :ID_GRUPA,'
      '  ID_CATEGORY = :ID_CATEGORY,'
      '  VES = :VES,'
      '  ID_LINKED_GOTOVPROD = :ID_LINKED_GOTOVPROD,'
      '  ARTICLE = :ARTICLE'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_GOTOV_PROD_0_ID'
    DataSource = DS_Gotov_prod_grupa
    Left = 232
    Top = 360
    object IB_Gotov_prod_0ID: TIntegerField
      FieldName = 'ID'
      Origin = '"GOTOV_PROD_0"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IB_Gotov_prod_0NAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"GOTOV_PROD_0"."NAME"'
      Size = 50
    end
    object IB_Gotov_prod_0ID_GRUPA: TIntegerField
      FieldName = 'ID_GRUPA'
      Origin = '"GOTOV_PROD_0"."ID_GRUPA"'
      Required = True
    end
    object IB_Gotov_prod_0ID_CATEGORY: TIntegerField
      FieldName = 'ID_CATEGORY'
      Origin = 'GOTOV_PROD_0.ID_CATEGORY'
    end
    object IB_Gotov_prod_0CATEGORY_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'CATEGORY_NAME'
      LookupDataSet = IB_GOTOV_PROD_CATEGORIES
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_CATEGORY'
      Size = 50
      Lookup = True
    end
    object IB_Gotov_prod_0GRUPA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'GRUPA_NAME'
      LookupDataSet = IB_GOTOV_PROD_grupa_name
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_GRUPA'
      Size = 50
      Lookup = True
    end
    object IB_Gotov_prod_0VES: TIBBCDField
      FieldName = 'VES'
      Origin = 'GOTOV_PROD_0.VES'
      Precision = 18
      Size = 3
    end
    object IB_Gotov_prod_0ID_LINKED_GOTOVPROD: TIntegerField
      FieldName = 'ID_LINKED_GOTOVPROD'
      Origin = 'GOTOV_PROD_0.ID_LINKED_GOTOVPROD'
    end
    object IB_Gotov_prod_0ARTICLE: TIntegerField
      FieldName = 'ARTICLE'
      Origin = 'GOTOV_PROD_0.ARTICLE'
    end
  end
  object IB_Gotov_prod_1: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnNewRecord = IB_Gotov_prod_1NewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from GOTOV_PROD_1'
      'where'
      '  ID_PARENT = :OLD_ID_PARENT and'
      '  ID_DETALI = :OLD_ID_DETALI')
    InsertSQL.Strings = (
      'insert into GOTOV_PROD_1'
      '  (ID_PARENT, ID_DETALI, KOL_VO)'
      'values'
      '  (:ID_PARENT, :ID_DETALI, :KOL_VO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  ID_DETALI,'
      '  KOL_VO'
      'from GOTOV_PROD_1 '
      'where'
      '  ID_PARENT = :ID_PARENT and'
      '  ID_DETALI = :ID_DETALI')
    SelectSQL.Strings = (
      'select * from GOTOV_PROD_1'
      'where  id_parent=:ID')
    ModifySQL.Strings = (
      'update GOTOV_PROD_1'
      'set'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_DETALI = :ID_DETALI,'
      '  KOL_VO = :KOL_VO'
      'where'
      '  ID_PARENT = :OLD_ID_PARENT and'
      '  ID_DETALI = :OLD_ID_DETALI')
    DataSource = DS_Gotov_prod_0
    Left = 232
    Top = 408
    object IB_Gotov_prod_1ID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'GOTOV_PROD_1.ID_PARENT'
      Required = True
    end
    object IB_Gotov_prod_1ID_DETALI: TIntegerField
      FieldName = 'ID_DETALI'
      Origin = 'GOTOV_PROD_1.ID_DETALI'
      Required = True
    end
    object IB_Gotov_prod_1KOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'GOTOV_PROD_1.KOL_VO'
      Required = True
    end
    object IB_Gotov_prod_1DETALI_NAME: TStringField
      DisplayWidth = 60
      FieldKind = fkLookup
      FieldName = 'DETALI_NAME'
      LookupDataSet = IB_Pilomat_detali
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_DETALI'
      Size = 60
      Lookup = True
    end
  end
  object IB_Zakaz_0: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
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
      'order by date_z, id')
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
    Left = 520
    Top = 16
  end
  object IB_Zakaz_1: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnNewRecord = IB_Zakaz_1NewRecord
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
      'select *  from zakaz_1'
      'where id_parent=:ID'
      'order by PRIORITET')
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
    Left = 520
    Top = 64
    object IB_Zakaz_1ID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'ZAKAZ_1.ID_PARENT'
      Required = True
    end
    object IB_Zakaz_1ID_GOTOV_PROD: TIntegerField
      FieldName = 'ID_GOTOV_PROD'
      Origin = 'ZAKAZ_1.ID_GOTOV_PROD'
      Required = True
    end
    object IB_Zakaz_1KOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'ZAKAZ_1.KOL_VO'
      Required = True
    end
    object IB_Zakaz_1PRIORITET: TIntegerField
      FieldName = 'PRIORITET'
      Origin = 'ZAKAZ_1.PRIORITET'
    end
    object IB_Zakaz_1GOTPROD_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'GOTPROD_NAME'
      LookupDataSet = IB_Gotov_prod_0
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_GOTOV_PROD'
      Size = 60
      Lookup = True
    end
    object IB_Zakaz_1GRUPA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'GRUPA_NAME'
      LookupDataSet = IB_Gotov_prod_0
      LookupKeyFields = 'ID'
      LookupResultField = 'GRUPA_NAME'
      KeyFields = 'ID_GOTOV_PROD'
      Size = 100
      Lookup = True
    end
  end
  object IB_Akt_vip_rabot_1: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    BeforeEdit = IB_Akt_vip_rabot_1BeforeEdit
    OnCalcFields = IB_Akt_vip_rabot_1CalcFields
    OnNewRecord = IB_Akt_vip_rabot_1NewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from AKT_VIP_RABOT_1'
      'where'
      '  ID_GOTOV_PROD = :OLD_ID_GOTOV_PROD and'
      '  ID_PARENT = :OLD_ID_PARENT')
    InsertSQL.Strings = (
      'insert into AKT_VIP_RABOT_1'
      '  (ID_GOTOV_PROD, ID_PARENT, KOL_VO, STOIMOSTI_RABOTI)'
      'values'
      '  (:ID_GOTOV_PROD, :ID_PARENT, :KOL_VO, :STOIMOSTI_RABOTI)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  ID_GOTOV_PROD,'
      '  KOL_VO,'
      '  STOIMOSTI_RABOTI'
      'from AKT_VIP_RABOT_1 '
      'where'
      '  ID_GOTOV_PROD = :ID_GOTOV_PROD and'
      '  ID_PARENT = :ID_PARENT')
    SelectSQL.Strings = (
      'select * from AKT_VIP_RABOT_1'
      'where id_parent=:NOMER')
    ModifySQL.Strings = (
      'update AKT_VIP_RABOT_1'
      'set'
      '  ID_GOTOV_PROD = :ID_GOTOV_PROD,'
      '  ID_PARENT = :ID_PARENT,'
      '  KOL_VO = :KOL_VO,'
      '  STOIMOSTI_RABOTI = :STOIMOSTI_RABOTI'
      'where'
      '  ID_GOTOV_PROD = :OLD_ID_GOTOV_PROD and'
      '  ID_PARENT = :OLD_ID_PARENT')
    DataSource = DS_Akt_vip_rabot_0
    Left = 520
    Top = 160
    object IB_Akt_vip_rabot_1ID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'AKT_VIP_RABOT_1.ID_PARENT'
      Required = True
    end
    object IB_Akt_vip_rabot_1ID_GOTOV_PROD: TIntegerField
      FieldName = 'ID_GOTOV_PROD'
      Origin = 'AKT_VIP_RABOT_1.ID_GOTOV_PROD'
      Required = True
    end
    object IB_Akt_vip_rabot_1KOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'AKT_VIP_RABOT_1.KOL_VO'
      Required = True
    end
    object IB_Akt_vip_rabot_1Got_prod_name: TStringField
      FieldKind = fkLookup
      FieldName = 'GOTOV_PROD_NAME'
      LookupDataSet = IB_Gotov_prod_0
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_GOTOV_PROD'
      Size = 100
      Lookup = True
    end
    object IB_Akt_vip_rabot_1STOIMOSTI_RABOTI: TIBBCDField
      FieldName = 'STOIMOSTI_RABOTI'
      Origin = '"AKT_VIP_RABOT_1"."STOIMOSTI_RABOTI"'
      DisplayFormat = '0.000'
      Precision = 9
      Size = 2
    end
    object IB_Akt_vip_rabot_1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'AKT_VIP_RABOT_1.ID'
    end
    object IB_Akt_vip_rabot_1GRUPA_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'GRUPA_NAME'
      Size = 100
      Calculated = True
    end
  end
  object IB_Akt_vip_prod_1: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnCalcFields = IB_Akt_vip_prod_1CalcFields
    OnNewRecord = IB_Akt_vip_prod_NewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from AKT_VIP_PROD_1'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into AKT_VIP_PROD_1'
      '  (ID_PARENT, ID_GOTOV_PROD, KOL_VO, ID)'
      'values'
      '  (:ID_PARENT, :ID_GOTOV_PROD, :KOL_VO, :ID)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  ID_GOTOV_PROD,'
      '  KOL_VO,'
      '  ID'
      'from AKT_VIP_PROD_1 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *  from AKT_VIP_PROD_1'
      'where id_parent=:NOMER')
    ModifySQL.Strings = (
      'update AKT_VIP_PROD_1'
      'set'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_GOTOV_PROD = :ID_GOTOV_PROD,'
      '  KOL_VO = :KOL_VO,'
      '  ID = :ID'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_AKT_VIP_PROD_1_ID'
    DataSource = DS_Akt_vip_prod_0
    Left = 520
    Top = 328
    object IB_Akt_vip_prod_1ID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'AKT_VIP_PROD_1.ID_PARENT'
      Required = True
    end
    object IB_Akt_vip_prod_1ID_GOTOV_PROD: TIntegerField
      FieldName = 'ID_GOTOV_PROD'
      Origin = 'AKT_VIP_PROD_1.ID_GOTOV_PROD'
      Required = True
    end
    object IB_Akt_vip_prod_1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'AKT_VIP_PROD_1.ID'
    end
    object IB_Akt_vip_prod_1KOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'AKT_VIP_PROD_1.KOL_VO'
    end
    object IB_Akt_vip_prod_1GOTOVPROD_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'GOTOVPROD_NAME'
      Size = 200
      Calculated = True
    end
    object IB_Akt_vip_prod_1GRUPA_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'GRUPA_NAME'
      Size = 200
      Calculated = True
    end
    object IB_Akt_vip_prod_1ARTICLE: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ARTICLE'
      Calculated = True
    end
  end
  object IB_Akt_raspil_listy: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
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
      'select *  from AKT_RASPIL_listy'
      'where id_parent=:ID')
    ModifySQL.Strings = (
      'update AKT_RASPIL_listy'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_PILOMAT_LISTY = :ID_PILOMAT_LISTY,'
      '  KOL_VO = :KOL_VO'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_AKT_RASPIL_LISTY_ID'
    DataSource = DS_Akt_raspil
    Left = 520
    Top = 448
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
      Required = True
    end
    object IB_Akt_raspil_listyID: TIntegerField
      FieldName = 'ID'
      Origin = '"AKT_RASPIL_LISTY"."ID"'
    end
    object IB_Akt_raspil_listyLISTY_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'LISTY_NAME'
      LookupDataSet = IB_Pilomat_listy
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_PILOMAT_LISTY'
      Size = 100
      Lookup = True
    end
    object IB_Akt_raspil_listyGRUPA_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'GRUPA_NAME'
      Size = 100
      Calculated = True
    end
  end
  object IB_Akt_raspil_detali: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnNewRecord = IB_Akt_raspil_detaliNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from AKT_RASPIL_DETALI'
      'where'
      '  ID_PARENT = :OLD_ID_PARENT and'
      '  ID_PILOMAT_DETALI = :OLD_ID_PILOMAT_DETALI')
    InsertSQL.Strings = (
      'insert into AKT_RASPIL_DETALI'
      '  (ID_PARENT, ID_PILOMAT_DETALI, ID_SKLAD, KOL_VO)'
      'values'
      '  (:ID_PARENT, :ID_PILOMAT_DETALI, :ID_SKLAD, :KOL_VO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  ID_PILOMAT_DETALI,'
      '  KOL_VO,'
      '  ID_SKLAD'
      'from AKT_RASPIL_DETALI '
      'where'
      '  ID_PARENT = :ID_PARENT and'
      '  ID_PILOMAT_DETALI = :ID_PILOMAT_DETALI')
    SelectSQL.Strings = (
      'select * from AKT_RASPIL_detali'
      'where id_parent=:ID')
    ModifySQL.Strings = (
      'update AKT_RASPIL_DETALI'
      'set'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_PILOMAT_DETALI = :ID_PILOMAT_DETALI,'
      '  ID_SKLAD = :ID_SKLAD,'
      '  KOL_VO = :KOL_VO'
      'where'
      '  ID_PARENT = :OLD_ID_PARENT and'
      '  ID_PILOMAT_DETALI = :OLD_ID_PILOMAT_DETALI')
    DataSource = DS_Akt_raspil
    Left = 520
    Top = 496
    object IB_Akt_raspil_detaliID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = '"AKT_RASPIL_DETALI"."ID_PARENT"'
      Required = True
    end
    object IB_Akt_raspil_detaliID_PILOMAT_DETALI: TIntegerField
      FieldName = 'ID_PILOMAT_DETALI'
      Origin = '"AKT_RASPIL_DETALI"."ID_PILOMAT_DETALI"'
      Required = True
    end
    object IB_Akt_raspil_detaliID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Origin = '"AKT_RASPIL_DETALI"."ID_SKLAD"'
    end
    object IB_Akt_raspil_detaliDETALI_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'DETALI_NAME'
      LookupDataSet = IB_Pilomat_detali
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_PILOMAT_DETALI'
      Size = 100
      Lookup = True
    end
    object IB_Akt_raspil_detaliGRUPA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'GRUPA_NAME'
      LookupDataSet = IB_Pilomat_detali
      LookupKeyFields = 'ID'
      LookupResultField = 'GRUPA_NAME'
      KeyFields = 'ID_PILOMAT_DETALI'
      Size = 100
      Lookup = True
    end
    object IB_Akt_raspil_detaliSKLAD_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'SKLAD_NAME'
      LookupDataSet = IB_Sklad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD'
      Size = 60
      Lookup = True
    end
    object IB_Akt_raspil_detaliKOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'AKT_RASPIL_DETALI.KOL_VO'
    end
    object IB_Akt_raspil_detaliID: TIntegerField
      FieldName = 'ID'
      Origin = 'AKT_RASPIL_DETALI.ID'
    end
  end
  object IB_Prihod_listy_0: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PRIHOD_LISTY_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PRIHOD_LISTY_0'
      
        '  (ID, DATE_P, ID_SKLAD, ID_AKT_RASPIL, PRIMECHANIE, ID_CONTRAGE' +
        'NT, ID_STATYA_DOHODA, '
      '   NOMER_TTN)'
      'values'
      
        '  (:ID, :DATE_P, :ID_SKLAD, :ID_AKT_RASPIL, :PRIMECHANIE, :ID_CO' +
        'NTRAGENT, '
      '   :ID_STATYA_DOHODA, :NOMER_TTN)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  DATE_P,'
      '  ID_SKLAD,'
      '  ID_AKT_RASPIL,'
      '  PRIMECHANIE,'
      '  ID_CONTRAGENT,'
      '  ID_STATYA_DOHODA,'
      '  NOMER_TTN'
      'from PRIHOD_LISTY_0 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from PRIHOD_LISTY_0'
      'where id= :id')
    ModifySQL.Strings = (
      'update PRIHOD_LISTY_0'
      'set'
      '  ID = :ID,'
      '  DATE_P = :DATE_P,'
      '  ID_SKLAD = :ID_SKLAD,'
      '  ID_AKT_RASPIL = :ID_AKT_RASPIL,'
      '  PRIMECHANIE = :PRIMECHANIE,'
      '  ID_CONTRAGENT = :ID_CONTRAGENT,'
      '  ID_STATYA_DOHODA = :ID_STATYA_DOHODA,'
      '  NOMER_TTN = :NOMER_TTN'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PRIHOD_LISTY_0_ID'
    Left = 736
    Top = 16
    object IB_Prihod_listy_0ID: TIntegerField
      FieldName = 'ID'
      Origin = '"PRIHOD_LISTY_0"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IB_Prihod_listy_0DATE_P: TDateField
      FieldName = 'DATE_P'
      Origin = '"PRIHOD_LISTY_0"."DATE_P"'
      Required = True
    end
    object IB_Prihod_listy_0ID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Origin = '"PRIHOD_LISTY_0"."ID_SKLAD"'
      Required = True
    end
    object IB_Prihod_listy_0SKLAD_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'SKLAD_NAME'
      LookupDataSet = IB_Sklad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD'
      Size = 60
      Lookup = True
    end
    object IB_Prihod_listy_0ID_AKT_RASPIL: TIntegerField
      FieldName = 'ID_AKT_RASPIL'
      Origin = '"PRIHOD_LISTY_0"."ID_AKT_RASPIL"'
    end
    object IB_Prihod_listy_0PRIMECHANIE: TIBStringField
      FieldName = 'PRIMECHANIE'
      Origin = '"PRIHOD_LISTY_0"."PRIMECHANIE"'
      Size = 255
    end
    object IB_Prihod_listy_0ID_CONTRAGENT: TIntegerField
      FieldName = 'ID_CONTRAGENT'
      Origin = 'PRIHOD_LISTY_0.ID_CONTRAGENT'
    end
    object IB_Prihod_listy_0contragent_name: TStringField
      FieldKind = fkLookup
      FieldName = 'contragent_name'
      LookupDataSet = IB_Contragenty_1
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_CONTRAGENT'
      Size = 100
      Lookup = True
    end
    object IB_Prihod_listy_0ID_STATYA_DOHODA: TIntegerField
      FieldName = 'ID_STATYA_DOHODA'
      Origin = 'PRIHOD_LISTY_0.ID_STATYA_DOHODA'
    end
    object IB_Prihod_listy_0STATYA_DOHODA: TStringField
      FieldKind = fkLookup
      FieldName = 'STATYA_DOHODA'
      LookupDataSet = IB_Statyi_Dohoda
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_STATYA_DOHODA'
      Size = 100
      Lookup = True
    end
    object IB_Prihod_listy_0NOMER_TTN: TIBStringField
      FieldName = 'NOMER_TTN'
      Origin = 'PRIHOD_LISTY_0.NOMER_TTN'
      Size = 50
    end
  end
  object IB_Prihod_listy_1: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    AfterPost = IB_Prihod_listy_1AfterPost
    OnCalcFields = IB_Prihod_listy_1CalcFields
    OnNewRecord = IB_Prihod_listy_1NewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PRIHOD_LISTY_1'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PRIHOD_LISTY_1'
      '  (ID_PARENT, ID_LISTY, KOL_VO, ID_GRUPA, ID, SUMMA)'
      'values'
      '  (:ID_PARENT, :ID_LISTY, :KOL_VO, :ID_GRUPA, :ID, :SUMMA)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  ID_LISTY,'
      '  KOL_VO,'
      '  ID_GRUPA,'
      '  ID,'
      '  SUMMA'
      'from PRIHOD_LISTY_1 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *   from PRIHOD_LISTY_1'
      'where id_parent=:ID')
    ModifySQL.Strings = (
      'update PRIHOD_LISTY_1'
      'set'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_LISTY = :ID_LISTY,'
      '  KOL_VO = :KOL_VO,'
      '  ID_GRUPA = :ID_GRUPA,'
      '  ID = :ID,'
      '  SUMMA = :SUMMA'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PRIHOD_LISTY_1_ID'
    DataSource = DS_Prihod_listy_0
    Left = 736
    Top = 64
    object IB_Prihod_listy_1ID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'PRIHOD_LISTY_1.ID_PARENT'
      Required = True
    end
    object IB_Prihod_listy_1ID_LISTY: TIntegerField
      FieldName = 'ID_LISTY'
      Origin = 'PRIHOD_LISTY_1.ID_LISTY'
      Required = True
    end
    object IB_Prihod_listy_1KOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'PRIHOD_LISTY_1.KOL_VO'
      Required = True
    end
    object IB_Prihod_listy_1ID_GRUPA: TIntegerField
      FieldName = 'ID_GRUPA'
      Origin = '"PRIHOD_LISTY_1"."ID_GRUPA"'
    end
    object IB_Prihod_listy_1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PRIHOD_LISTY_1.ID'
      Required = True
    end
    object IB_Prihod_listy_1SUMMA: TIBBCDField
      FieldName = 'SUMMA'
      Origin = 'PRIHOD_LISTY_1.SUMMA'
      Precision = 18
      Size = 2
    end
    object IB_Prihod_listy_1LISTY_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'LISTY_NAME'
      Size = 200
      Calculated = True
    end
    object IB_Prihod_listy_1GRUPA_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'GRUPA_NAME'
      Size = 200
      Calculated = True
    end
  end
  object IB_Prihod_detali_0: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    AutoCalcFields = False
    OnPostError = IB_Prihod_detali_0PostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PRIHOD_DETALI_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PRIHOD_DETALI_0'
      
        '  (ID, DATE_P, ID_SKLAD, ID_VID_RABOT, ID_AKT_RASPIL, PRIMECHANI' +
        'E, ID_ZAKAZ)'
      'values'
      
        '  (:ID, :DATE_P, :ID_SKLAD, :ID_VID_RABOT, :ID_AKT_RASPIL, :PRIM' +
        'ECHANIE, '
      '   :ID_ZAKAZ)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  DATE_P,'
      '  ID_SKLAD,'
      '  ID_VID_RABOT,'
      '  ID_AKT_RASPIL,'
      '  PRIMECHANIE,'
      '  ID_ZAKAZ'
      'from PRIHOD_DETALI_0 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *   from PRIHOD_DETALI_0'
      'order by date_p, ID')
    ModifySQL.Strings = (
      'update PRIHOD_DETALI_0'
      'set'
      '  ID = :ID,'
      '  DATE_P = :DATE_P,'
      '  ID_SKLAD = :ID_SKLAD,'
      '  ID_VID_RABOT = :ID_VID_RABOT,'
      '  ID_AKT_RASPIL = :ID_AKT_RASPIL,'
      '  PRIMECHANIE = :PRIMECHANIE,'
      '  ID_ZAKAZ = :ID_ZAKAZ'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PRIHOD_DETALI_0_ID'
    Left = 736
    Top = 112
    object IB_Prihod_detali_0ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PRIHOD_DETALI_0.ID'
      Required = True
    end
    object IB_Prihod_detali_0DATE_P: TDateField
      FieldName = 'DATE_P'
      Origin = 'PRIHOD_DETALI_0.DATE_P'
      Required = True
    end
    object IB_Prihod_detali_0ID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Origin = 'PRIHOD_DETALI_0.ID_SKLAD'
      Required = True
    end
    object IB_Prihod_detali_0ID_VID_RABOT: TIntegerField
      FieldName = 'ID_VID_RABOT'
      Origin = 'PRIHOD_DETALI_0.ID_VID_RABOT'
      Required = True
    end
    object IB_Prihod_detali_0VID_RABOT_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'VID_RABOT_NAME'
      LookupDataSet = IB_Vidy_rabot
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_VID_RABOT'
      Size = 60
      Lookup = True
    end
    object IB_Prihod_detali_0SKLAD_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'SKLAD_NAME'
      LookupDataSet = IB_Sklad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD'
      Size = 60
      Lookup = True
    end
    object IB_Prihod_detali_0ID_AKT_RASPIL: TIntegerField
      FieldName = 'ID_AKT_RASPIL'
      Origin = 'PRIHOD_DETALI_0.ID_AKT_RASPIL'
    end
    object IB_Prihod_detali_0PRIMECHANIE: TIBStringField
      FieldName = 'PRIMECHANIE'
      Origin = '"PRIHOD_DETALI_0"."PRIMECHANIE"'
      Size = 255
    end
    object IB_Prihod_detali_0ID_ZAKAZ: TIntegerField
      FieldName = 'ID_ZAKAZ'
      Origin = 'PRIHOD_DETALI_0.ID_ZAKAZ'
    end
  end
  object IB_Prihod_detali_1: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnNewRecord = IB_Prihod_detali_1NewRecord
    OnPostError = IB_Prihod_detali_1PostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PRIHOD_DETALI_1'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PRIHOD_DETALI_1'
      '  (ID_PARENT, ID_PILOMAT_DETALI, KOL_VO, SUMMA, ID)'
      'values'
      '  (:ID_PARENT, :ID_PILOMAT_DETALI, :KOL_VO, :SUMMA, :ID)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  ID_PILOMAT_DETALI,'
      '  KOL_VO,'
      '  SUMMA,'
      '  ID'
      'from PRIHOD_DETALI_1 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *   from PRIHOD_DETALI_1'
      'where id_parent=:ID')
    ModifySQL.Strings = (
      'update PRIHOD_DETALI_1'
      'set'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_PILOMAT_DETALI = :ID_PILOMAT_DETALI,'
      '  KOL_VO = :KOL_VO,'
      '  SUMMA = :SUMMA,'
      '  ID = :ID'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PRIHOD_DETALI_1_ID'
    DataSource = DS_Prihod_detali_0
    Left = 736
    Top = 160
    object IB_Prihod_detali_1ID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'PRIHOD_DETALI_1.ID_PARENT'
      Required = True
    end
    object IB_Prihod_detali_1ID_PILOMAT_DETALI: TIntegerField
      FieldName = 'ID_PILOMAT_DETALI'
      Origin = 'PRIHOD_DETALI_1.ID_PILOMAT_DETALI'
      Required = True
    end
    object IB_Prihod_detali_1KOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'PRIHOD_DETALI_1.KOL_VO'
      Required = True
    end
    object IB_Prihod_detali_1DETALI_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'DETALI_NAME'
      LookupDataSet = IB_Pilomat_detali
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_PILOMAT_DETALI'
      Size = 100
      Lookup = True
    end
    object IB_Prihod_detali_1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PRIHOD_DETALI_1.ID'
      Required = True
    end
    object IB_Prihod_detali_1SUMMA: TIBBCDField
      FieldName = 'SUMMA'
      Origin = 'PRIHOD_DETALI_1.SUMMA'
      Precision = 18
      Size = 3
    end
  end
  object IB_Prihod_furnitura_1: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    AfterPost = IB_Prihod_furnitura_1AfterPost
    OnCalcFields = IB_Prihod_furnitura_1CalcFields
    OnNewRecord = IB_Prihod_furnitura_1NewRecord
    OnPostError = IB_Prihod_furnitura_1PostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PRIHOD_FURNITURA_1'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PRIHOD_FURNITURA_1'
      '  (ID_PARENT, ID_FURNITURA, KOL_VO, ID, SUMMA)'
      'values'
      '  (:ID_PARENT, :ID_FURNITURA, :KOL_VO, :ID, :SUMMA)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  ID_FURNITURA,'
      '  KOL_VO,'
      '  ID,'
      '  SUMMA'
      'from PRIHOD_FURNITURA_1 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *  from PRIHOD_FURNITURA_1'
      'where id_parent=:ID'
      '')
    ModifySQL.Strings = (
      'update PRIHOD_FURNITURA_1'
      'set'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_FURNITURA = :ID_FURNITURA,'
      '  KOL_VO = :KOL_VO,'
      '  ID = :ID,'
      '  SUMMA = :SUMMA'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PRIHOD_FURNITURA_1_ID'
    DataSource = DS_Prihod_furnitura_0
    Left = 736
    Top = 256
    object IB_Prihod_furnitura_1ID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'PRIHOD_FURNITURA_1.ID_PARENT'
      Required = True
    end
    object IB_Prihod_furnitura_1ID_FURNITURA: TIntegerField
      FieldName = 'ID_FURNITURA'
      Origin = 'PRIHOD_FURNITURA_1.ID_FURNITURA'
      Required = True
    end
    object IB_Prihod_furnitura_1FURNITURA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'FURNITURA_NAME'
      LookupDataSet = IB_Furnitura
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_FURNITURA'
      Size = 100
      Lookup = True
    end
    object IB_Prihod_furnitura_1FURNITURA_EDIZM: TStringField
      FieldKind = fkLookup
      FieldName = 'FURNITURA_EDIZM'
      LookupDataSet = IB_Furnitura
      LookupKeyFields = 'ID'
      LookupResultField = 'ED_IZM'
      KeyFields = 'ID_FURNITURA'
      Size = 10
      Lookup = True
    end
    object IB_Prihod_furnitura_1KOL_VO: TIBBCDField
      FieldName = 'KOL_VO'
      Origin = '"PRIHOD_FURNITURA_1"."KOL_VO"'
      Required = True
      EditFormat = '0.000'
      Precision = 9
      Size = 3
    end
    object IB_Prihod_furnitura_1GRUPA_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'GRUPA_NAME'
      Size = 60
      Calculated = True
    end
    object IB_Prihod_furnitura_1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PRIHOD_FURNITURA_1.ID'
      Required = True
    end
    object IB_Prihod_furnitura_1SUMMA: TIBBCDField
      FieldName = 'SUMMA'
      Origin = 'PRIHOD_FURNITURA_1.SUMMA'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
  end
  object IB_Prihod_furnitura_0: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnPostError = IB_Prihod_furnitura_0PostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PRIHOD_FURNITURA_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PRIHOD_FURNITURA_0'
      
        '  (ID, DATE_P, ID_SKLAD, PRIMECHANIE, ID_CONTRAGENT, ID_STATYA_D' +
        'OHODA, '
      '   NOMER_TTN)'
      'values'
      
        '  (:ID, :DATE_P, :ID_SKLAD, :PRIMECHANIE, :ID_CONTRAGENT, :ID_ST' +
        'ATYA_DOHODA, '
      '   :NOMER_TTN)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  DATE_P,'
      '  ID_SKLAD,'
      '  PRIMECHANIE,'
      '  ID_CONTRAGENT,'
      '  ID_STATYA_DOHODA,'
      '  NOMER_TTN'
      'from PRIHOD_FURNITURA_0 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *   from PRIHOD_FURNITURA_0'
      'where id= :id')
    ModifySQL.Strings = (
      'update PRIHOD_FURNITURA_0'
      'set'
      '  ID = :ID,'
      '  DATE_P = :DATE_P,'
      '  ID_SKLAD = :ID_SKLAD,'
      '  PRIMECHANIE = :PRIMECHANIE,'
      '  ID_CONTRAGENT = :ID_CONTRAGENT,'
      '  ID_STATYA_DOHODA = :ID_STATYA_DOHODA,'
      '  NOMER_TTN = :NOMER_TTN'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PRIHOD_FURNITURA_0_ID'
    Left = 736
    Top = 208
    object IB_Prihod_furnitura_0ID: TIntegerField
      FieldName = 'ID'
      Origin = '"PRIHOD_FURNITURA_0"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IB_Prihod_furnitura_0DATE_P: TDateField
      FieldName = 'DATE_P'
      Origin = '"PRIHOD_FURNITURA_0"."DATE_P"'
      Required = True
    end
    object IB_Prihod_furnitura_0ID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Origin = '"PRIHOD_FURNITURA_0"."ID_SKLAD"'
      Required = True
    end
    object IB_Prihod_furnitura_0SKLAD_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'SKLAD_NAME'
      LookupDataSet = IB_Sklad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD'
      Size = 60
      Lookup = True
    end
    object IB_Prihod_furnitura_0PRIMECHANIE: TIBStringField
      FieldName = 'PRIMECHANIE'
      Origin = '"PRIHOD_FURNITURA_0"."PRIMECHANIE"'
      Size = 255
    end
    object IB_Prihod_furnitura_0ID_CONTRAGENT: TIntegerField
      FieldName = 'ID_CONTRAGENT'
      Origin = 'PRIHOD_FURNITURA_0.ID_CONTRAGENT'
    end
    object IB_Prihod_furnitura_0CONTRAGENT_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'CONTRAGENT_NAME'
      LookupDataSet = IB_Contragenty_1
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_CONTRAGENT'
      Size = 100
      Lookup = True
    end
    object IB_Prihod_furnitura_0ID_STATYA_DOHODA: TIntegerField
      FieldName = 'ID_STATYA_DOHODA'
      Origin = 'PRIHOD_FURNITURA_0.ID_STATYA_DOHODA'
    end
    object IB_Prihod_furnitura_0NOMER_TTN: TIBStringField
      FieldName = 'NOMER_TTN'
      Origin = 'PRIHOD_FURNITURA_0.NOMER_TTN'
      Size = 50
    end
  end
  object IB_Gotov_prod_2: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnNewRecord = IB_Gotov_prod_2NewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from GOTOV_PROD_2'
      'where'
      '  ID_PARENT = :OLD_ID_PARENT and'
      '  ID_FURNITURA = :OLD_ID_FURNITURA')
    InsertSQL.Strings = (
      'insert into GOTOV_PROD_2'
      '  (ID_PARENT, KOL_VO, ID_FURNITURA)'
      'values'
      '  (:ID_PARENT, :KOL_VO, :ID_FURNITURA)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  KOL_VO,'
      '  ID_FURNITURA'
      'from GOTOV_PROD_2 '
      'where'
      '  ID_PARENT = :ID_PARENT and'
      '  ID_FURNITURA = :ID_FURNITURA')
    SelectSQL.Strings = (
      'select * FROM GOTOV_PROD_2'
      'where  id_parent=:ID')
    ModifySQL.Strings = (
      'update GOTOV_PROD_2'
      'set'
      '  ID_PARENT = :ID_PARENT,'
      '  KOL_VO = :KOL_VO,'
      '  ID_FURNITURA = :ID_FURNITURA'
      'where'
      '  ID_PARENT = :OLD_ID_PARENT and'
      '  ID_FURNITURA = :OLD_ID_FURNITURA')
    DataSource = DS_Gotov_prod_0
    Left = 232
    Top = 456
    object IB_Gotov_prod_2ID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'GOTOV_PROD_2.ID_PARENT'
      Required = True
    end
    object IB_Gotov_prod_2ID_FURNITURA: TIntegerField
      FieldName = 'ID_FURNITURA'
      Origin = 'GOTOV_PROD_2.ID_FURNITURA'
      Required = True
    end
    object IB_Gotov_prod_2FURNITURA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'FURNITURA_NAME'
      LookupDataSet = IB_Furnitura
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_FURNITURA'
      Size = 50
      Lookup = True
    end
    object IB_Gotov_prod_2ED_IZM: TStringField
      FieldKind = fkLookup
      FieldName = 'ED_IZM'
      LookupDataSet = IB_Furnitura
      LookupKeyFields = 'ID'
      LookupResultField = 'ED_IZM'
      KeyFields = 'ID_FURNITURA'
      Size = 9
      Lookup = True
    end
    object IB_Gotov_prod_2KOL_VO: TIBBCDField
      FieldName = 'KOL_VO'
      Origin = 'GOTOV_PROD_2.KOL_VO'
      Required = True
      Precision = 9
      Size = 3
    end
  end
  object DS_Gotov_Prod_2: TDataSource
    DataSet = IB_Gotov_prod_2
    Left = 312
    Top = 456
  end
  object IB_Akt_raspil: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    OnDeleteError = IB_Akt_raspilDeleteError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from AKT_RASPIL'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into AKT_RASPIL'
      
        '  (ID, DATE_R, OTHOD, OSTATOK, PRIMECHANIE, ID_ZAKAZ, ID_SOTRUDN' +
        'IK_1, ID_SOTRUDNIK_2, '
      '   OTHOD_SUMMA, OTHOD_M2)'
      'values'
      
        '  (:ID, :DATE_R, :OTHOD, :OSTATOK, :PRIMECHANIE, :ID_ZAKAZ, :ID_' +
        'SOTRUDNIK_1, '
      '   :ID_SOTRUDNIK_2, :OTHOD_SUMMA, :OTHOD_M2)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  DATE_R,'
      '  OTHOD,'
      '  OSTATOK,'
      '  PRIMECHANIE,'
      '  ID_ZAKAZ,'
      '  ID_SOTRUDNIK_1,'
      '  ID_SOTRUDNIK_2,'
      '  OTHOD_SUMMA,'
      '  OTHOD_M2'
      'from AKT_RASPIL '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from AKT_RASPIL'
      ''
      'order by date_r, ID')
    ModifySQL.Strings = (
      'update AKT_RASPIL'
      'set'
      '  ID = :ID,'
      '  DATE_R = :DATE_R,'
      '  OTHOD = :OTHOD,'
      '  OSTATOK = :OSTATOK,'
      '  PRIMECHANIE = :PRIMECHANIE,'
      '  ID_ZAKAZ = :ID_ZAKAZ,'
      '  ID_SOTRUDNIK_1 = :ID_SOTRUDNIK_1,'
      '  ID_SOTRUDNIK_2 = :ID_SOTRUDNIK_2,'
      '  OTHOD_SUMMA = :OTHOD_SUMMA,'
      '  OTHOD_M2 = :OTHOD_M2'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_AKT_RASPIL_ID'
    Left = 520
    Top = 408
    object IB_Akt_raspilID: TIntegerField
      FieldName = 'ID'
      Origin = 'AKT_RASPIL.ID'
      Required = True
    end
    object IB_Akt_raspilDATE_R: TDateField
      FieldName = 'DATE_R'
      Origin = 'AKT_RASPIL.DATE_R'
    end
    object IB_Akt_raspilOTHOD: TIBBCDField
      FieldName = 'OTHOD'
      Origin = '"AKT_RASPIL"."OTHOD"'
      Required = True
      Precision = 9
      Size = 2
    end
    object IB_Akt_raspilOSTATOK: TIntegerField
      FieldName = 'OSTATOK'
      Origin = '"AKT_RASPIL"."OSTATOK"'
    end
    object IB_Akt_raspilPRIMECHANIE: TIBStringField
      FieldName = 'PRIMECHANIE'
      Origin = '"AKT_RASPIL"."PRIMECHANIE"'
      Size = 255
      Transliterate = False
    end
    object IB_Akt_raspilID_ZAKAZ: TIntegerField
      FieldName = 'ID_ZAKAZ'
      Origin = 'AKT_RASPIL.ID_ZAKAZ'
    end
    object IB_Akt_raspilID_SOTRUDNIK_1: TIntegerField
      FieldName = 'ID_SOTRUDNIK_1'
      Origin = 'AKT_RASPIL.ID_SOTRUDNIK_1'
    end
    object IB_Akt_raspilID_SOTRUDNIK_2: TIntegerField
      FieldName = 'ID_SOTRUDNIK_2'
      Origin = 'AKT_RASPIL.ID_SOTRUDNIK_2'
    end
    object IB_Akt_raspilSOTRUDNIK1_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'SOTRUDNIK1_NAME'
      LookupDataSet = IB_Sotrudniki
      LookupKeyFields = 'ID'
      LookupResultField = 'FIO'
      KeyFields = 'ID_SOTRUDNIK_1'
      Size = 50
      Lookup = True
    end
    object IB_Akt_raspilSOTRUDNIK2_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'SOTRUDNIK2_NAME'
      LookupDataSet = IB_Sotrudniki
      LookupKeyFields = 'ID'
      LookupResultField = 'FIO'
      KeyFields = 'ID_SOTRUDNIK_2'
      Size = 50
      Lookup = True
    end
    object IB_Akt_raspilOTHOD_SUMMA: TIBBCDField
      FieldName = 'OTHOD_SUMMA'
      Origin = 'AKT_RASPIL.OTHOD_SUMMA'
      DisplayFormat = '### ##0.00'
      Precision = 18
      Size = 3
    end
    object IB_Akt_raspilOTHOD_M2: TIBBCDField
      FieldName = 'OTHOD_M2'
      Origin = 'AKT_RASPIL.OTHOD_M2'
      DisplayFormat = '##0.000'
      Precision = 18
      Size = 4
    end
  end
  object IB_Peremeschenie_0: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PEREMESCHENIE_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PEREMESCHENIE_0'
      '  (DATE_PER, ID, ID_SKLAD_KUDA, ID_SKLAD_OTKUDA, PRIMECHANIE)'
      'values'
      
        '  (:DATE_PER, :ID, :ID_SKLAD_KUDA, :ID_SKLAD_OTKUDA, :PRIMECHANI' +
        'E)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  DATE_PER,'
      '  ID_SKLAD_OTKUDA,'
      '  ID_SKLAD_KUDA,'
      '  PRIMECHANIE'
      'from PEREMESCHENIE_0 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from PEREMESCHENIE_0'
      'order by date_per, id')
    ModifySQL.Strings = (
      'update PEREMESCHENIE_0'
      'set'
      '  DATE_PER = :DATE_PER,'
      '  ID = :ID,'
      '  ID_SKLAD_KUDA = :ID_SKLAD_KUDA,'
      '  ID_SKLAD_OTKUDA = :ID_SKLAD_OTKUDA,'
      '  PRIMECHANIE = :PRIMECHANIE'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PEREMESCHENIE_0_ID'
    Left = 736
    Top = 304
    object IB_Peremeschenie_0ID: TIntegerField
      FieldName = 'ID'
      Origin = '"PEREMESCHENIE_0"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IB_Peremeschenie_0DATE_PER: TDateField
      FieldName = 'DATE_PER'
      Origin = '"PEREMESCHENIE_0"."DATE_PER"'
      Required = True
    end
    object IB_Peremeschenie_0ID_SKLAD_OTKUDA: TIntegerField
      FieldName = 'ID_SKLAD_OTKUDA'
      Origin = '"PEREMESCHENIE_0"."ID_SKLAD_OTKUDA"'
    end
    object IB_Peremeschenie_0ID_SKLAD_KUDA: TIntegerField
      FieldName = 'ID_SKLAD_KUDA'
      Origin = '"PEREMESCHENIE_0"."ID_SKLAD_KUDA"'
    end
    object IB_Peremeschenie_0SKLAD_OTKUDA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'SKLAD_OTKUDA_NAME'
      LookupDataSet = IB_Sklad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD_OTKUDA'
      Size = 60
      Lookup = True
    end
    object IB_Peremeschenie_0SKLAD_KUDA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'SKLAD_KUDA_NAME'
      LookupDataSet = IB_Sklad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD_KUDA'
      Size = 60
      Lookup = True
    end
    object IB_Peremeschenie_0PRIMECHANIE: TIBStringField
      FieldName = 'PRIMECHANIE'
      Origin = '"PEREMESCHENIE_0"."PRIMECHANIE"'
      Size = 255
    end
  end
  object DS_Peremeschenie_0: TDataSource
    DataSet = IB_Peremeschenie_0
    Left = 832
    Top = 304
  end
  object IB_Akt_vip_rabot_0: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnPostError = IB_Akt_vip_rabot_0PostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from AKT_VIP_RABOT_0'
      'where'
      '  NOMER = :OLD_NOMER')
    InsertSQL.Strings = (
      'insert into AKT_VIP_RABOT_0'
      
        '  (NOMER, DATE_A, ID_SOTRUDNIK, ID_ZAKAZ, ID_VID_RABOT, PRIMECHA' +
        'NIE, ID_SOTRUDNIK2)'
      'values'
      
        '  (:NOMER, :DATE_A, :ID_SOTRUDNIK, :ID_ZAKAZ, :ID_VID_RABOT, :PR' +
        'IMECHANIE, '
      '   :ID_SOTRUDNIK2)')
    RefreshSQL.Strings = (
      'Select '
      '  NOMER,'
      '  DATE_A,'
      '  ID_SOTRUDNIK,'
      '  ID_ZAKAZ,'
      '  ID_VID_RABOT,'
      '  PRIMECHANIE,'
      '  ID_SOTRUDNIK2'
      'from AKT_VIP_RABOT_0 '
      'where'
      '  NOMER = :NOMER')
    SelectSQL.Strings = (
      'select *   from AKT_VIP_RABOT_0'
      ''
      'order by date_a, nomer')
    ModifySQL.Strings = (
      'update AKT_VIP_RABOT_0'
      'set'
      '  NOMER = :NOMER,'
      '  DATE_A = :DATE_A,'
      '  ID_SOTRUDNIK = :ID_SOTRUDNIK,'
      '  ID_ZAKAZ = :ID_ZAKAZ,'
      '  ID_VID_RABOT = :ID_VID_RABOT,'
      '  PRIMECHANIE = :PRIMECHANIE,'
      '  ID_SOTRUDNIK2 = :ID_SOTRUDNIK2'
      'where'
      '  NOMER = :OLD_NOMER')
    GeneratorField.Field = 'NOMER'
    GeneratorField.Generator = 'GEN_AKT_VIP_RABOT_0_ID'
    Left = 520
    Top = 112
    object IB_Akt_vip_rabot_0NOMER: TIntegerField
      FieldName = 'NOMER'
      Origin = 'AKT_VIP_RABOT_0.NOMER'
      Required = True
    end
    object IB_Akt_vip_rabot_0DATE_A: TDateField
      FieldName = 'DATE_A'
      Origin = 'AKT_VIP_RABOT_0.DATE_A'
    end
    object IB_Akt_vip_rabot_0ID_SOTRUDNIK: TIntegerField
      FieldName = 'ID_SOTRUDNIK'
      Origin = 'AKT_VIP_RABOT_0.ID_SOTRUDNIK'
    end
    object IB_Akt_vip_rabot_0ID_ZAKAZ: TIntegerField
      FieldName = 'ID_ZAKAZ'
      Origin = 'AKT_VIP_RABOT_0.ID_ZAKAZ'
    end
    object IB_Akt_vip_rabot_0ID_VID_RABOT: TIntegerField
      FieldName = 'ID_VID_RABOT'
      Origin = 'AKT_VIP_RABOT_0.ID_VID_RABOT'
    end
    object IB_Akt_vip_rabot_0SOTRUDNIK_FIO: TStringField
      FieldKind = fkLookup
      FieldName = 'SOTRUDNIK_FIO'
      LookupDataSet = IB_Sotrudniki
      LookupKeyFields = 'ID'
      LookupResultField = 'FIO'
      KeyFields = 'ID_SOTRUDNIK'
      Size = 50
      Lookup = True
    end
    object IB_Akt_vip_rabot_0VIDRABOT_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'VIDRABOT_NAME'
      LookupDataSet = IB_Vidy_rabot
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_VID_RABOT'
      Size = 60
      Lookup = True
    end
    object IB_Akt_vip_rabot_0PRIMECHANIE: TIBStringField
      FieldName = 'PRIMECHANIE'
      Origin = '"AKT_VIP_RABOT_0"."PRIMECHANIE"'
      Size = 255
    end
    object IB_Akt_vip_rabot_0ID_SOTRUDNIK2: TIntegerField
      FieldName = 'ID_SOTRUDNIK2'
      Origin = 'AKT_VIP_RABOT_0.ID_SOTRUDNIK2'
    end
    object IB_Akt_vip_rabot_0SOTRUDNIK2_FIO: TStringField
      FieldKind = fkLookup
      FieldName = 'SOTRUDNIK2_FIO'
      LookupDataSet = IB_Sotrudniki
      LookupKeyFields = 'ID'
      LookupResultField = 'FIO'
      KeyFields = 'ID_SOTRUDNIK2'
      Size = 50
      Lookup = True
    end
  end
  object IB_Rashod_detali: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnPostError = IB_Rashod_detaliPostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from RASHOD_DETALI'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into RASHOD_DETALI'
      
        '  (AREA, DATE_R, ID, ID_AKT_VIP_PROD, ID_GOTOV_PROD, ID_PILOMAT_' +
        'DETALI, '
      '   KOL_VO)'
      'values'
      
        '  (:AREA, :DATE_R, :ID, :ID_AKT_VIP_PROD, :ID_GOTOV_PROD, :ID_PI' +
        'LOMAT_DETALI, '
      '   :KOL_VO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_PILOMAT_DETALI,'
      '  KOL_VO,'
      '  DATE_R,'
      '  ID_AKT_VIP_PROD,'
      '  ID_GOTOV_PROD,'
      '  AREA'
      'from RASHOD_DETALI '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *  from RASHOD_DETALI'
      'where (id_akt_vip_prod=:NOMER)'
      'order by date_r')
    ModifySQL.Strings = (
      'update RASHOD_DETALI'
      'set'
      '  AREA = :AREA,'
      '  DATE_R = :DATE_R,'
      '  ID = :ID,'
      '  ID_AKT_VIP_PROD = :ID_AKT_VIP_PROD,'
      '  ID_GOTOV_PROD = :ID_GOTOV_PROD,'
      '  ID_PILOMAT_DETALI = :ID_PILOMAT_DETALI,'
      '  KOL_VO = :KOL_VO'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_RASHOD_DETALI_ID'
    DataSource = DS_Akt_vip_prod_0
    Left = 936
    Top = 16
    object IB_Rashod_detaliID: TIntegerField
      FieldName = 'ID'
      Origin = '"RASHOD_DETALI"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IB_Rashod_detaliID_PILOMAT_DETALI: TIntegerField
      FieldName = 'ID_PILOMAT_DETALI'
      Origin = '"RASHOD_DETALI"."ID_PILOMAT_DETALI"'
      Required = True
    end
    object IB_Rashod_detaliKOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = '"RASHOD_DETALI"."KOL_VO"'
      Required = True
    end
    object IB_Rashod_detaliDATE_R: TDateField
      FieldName = 'DATE_R'
      Origin = '"RASHOD_DETALI"."DATE_R"'
      Required = True
    end
    object IB_Rashod_detaliID_AKT_VIP_PROD: TIntegerField
      FieldName = 'ID_AKT_VIP_PROD'
      Origin = '"RASHOD_DETALI"."ID_AKT_VIP_PROD"'
      Required = True
    end
    object IB_Rashod_detaliDETALI_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'DETALI_NAME'
      LookupDataSet = IB_Pilomat_detali
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_PILOMAT_DETALI'
      Size = 60
      Lookup = True
    end
    object IB_Rashod_detaliID_GOTOV_PROD: TIntegerField
      FieldName = 'ID_GOTOV_PROD'
      Origin = '"RASHOD_DETALI"."ID_GOTOV_PROD"'
    end
    object IB_Rashod_detaliAREA: TIntegerField
      FieldName = 'AREA'
      Origin = '"RASHOD_DETALI"."AREA"'
      DisplayFormat = '# ### ###'
    end
  end
  object DS_Rashod_detali: TDataSource
    DataSet = IB_Rashod_detali
    Left = 1008
    Top = 16
  end
  object IB_Rashod_furnitura: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnPostError = IB_Rashod_furnituraPostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from RASHOD_FURNITURA'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into RASHOD_FURNITURA'
      
        '  (DATE_R, ID, ID_AKT_VIP_PROD, ID_AKT_VIP_RABOT, ID_FURNITURA, ' +
        'ID_GOTOV_PROD, '
      '   KOL_VO)'
      'values'
      
        '  (:DATE_R, :ID, :ID_AKT_VIP_PROD, :ID_AKT_VIP_RABOT, :ID_FURNIT' +
        'URA, :ID_GOTOV_PROD, '
      '   :KOL_VO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_FURNITURA,'
      '  KOL_VO,'
      '  DATE_R,'
      '  ID_AKT_VIP_PROD,'
      '  ID_AKT_VIP_RABOT,'
      '  ID_GOTOV_PROD'
      'from RASHOD_FURNITURA '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      
        'select fg.name as grupa_name, f.name as furnitura_name, f.ed_izm' +
        ' as ed_izm, rf.ID, rf.ID_FURNITURA, rf.KOL_VO, rf.kolvo_norma, r' +
        'f.DATE_R, rf.ID_AKT_VIP_PROD, rf.ID_AKT_VIP_RABOT, rf.ID_GOTOV_P' +
        'ROD'
      
        'from RASHOD_FURNITURA as rf, furnitura as f, furnitura_grupa as ' +
        'fg'
      
        'where (rf.id_furnitura=f.id) and (f.id_parent=fg.id) and (id_akt' +
        '_vip_prod=:NOMER)'
      'order by date_r, grupa_name, furnitura_name')
    ModifySQL.Strings = (
      'update RASHOD_FURNITURA'
      'set'
      '  DATE_R = :DATE_R,'
      '  ID = :ID,'
      '  ID_AKT_VIP_PROD = :ID_AKT_VIP_PROD,'
      '  ID_AKT_VIP_RABOT = :ID_AKT_VIP_RABOT,'
      '  ID_FURNITURA = :ID_FURNITURA,'
      '  ID_GOTOV_PROD = :ID_GOTOV_PROD,'
      '  KOL_VO = :KOL_VO'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_RASHOD_FURNITURA_ID'
    DataSource = DS_Akt_vip_prod_0
    Left = 936
    Top = 64
    object IB_Rashod_furnituraGRUPA_NAME: TIBStringField
      FieldName = 'GRUPA_NAME'
      Origin = '"FURNITURA_GRUPA"."NAME"'
      Size = 50
    end
    object IB_Rashod_furnituraFURNITURA_NAME: TIBStringField
      FieldName = 'FURNITURA_NAME'
      Origin = '"FURNITURA"."NAME"'
      Size = 100
    end
    object IB_Rashod_furnituraID: TIntegerField
      FieldName = 'ID'
      Origin = '"RASHOD_FURNITURA"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IB_Rashod_furnituraID_FURNITURA: TIntegerField
      FieldName = 'ID_FURNITURA'
      Origin = '"RASHOD_FURNITURA"."ID_FURNITURA"'
      Required = True
    end
    object IB_Rashod_furnituraKOL_VO: TIBBCDField
      FieldName = 'KOL_VO'
      Origin = '"RASHOD_FURNITURA"."KOL_VO"'
      Required = True
      Precision = 9
      Size = 3
    end
    object IB_Rashod_furnituraDATE_R: TDateField
      FieldName = 'DATE_R'
      Origin = '"RASHOD_FURNITURA"."DATE_R"'
      Required = True
    end
    object IB_Rashod_furnituraID_AKT_VIP_PROD: TIntegerField
      FieldName = 'ID_AKT_VIP_PROD'
      Origin = '"RASHOD_FURNITURA"."ID_AKT_VIP_PROD"'
    end
    object IB_Rashod_furnituraID_AKT_VIP_RABOT: TIntegerField
      FieldName = 'ID_AKT_VIP_RABOT'
      Origin = '"RASHOD_FURNITURA"."ID_AKT_VIP_RABOT"'
    end
    object IB_Rashod_furnituraID_GOTOV_PROD: TIntegerField
      FieldName = 'ID_GOTOV_PROD'
      Origin = '"RASHOD_FURNITURA"."ID_GOTOV_PROD"'
    end
    object IB_Rashod_furnituraED_IZM: TIBStringField
      FieldName = 'ED_IZM'
      Origin = '"FURNITURA"."ED_IZM"'
      Size = 8
    end
    object IB_Rashod_furnituraKOLVO_NORMA: TIBBCDField
      FieldName = 'KOLVO_NORMA'
      Origin = 'RASHOD_FURNITURA.KOLVO_NORMA'
      Precision = 9
      Size = 3
    end
  end
  object DS_Rashod_furnitura: TDataSource
    DataSet = IB_Rashod_furnitura
    Left = 1008
    Top = 64
  end
  object IB_Akt_vip_prod_0: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnPostError = IB_Akt_vip_prod_0PostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from AKT_VIP_PROD_0'
      'where'
      '  NOMER = :OLD_NOMER')
    InsertSQL.Strings = (
      'insert into AKT_VIP_PROD_0'
      
        '  (DATE_A, ID_SKLAD_KUDA, ID_SKLAD_OTKUDA, ID_ZAKAZ, NOMER, PRIM' +
        'ECHANIE)'
      'values'
      
        '  (:DATE_A, :ID_SKLAD_KUDA, :ID_SKLAD_OTKUDA, :ID_ZAKAZ, :NOMER,' +
        ' :PRIMECHANIE)')
    RefreshSQL.Strings = (
      'Select '
      '  NOMER,'
      '  DATE_A,'
      '  ID_SKLAD_OTKUDA,'
      '  ID_SKLAD_KUDA,'
      '  ID_ZAKAZ,'
      '  PRIMECHANIE'
      'from AKT_VIP_PROD_0 '
      'where'
      '  NOMER = :NOMER')
    SelectSQL.Strings = (
      'select *   from AKT_VIP_PROD_0'
      ''
      'order by date_a, nomer')
    ModifySQL.Strings = (
      'update AKT_VIP_PROD_0'
      'set'
      '  DATE_A = :DATE_A,'
      '  ID_SKLAD_KUDA = :ID_SKLAD_KUDA,'
      '  ID_SKLAD_OTKUDA = :ID_SKLAD_OTKUDA,'
      '  ID_ZAKAZ = :ID_ZAKAZ,'
      '  NOMER = :NOMER,'
      '  PRIMECHANIE = :PRIMECHANIE'
      'where'
      '  NOMER = :OLD_NOMER')
    GeneratorField.Field = 'NOMER'
    GeneratorField.Generator = 'GEN_AKT_VIP_PROD_0_ID'
    Left = 520
    Top = 280
    object IB_Akt_vip_prod_0NOMER: TIntegerField
      FieldName = 'NOMER'
      Origin = '"AKT_VIP_PROD_0"."NOMER"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IB_Akt_vip_prod_0DATE_A: TDateField
      FieldName = 'DATE_A'
      Origin = '"AKT_VIP_PROD_0"."DATE_A"'
      Required = True
    end
    object IB_Akt_vip_prod_0ID_SKLAD_OTKUDA: TIntegerField
      FieldName = 'ID_SKLAD_OTKUDA'
      Origin = '"AKT_VIP_PROD_0"."ID_SKLAD_OTKUDA"'
      Required = True
    end
    object IB_Akt_vip_prod_0ID_SKLAD_KUDA: TIntegerField
      FieldName = 'ID_SKLAD_KUDA'
      Origin = '"AKT_VIP_PROD_0"."ID_SKLAD_KUDA"'
      Required = True
    end
    object IB_Akt_vip_prod_0ID_ZAKAZ: TIntegerField
      FieldName = 'ID_ZAKAZ'
      Origin = '"AKT_VIP_PROD_0"."ID_ZAKAZ"'
    end
    object IB_Akt_vip_prod_0SKLAD_OTKUDA: TStringField
      FieldKind = fkLookup
      FieldName = 'SKLAD_OTKUDA'
      LookupDataSet = IB_Sklad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD_OTKUDA'
      Size = 60
      Lookup = True
    end
    object IB_Akt_vip_prod_0SKLAD_KUDA: TStringField
      FieldKind = fkLookup
      FieldName = 'SKLAD_KUDA'
      LookupDataSet = IB_Sklad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD_KUDA'
      Size = 60
      Lookup = True
    end
    object IB_Akt_vip_prod_0PRIMECHANIE: TIBStringField
      FieldName = 'PRIMECHANIE'
      Origin = '"AKT_VIP_PROD_0"."PRIMECHANIE"'
      Size = 255
    end
  end
  object IB_Akt_raspil_ostatok: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    BeforePost = IB_Akt_raspil_ostatokBeforePost
    OnDeleteError = IB_Akt_raspil_ostatokDeleteError
    OnNewRecord = IB_Akt_raspil_ostatokNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from AKT_RASPIL_OSTATOK'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into AKT_RASPIL_OSTATOK'
      
        '  (ID, ID_PARENT, NAME, RAZMER_X, RAZMER_Y, ID_PILOMAT_LISTY, KO' +
        'L_VO)'
      'values'
      
        '  (:ID, :ID_PARENT, :NAME, :RAZMER_X, :RAZMER_Y, :ID_PILOMAT_LIS' +
        'TY, :KOL_VO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_PARENT,'
      '  NAME,'
      '  RAZMER_X,'
      '  RAZMER_Y,'
      '  ID_PILOMAT_LISTY,'
      '  KOL_VO'
      'from AKT_RASPIL_OSTATOK '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *  from AKT_RASPIL_OSTATOK'
      'where id_parent=:ID')
    ModifySQL.Strings = (
      'update AKT_RASPIL_OSTATOK'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  NAME = :NAME,'
      '  RAZMER_X = :RAZMER_X,'
      '  RAZMER_Y = :RAZMER_Y,'
      '  ID_PILOMAT_LISTY = :ID_PILOMAT_LISTY,'
      '  KOL_VO = :KOL_VO'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_AKT_RASPIL_OSTATOK_ID'
    GeneratorField.ApplyEvent = gamOnPost
    DataSource = DS_Akt_raspil
    Left = 520
    Top = 544
    object IB_Akt_raspil_ostatokID: TIntegerField
      FieldName = 'ID'
      Origin = '"AKT_RASPIL_OSTATOK"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IB_Akt_raspil_ostatokID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = '"AKT_RASPIL_OSTATOK"."ID_PARENT"'
      Required = True
    end
    object IB_Akt_raspil_ostatokNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"AKT_RASPIL_OSTATOK"."NAME"'
      Size = 60
    end
    object IB_Akt_raspil_ostatokRAZMER_X: TIBBCDField
      FieldName = 'RAZMER_X'
      Origin = '"AKT_RASPIL_OSTATOK"."RAZMER_X"'
      Required = True
      Precision = 9
      Size = 2
    end
    object IB_Akt_raspil_ostatokRAZMER_Y: TIBBCDField
      FieldName = 'RAZMER_Y'
      Origin = '"AKT_RASPIL_OSTATOK"."RAZMER_Y"'
      Required = True
      Precision = 9
      Size = 2
    end
    object IB_Akt_raspil_ostatokID_PILOMAT_LISTY: TIntegerField
      FieldName = 'ID_PILOMAT_LISTY'
      Origin = '"AKT_RASPIL_OSTATOK"."ID_PILOMAT_LISTY"'
    end
    object IB_Akt_raspil_ostatokKOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'AKT_RASPIL_OSTATOK.KOL_VO'
    end
  end
  object DS_Akt_raspil_ostatok: TDataSource
    DataSet = IB_Akt_raspil_ostatok
    Left = 616
    Top = 544
  end
  object IB_Furnitura_grupa: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    OnDeleteError = IB_Furnitura_grupaDeleteError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from FURNITURA_GRUPA'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into FURNITURA_GRUPA'
      '  (ID, ID_VID_RABOT, NAME)'
      'values'
      '  (:ID, :ID_VID_RABOT, :NAME)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  NAME,'
      '  ID_VID_RABOT'
      'from FURNITURA_GRUPA '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *   from FURNITURA_GRUPA'
      'order by NAME')
    ModifySQL.Strings = (
      'update FURNITURA_GRUPA'
      'set'
      '  ID = :ID,'
      '  ID_VID_RABOT = :ID_VID_RABOT,'
      '  NAME = :NAME'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_FURNITURA_GRUPA_ID'
    Left = 232
    Top = 168
    object IB_Furnitura_grupaVID_RABOT: TStringField
      FieldKind = fkLookup
      FieldName = 'VID_RABOT'
      LookupDataSet = IB_Vidy_rabot
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_VID_RABOT'
      Size = 60
      Lookup = True
    end
    object IB_Furnitura_grupaID: TIntegerField
      FieldName = 'ID'
      Origin = '"FURNITURA_GRUPA"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IB_Furnitura_grupaNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"FURNITURA_GRUPA"."NAME"'
      Required = True
      Size = 50
    end
    object IB_Furnitura_grupaID_VID_RABOT: TIntegerField
      FieldName = 'ID_VID_RABOT'
      Origin = '"FURNITURA_GRUPA"."ID_VID_RABOT"'
    end
  end
  object DS_Furnitura_grupa: TDataSource
    DataSet = IB_Furnitura_grupa
    Left = 320
    Top = 168
  end
  object DS_Furnitura: TDataSource
    DataSet = IB_Furnitura
    Left = 320
    Top = 216
  end
  object IB_Furnitura: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    OnDeleteError = IB_FurnituraDeleteError
    OnNewRecord = IB_FurnituraNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from FURNITURA'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into FURNITURA'
      
        '  (ID, NAME, ED_IZM, ID_PARENT, MANUFACTURER_NAME, MANUFACTURER_' +
        'CODE, ARTICLE)'
      'values'
      
        '  (:ID, :NAME, :ED_IZM, :ID_PARENT, :MANUFACTURER_NAME, :MANUFAC' +
        'TURER_CODE, '
      '   :ARTICLE)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  NAME,'
      '  ED_IZM,'
      '  ID_PARENT,'
      '  MANUFACTURER_NAME,'
      '  MANUFACTURER_CODE,'
      '  ARTICLE'
      'from FURNITURA '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *   from FURNITURA'
      ''
      'order by name')
    ModifySQL.Strings = (
      'update FURNITURA'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME,'
      '  ED_IZM = :ED_IZM,'
      '  ID_PARENT = :ID_PARENT,'
      '  MANUFACTURER_NAME = :MANUFACTURER_NAME,'
      '  MANUFACTURER_CODE = :MANUFACTURER_CODE,'
      '  ARTICLE = :ARTICLE'
      'where'
      '  ID = :OLD_ID')
    DataSource = DS_Furnitura_grupa
    Left = 232
    Top = 216
    object IB_FurnituraID: TIntegerField
      FieldName = 'ID'
      Origin = 'FURNITURA.ID'
      Required = True
    end
    object IB_FurnituraED_IZM: TIBStringField
      FieldName = 'ED_IZM'
      Origin = 'FURNITURA.ED_IZM'
      Required = True
      Size = 8
    end
    object IB_FurnituraID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'FURNITURA.ID_PARENT'
      Required = True
    end
    object IB_FurnituraMANUFACTURER_NAME: TIBStringField
      FieldName = 'MANUFACTURER_NAME'
      Origin = 'FURNITURA.MANUFACTURER_NAME'
      Size = 100
    end
    object IB_FurnituraARTICLE: TIntegerField
      FieldName = 'ARTICLE'
      Origin = 'FURNITURA.ARTICLE'
    end
    object IB_FurnituraNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'FURNITURA.NAME'
      Required = True
      Size = 100
    end
    object IB_FurnituraMANUFACTURER_CODE: TIBStringField
      FieldName = 'MANUFACTURER_CODE'
      Origin = 'FURNITURA.MANUFACTURER_CODE'
      Size = 100
    end
  end
  object DS_Vidy_rabot_stoimosti: TDataSource
    DataSet = IB_Vidy_rabot_stoimosti
    Left = 104
    Top = 240
  end
  object IB_Vidy_rabot_stoimosti: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnNewRecord = IB_Vidy_rabot_stoimostiNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from VIDY_RABOT_STOIMOSTI'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into VIDY_RABOT_STOIMOSTI'
      '  (DATE_STOIM, ID, ID_GOTOV_PROD, ID_VID_RABOT, PRICE)'
      'values'
      '  (:DATE_STOIM, :ID, :ID_GOTOV_PROD, :ID_VID_RABOT, :PRICE)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_VID_RABOT,'
      '  DATE_STOIM,'
      '  PRICE,'
      '  ID_GOTOV_PROD'
      'from VIDY_RABOT_STOIMOSTI '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *  from  VIDY_RABOT_STOIMOSTI'
      'where ID_VID_RABOT=:ID'
      'order by DATE_STOIM, ID_GOTOV_PROD')
    ModifySQL.Strings = (
      'update VIDY_RABOT_STOIMOSTI'
      'set'
      '  DATE_STOIM = :DATE_STOIM,'
      '  ID = :ID,'
      '  ID_GOTOV_PROD = :ID_GOTOV_PROD,'
      '  ID_VID_RABOT = :ID_VID_RABOT,'
      '  PRICE = :PRICE'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_VIDY_RABOT_STOIMOSTI_ID'
    DataSource = DS_Vidy_rabot
    Left = 48
    Top = 248
  end
  object IB_Gotov_prod_grupa: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from GOTOV_PROD_grupa'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into GOTOV_PROD_grupa'
      '  (ID, NAME)'
      'values'
      '  (:ID, :NAME)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  NAME'
      'from GOTOV_PROD_grupa '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *  from GOTOV_PROD_grupa'
      'order by NAME')
    ModifySQL.Strings = (
      'update GOTOV_PROD_grupa'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_GOTOV_PROD_GRUPA_ID'
    Left = 232
    Top = 312
  end
  object DS_Gotov_prod_grupa: TDataSource
    DataSet = IB_Gotov_prod_grupa
    Left = 312
    Top = 312
  end
  object IB_Peremeschenie_detali: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnNewRecord = IB_Peremeschenie_detaliNewRecord
    OnPostError = IB_Peremeschenie_detaliPostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PEREMESCHENIE_DETALI'
      'where'
      '  ID_PARENT = :OLD_ID_PARENT and'
      '  ID_PILOMAT_DETALI = :OLD_ID_PILOMAT_DETALI')
    InsertSQL.Strings = (
      'insert into PEREMESCHENIE_DETALI'
      '  (ID_PARENT, ID_PILOMAT_DETALI, ID_VID_RABOT, KOL_VO)'
      'values'
      '  (:ID_PARENT, :ID_PILOMAT_DETALI, :ID_VID_RABOT, :KOL_VO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  ID_PILOMAT_DETALI,'
      '  KOL_VO,'
      '  ID_VID_RABOT'
      'from PEREMESCHENIE_DETALI '
      'where'
      '  ID_PARENT = :ID_PARENT and'
      '  ID_PILOMAT_DETALI = :ID_PILOMAT_DETALI')
    SelectSQL.Strings = (
      'select * from PEREMESCHENIE_DETALI'
      'where id_parent=:ID')
    ModifySQL.Strings = (
      'update PEREMESCHENIE_DETALI'
      'set'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_PILOMAT_DETALI = :ID_PILOMAT_DETALI,'
      '  ID_VID_RABOT = :ID_VID_RABOT,'
      '  KOL_VO = :KOL_VO'
      'where'
      '  ID_PARENT = :OLD_ID_PARENT and'
      '  ID_PILOMAT_DETALI = :OLD_ID_PILOMAT_DETALI')
    DataSource = DS_Peremeschenie_0
    Left = 736
    Top = 352
    object IB_Peremeschenie_detaliID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = '"PEREMESCHENIE_DETALI"."ID_PARENT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IB_Peremeschenie_detaliID_PILOMAT_DETALI: TIntegerField
      FieldName = 'ID_PILOMAT_DETALI'
      Origin = '"PEREMESCHENIE_DETALI"."ID_PILOMAT_DETALI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IB_Peremeschenie_detaliKOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = '"PEREMESCHENIE_DETALI"."KOL_VO"'
      Required = True
    end
    object IB_Peremeschenie_detaliDETALI_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'DETALI_NAME'
      LookupDataSet = IB_Pilomat_detali
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_PILOMAT_DETALI'
      Size = 60
      Lookup = True
    end
    object IB_Peremeschenie_detaliID_VID_RABOT: TIntegerField
      FieldName = 'ID_VID_RABOT'
      Origin = '"PEREMESCHENIE_DETALI"."ID_VID_RABOT"'
    end
    object IB_Peremeschenie_detaliVIDRABOT_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'VIDRABOT_NAME'
      LookupDataSet = IB_Vidy_rabot
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_VID_RABOT'
      Size = 60
      Lookup = True
    end
  end
  object DS_Peremeschenie_detali: TDataSource
    DataSet = IB_Peremeschenie_detali
    Left = 832
    Top = 352
  end
  object IB_Peremeschenie_furnitura: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    BeforePost = IB_Peremeschenie_furnituraBeforePost
    OnCalcFields = IB_Peremeschenie_furnituraCalcFields
    OnNewRecord = IB_Peremeschenie_furnituraNewRecord
    OnPostError = IB_Peremeschenie_furnituraPostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PEREMESCHENIE_FURNITURA'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PEREMESCHENIE_FURNITURA'
      '  (ID_PARENT, ID_FURNITURA, KOL_VO, ID_SOTRUDNIK, ID)'
      'values'
      '  (:ID_PARENT, :ID_FURNITURA, :KOL_VO, :ID_SOTRUDNIK, :ID)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  ID_FURNITURA,'
      '  KOL_VO,'
      '  ID_SOTRUDNIK,'
      '  ID'
      'from PEREMESCHENIE_FURNITURA '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from PEREMESCHENIE_FURNITURA'
      'where id_parent=:ID')
    ModifySQL.Strings = (
      'update PEREMESCHENIE_FURNITURA'
      'set'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_FURNITURA = :ID_FURNITURA,'
      '  KOL_VO = :KOL_VO,'
      '  ID_SOTRUDNIK = :ID_SOTRUDNIK,'
      '  ID = :ID'
      'where'
      '  ID = :OLD_ID')
    DataSource = DS_Peremeschenie_0
    Left = 736
    Top = 400
    object IB_Peremeschenie_furnituraID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = '"PEREMESCHENIE_FURNITURA"."ID_PARENT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IB_Peremeschenie_furnituraID_FURNITURA: TIntegerField
      FieldName = 'ID_FURNITURA'
      Origin = '"PEREMESCHENIE_FURNITURA"."ID_FURNITURA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IB_Peremeschenie_furnituraKOL_VO: TIBBCDField
      FieldName = 'KOL_VO'
      Origin = '"PEREMESCHENIE_FURNITURA"."KOL_VO"'
      Required = True
      Precision = 18
      Size = 3
    end
    object IB_Peremeschenie_furnituraFURNITURA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'FURNITURA_NAME'
      LookupDataSet = IB_Furnitura
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_FURNITURA'
      Size = 100
      Lookup = True
    end
    object IB_Peremeschenie_furnituraEDIZM_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'EDIZM_NAME'
      LookupDataSet = IB_Furnitura
      LookupKeyFields = 'ID'
      LookupResultField = 'ED_IZM'
      KeyFields = 'ID_FURNITURA'
      Size = 10
      Lookup = True
    end
    object IB_Peremeschenie_furnituraID_SOTRUDNIK: TIntegerField
      FieldName = 'ID_SOTRUDNIK'
      Origin = 'PEREMESCHENIE_FURNITURA.ID_SOTRUDNIK'
    end
    object IB_Peremeschenie_furnituraGRUPA_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'GRUPA_NAME'
      Size = 100
      Calculated = True
    end
    object IB_Peremeschenie_furnituraSOTRUDNIK_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'SOTRUDNIK_NAME'
      LookupDataSet = IB_Sotrudniki
      LookupKeyFields = 'ID'
      LookupResultField = 'FIO'
      KeyFields = 'ID_SOTRUDNIK'
      Size = 60
      Lookup = True
    end
  end
  object DS_Peremeschenie_furnitura: TDataSource
    DataSet = IB_Peremeschenie_furnitura
    Left = 832
    Top = 400
  end
  object IB_Peremeschenie_listy: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    BeforePost = IB_Peremeschenie_listyBeforePost
    OnNewRecord = IB_Peremeschenie_listyNewRecord
    OnPostError = IB_Peremeschenie_listyPostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PEREMESCHENIE_LISTY'
      'where'
      '  ID_PARENT = :OLD_ID_PARENT and'
      '  ID_PILOMAT_LISTY = :OLD_ID_PILOMAT_LISTY')
    InsertSQL.Strings = (
      'insert into PEREMESCHENIE_LISTY'
      '  (ID_PARENT, ID_PILOMAT_LISTY, KOL_VO)'
      'values'
      '  (:ID_PARENT, :ID_PILOMAT_LISTY, :KOL_VO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  ID_PILOMAT_LISTY,'
      '  KOL_VO'
      'from PEREMESCHENIE_LISTY '
      'where'
      '  ID_PARENT = :ID_PARENT and'
      '  ID_PILOMAT_LISTY = :ID_PILOMAT_LISTY')
    SelectSQL.Strings = (
      'select * from PEREMESCHENIE_LISTY'
      'where id_parent=:ID')
    ModifySQL.Strings = (
      'update PEREMESCHENIE_LISTY'
      'set'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_PILOMAT_LISTY = :ID_PILOMAT_LISTY,'
      '  KOL_VO = :KOL_VO'
      'where'
      '  ID_PARENT = :OLD_ID_PARENT and'
      '  ID_PILOMAT_LISTY = :OLD_ID_PILOMAT_LISTY')
    DataSource = DS_Peremeschenie_0
    Left = 736
    Top = 448
    object IB_Peremeschenie_listyID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = '"PEREMESCHENIE_LISTY"."ID_PARENT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IB_Peremeschenie_listyID_PILOMAT_LISTY: TIntegerField
      FieldName = 'ID_PILOMAT_LISTY'
      Origin = '"PEREMESCHENIE_LISTY"."ID_PILOMAT_LISTY"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IB_Peremeschenie_listyKOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = '"PEREMESCHENIE_LISTY"."KOL_VO"'
      Required = True
    end
    object IB_Peremeschenie_listyLISTY_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'LISTY_NAME'
      LookupDataSet = IB_Pilomat_listy
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_PILOMAT_LISTY'
      Size = 60
      Lookup = True
    end
  end
  object DS_Peremeschenie_listy: TDataSource
    DataSet = IB_Peremeschenie_listy
    Left = 832
    Top = 448
  end
  object IB_Spisanie_0: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnDeleteError = IB_Spisanie_0DeleteError
    OnPostError = IB_Spisanie_0PostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from SPISANIE_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into SPISANIE_0'
      '  (ID, DATE_SPIS, ID_SKLAD, PRIMECHANIE, ID_STATYA_RASHODA)'
      'values'
      '  (:ID, :DATE_SPIS, :ID_SKLAD, :PRIMECHANIE, :ID_STATYA_RASHODA)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  DATE_SPIS,'
      '  ID_SKLAD,'
      '  PRIMECHANIE,'
      '  ID_STATYA_RASHODA'
      'from SPISANIE_0 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from SPISANIE_0'
      'where date_spis>=:date_start'
      'order by date_spis, id')
    ModifySQL.Strings = (
      'update SPISANIE_0'
      'set'
      '  ID = :ID,'
      '  DATE_SPIS = :DATE_SPIS,'
      '  ID_SKLAD = :ID_SKLAD,'
      '  PRIMECHANIE = :PRIMECHANIE,'
      '  ID_STATYA_RASHODA = :ID_STATYA_RASHODA'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_SPISANIE'
    Left = 936
    Top = 144
    object IB_Spisanie_0ID: TIntegerField
      FieldName = 'ID'
      Origin = '"SPISANIE_0"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IB_Spisanie_0DATE_SPIS: TDateField
      FieldName = 'DATE_SPIS'
      Origin = '"SPISANIE_0"."DATE_SPIS"'
      Required = True
    end
    object IB_Spisanie_0ID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Origin = '"SPISANIE_0"."ID_SKLAD"'
    end
    object IB_Spisanie_0SKLAD_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'SKLAD_NAME'
      LookupDataSet = IB_Sklad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD'
      Size = 100
      Lookup = True
    end
    object IB_Spisanie_0PRIMECHANIE: TIBStringField
      FieldName = 'PRIMECHANIE'
      Origin = '"SPISANIE_0"."PRIMECHANIE"'
      Size = 255
    end
    object IB_Spisanie_0ID_STATYA_RASHODA: TIntegerField
      FieldName = 'ID_STATYA_RASHODA'
      Origin = 'SPISANIE_0.ID_STATYA_RASHODA'
    end
    object IB_Spisanie_0STATYA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'STATYA_NAME'
      LookupDataSet = IB_Statyi_Rashoda
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_STATYA_RASHODA'
      Size = 100
      Lookup = True
    end
  end
  object DS_Spisanie_0: TDataSource
    DataSet = IB_Spisanie_0
    Left = 1024
    Top = 144
  end
  object IB_Spisanie_detali: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnCalcFields = IB_Spisanie_detaliCalcFields
    OnNewRecord = IB_Spisanie_detaliNewRecord
    OnPostError = IB_Spisanie_detaliPostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from SPISANIE_DETALI'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into SPISANIE_DETALI'
      
        '  (ID_PARENT, ID_PILOMAT_DETALI, KOL_VO, ID_VID_RABOT, OPLATA, I' +
        'D)'
      'values'
      
        '  (:ID_PARENT, :ID_PILOMAT_DETALI, :KOL_VO, :ID_VID_RABOT, :OPLA' +
        'TA, :ID)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  ID_PILOMAT_DETALI,'
      '  KOL_VO,'
      '  ID_VID_RABOT,'
      '  OPLATA,'
      '  ID'
      'from SPISANIE_DETALI '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from SPISANIE_DETALI'
      'where id_parent=:ID')
    ModifySQL.Strings = (
      'update SPISANIE_DETALI'
      'set'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_PILOMAT_DETALI = :ID_PILOMAT_DETALI,'
      '  KOL_VO = :KOL_VO,'
      '  ID_VID_RABOT = :ID_VID_RABOT,'
      '  OPLATA = :OPLATA,'
      '  ID = :ID'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_SPISANIE_DETALI_ID'
    DataSource = DS_Spisanie_0
    Left = 936
    Top = 192
    object IB_Spisanie_detaliID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = '"SPISANIE_DETALI"."ID_PARENT"'
      Required = True
    end
    object IB_Spisanie_detaliID_PILOMAT_DETALI: TIntegerField
      FieldName = 'ID_PILOMAT_DETALI'
      Origin = '"SPISANIE_DETALI"."ID_PILOMAT_DETALI"'
      Required = True
    end
    object IB_Spisanie_detaliKOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = '"SPISANIE_DETALI"."KOL_VO"'
      Required = True
    end
    object IB_Spisanie_detaliID_VID_RABOT: TIntegerField
      FieldName = 'ID_VID_RABOT'
      Origin = '"SPISANIE_DETALI"."ID_VID_RABOT"'
    end
    object IB_Spisanie_detaliVIDRBOT_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'VIDRABOT_NAME'
      LookupDataSet = IB_Vidy_rabot
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_VID_RABOT'
      Size = 200
      Lookup = True
    end
    object IB_Spisanie_detaliOPLATA: TSmallintField
      FieldName = 'OPLATA'
      Origin = '"SPISANIE_DETALI"."OPLATA"'
    end
    object IB_Spisanie_detaliOPLATA_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'OPLATA_NAME'
      Size = 3
      Calculated = True
    end
    object IB_Spisanie_detaliDETALI_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'DETALI_NAME'
      LookupDataSet = F_Spisanie_jurnal.IB_Pilomat_detali
      LookupKeyFields = 'ID_PILOMAT_DETALI'
      LookupResultField = 'DETALI_NAME'
      KeyFields = 'ID_PILOMAT_DETALI'
      Size = 100
      Lookup = True
    end
    object IB_Spisanie_detaliGRUPA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'GRUPA_NAME'
      LookupDataSet = F_Spisanie_jurnal.IB_Pilomat_detali
      LookupKeyFields = 'ID_PILOMAT_DETALI'
      LookupResultField = 'GRUPA_NAME'
      KeyFields = 'ID_PILOMAT_DETALI'
      Size = 100
      Lookup = True
    end
    object IB_Spisanie_detaliID: TIntegerField
      FieldName = 'ID'
      Origin = 'SPISANIE_DETALI.ID'
      Required = True
    end
  end
  object DS_Spisanie_detali: TDataSource
    DataSet = IB_Spisanie_detali
    Left = 1032
    Top = 192
  end
  object IB_Spisanie_furnitura: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnNewRecord = IB_Spisanie_furnituraNewRecord
    OnPostError = IB_Spisanie_furnituraPostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from SPISANIE_FURNITURA'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into SPISANIE_FURNITURA'
      '  (ID_PARENT, ID_FURNITURA, KOL_VO, ID)'
      'values'
      '  (:ID_PARENT, :ID_FURNITURA, :KOL_VO, :ID)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  ID_FURNITURA,'
      '  KOL_VO,'
      '  ID'
      'from SPISANIE_FURNITURA '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from SPISANIE_FURNITURA'
      'where id_parent=:ID')
    ModifySQL.Strings = (
      'update SPISANIE_FURNITURA'
      'set'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_FURNITURA = :ID_FURNITURA,'
      '  KOL_VO = :KOL_VO,'
      '  ID = :ID'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_SPISANIE_FURNITURA_ID'
    DataSource = DS_Spisanie_0
    Left = 936
    Top = 240
    object IB_Spisanie_furnituraID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = '"SPISANIE_FURNITURA"."ID_PARENT"'
      Required = True
    end
    object IB_Spisanie_furnituraID_FURNITURA: TIntegerField
      FieldName = 'ID_FURNITURA'
      Origin = '"SPISANIE_FURNITURA"."ID_FURNITURA"'
      Required = True
    end
    object IB_Spisanie_furnituraKOL_VO: TIBBCDField
      FieldName = 'KOL_VO'
      Origin = '"SPISANIE_FURNITURA"."KOL_VO"'
      Required = True
      DisplayFormat = '0.000'
      EditFormat = '0.000'
      Precision = 18
      Size = 3
    end
    object IB_Spisanie_furnituraFURNITURA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'FURNITURA_NAME'
      LookupDataSet = IB_Furnitura
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_FURNITURA'
      Size = 200
      Lookup = True
    end
    object IB_Spisanie_furnituraFURNITURA_EDIZM: TStringField
      FieldKind = fkLookup
      FieldName = 'EDIZM_NAME'
      LookupDataSet = IB_Furnitura
      LookupKeyFields = 'ID'
      LookupResultField = 'ED_IZM'
      KeyFields = 'ID_FURNITURA'
      Size = 10
      Lookup = True
    end
    object IB_Spisanie_furnituraID: TIntegerField
      FieldName = 'ID'
      Origin = 'SPISANIE_FURNITURA.ID'
      Required = True
    end
  end
  object DS_Spisanie_furnitura: TDataSource
    DataSet = IB_Spisanie_furnitura
    Left = 1032
    Top = 240
  end
  object IB_Spisanie_listy: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    BeforePost = IB_Spisanie_listyBeforePost
    OnNewRecord = IB_Spisanie_listyNewRecord
    OnPostError = IB_Spisanie_listyPostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from SPISANIE_LISTY'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into SPISANIE_LISTY'
      
        '  (ID, ID_PARENT, ID_PILOMAT_LISTY, KOL_VO, SUMMA, ID_PRIHOD_LIS' +
        'TY)'
      'values'
      
        '  (:ID, :ID_PARENT, :ID_PILOMAT_LISTY, :KOL_VO, :SUMMA, :ID_PRIH' +
        'OD_LISTY)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_PARENT,'
      '  ID_PILOMAT_LISTY,'
      '  KOL_VO,'
      '  SUMMA,'
      '  ID_PRIHOD_LISTY'
      'from SPISANIE_LISTY '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from SPISANIE_LISTY'
      'where id_parent=:ID')
    ModifySQL.Strings = (
      'update SPISANIE_LISTY'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_PILOMAT_LISTY = :ID_PILOMAT_LISTY,'
      '  KOL_VO = :KOL_VO,'
      '  SUMMA = :SUMMA,'
      '  ID_PRIHOD_LISTY = :ID_PRIHOD_LISTY'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_SPISANIE_LISTY_ID'
    DataSource = DS_Spisanie_0
    Left = 936
    Top = 288
    object IB_Spisanie_listyID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = '"SPISANIE_LISTY"."ID_PARENT"'
      Required = True
    end
    object IB_Spisanie_listyID_PILOMAT_LISTY: TIntegerField
      FieldName = 'ID_PILOMAT_LISTY'
      Origin = '"SPISANIE_LISTY"."ID_PILOMAT_LISTY"'
      Required = True
    end
    object IB_Spisanie_listyKOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = '"SPISANIE_LISTY"."KOL_VO"'
      Required = True
    end
    object IB_Spisanie_listyLISTY_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'LISTY_NAME'
      LookupDataSet = IB_Pilomat_listy
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_PILOMAT_LISTY'
      Size = 100
      Transliterate = False
      Lookup = True
    end
    object IB_Spisanie_listyID: TIntegerField
      FieldName = 'ID'
      Origin = 'SPISANIE_LISTY.ID'
      Required = True
    end
    object IB_Spisanie_listySUMMA: TIBBCDField
      FieldName = 'SUMMA'
      Origin = 'SPISANIE_LISTY.SUMMA'
      Precision = 18
      Size = 2
    end
    object IB_Spisanie_listyID_PRIHOD_LISTY: TIntegerField
      FieldName = 'ID_PRIHOD_LISTY'
      Origin = 'SPISANIE_LISTY.ID_PRIHOD_LISTY'
    end
  end
  object DS_Spisanie_listy: TDataSource
    DataSet = IB_Spisanie_listy
    Left = 1032
    Top = 288
  end
  object IB_Ostatki: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from OSTATKI'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into OSTATKI'
      
        '  (AREA, ED_IZM, GRUPA, ID, ID_GRUPA, ID_SKLAD, KOL_VO, NAME, SK' +
        'LAD, TIP_MATERIALA)'
      'values'
      
        '  (:AREA, :ED_IZM, :GRUPA, :ID, :ID_GRUPA, :ID_SKLAD, :KOL_VO, :' +
        'NAME, :SKLAD, '
      '   :TIP_MATERIALA)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  SKLAD,'
      '  NAME,'
      '  ED_IZM,'
      '  KOL_VO,'
      '  AREA,'
      '  TIP_MATERIALA,'
      '  GRUPA,'
      '  ID_SKLAD,'
      '  ID_GRUPA'
      'from OSTATKI '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from OSTATKI'
      'order by TIP_MATERIALA,ID_SKLAD,ID_GRUPA,NAME')
    ModifySQL.Strings = (
      'update OSTATKI'
      'set'
      '  AREA = :AREA,'
      '  ED_IZM = :ED_IZM,'
      '  GRUPA = :GRUPA,'
      '  ID = :ID,'
      '  ID_GRUPA = :ID_GRUPA,'
      '  ID_SKLAD = :ID_SKLAD,'
      '  KOL_VO = :KOL_VO,'
      '  NAME = :NAME,'
      '  SKLAD = :SKLAD,'
      '  TIP_MATERIALA = :TIP_MATERIALA'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_OSTATKI_ID'
    Left = 832
    Top = 536
    object IB_OstatkiID: TIntegerField
      FieldName = 'ID'
      Origin = '"OSTATKI"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IB_OstatkiSKLAD: TIBStringField
      FieldName = 'SKLAD'
      Origin = '"OSTATKI"."SKLAD"'
      Size = 50
    end
    object IB_OstatkiID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Origin = '"OSTATKI"."ID_SKLAD"'
    end
    object IB_OstatkiGRUPA: TIBStringField
      FieldName = 'GRUPA'
      Origin = '"OSTATKI"."GRUPA"'
      Size = 50
    end
    object IB_OstatkiID_GRUPA: TIntegerField
      FieldName = 'ID_GRUPA'
      Origin = '"OSTATKI"."ID_GRUPA"'
    end
    object IB_OstatkiNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"OSTATKI"."NAME"'
      Size = 100
    end
    object IB_OstatkiED_IZM: TIBStringField
      FieldName = 'ED_IZM'
      Origin = '"OSTATKI"."ED_IZM"'
      Size = 10
    end
    object IB_OstatkiKOL_VO: TIBBCDField
      FieldName = 'KOL_VO'
      Origin = '"OSTATKI"."KOL_VO"'
      Precision = 18
      Size = 3
    end
    object IB_OstatkiAREA: TIBBCDField
      FieldName = 'AREA'
      Origin = '"OSTATKI"."AREA"'
      Precision = 9
      Size = 3
    end
    object IB_OstatkiTIP_MATERIALA: TIntegerField
      FieldName = 'TIP_MATERIALA'
      Origin = '"OSTATKI"."TIP_MATERIALA"'
    end
  end
  object IB_Akt_vip_rabot_detali: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnPostError = IB_Akt_vip_rabot_detaliPostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from AKT_VIP_RABOT_DETALI'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into AKT_VIP_RABOT_DETALI'
      
        '  (DATE_A, ID, ID_PARENT, ID_PILOMAT_DETALI, ID_VID_RABOT, KOL_V' +
        'O)'
      'values'
      
        '  (:DATE_A, :ID, :ID_PARENT, :ID_PILOMAT_DETALI, :ID_VID_RABOT, ' +
        ':KOL_VO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_PILOMAT_DETALI,'
      '  ID_PARENT,'
      '  KOL_VO,'
      '  DATE_A,'
      '  ID_VID_RABOT'
      'from AKT_VIP_RABOT_DETALI '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from AKT_VIP_RABOT_DETALI'
      'where id_parent=:NOMER')
    ModifySQL.Strings = (
      'update AKT_VIP_RABOT_DETALI'
      'set'
      '  DATE_A = :DATE_A,'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_PILOMAT_DETALI = :ID_PILOMAT_DETALI,'
      '  ID_VID_RABOT = :ID_VID_RABOT,'
      '  KOL_VO = :KOL_VO'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_AKT_VIP_RABOT_DETALI_ID'
    DataSource = DS_Akt_vip_rabot_0
    Left = 520
    Top = 208
  end
  object DS_Akt_vip_rabot_detali: TDataSource
    AutoEdit = False
    DataSet = IB_Akt_vip_rabot_detali
    Left = 616
    Top = 208
  end
  object IB_OSTATOK_DETALI_VIDRABOT: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    AfterInsert = IB_OSTATOK_DETALI_VIDRABOTAfterInsert
    OnCalcFields = IB_OSTATOK_DETALI_VIDRABOTCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from OSTATOK_DETALI_VIDRABOT'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into OSTATOK_DETALI_VIDRABOT'
      
        '  (DATE_OST, ID, ID_PILOMAT_DETALI, ID_SKLAD, ID_VID_RABOT, KOL_' +
        'VO)'
      'values'
      
        '  (:DATE_OST, :ID, :ID_PILOMAT_DETALI, :ID_SKLAD, :ID_VID_RABOT,' +
        ' :KOL_VO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_PILOMAT_DETALI,'
      '  ID_VID_RABOT,'
      '  ID_SKLAD,'
      '  DATE_OST,'
      '  KOL_VO'
      'from OSTATOK_DETALI_VIDRABOT '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from OSTATOK_DETALI_VIDRABOT'
      'order by id_vid_rabot')
    ModifySQL.Strings = (
      'update OSTATOK_DETALI_VIDRABOT'
      'set'
      '  DATE_OST = :DATE_OST,'
      '  ID = :ID,'
      '  ID_PILOMAT_DETALI = :ID_PILOMAT_DETALI,'
      '  ID_SKLAD = :ID_SKLAD,'
      '  ID_VID_RABOT = :ID_VID_RABOT,'
      '  KOL_VO = :KOL_VO'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_OSTATOK_DETALI_VIDRABOT_ID'
    Left = 80
    Top = 624
    object IB_OSTATOK_DETALI_VIDRABOTID: TIntegerField
      FieldName = 'ID'
      Origin = '"OSTATOK_DETALI_VIDRABOT"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IB_OSTATOK_DETALI_VIDRABOTID_PILOMAT_DETALI: TIntegerField
      FieldName = 'ID_PILOMAT_DETALI'
      Origin = '"OSTATOK_DETALI_VIDRABOT"."ID_PILOMAT_DETALI"'
    end
    object IB_OSTATOK_DETALI_VIDRABOTID_VID_RABOT: TIntegerField
      FieldName = 'ID_VID_RABOT'
      Origin = '"OSTATOK_DETALI_VIDRABOT"."ID_VID_RABOT"'
    end
    object IB_OSTATOK_DETALI_VIDRABOTID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Origin = '"OSTATOK_DETALI_VIDRABOT"."ID_SKLAD"'
    end
    object IB_OSTATOK_DETALI_VIDRABOTDATE_OST: TDateField
      FieldName = 'DATE_OST'
      Origin = '"OSTATOK_DETALI_VIDRABOT"."DATE_OST"'
    end
    object IB_OSTATOK_DETALI_VIDRABOTKOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = '"OSTATOK_DETALI_VIDRABOT"."KOL_VO"'
    end
    object IB_OSTATOK_DETALI_VIDRABOTDETALI_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'DETALI_NAME'
      LookupDataSet = IB_Pilomat_detali
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_PILOMAT_DETALI'
      Size = 100
      Lookup = True
    end
    object IB_OSTATOK_DETALI_VIDRABOTVIDRABOT_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'VIDRABOT_NAME'
      LookupDataSet = IB_Vidy_rabot
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_VID_RABOT'
      Size = 100
      Lookup = True
    end
    object IB_OSTATOK_DETALI_VIDRABOTNEW_OSTATOK: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NEW_OSTATOK'
      Calculated = True
    end
  end
  object DS_OSTATOK_DETALI_VIDRABOT: TDataSource
    DataSet = IB_OSTATOK_DETALI_VIDRABOT
    Left = 88
    Top = 664
  end
  object DS_Pilomat_detali_furn: TDataSource
    DataSet = IB_Pilomat_detali_furn
    Left = 128
    Top = 504
  end
  object IB_Pilomat_detali_furn: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnNewRecord = IB_Pilomat_detali_furnNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PILOMAT_DETALI_FURN'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PILOMAT_DETALI_FURN'
      '  (ID, ID_DETALI, ID_FURNITURA, ID_VID_RABOT, KOL_VO)'
      'values'
      '  (:ID, :ID_DETALI, :ID_FURNITURA, :ID_VID_RABOT, :KOL_VO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_DETALI,'
      '  ID_FURNITURA,'
      '  KOL_VO,'
      '  ID_VID_RABOT'
      'from PILOMAT_DETALI_FURN '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from PILOMAT_DETALI_FURN'
      'where id_detali=:ID')
    ModifySQL.Strings = (
      'update PILOMAT_DETALI_FURN'
      'set'
      '  ID = :ID,'
      '  ID_DETALI = :ID_DETALI,'
      '  ID_FURNITURA = :ID_FURNITURA,'
      '  ID_VID_RABOT = :ID_VID_RABOT,'
      '  KOL_VO = :KOL_VO'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PILOMAT_DETALI_FURN_ID'
    DataSource = DS_Pilomat_detali
    Left = 48
    Top = 504
    object IB_Pilomat_detali_furnID: TIntegerField
      FieldName = 'ID'
      Origin = '"PILOMAT_DETALI_FURN"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IB_Pilomat_detali_furnID_DETALI: TIntegerField
      FieldName = 'ID_DETALI'
      Origin = '"PILOMAT_DETALI_FURN"."ID_DETALI"'
    end
    object IB_Pilomat_detali_furnID_FURNITURA: TIntegerField
      FieldName = 'ID_FURNITURA'
      Origin = '"PILOMAT_DETALI_FURN"."ID_FURNITURA"'
    end
    object IB_Pilomat_detali_furnKOL_VO: TIBBCDField
      FieldName = 'KOL_VO'
      Origin = '"PILOMAT_DETALI_FURN"."KOL_VO"'
      Precision = 9
      Size = 3
    end
    object IB_Pilomat_detali_furnFurnitura_name: TStringField
      FieldKind = fkLookup
      FieldName = 'FURNITURA_NAME'
      LookupDataSet = IB_Furnitura
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_FURNITURA'
      Size = 50
      Lookup = True
    end
    object IB_Pilomat_detali_furnID_VID_RABOT: TIntegerField
      FieldName = 'ID_VID_RABOT'
      Origin = '"PILOMAT_DETALI_FURN"."ID_VID_RABOT"'
    end
    object IB_Pilomat_detali_furnVID_RABOT_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'VID_RABOT_NAME'
      LookupDataSet = IB_Vidy_rabot
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_VID_RABOT'
      Size = 50
      Lookup = True
    end
  end
  object IB_Pilomat_listy: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    BeforePost = IB_Pilomat_listyBeforePost
    OnDeleteError = IB_Pilomat_listyDeleteError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PILOMAT_listy'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PILOMAT_listy'
      '  (ID, ID_GRUPA, RAZMER_X, RAZMER_Y, NAME, AREA, ISLIST)'
      'values'
      '  (:ID, :ID_GRUPA, :RAZMER_X, :RAZMER_Y, :NAME, :AREA, :ISLIST)')
    RefreshSQL.Strings = (
      'Select * from PILOMAT_listy '
      'where   ID = :ID')
    SelectSQL.Strings = (
      'select * from PILOMAT_listy'
      ''
      'order by name')
    ModifySQL.Strings = (
      'update PILOMAT_listy'
      'set'
      '  ID = :ID,'
      '  ID_GRUPA = :ID_GRUPA,'
      '  RAZMER_X = :RAZMER_X,'
      '  RAZMER_Y = :RAZMER_Y,'
      '  NAME = :NAME,'
      '  AREA = :AREA,'
      '  ISLIST = :ISLIST'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PILOMAT_LISTY_ID'
    DataSource = DS_Pilomat_grupa
    Left = 48
    Top = 408
    object IB_Pilomat_listyID: TIntegerField
      FieldName = 'ID'
      Origin = 'PILOMAT_LISTY.ID'
    end
    object IB_Pilomat_listyID_GRUPA: TIntegerField
      FieldName = 'ID_GRUPA'
      Origin = 'PILOMAT_LISTY.ID_GRUPA'
    end
    object IB_Pilomat_listyRAZMER_X: TIntegerField
      FieldName = 'RAZMER_X'
      Origin = 'PILOMAT_LISTY.RAZMER_X'
    end
    object IB_Pilomat_listyRAZMER_Y: TIntegerField
      FieldName = 'RAZMER_Y'
      Origin = 'PILOMAT_LISTY.RAZMER_Y'
    end
    object IB_Pilomat_listyAREA: TIntegerField
      FieldName = 'AREA'
      Origin = 'PILOMAT_LISTY.AREA'
    end
    object IB_Pilomat_listyISLIST: TSmallintField
      FieldName = 'ISLIST'
      Origin = 'PILOMAT_LISTY.ISLIST'
    end
    object IB_Pilomat_listyNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'PILOMAT_LISTY.NAME'
      Required = True
      Size = 100
    end
  end
  object IB_GOTOV_PROD_CATEGORIES: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from GOTOV_PROD_CATEGORIES'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into GOTOV_PROD_CATEGORIES'
      '  (ID, NAME)'
      'values'
      '  (:ID, :NAME)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  NAME'
      'from GOTOV_PROD_CATEGORIES '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *   from  GOTOV_PROD_CATEGORIES'
      'order by name')
    ModifySQL.Strings = (
      'update GOTOV_PROD_CATEGORIES'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PILOMAT_GRUPA_ID'
    Left = 240
    Top = 80
  end
  object DS_GOTOV_PROD_CATEGORIES: TDataSource
    DataSet = IB_GOTOV_PROD_CATEGORIES
    Left = 296
    Top = 80
  end
  object IB_Contragenty_0: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from contragenty_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into contragenty_0'
      '  (ID, NAME)'
      'values'
      '  (:ID, :NAME)')
    RefreshSQL.Strings = (
      'Select *'
      'from contragenty_0 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *  from contragenty_0'
      'order by NAME')
    ModifySQL.Strings = (
      'update contragenty_0'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_CONTRAGENTY_0_ID'
    Left = 248
    Top = 648
  end
  object DS_Contragenty_0: TDataSource
    AutoEdit = False
    DataSet = IB_Contragenty_0
    Left = 328
    Top = 648
  end
  object DS_Contragenty_1: TDataSource
    DataSet = IB_Contragenty_1
    Left = 328
    Top = 696
  end
  object IB_Contragenty_1: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnNewRecord = IB_Contragenty_1NewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from contragenty_1'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into contragenty_1'
      '  (ID, ID_PARENT, NAME)'
      'values'
      '  (:ID, :ID_PARENT, :NAME)')
    RefreshSQL.Strings = (
      'Select *'
      'from contragenty_1 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *  from contragenty_1'
      ''
      'order by NAME')
    ModifySQL.Strings = (
      'update contragenty_1'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  NAME = :NAME'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_CONTRAGENTY_1_ID'
    DataSource = DS_Contragenty_0
    Left = 248
    Top = 696
    object IB_Contragenty_1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'CONTRAGENTY_1.ID'
      Required = True
    end
    object IB_Contragenty_1ID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'CONTRAGENTY_1.ID_PARENT'
    end
    object IB_Contragenty_1NAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'CONTRAGENTY_1.NAME'
      Required = True
      Size = 50
    end
  end
  object IB_GOTOV_PROD_grupa_name: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    RefreshSQL.Strings = (
      'Select id,name'
      'from GOTOV_PROD_grupa '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select id, name from GOTOV_PROD_grupa'
      'order by name')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_GOTOV_PROD_GRUPA_ID'
    Left = 440
    Top = 360
  end
  object IB_GOTOV_PROD_VIDRABOT: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnNewRecord = IB_GOTOV_PROD_VIDRABOTNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from GOTOV_PROD_VIDRABOT'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into GOTOV_PROD_VIDRABOT'
      '  (ID, ID_GOTOV_PROD, ID_VID_RABOT)'
      'values'
      '  (:ID, :ID_GOTOV_PROD, :ID_VID_RABOT)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_GOTOV_PROD,'
      '  ID_VID_RABOT'
      'from GOTOV_PROD_VIDRABOT '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * FROM GOTOV_PROD_VIDRABOT'
      'where  id_gotov_prod=:ID'
      'order by id_vid_rabot')
    ModifySQL.Strings = (
      'update GOTOV_PROD_VIDRABOT'
      'set'
      '  ID = :ID,'
      '  ID_GOTOV_PROD = :ID_GOTOV_PROD,'
      '  ID_VID_RABOT = :ID_VID_RABOT'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_GOTOV_PROD_VIDRABOT_ID'
    DataSource = DS_Gotov_prod_0
    Left = 232
    Top = 504
    object IB_GOTOV_PROD_VIDRABOTID: TIntegerField
      FieldName = 'ID'
      Origin = 'GOTOV_PROD_VIDRABOT.ID'
      Required = True
    end
    object IB_GOTOV_PROD_VIDRABOTID_GOTOV_PROD: TIntegerField
      FieldName = 'ID_GOTOV_PROD'
      Origin = 'GOTOV_PROD_VIDRABOT.ID_GOTOV_PROD'
      Required = True
    end
    object IB_GOTOV_PROD_VIDRABOTID_VID_RABOT: TIntegerField
      FieldName = 'ID_VID_RABOT'
      Origin = 'GOTOV_PROD_VIDRABOT.ID_VID_RABOT'
      Required = True
    end
    object IB_GOTOV_PROD_VIDRABOTVid_rabot: TStringField
      FieldKind = fkLookup
      FieldName = 'Vid_rabot'
      LookupDataSet = IB_Vidy_rabot
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_VID_RABOT'
      Size = 50
      Lookup = True
    end
  end
  object DS_GOTOV_PROD_VIDRABOT: TDataSource
    DataSet = IB_GOTOV_PROD_VIDRABOT
    Left = 312
    Top = 504
  end
  object IB_Furnitura_vidrabot: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    OnNewRecord = IB_FurnituraNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from FURNITURA_VIDRABOT'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into FURNITURA_VIDRABOT'
      '  (ID, ID_FURNITURA, ID_VID_RABOT)'
      'values'
      '  (:ID, :ID_FURNITURA, :ID_VID_RABOT)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_FURNITURA,'
      '  ID_VID_RABOT'
      'from FURNITURA_VIDRABOT '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *   from FURNITURA_VIDRABOT'
      'where id_furnitura=:id'
      'order by id_vid_rabot')
    ModifySQL.Strings = (
      'update FURNITURA_VIDRABOT'
      'set'
      '  ID = :ID,'
      '  ID_FURNITURA = :ID_FURNITURA,'
      '  ID_VID_RABOT = :ID_VID_RABOT'
      'where'
      '  ID = :OLD_ID')
    DataSource = DS_Furnitura
    Left = 232
    Top = 260
    object IB_Furnitura_vidrabotID: TIntegerField
      FieldName = 'ID'
      Origin = 'FURNITURA_VIDRABOT.ID'
      Required = True
    end
    object IB_Furnitura_vidrabotID_FURNITURA: TIntegerField
      FieldName = 'ID_FURNITURA'
      Origin = 'FURNITURA_VIDRABOT.ID_FURNITURA'
      Required = True
    end
    object IB_Furnitura_vidrabotID_VID_RABOT: TIntegerField
      FieldName = 'ID_VID_RABOT'
      Origin = 'FURNITURA_VIDRABOT.ID_VID_RABOT'
      Required = True
    end
    object IB_Furnitura_vidrabotVIDRABOT_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'VIDRABOT_NAME'
      LookupDataSet = IB_Vidy_rabot
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_VID_RABOT'
      Size = 50
      Lookup = True
    end
  end
  object DS_Furnitura_vidrabot: TDataSource
    DataSet = IB_Furnitura_vidrabot
    Left = 320
    Top = 260
  end
  object IB_Constanty: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from constanty'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into constanty'
      '  (ID, NAME, VALUE_CONST, DESCRIPTION)'
      'values'
      '  (:ID, :NAME, :VALUE_CONST, :DESCRIPTION)')
    RefreshSQL.Strings = (
      'Select *'
      'from constanty '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from constanty'
      'order by ID')
    ModifySQL.Strings = (
      'update constanty'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME,'
      '  VALUE_CONST = :VALUE_CONST,'
      '  DESCRIPTION = :DESCRIPTION'
      'where'
      '  ID = :OLD_ID')
    Left = 48
    Top = 560
  end
  object DS_Constanty: TDataSource
    DataSet = IB_Constanty
    Left = 120
    Top = 560
  end
  object DS_Statyi_Rashoda: TDataSource
    DataSet = IB_Statyi_Rashoda
    Left = 1016
    Top = 344
  end
  object IB_Statyi_Rashoda: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnDeleteError = IB_Spisanie_0DeleteError
    OnPostError = IB_Spisanie_0PostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from SPISANIE_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into SPISANIE_0'
      '  (DATE_SPIS, ID, ID_SKLAD, PRIMECHANIE)'
      'values'
      '  (:DATE_SPIS, :ID, :ID_SKLAD, :PRIMECHANIE)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  DATE_SPIS,'
      '  ID_SKLAD,'
      '  PRIMECHANIE'
      'from SPISANIE_0 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from statyi_rashoda'
      'where id_parent is not null'
      'order by name')
    ModifySQL.Strings = (
      'update SPISANIE_0'
      'set'
      '  DATE_SPIS = :DATE_SPIS,'
      '  ID = :ID,'
      '  ID_SKLAD = :ID_SKLAD,'
      '  PRIMECHANIE = :PRIMECHANIE'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_STATYI_RASHODA_ID'
    Left = 928
    Top = 344
  end
  object IB_Statyi_Dohoda: TIBDataSet
    Database = DB_Mebeli
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnDeleteError = IB_Spisanie_0DeleteError
    OnPostError = IB_Spisanie_0PostError
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from statyi_dohoda'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into statyi_dohoda'
      '  (ID, ID_PARENT, NAME, IS_DOHOD)'
      'values'
      '  (:ID, :ID_PARENT, :NAME, :IS_DOHOD)')
    RefreshSQL.Strings = (
      'Select *'
      'from statyi_dohoda '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from statyi_dohoda'
      'where id_parent is not null'
      'order by name')
    ModifySQL.Strings = (
      'update statyi_dohoda'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  NAME = :NAME,'
      '  IS_DOHOD = :IS_DOHOD'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_STATYI_DOHODA_ID'
    Left = 928
    Top = 392
  end
  object DS_Statyi_Dohoda: TDataSource
    DataSet = IB_Statyi_Dohoda
    Left = 1016
    Top = 392
  end
  object DB_Images: TIBDatabase
    Connected = True
    DatabaseName = 'D:\'#1052#1086#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1099'\'#1055#1056#1054#1043#1056#1040#1052#1052#1067'\'#1052#1077#1073#1077#1083#1100' '#1089#1082#1083#1072#1076'\mebeli\MEBELI_images.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=miscacosolapii'
      'sql_role_name=admin'
      '')
    LoginPrompt = False
    DefaultTransaction = Transaction_Images
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    AllowStreamedConnected = False
    Left = 168
    Top = 16
  end
  object Transaction_Images: TIBTransaction
    Active = True
    DefaultDatabase = DB_Images
    DefaultAction = TARollbackRetaining
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 224
    Top = 16
  end
end
