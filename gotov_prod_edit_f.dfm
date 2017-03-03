object F_Gotov_prod_edit: TF_Gotov_prod_edit
  Left = 0
  Top = 0
  AutoScroll = False
  Caption = #1043#1086#1090#1086#1074#1072#1103' '#1087#1088#1086#1076#1091#1082#1094#1080#1103
  ClientHeight = 702
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PrintScale = poPrintToFit
  Scaled = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 0
    Top = 10
    Width = 89
    Height = 18
    Caption = #1044#1072#1090#1072' '#1085#1086#1088#1084#1099
  end
  object Label2: TLabel
    Left = 248
    Top = 10
    Width = 70
    Height = 18
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 808
    Top = 10
    Width = 75
    Height = 18
    Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
  end
  object DBGR_FURNITURA: TDBGrid
    Left = 1
    Top = 262
    Width = 1169
    Height = 237
    DataSource = DS_Gotov_Prod_2
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    OnEditButtonClick = DBGR_FURNITURAEditButtonClick
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'ID_FURNITURA'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'FURNITURA_GRUPA'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 289
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'FURNITURA_NAME'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1052#1055#1051#1045#1050#1058#1059#1070#1065#1048#1045
        Width = 367
        Visible = True
      end
      item
        Alignment = taCenter
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'ED_IZM'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1045#1044'.'#1048#1047#1052'.'
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 166
        Visible = True
      end>
  end
  object DBGR_DETALI: TDBGrid
    Left = 1
    Top = 40
    Width = 1169
    Height = 217
    DataSource = DS_Gotov_prod_1
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    OnEditButtonClick = DBGR_DETALIEditButtonClick
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'ID_DETALI'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'DETALI_GRUPA'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 303
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'DETALI_NAME'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1044#1045#1058#1040#1051#1048
        Width = 393
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 127
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 1
    Top = 655
    Width = 1169
    Height = 45
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 6
    object B_Exit: TButton
      Left = 1064
      Top = 6
      Width = 97
      Height = 33
      BiDiMode = bdLeftToRight
      Caption = '&'#1054#1090#1084#1077#1085#1072
      ModalResult = 2
      ParentBiDiMode = False
      TabOrder = 0
      OnClick = B_ExitClick
    end
    object B_Ok: TButton
      Left = 960
      Top = 6
      Width = 97
      Height = 33
      Caption = '&'#1047#1072#1087#1080#1089#1072#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 1
      OnClick = B_OkClick
    end
  end
  object DBG_Vid_rabot: TDBGrid
    Left = 1
    Top = 503
    Width = 1169
    Height = 152
    DataSource = DS_GOTOV_PROD_VIDRABOT
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Narrow'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 5
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_VID_RABOT'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1101#1090#1072#1087#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vid_rabot'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1069#1090#1072#1087#1099' '#1088#1072#1073#1086#1090
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 424
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CATEGORY_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
        Width = 266
        Visible = True
      end>
  end
  object DBE_Data: TDBEdit
    Left = 96
    Top = 6
    Width = 145
    Height = 26
    DataField = 'DATE_NOR'
    DataSource = F_Gotov_prod_normy.DS_Gotovprod_normy
    TabOrder = 0
  end
  object DBE_Descr: TDBEdit
    Left = 320
    Top = 6
    Width = 481
    Height = 26
    DataField = 'DESCRIPTION'
    DataSource = F_Gotov_prod_normy.DS_Gotovprod_normy
    TabOrder = 1
  end
  object DBL_Category: TDBLookupComboBox
    Left = 888
    Top = 8
    Width = 273
    Height = 26
    DataField = 'CATEGORY_NAME'
    DataSource = DS_GOTOV_PROD_CATEGORIES_NORMY
    TabOrder = 2
  end
  object IB_Gotov_prod_1: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    OnNewRecord = IB_Gotov_prod_1NewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from GOTOV_PROD_1'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into GOTOV_PROD_1'
      '  (ID_DETALI, KOL_VO, ID_NORMA)'
      'values'
      '  (:ID_DETALI, :KOL_VO, :ID_NORMA)')
    RefreshSQL.Strings = (
      
        'select gp1.id_parent id_parent, gp1.id id, pd.id id_detali, pg.n' +
        'ame detali_grupa, '
      'pd.name detali_name, gp1.kol_vo kol_vo, gp1.id_norma'
      'from gotov_prod_1 gp1, pilomat_detali pd, pilomat_grupa pg'
      
        'where (gp1.id_detali=pd.id) and (pg.id=pd.id_grupa) and (gp1.id=' +
        ':id)'
      'order by pg.name, pd.name'
      '')
    SelectSQL.Strings = (
      
        'select gp1.id_parent id_parent, gp1.id id, pd.id id_detali, pg.n' +
        'ame detali_grupa, pd.name detali_name, gp1.kol_vo kol_vo, gp1.id' +
        '_norma'
      'from gotov_prod_1 gp1, pilomat_detali pd, pilomat_grupa pg'
      
        'where (gp1.id_detali=pd.id) and (pg.id=pd.id_grupa) and (gp1.id_' +
        'norma=:id)'
      'order by pg.name, pd.name')
    ModifySQL.Strings = (
      'update GOTOV_PROD_1'
      'set'
      '  ID_DETALI = :ID_DETALI,'
      '  KOL_VO = :KOL_VO,'
      '  ID_NORMA = :ID_NORMA'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_GOTOV_PROD_1_ID'
    DataSource = F_Gotov_prod_normy.DS_Gotovprod_normy
    Left = 920
    Top = 176
    object IB_Gotov_prod_1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PILOMAT_DETALI.ID'
    end
    object IB_Gotov_prod_1DETALI_GRUPA: TIBStringField
      FieldName = 'DETALI_GRUPA'
      Origin = 'PILOMAT_GRUPA.NAME'
      Size = 60
    end
    object IB_Gotov_prod_1DETALI_NAME: TIBStringField
      FieldName = 'DETALI_NAME'
      Origin = 'PILOMAT_DETALI.NAME'
      Size = 50
    end
    object IB_Gotov_prod_1KOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'GOTOV_PROD_1.KOL_VO'
      Required = True
    end
    object IB_Gotov_prod_1ID_DETALI: TIntegerField
      FieldName = 'ID_DETALI'
      Origin = 'PILOMAT_DETALI.ID'
      Required = True
    end
    object IB_Gotov_prod_1ID_NORMA: TIntegerField
      FieldName = 'ID_NORMA'
      Origin = 'GOTOV_PROD_1.ID_NORMA'
    end
  end
  object DS_Gotov_prod_1: TDataSource
    DataSet = IB_Gotov_prod_1
    Left = 960
    Top = 176
  end
  object IB_Gotov_prod_2: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    OnNewRecord = IB_Gotov_prod_2NewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from GOTOV_PROD_2'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into GOTOV_PROD_2'
      '  (ID_FURNITURA, KOL_VO, ID_NORMA)'
      'values'
      '  (:ID_FURNITURA, :KOL_VO, :ID_NORMA)')
    RefreshSQL.Strings = (
      
        ' select gp2.id_parent id_parent, gp2.id id, f.id id_furnitura, f' +
        'g.name furnitura_grupa, '
      
        'f.name furnitura_name, f.ed_izm ed_izm, gp2.kol_vo kol_vo, gp2.i' +
        'd_norma'
      'from gotov_prod_2 gp2, furnitura f, furnitura_grupa fg'
      
        'where (gp2.id_furnitura=f.id) and (fg.id=f.id_parent) and (gp2.i' +
        'd=:id)'
      'order by fg.name, f.name')
    SelectSQL.Strings = (
      
        ' select gp2.id_parent id_parent, gp2.id id, f.id id_furnitura, f' +
        'g.name furnitura_grupa, f.name furnitura_name, f.ed_izm ed_izm, ' +
        'gp2.kol_vo kol_vo, gp2.id_norma'
      'from gotov_prod_2 gp2, furnitura f, furnitura_grupa fg'
      
        'where (gp2.id_furnitura=f.id) and (fg.id=f.id_parent) and (gp2.i' +
        'd_norma=:id)'
      'order by fg.name, f.name')
    ModifySQL.Strings = (
      'update GOTOV_PROD_2'
      'set'
      '  ID_FURNITURA = :ID_FURNITURA,'
      '  KOL_VO = :KOL_VO,'
      '  ID_NORMA = :ID_NORMA'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_GOTOV_PROD_2_ID'
    DataSource = F_Gotov_prod_normy.DS_Gotovprod_normy
    Left = 920
    Top = 432
    object IB_Gotov_prod_2ID: TIntegerField
      FieldName = 'ID'
      Origin = 'GOTOV_PROD_2.ID'
    end
    object IB_Gotov_prod_2ID_FURNITURA: TIntegerField
      FieldName = 'ID_FURNITURA'
      Origin = 'FURNITURA.ID'
    end
    object IB_Gotov_prod_2FURNITURA_GRUPA: TIBStringField
      FieldName = 'FURNITURA_GRUPA'
      Origin = 'FURNITURA_GRUPA.NAME'
      Size = 50
    end
    object IB_Gotov_prod_2FURNITURA_NAME: TIBStringField
      FieldName = 'FURNITURA_NAME'
      Origin = 'FURNITURA.NAME'
      Size = 50
    end
    object IB_Gotov_prod_2KOL_VO: TIBBCDField
      FieldName = 'KOL_VO'
      Origin = 'GOTOV_PROD_2.KOL_VO'
      Required = True
      Precision = 9
      Size = 3
    end
    object IB_Gotov_prod_2ED_IZM: TIBStringField
      FieldName = 'ED_IZM'
      Origin = 'FURNITURA.ED_IZM'
      Size = 8
    end
    object IB_Gotov_prod_2ID_NORMA: TIntegerField
      FieldName = 'ID_NORMA'
      Origin = 'GOTOV_PROD_2.ID_NORMA'
    end
  end
  object DS_Gotov_Prod_2: TDataSource
    DataSet = IB_Gotov_prod_2
    Left = 960
    Top = 432
  end
  object DS_GOTOV_PROD_VIDRABOT: TDataSource
    DataSet = IB_GOTOV_PROD_VIDRABOT
    Left = 1000
    Top = 544
  end
  object IB_GOTOV_PROD_VIDRABOT: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
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
      '  (ID, ID_GOTOV_PROD, ID_VID_RABOT, ID_NORMA, ID_CATEGORY)'
      'values'
      '  (:ID, :ID_GOTOV_PROD, :ID_VID_RABOT, :ID_NORMA, :ID_CATEGORY)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_GOTOV_PROD,'
      '  ID_VID_RABOT,'
      '  ID_NORMA,'
      '  ID_CATEGORY'
      'from GOTOV_PROD_VIDRABOT '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * FROM GOTOV_PROD_VIDRABOT'
      'where  id_norma=:ID'
      'order by id_vid_rabot')
    ModifySQL.Strings = (
      'update GOTOV_PROD_VIDRABOT'
      'set'
      '  ID = :ID,'
      '  ID_GOTOV_PROD = :ID_GOTOV_PROD,'
      '  ID_VID_RABOT = :ID_VID_RABOT,'
      '  ID_NORMA = :ID_NORMA,'
      '  ID_CATEGORY = :ID_CATEGORY'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_GOTOV_PROD_VIDRABOT_ID'
    DataSource = F_Gotov_prod_normy.DS_Gotovprod_normy
    Left = 920
    Top = 544
    object IB_GOTOV_PROD_VIDRABOTID: TIntegerField
      FieldName = 'ID'
      Origin = 'GOTOV_PROD_VIDRABOT.ID'
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
      LookupDataSet = DM_Mebeli.IB_Vidy_rabot
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_VID_RABOT'
      Size = 50
      Lookup = True
    end
    object IB_GOTOV_PROD_VIDRABOTID_NORMA: TIntegerField
      FieldName = 'ID_NORMA'
      Origin = 'GOTOV_PROD_VIDRABOT.ID_NORMA'
      Required = True
    end
    object IB_GOTOV_PROD_VIDRABOTID_GOTOV_PROD: TIntegerField
      FieldName = 'ID_GOTOV_PROD'
      Origin = 'GOTOV_PROD_VIDRABOT.ID_GOTOV_PROD'
    end
    object IB_GOTOV_PROD_VIDRABOTID_CATEGORY: TIntegerField
      FieldName = 'ID_CATEGORY'
      Origin = 'GOTOV_PROD_VIDRABOT.ID_CATEGORY'
    end
    object IB_GOTOV_PROD_VIDRABOTCATEGORY_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'CATEGORY_NAME'
      LookupDataSet = DM_Mebeli.IB_GOTOV_PROD_CATEGORIES
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_CATEGORY'
      Size = 200
      Lookup = True
    end
  end
  object IB_GOTOV_PROD_CATEGORIES_NORMY: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    OnNewRecord = IB_GOTOV_PROD_CATEGORIES_NORMYNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from GOTOV_PROD_CATEGORIES_NORMY'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into GOTOV_PROD_CATEGORIES_NORMY'
      '  (ID, ID_NORMA, ID_CATEGORY)'
      'values'
      '  (:ID, :ID_NORMA, :ID_CATEGORY)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_NORMA,'
      '  ID_CATEGORY'
      'from GOTOV_PROD_CATEGORIES_NORMY '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from GOTOV_PROD_CATEGORIES_NORMY'
      'where id_norma=:id')
    ModifySQL.Strings = (
      'update GOTOV_PROD_CATEGORIES_NORMY'
      'set'
      '  ID = :ID,'
      '  ID_NORMA = :ID_NORMA,'
      '  ID_CATEGORY = :ID_CATEGORY'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_GOTOV_PROD_CATEGORIES_NORMY'
    DataSource = F_Gotov_prod_normy.DS_Gotovprod_normy
    Left = 1016
    Top = 48
    object IB_GOTOV_PROD_CATEGORIES_NORMYID: TIntegerField
      FieldName = 'ID'
      Origin = 'GOTOV_PROD_CATEGORIES_NORMY.ID'
      Required = True
    end
    object IB_GOTOV_PROD_CATEGORIES_NORMYID_NORMA: TIntegerField
      FieldName = 'ID_NORMA'
      Origin = 'GOTOV_PROD_CATEGORIES_NORMY.ID_NORMA'
      Required = True
    end
    object IB_GOTOV_PROD_CATEGORIES_NORMYID_CATEGORY: TIntegerField
      FieldName = 'ID_CATEGORY'
      Origin = 'GOTOV_PROD_CATEGORIES_NORMY.ID_CATEGORY'
    end
    object IB_GOTOV_PROD_CATEGORIES_NORMYCATEGORY_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'CATEGORY_NAME'
      LookupDataSet = DM_Mebeli.IB_GOTOV_PROD_CATEGORIES
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_CATEGORY'
      Size = 100
      Lookup = True
    end
  end
  object DS_GOTOV_PROD_CATEGORIES_NORMY: TDataSource
    DataSet = IB_GOTOV_PROD_CATEGORIES_NORMY
    Left = 1056
    Top = 48
  end
end
