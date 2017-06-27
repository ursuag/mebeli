object F_Ostatok_detali: TF_Ostatok_detali
  Left = 11
  Top = 79
  AutoScroll = False
  Caption = #1054#1089#1090#1072#1090#1082#1080' '#1076#1077#1090#1072#1083#1077#1081' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1084#1077#1089#1103#1094#1072
  ClientHeight = 682
  ClientWidth = 1184
  Color = clBtnFace
  ParentFont = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1177
    Height = 297
    DataSource = DS_Prihod_detali_0_F
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
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = #8470
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_P'
        Title.Alignment = taCenter
        Title.Caption = #1044#1040#1058#1040
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SKLAD_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1057#1050#1051#1040#1044
        Width = 322
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIMECHANIE'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 526
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 304
    Width = 1177
    Height = 313
    DataSource = DS_Prihod_detali_1_F
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
        FieldName = 'ID_PILOMAT_DETALI'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETALI_GRUPA'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 351
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETALI_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1044#1045#1058#1040#1051#1048
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE_M2'
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072' '#1084'2'
        Width = 82
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 620
    Width = 1177
    Height = 57
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object B_Exit: TButton
      Left = 1064
      Top = 12
      Width = 97
      Height = 33
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 0
    end
    object B_Insert: TButton
      Left = 8
      Top = 12
      Width = 97
      Height = 33
      Hint = #1042#1089#1090#1072#1074#1083#1103#1077#1090' '#1101#1090#1072#1087' '#1087#1086#1089#1083#1077' '#1090#1077#1082#1091#1097#1077#1075#1086
      Caption = #1053#1086#1074#1099#1081
      TabOrder = 1
    end
    object B_Edit: TButton
      Left = 112
      Top = 12
      Width = 97
      Height = 33
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 2
    end
    object B_Delete: TButton
      Left = 216
      Top = 12
      Width = 97
      Height = 33
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 3
      OnClick = B_DeleteClick
    end
  end
  object IB_Prihod_detali_1_F: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PRIHOD_DETALI_1'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PRIHOD_DETALI_1'
      '  (SUMMA)'
      'values'
      '  (:SUMMA)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_PARENT,'
      '  ID_PILOMAT_DETALI,'
      '  KOL_VO,'
      '  SUMMA'
      'from PRIHOD_DETALI_1 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      
        'select pd1.id, pd1.kol_vo, pd1.summa, pg.name detali_grupa, deta' +
        'li.name detali_name, pd1.ID_PILOMAT_DETALI, cast(pd1.summa/pd1.k' +
        'ol_vo as numeric(15,2)) price, cast(pd1.summa/(pd1.kol_vo*detali' +
        '.area/1000000.000) as numeric(15,2)) price_m2'
      
        'from prihod_detali_1 pd1, pilomat_detali detali, pilomat_grupa p' +
        'g'
      
        'where (pd1.id_pilomat_detali=detali.id) and (detali.id_grupa=pg.' +
        'id) and (pd1.id_parent=:id)'
      'order by pg.name, detali.name')
    ModifySQL.Strings = (
      'update PRIHOD_DETALI_1'
      'set'
      '  SUMMA = :SUMMA'
      'where'
      '  ID = :OLD_ID')
    DataSource = DS_Prihod_detali_0_F
    Left = 760
    Top = 384
    object IB_Prihod_detali_1_FID: TIntegerField
      FieldName = 'ID'
      Origin = 'PRIHOD_DETALI_1.ID'
      Required = True
    end
    object IB_Prihod_detali_1_FKOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'PRIHOD_DETALI_1.KOL_VO'
      Required = True
    end
    object IB_Prihod_detali_1_FSUMMA: TIBBCDField
      FieldName = 'SUMMA'
      Origin = 'PRIHOD_DETALI_1.SUMMA'
      DisplayFormat = '### ##0.00'
      Precision = 18
      Size = 3
    end
    object IB_Prihod_detali_1_FDETALI_GRUPA: TIBStringField
      FieldName = 'DETALI_GRUPA'
      Origin = 'PILOMAT_GRUPA.NAME'
      Required = True
      Size = 60
    end
    object IB_Prihod_detali_1_FDETALI_NAME: TIBStringField
      FieldName = 'DETALI_NAME'
      Origin = 'PILOMAT_DETALI.NAME'
      Required = True
      Size = 50
    end
    object IB_Prihod_detali_1_FID_PILOMAT_DETALI: TIntegerField
      FieldName = 'ID_PILOMAT_DETALI'
      Origin = 'PRIHOD_DETALI_1.ID_PILOMAT_DETALI'
      Required = True
    end
    object IB_Prihod_detali_1_FPRICE: TIBBCDField
      FieldName = 'PRICE'
      DisplayFormat = '### ##0.00'
      Precision = 18
      Size = 2
    end
    object IB_Prihod_detali_1_FPRICE_M2: TIBBCDField
      FieldName = 'PRICE_M2'
      DisplayFormat = '### ##0.00'
      Precision = 18
      Size = 2
    end
  end
  object DS_Prihod_detali_1_F: TDataSource
    AutoEdit = False
    DataSet = IB_Prihod_detali_1_F
    Left = 800
    Top = 384
  end
  object DS_Prihod_detali_0_F: TDataSource
    AutoEdit = False
    DataSet = IB_Prihod_detali_0_F
    Left = 824
    Top = 80
  end
  object IB_Prihod_detali_0_F: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select pd0.id, pd0.date_p, pd0.primechanie, s.name sklad_name'
      'from prihod_detali_0 pd0, sklad s'
      'where (pd0.id_sklad=s.id) and (pd0.is_ostatok=1)'
      'order by pd0.date_p, pd0.id')
    Left = 784
    Top = 80
  end
  object OpenDialog1: TOpenDialog
    Left = 576
    Top = 104
  end
  object MainMenu1: TMainMenu
    Left = 216
    Top = 112
    object N_Period_of_view: TMenuItem
      Caption = #1055#1077#1088#1080#1086#1076' '#1087#1088#1086#1089#1084#1086#1090#1088#1072
    end
    object N1: TMenuItem
      Caption = #1048#1084#1087#1086#1088#1090
      OnClick = N1Click
    end
  end
end
