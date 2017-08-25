object F_Prodaja_jurnal: TF_Prodaja_jurnal
  Left = 0
  Top = 96
  AutoScroll = False
  Caption = #1046#1091#1088#1085#1072#1083' "'#1054#1090#1075#1088#1091#1079#1082#1072' '#1075#1086#1090#1086#1074#1086#1081' '#1087#1088#1086#1076#1091#1082#1094#1080#1080'"'
  ClientHeight = 682
  ClientWidth = 1136
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1169
    Height = 281
    DataSource = DS_Prodaja_0
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
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
        FieldName = 'NOMER_AKT'
        Title.Alignment = taCenter
        Title.Caption = #1053#1054#1052#1045#1056
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_AKT'
        Title.Alignment = taCenter
        Title.Caption = #1044#1040#1058#1040
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRAGENT_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1053#1058#1056#1040#1043#1045#1053#1058
        Width = 264
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIMECHANIE'
        Title.Alignment = taCenter
        Title.Caption = #1055#1056#1048#1052#1045#1063#1040#1053#1048#1045
        Width = 503
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SIGNED'
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1076#1087#1080#1089#1072#1085
        Width = 97
        Visible = True
      end>
  end
  object DBG_Gotovprod: TDBGrid
    Left = 0
    Top = 284
    Width = 1169
    Height = 333
    DataSource = DS_Prodaja_1
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
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
        Title.Caption = #1040#1056#1058#1048#1050#1059#1051
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 372
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GOTOVPROD_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1054#1058#1054#1042#1040#1071' '#1055#1056#1054#1044#1059#1050#1062#1048#1071
        Width = 314
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_ZAKAZ'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1079#1072#1082#1072#1079#1072
        Width = 125
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 8
    Top = 624
    Width = 1161
    Height = 48
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object B_Exit: TButton
      Left = 1040
      Top = 8
      Width = 108
      Height = 33
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 0
      OnClick = B_ExitClick
    end
    object B_Insert: TButton
      Left = 4
      Top = 7
      Width = 108
      Height = 33
      Hint = #1042#1089#1090#1072#1074#1083#1103#1077#1090' '#1101#1090#1072#1087' '#1087#1086#1089#1083#1077' '#1090#1077#1082#1091#1097#1077#1075#1086
      Caption = #1053#1086#1074#1099#1081
      TabOrder = 1
      OnClick = B_InsertClick
    end
    object B_Edit: TButton
      Left = 127
      Top = 7
      Width = 108
      Height = 33
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 2
      OnClick = B_EditClick
    end
    object B_Delete: TButton
      Left = 258
      Top = 7
      Width = 108
      Height = 33
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 3
      OnClick = B_DeleteClick
    end
  end
  object DBG_Sebest: TDBGrid
    Left = 0
    Top = 480
    Width = 1169
    Height = 137
    DataSource = DS_Prodaja_1_sebest
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Visible = False
    Columns = <
      item
        Expanded = False
        FieldName = 'ARTICLE'
        Title.Alignment = taCenter
        Title.Caption = #1040#1056#1058#1048#1050#1059#1051
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 372
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GOTOVPROD_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1054#1058#1054#1042#1040#1071' '#1055#1056#1054#1044#1059#1050#1062#1048#1071
        Width = 314
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_AKTVIPPROD_0'
        Title.Alignment = taCenter
        Title.Caption = #1040#1082#1090' '#1074#1099#1087#1091#1089#1082#1072
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEBEST'
        Visible = True
      end>
  end
  object IB_Prodaja_0: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PRODAJA_GOTOVPROD_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  DATE_PRO,'
      '  ID_CONTRAGENT,'
      '  PRIMECHANIE'
      'from PRODAJA_GOTOVPROD_0 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      
        'select prgp0.id as id, prgp0.id as nomer_akt, prgp0.date_pro as ' +
        'date_akt, prgp0.primechanie as primechanie, c1.name as contragen' +
        't_name,'
      
        'iif((select is_signed from CHECK_IS_SIGNED('#39'PRODAJA_GOTOVPROD_0'#39 +
        ',prgp0.id))=1,'#39#1044#1072#39','#39#1053#1077#1090#39') signed'
      'from PRODAJA_GOTOVPROD_0 as prgp0, contragenty_1 as c1'
      
        'where (prgp0.ID_CONTRAGENT=c1.id) and (prgp0.date_pro>=:date_sta' +
        'rt)'
      'order by prgp0.date_pro')
    ModifySQL.Strings = (
      '')
    Left = 40
    Top = 64
  end
  object DS_Prodaja_0: TDataSource
    AutoEdit = False
    DataSet = IB_Prodaja_0
    Left = 80
    Top = 64
  end
  object DS_Prodaja_1: TDataSource
    AutoEdit = False
    DataSet = IB_Prodaja_1
    Left = 80
    Top = 96
  end
  object IB_Prodaja_1: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select gpg.name as grupa_name, gp0.article article, gp0.name as ' +
        'gotovprod_name, prgp1.kol_vo as kol_vo, prgp1.id_zakaz as id_zak' +
        'az, prgp1.id id, cast(prgp1.price*prgp1.kol_vo as numeric(15,2))' +
        ' summa'
      
        'from PRODAJA_GOTOVPROD_0 as prgp0, PRODAJA_GOTOVPROD_1 as prgp1,' +
        ' gotov_prod_0 as gp0, gotov_prod_grupa as gpg'
      
        'where  (prgp0.id=:nomer_akt) and (prgp0.id=prgp1.id_parent) and ' +
        '(prgp1.id_gotov_prod=gp0.id) and (gp0.id_grupa=gpg.id)'
      'order by 1,2')
    DataSource = DS_Prodaja_0
    Left = 40
    Top = 96
  end
  object MainMenu1: TMainMenu
    Left = 216
    Top = 112
    object N_Period_of_view: TMenuItem
      Caption = #1055#1077#1088#1080#1086#1076' '#1087#1088#1086#1089#1084#1086#1090#1088#1072
      OnClick = N_Period_of_viewClick
    end
    object N_Podrobno: TMenuItem
      Caption = #1055#1086#1076#1088#1086#1073#1085#1086
      OnClick = N_PodrobnoClick
    end
    object N1: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1055#1086#1076#1087#1080#1089#1080
      object N_Sign: TMenuItem
        Caption = #1055#1086#1076#1087#1080#1089#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
        OnClick = N_SignClick
      end
      object N_Unsign: TMenuItem
        Caption = #1057#1085#1103#1090#1100' '#1087#1086#1076#1087#1080#1089#1100
        OnClick = N_UnsignClick
      end
    end
  end
  object IB_Prodaja_1_sebest: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select gp.article article, gpg.name grupa_name, gp.name gotovpro' +
        'd_name, pr1s.kol_vo kol_vo, pr1s.sebest sebest, (select id_paren' +
        't from akt_vip_prod_1 where id=pr1s.id_aktvipprod_1) id_aktvippr' +
        'od_0, pr1s.id_aktvipprod_1'
      
        'from prodaja_gotovprod_1_sebest pr1s, gotov_prod_0 gp, gotov_pro' +
        'd_grupa gpg'
      
        'where (gpg.id=gp.id_grupa) and (gp.id=pr1s.id_gotov_prod) and (p' +
        'r1s.id_parent=:id)')
    DataSource = DS_Prodaja_1
    Left = 872
    Top = 168
  end
  object DS_Prodaja_1_sebest: TDataSource
    AutoEdit = False
    DataSet = IB_Prodaja_1_sebest
    Left = 912
    Top = 168
  end
end
