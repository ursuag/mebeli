object F_Ostatok_listy: TF_Ostatok_listy
  Left = 0
  Top = 120
  AutoScroll = False
  Caption = #1054#1089#1090#1072#1090#1082#1080' '#1083#1080#1089#1090#1086#1074' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
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
        Width = 385
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
        Width = 264
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Title.Alignment = taCenter
        Title.Caption = #1057#1059#1052#1052#1040
        Width = 194
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072' '#1096#1090
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE_M2'
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072' '#1084'2'
        Width = 77
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
    object N1: TMenuItem
      Caption = #1048#1084#1087#1086#1088#1090
      OnClick = N1Click
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
        'imechanie, s.name as sklad_name, '
      
        '(select sum(summa) from prihod_listy_1 pl1 where pl1.id_parent=p' +
        'l0.id) summa'
      'from prihod_listy_0 as pl0, sklad as s'
      
        'where (date_p >=:date_start) and (pl0.id_sklad=s.id) and (pl0.is' +
        '_ostatok=1)'
      'order by date_p, id')
    Left = 32
    Top = 56
  end
  object F_DS_Prihod_listy_1: TDataSource
    AutoEdit = False
    DataSet = F_IB_Prihod_listy_1
    Left = 72
    Top = 328
  end
  object F_IB_Prihod_listy_1: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select pl1.id id, pl.id id_listy, pl.name as listy_name, pg.name' +
        ' as grupa_name, pl1.kol_vo as kol_vo, pl1.summa summa, cast(pl1.' +
        'summa/pl1.kol_vo as numeric(15,2)) price, cast(pl1.summa/(pl1.ko' +
        'l_vo*pl.area/1000000.000) as numeric(15,2)) price_m2'
      'from prihod_listy_1 pl1, pilomat_grupa pg, pilomat_listy pl'
      
        'where (pl1.id_parent=:ID) and (pl1.id_listy=pl.id) and (pl.id_gr' +
        'upa=pg.id)'
      'order by pg.name, pl.name')
    DataSource = F_DS_Prihod_listy_0
    Left = 24
    Top = 328
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
      Size = 100
    end
    object F_IB_Prihod_listy_1GRUPA_NAME: TIBStringField
      FieldName = 'GRUPA_NAME'
      Origin = 'PILOMAT_GRUPA.NAME'
      Required = True
      Size = 100
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
    object F_IB_Prihod_listy_1PRICE: TIBBCDField
      FieldName = 'PRICE'
      DisplayFormat = '### ##0.00'
      Precision = 18
      Size = 2
    end
    object F_IB_Prihod_listy_1PRICE_M2: TIBBCDField
      FieldName = 'PRICE_M2'
      DisplayFormat = '### ##0.00'
      Precision = 18
      Size = 2
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 576
    Top = 104
  end
end
