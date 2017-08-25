object F_Gotov_prod_normy: TF_Gotov_prod_normy
  Left = 0
  Top = 97
  AutoScroll = False
  Caption = #1053#1086#1088#1084#1099' '#1075#1086#1090#1086#1074#1086#1081' '#1087#1088#1086#1076#1091#1082#1094#1080#1080
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
  Scaled = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Label3: TLabel
    Left = 138
    Top = 7
    Width = 50
    Height = 18
    Caption = #1043#1088#1091#1087#1087#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 455
    Top = 7
    Width = 114
    Height = 18
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = -1
    Top = 8
    Width = 28
    Height = 17
    Caption = #1040#1088#1090':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 1014
    Top = 5
    Width = 50
    Height = 17
    Caption = #1042#1077#1089', '#1082#1075':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 449
    Top = 34
    Width = 121
    Height = 18
    Caption = #1053#1086#1088#1084#1099' '#1074#1079#1103#1090#1100' '#1080#1079':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object B_Linked_clear: TSpeedButton
    Left = 978
    Top = 30
    Width = 27
    Height = 26
    Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1057#1086#1090#1088#1091#1076#1085#1080#1082
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333333333333333333FFF33FF333FFF339993370733
      999333777FF37FF377733339993000399933333777F777F77733333399970799
      93333333777F7377733333333999399933333333377737773333333333990993
      3333333333737F73333333333331013333333333333777FF3333333333910193
      333333333337773FF3333333399000993333333337377737FF33333399900099
      93333333773777377FF333399930003999333337773777F777FF339993370733
      9993337773337333777333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    OnClick = B_Linked_clearClick
  end
  object Label6: TLabel
    Left = 7
    Top = 32
    Width = 14
    Height = 17
    Caption = 'ID'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 636
    Width = 1170
    Height = 40
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 10
    object B_Cancel: TButton
      Left = 1061
      Top = 5
      Width = 94
      Height = 29
      Caption = #1054#1090#1084#1077#1085#1072
      Default = True
      ModalResult = 2
      TabOrder = 0
      OnClick = B_CancelClick
    end
    object B_Save: TButton
      Left = 957
      Top = 5
      Width = 94
      Height = 29
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      TabOrder = 1
      OnClick = B_SaveClick
    end
  end
  object DBGrid3: TDBGrid
    Left = 1
    Top = 535
    Width = 864
    Height = 97
    DataSource = DS_Gotov_prod_vidrabot
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 9
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1101#1090#1072#1087#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1069#1090#1072#1087#1099' '#1088#1072#1073#1086#1090
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 347
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CATEGORY_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
        Width = 279
        Visible = True
      end>
  end
  object DBGR_FURNITURA: TDBGrid
    Left = 1
    Top = 388
    Width = 864
    Height = 145
    DataSource = DS_Gotov_Prod_2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PM_ClipBoard
    ReadOnly = True
    TabOrder = 8
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'ID_FURNITURA'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'FURNITURA_GRUPA'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 289
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'FURNITURA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1052#1055#1051#1045#1050#1058#1059#1070#1065#1048#1045
        Width = 281
        Visible = True
      end
      item
        Alignment = taCenter
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'ED_IZM'
        Title.Alignment = taCenter
        Title.Caption = #1045#1044'.'#1048#1047#1052'.'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 91
        Visible = True
      end>
  end
  object DBGR_DETALI: TDBGrid
    Left = 1
    Top = 235
    Width = 864
    Height = 153
    DataSource = DS_Gotov_prod_1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    TabOrder = 7
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'ID_DETALI'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'DETALI_GRUPA'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 261
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'DETALI_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1044#1045#1058#1040#1051#1048
        Width = 347
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 127
        Visible = True
      end>
  end
  object DBGrid1: TDBGrid
    Left = 2
    Top = 57
    Width = 1168
    Height = 105
    DataSource = DS_Gotovprod_normy
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DATE_NOR'
        Title.Alignment = taCenter
        Title.Caption = #1044#1040#1058#1040' '#1053#1054#1056#1052#1067
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 184
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Alignment = taCenter
        Title.Caption = #1055#1056#1048#1052#1045#1063#1040#1053#1048#1045
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 790
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  object DBL_Grupa: TDBLookupComboBox
    Left = 192
    Top = 3
    Width = 257
    Height = 26
    DataField = 'GRUPA_NAME'
    DataSource = DS_Gotov_prod_0_E
    TabOrder = 1
  end
  object DBE_NAME: TDBEdit
    Left = 576
    Top = 3
    Width = 393
    Height = 26
    DataField = 'NAME'
    DataSource = DS_Gotov_prod_0_E
    TabOrder = 2
    OnExit = DBE_NAMEExit
  end
  object DBE_VES: TDBEdit
    Left = 1068
    Top = 0
    Width = 95
    Height = 26
    DataField = 'VES'
    DataSource = DS_Gotov_prod_0_E
    TabOrder = 3
  end
  object DBGrid2: TDBGrid
    Left = 1
    Top = 168
    Width = 1169
    Height = 60
    DataSource = DS_GOTOV_PROD_CATEGORIES_NORMY
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 6
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1050#1040#1058#1045#1043#1054#1056#1048#1071
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 477
        Visible = True
      end>
  end
  object DBL_Linked_gotovprod: TDBLookupComboBox
    Left = 576
    Top = 30
    Width = 393
    Height = 26
    DataField = 'LINKED_GOTOVPROD'
    DataSource = DS_Gotov_prod_0_E
    TabOrder = 4
    TabStop = False
  end
  object DBE_Article: TDBEdit
    Left = 35
    Top = 3
    Width = 95
    Height = 26
    DataField = 'ARTICLE'
    DataSource = DS_Gotov_prod_0_E
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 35
    Top = 29
    Width = 95
    Height = 26
    TabStop = False
    DataField = 'ID'
    DataSource = DS_Gotov_prod_0_E
    ReadOnly = True
    TabOrder = 11
  end
  object Panel2: TPanel
    Left = 866
    Top = 232
    Width = 315
    Height = 404
    BevelInner = bvSpace
    BevelOuter = bvLowered
    Caption = #1060#1086#1090#1086' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
    TabOrder = 12
    object Gotovprod_image: TImage
      Left = 4
      Top = 30
      Width = 305
      Height = 329
      Center = True
      PopupMenu = M_Image
      Proportional = True
      Stretch = True
    end
  end
  object IB_Gotov_prod_1: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from GOTOV_PROD_1'
      'where'
      '  ID = :OLD_ID')
    RefreshSQL.Strings = (
      
        'select gp1.id_parent id_parent, gp1.id id, pd.id id_detali, pg.n' +
        'ame detali_grupa, '
      'pd.name detali_name, gp1.kol_vo kol_vo'
      'from gotov_prod_1 gp1, pilomat_detali pd, pilomat_grupa pg'
      
        'where (gp1.id_detali=pd.id) and (pg.id=pd.id_grupa) and (gp1.id=' +
        ':id)')
    SelectSQL.Strings = (
      
        'select gp1.id id, pd.id id_detali, pg.name detali_grupa, pd.name' +
        ' detali_name, gp1.kol_vo kol_vo'
      'from gotov_prod_1 gp1, pilomat_detali pd, pilomat_grupa pg'
      
        'where (gp1.id_detali=pd.id) and (pg.id=pd.id_grupa) and (gp1.id_' +
        'norma=:id)'
      'order by pg.name, pd.name')
    ModifySQL.Strings = (
      '')
    DataSource = DS_Gotovprod_normy
    Left = 752
    Top = 288
    object IB_Gotov_prod_1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PILOMAT_DETALI.ID'
    end
    object IB_Gotov_prod_1DETALI_GRUPA: TIBStringField
      FieldName = 'DETALI_GRUPA'
      Origin = 'PILOMAT_GRUPA.NAME'
      Size = 100
    end
    object IB_Gotov_prod_1DETALI_NAME: TIBStringField
      FieldName = 'DETALI_NAME'
      Origin = 'PILOMAT_DETALI.NAME'
      Size = 100
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
  end
  object DS_Gotov_prod_1: TDataSource
    AutoEdit = False
    DataSet = IB_Gotov_prod_1
    Left = 808
    Top = 288
  end
  object IB_Gotov_prod_2: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from GOTOV_PROD_2'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into GOTOV_PROD_2'
      '  (ID_PARENT, ID_FURNITURA, KOL_VO)'
      'values'
      '  (:ID_PARENT, :ID_FURNITURA, :KOL_VO)')
    RefreshSQL.Strings = (
      
        'select gp2.id_parent id_parent, gp2.id id, f.id id_furnitura, fg' +
        '.name furnitura_grupa, '
      'f.name furnitura_name, f.ed_izm ed_izm,  gp2.kol_vo kol_vo'
      'from gotov_prod_2 gp2, furnitura f, furnitura_grupa fg'
      
        'where (gp2.id_furnitura=f.id) and (fg.id=f.id_parent) and (gp2.i' +
        'd=:id)')
    SelectSQL.Strings = (
      
        ' select gp2.id id, f.id id_furnitura, fg.name furnitura_grupa, f' +
        '.name furnitura_name, f.ed_izm ed_izm, gp2.kol_vo kol_vo'
      'from gotov_prod_2 gp2, furnitura f, furnitura_grupa fg'
      
        'where (gp2.id_furnitura=f.id) and (fg.id=f.id_parent) and (gp2.i' +
        'd_norma=:id)'
      'order by fg.name, f.name')
    ModifySQL.Strings = (
      'update GOTOV_PROD_2'
      'set'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_FURNITURA = :ID_FURNITURA,'
      '  KOL_VO = :KOL_VO'
      'where'
      '  ID = :OLD_ID')
    DataSource = DS_Gotovprod_normy
    Left = 760
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
      Size = 100
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
  end
  object DS_Gotov_Prod_2: TDataSource
    AutoEdit = False
    DataSet = IB_Gotov_prod_2
    Left = 800
    Top = 432
  end
  object IB_Gotovprod_normy: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from gotovprod_normy'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into gotovprod_normy'
      '  (DATE_NOR, DESCRIPTION, ID_GOTOV_PROD)'
      'values'
      '  (:DATE_NOR, :DESCRIPTION, :ID_GOTOV_PROD)')
    RefreshSQL.Strings = (
      'Select *'
      'from gotovprod_normy '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from gotovprod_normy'
      'where id_gotov_prod=:id_gotov_prod'
      'order by date_nor desc ')
    ModifySQL.Strings = (
      'update gotovprod_normy'
      'set'
      '  DATE_NOR = :DATE_NOR,'
      '  DESCRIPTION = :DESCRIPTION,'
      '  ID_GOTOV_PROD = :ID_GOTOV_PROD'
      'where'
      '  ID = :OLD_ID')
    Left = 952
    Top = 72
  end
  object DS_Gotovprod_normy: TDataSource
    DataSet = IB_Gotovprod_normy
    Left = 1008
    Top = 72
  end
  object IB_Gotov_prod_vidrabot: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from GOTOV_PROD_2'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into GOTOV_PROD_2'
      '  (ID_PARENT, ID_FURNITURA, KOL_VO)'
      'values'
      '  (:ID_PARENT, :ID_FURNITURA, :KOL_VO)')
    RefreshSQL.Strings = (
      
        'select gp2.id_parent id_parent, gp2.id id, f.id id_furnitura, fg' +
        '.name furnitura_grupa, '
      'f.name furnitura_name, f.ed_izm ed_izm,  gp2.kol_vo kol_vo'
      'from gotov_prod_2 gp2, furnitura f, furnitura_grupa fg'
      
        'where (gp2.id_furnitura=f.id) and (fg.id=f.id_parent) and (gp2.i' +
        'd=:id)')
    SelectSQL.Strings = (
      'select vr.id, vr.name, gpc.name category_name'
      
        'from gotov_prod_vidrabot gpvr, vidy_rabot vr, gotov_prod_categor' +
        'ies gpc'
      
        'where (gpvr.id_vid_rabot=vr.id) and(gpvr.id_category=gpc.id) and' +
        ' (gpvr.id_norma=:id)'
      'order by vr.id')
    ModifySQL.Strings = (
      'update GOTOV_PROD_2'
      'set'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_FURNITURA = :ID_FURNITURA,'
      '  KOL_VO = :KOL_VO'
      'where'
      '  ID = :OLD_ID')
    DataSource = DS_Gotovprod_normy
    Left = 776
    Top = 560
    object IB_Gotov_prod_vidrabotID: TIntegerField
      FieldName = 'ID'
      Origin = 'VIDY_RABOT.ID'
      Required = True
    end
    object IB_Gotov_prod_vidrabotNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'VIDY_RABOT.NAME'
      Required = True
      Size = 50
    end
    object IB_Gotov_prod_vidrabotCATEGORY_NAME: TIBStringField
      FieldName = 'CATEGORY_NAME'
      Origin = 'GOTOV_PROD_CATEGORIES.NAME'
      Required = True
      Size = 50
    end
  end
  object DS_Gotov_prod_vidrabot: TDataSource
    AutoEdit = False
    DataSet = IB_Gotov_prod_vidrabot
    Left = 816
    Top = 560
  end
  object MainMenu1: TMainMenu
    OnChange = MainMenu1Change
    Left = 1088
    Top = 80
    object N1: TMenuItem
      Caption = #1053#1086#1088#1084#1099
      object N_Insert: TMenuItem
        Caption = #1053#1086#1074#1072#1103' '#1085#1086#1088#1084#1072
        OnClick = N_InsertClick
      end
      object N_Copy: TMenuItem
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1091#1097#1091#1102
        OnClick = N_CopyClick
      end
      object N_Edit: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1085#1086#1088#1084#1091
        OnClick = N_EditClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1085#1086#1088#1084#1091
        OnClick = N_DeleteClick
      end
    end
    object N2: TMenuItem
      Caption = #1055#1086#1076#1087#1080#1089#1080
      object N_Sign_Norma: TMenuItem
        Caption = #1055#1086#1076#1087#1080#1089#1072#1090#1100' '#1085#1086#1088#1084#1091
        OnClick = N_Sign_NormaClick
      end
      object N_UnSign_Norma: TMenuItem
        Caption = #1057#1085#1103#1090#1100' '#1087#1086#1076#1087#1080#1089#1100
        OnClick = N_UnSign_NormaClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object N_Who_Signed: TMenuItem
        Caption = #1050#1090#1086' '#1087#1086#1076#1087#1080#1089#1072#1083
        OnClick = N_Who_SignedClick
      end
      object N_Signs_Log: TMenuItem
        Caption = #1046#1091#1088#1085#1072#1083' '#1087#1086#1076#1087#1080#1089#1077#1081
        OnClick = N_Signs_LogClick
      end
    end
    object N5: TMenuItem
      Caption = #1054#1090#1095#1077#1090#1099
    end
    object N7: TMenuItem
      Caption = #1060#1086#1090#1086#1075#1088#1072#1092#1080#1103
      object N_Load_image: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1086#1090#1086#1075#1088#1072#1092#1080#1102
        OnClick = N_Load_imageClick
      end
      object N_Delete_image: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1092#1086#1090#1086#1075#1088#1072#1092#1080#1102
        OnClick = N_Delete_imageClick
      end
    end
  end
  object IB_GOTOV_PROD_CATEGORIES_NORMY: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from GOTOV_PROD_1'
      'where'
      '  ID = :OLD_ID')
    RefreshSQL.Strings = (
      
        'select gp1.id_parent id_parent, gp1.id id, pd.id id_detali, pg.n' +
        'ame detali_grupa, '
      'pd.name detali_name, gp1.kol_vo kol_vo'
      'from gotov_prod_1 gp1, pilomat_detali pd, pilomat_grupa pg'
      
        'where (gp1.id_detali=pd.id) and (pg.id=pd.id_grupa) and (gp1.id=' +
        ':id)')
    SelectSQL.Strings = (
      'select gpc.name'
      'from GOTOV_PROD_CATEGORIES_NORMY gpcn, GOTOV_PROD_CATEGORIES gpc'
      'where (gpcn.id_category=gpc.id) and (gpcn.id_norma=:id)')
    ModifySQL.Strings = (
      '')
    DataSource = DS_Gotovprod_normy
    Left = 952
    Top = 160
  end
  object DS_GOTOV_PROD_CATEGORIES_NORMY: TDataSource
    AutoEdit = False
    DataSet = IB_GOTOV_PROD_CATEGORIES_NORMY
    Left = 1008
    Top = 160
  end
  object DS_Gotov_prod_0_E: TDataSource
    DataSet = IB_Gotov_prod_0_E
    Left = 416
    Top = 32
  end
  object IB_Gotov_prod_0_E: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BeforePost = IB_Gotov_prod_0_EBeforePost
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
      'where id=:id_gotov_prod'
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
    Left = 376
    Top = 32
    object IB_Gotov_prod_0_EID: TIntegerField
      FieldName = 'ID'
      Origin = '"GOTOV_PROD_0"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IB_Gotov_prod_0_ENAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"GOTOV_PROD_0"."NAME"'
      Size = 50
    end
    object IB_Gotov_prod_0_EID_GRUPA: TIntegerField
      FieldName = 'ID_GRUPA'
      Origin = '"GOTOV_PROD_0"."ID_GRUPA"'
      Required = True
    end
    object IB_Gotov_prod_0_EID_CATEGORY: TIntegerField
      FieldName = 'ID_CATEGORY'
      Origin = 'GOTOV_PROD_0.ID_CATEGORY'
    end
    object IB_Gotov_prod_0_ECATEGORY_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'CATEGORY_NAME'
      LookupDataSet = DM_Mebeli.IB_GOTOV_PROD_CATEGORIES
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_CATEGORY'
      Size = 50
      Lookup = True
    end
    object IB_Gotov_prod_0_EGRUPA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'GRUPA_NAME'
      LookupDataSet = DM_Mebeli.IB_Gotov_prod_grupa
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_GRUPA'
      Size = 50
      Lookup = True
    end
    object IB_Gotov_prod_0_EVES: TIBBCDField
      FieldName = 'VES'
      Origin = 'GOTOV_PROD_0.VES'
      Precision = 18
      Size = 3
    end
    object IB_Gotov_prod_0_EID_LINKED_GOTOVPROD: TIntegerField
      FieldName = 'ID_LINKED_GOTOVPROD'
      Origin = 'GOTOV_PROD_0.ID_LINKED_GOTOVPROD'
    end
    object IB_Gotov_prod_0_ELINKED_GOTOVPROD: TStringField
      FieldKind = fkLookup
      FieldName = 'LINKED_GOTOVPROD'
      LookupDataSet = DM_Mebeli.IB_Gotov_prod_0
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_LINKED_GOTOVPROD'
      Size = 200
      Lookup = True
    end
    object IB_Gotov_prod_0_EARTICLE: TIntegerField
      FieldName = 'ARTICLE'
      Origin = 'GOTOV_PROD_0.ARTICLE'
    end
  end
  object M_Image: TPopupMenu
    Left = 1128
    Top = 248
    object N_Load_image_popup: TMenuItem
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1086#1090#1086#1075#1088#1072#1092#1080#1102
      OnClick = N_Load_image_popupClick
    end
    object N_Delete_image_popup: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1092#1086#1090#1086#1075#1088#1072#1092#1080#1102
      OnClick = N_Delete_image_popupClick
    end
  end
  object IB_Image: TIBDataSet
    Database = DM_Mebeli.DB_Images
    Transaction = DM_Mebeli.Transaction_Images
    ForcedRefresh = True
    OnNewRecord = IB_ImageNewRecord
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
    Left = 888
    Top = 304
  end
  object DS_Image: TDataSource
    AutoEdit = False
    DataSet = IB_Image
    Left = 920
    Top = 304
  end
  object dlgOpenPicture: TOpenPictureDialog
    Filter = 'JPEG Image File (*.jpg)|*.jpg;*.jpeg'
    Options = [ofReadOnly, ofEnableSizing]
    Left = 992
    Top = 320
  end
  object PM_ClipBoard: TPopupMenu
    Left = 536
    Top = 448
    object N_CopyToClipboard: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = N_CopyToClipboardClick
    end
  end
end
