object F_Prihod_listy_jurnal: TF_Prihod_listy_jurnal
  Left = 2
  Top = 68
  AutoScroll = False
  AutoSize = True
  Caption = #1046#1091#1088#1085#1072#1083' '#1087#1088#1080#1093#1086#1076#1072' '#1083#1080#1089#1090#1086#1074#1099#1093' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
  ClientHeight = 673
  ClientWidth = 1180
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1177
    Height = 273
    DataSource = F_DS_Prihod_listy_0
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
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1087'/'#1087
        Width = 58
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATE_P'
        Title.Alignment = taCenter
        Title.Caption = #1044#1040#1058#1040
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SKLAD_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1057#1050#1051#1040#1044
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMER_TTN'
        Title.Alignment = taCenter
        Title.Caption = #1058#1058#1053
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRAGENT_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1055#1054#1057#1058#1040#1042#1065#1048#1050
        Width = 239
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Title.Alignment = taCenter
        Title.Caption = #1048#1058#1054#1043#1054', '#1083#1077#1081
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIMECHANIE'
        Title.Alignment = taCenter
        Title.Caption = #1055#1056#1048#1052#1045#1063#1040#1053#1048#1045
        Width = 355
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 272
    Width = 1177
    Height = 337
    DataSource = F_DS_Prihod_listy_1
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
        FieldName = 'ID_LISTY'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 293
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LISTY_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1051#1048#1057#1058#1054#1042
        Width = 273
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Title.Alignment = taCenter
        Title.Caption = #1057#1059#1052#1052#1040
        Width = 194
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 616
    Width = 1180
    Height = 57
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object B_Exit: TButton
      Left = 1072
      Top = 12
      Width = 97
      Height = 33
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 0
      OnClick = B_ExitClick
    end
    object B_Insert: TButton
      Left = 8
      Top = 12
      Width = 97
      Height = 33
      Hint = #1042#1089#1090#1072#1074#1083#1103#1077#1090' '#1101#1090#1072#1087' '#1087#1086#1089#1083#1077' '#1090#1077#1082#1091#1097#1077#1075#1086
      Caption = #1053#1086#1074#1099#1081
      TabOrder = 1
      OnClick = B_InsertClick
    end
    object B_Edit: TButton
      Left = 112
      Top = 12
      Width = 97
      Height = 33
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 2
      OnClick = B_EditClick
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
  object MainMenu1: TMainMenu
    Left = 216
    Top = 112
    object N_Period_of_view: TMenuItem
      Caption = #1055#1077#1088#1080#1086#1076' '#1087#1088#1086#1089#1084#1086#1090#1088#1072
      OnClick = N_Period_of_viewClick
    end
  end
  object F_DS_Prihod_listy_0: TDataSource
    AutoEdit = False
    DataSet = F_IB_Prihod_listy_0
    Left = 80
    Top = 56
  end
  object F_IB_Prihod_listy_0: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from prihod_listy_0'
      'where'
      '  ID = :OLD_ID')
    SelectSQL.Strings = (
      
        'select pl0.id as id, pl0.date_p as date_p, pl0.primechanie as pr' +
        'imechanie, s.name as sklad_name, pl0.id_akt_raspil as id_akt_ras' +
        'pil, (select name from contragenty_1 where pl0.id_contragent=id)' +
        ' contragent_name, pl0.nomer_ttn nomer_ttn,'
      
        '(select sum(summa) from prihod_listy_1 pl1 where pl1.id_parent=p' +
        'l0.id) summa'
      'from prihod_listy_0 as pl0, sklad as s'
      'where (date_p >=:date_start) and (pl0.id_sklad=s.id)'
      'order by date_p, id')
    Left = 32
    Top = 56
    object F_IB_Prihod_listy_0ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PRIHOD_LISTY_0.ID'
      Required = True
    end
    object F_IB_Prihod_listy_0DATE_P: TDateField
      FieldName = 'DATE_P'
      Origin = 'PRIHOD_LISTY_0.DATE_P'
      Required = True
    end
    object F_IB_Prihod_listy_0PRIMECHANIE: TIBStringField
      FieldName = 'PRIMECHANIE'
      Origin = 'PRIHOD_LISTY_0.PRIMECHANIE'
      Size = 255
    end
    object F_IB_Prihod_listy_0SKLAD_NAME: TIBStringField
      FieldName = 'SKLAD_NAME'
      Origin = 'SKLAD.NAME'
      Required = True
      Size = 30
    end
    object F_IB_Prihod_listy_0ID_AKT_RASPIL: TIntegerField
      FieldName = 'ID_AKT_RASPIL'
      Origin = 'PRIHOD_LISTY_0.ID_AKT_RASPIL'
    end
    object F_IB_Prihod_listy_0CONTRAGENT_NAME: TIBStringField
      FieldName = 'CONTRAGENT_NAME'
      Size = 50
    end
    object F_IB_Prihod_listy_0NOMER_TTN: TIBStringField
      FieldName = 'NOMER_TTN'
      Origin = 'PRIHOD_LISTY_0.NOMER_TTN'
      Size = 50
    end
    object F_IB_Prihod_listy_0SUMMA: TIBBCDField
      FieldName = 'SUMMA'
      DisplayFormat = '### ##0.00'
      Precision = 18
      Size = 2
    end
  end
  object F_DS_Prihod_listy_1: TDataSource
    AutoEdit = False
    DataSet = F_IB_Prihod_listy_1
    Left = 80
    Top = 96
  end
  object F_IB_Prihod_listy_1: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select pl1.id id, pl.id id_listy, pl.name as listy_name, pg.name' +
        ' as grupa_name, pl1.kol_vo as kol_vo, pl1.summa summa'
      'from prihod_listy_1 pl1, pilomat_grupa pg, pilomat_listy pl'
      
        'where (pl1.id_parent=:ID) and (pl1.id_listy=pl.id) and (pl.id_gr' +
        'upa=pg.id)'
      'order by pg.name, pl.name')
    DataSource = F_DS_Prihod_listy_0
    Left = 32
    Top = 96
    object F_IB_Prihod_listy_1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PRIHOD_LISTY_1.ID'
      Required = True
    end
    object F_IB_Prihod_listy_1ID_LISTY: TIntegerField
      FieldName = 'ID_LISTY'
      Origin = 'PILOMAT_LISTY.ID'
      Required = True
    end
    object F_IB_Prihod_listy_1LISTY_NAME: TIBStringField
      FieldName = 'LISTY_NAME'
      Origin = 'PILOMAT_LISTY.NAME'
      Required = True
      Size = 50
    end
    object F_IB_Prihod_listy_1GRUPA_NAME: TIBStringField
      FieldName = 'GRUPA_NAME'
      Origin = 'PILOMAT_GRUPA.NAME'
      Required = True
      Size = 60
    end
    object F_IB_Prihod_listy_1KOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'PRIHOD_LISTY_1.KOL_VO'
      Required = True
    end
    object F_IB_Prihod_listy_1SUMMA: TIBBCDField
      FieldName = 'SUMMA'
      Origin = 'PRIHOD_LISTY_1.SUMMA'
      DisplayFormat = '### ##0.00'
      Precision = 18
      Size = 2
    end
  end
end
