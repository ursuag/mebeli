object F_Akt_vip_rabot_jurnal: TF_Akt_vip_rabot_jurnal
  Left = 14
  Top = 35
  AutoScroll = False
  Caption = #1046#1091#1088#1085#1072#1083' '#1072#1082#1090#1086#1074' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1088#1072#1073#1086#1090
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
  ShowHint = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 696
    Top = 272
    Width = 267
    Height = 16
    Caption = #1057#1055#1048#1057#1040#1053#1048#1045' '#1050#1054#1052#1055#1051#1045#1050#1058#1059#1070#1065#1048#1061' '#1055#1054' '#1040#1050#1058#1059
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1170
    Height = 273
    Ctl3D = True
    DataSource = DM_Mebeli.DS_Akt_vip_rabot_0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
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
        FieldName = 'NOMER'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1072#1082#1090#1072
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_A'
        Title.Alignment = taCenter
        Title.Caption = #1044#1040#1058#1040
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_ZAKAZ'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1079#1072#1082#1072#1079#1072
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDRABOT_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1042#1048#1044' '#1056#1040#1041#1054#1058
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOTRUDNIK_FIO'
        Title.Alignment = taCenter
        Title.Caption = #1048#1057#1055#1054#1051#1053#1048#1058#1045#1051#1068
        Width = 283
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 280
    Width = 545
    Height = 337
    TabStop = False
    DataSource = DS_Akt_vip_rabot_1
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
        FieldName = 'ID_GOTOV_PROD'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 178
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GOTOV_PROD_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1048#1047#1044#1045#1051#1048#1071
        Width = 223
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 54
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 623
    Width = 1169
    Height = 57
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object L_Filtre: TLabel
      Left = 424
      Top = 24
      Width = 57
      Height = 19
      Caption = 'L_Filtre'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
    end
    object B_Exit: TButton
      Left = 1064
      Top = 12
      Width = 97
      Height = 33
      Caption = '&'#1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 3
      OnClick = B_ExitClick
    end
    object B_Insert: TButton
      Left = 8
      Top = 12
      Width = 97
      Height = 33
      Hint = #1042#1089#1090#1072#1074#1083#1103#1077#1090' '#1101#1090#1072#1087' '#1087#1086#1089#1083#1077' '#1090#1077#1082#1091#1097#1077#1075#1086
      Caption = '&'#1053#1086#1074#1099#1081
      TabOrder = 0
      OnClick = B_InsertClick
    end
    object B_Edit: TButton
      Left = 112
      Top = 12
      Width = 97
      Height = 33
      Caption = '&'#1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = B_EditClick
    end
    object B_Delete: TButton
      Left = 216
      Top = 12
      Width = 97
      Height = 33
      Caption = '&'#1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
      TabStop = False
      OnClick = B_DeleteClick
    end
  end
  object DNG_Rashod_furnitura: TDBGrid
    Left = 552
    Top = 296
    Width = 620
    Height = 321
    TabStop = False
    DataSource = DS_Rashod_furnitura_F
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete]
    ParentFont = False
    PopupMenu = PopupMenu_Furnitura
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    OnExit = DNG_Rashod_furnituraExit
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_FURNITURA'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FURNITURA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1052#1055#1051#1045#1050#1058#1059#1070#1065#1048#1045
        Width = 184
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
        FieldName = 'KOLVO_NORMA'
        Title.Alignment = taCenter
        Title.Caption = #1053#1054#1056#1052#1040
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ED_IZM'
        Title.Alignment = taCenter
        Title.Caption = #1045#1044'.'#1048#1047#1052'.'
        Visible = True
      end>
  end
  object P_Podrobno: TPanel
    Left = 552
    Top = 290
    Width = 625
    Height = 318
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 4
    Visible = False
    object DBG_Podrobno: TDBGrid
      Left = 8
      Top = 8
      Width = 609
      Height = 297
      TabStop = False
      DataSource = DS_Podrobno
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
          FieldName = 'ID_FURNITURA'
          Title.Alignment = taCenter
          Title.Caption = #1050#1054#1044
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GRUPA_NAME'
          Title.Alignment = taCenter
          Title.Caption = #1043#1056#1059#1055#1055#1040
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FURNITURA_NAME'
          Title.Alignment = taCenter
          Title.Caption = #1050#1054#1052#1055#1051#1045#1050#1058#1059#1070#1065#1048#1045
          Width = 177
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KOL_VO'
          Title.Alignment = taCenter
          Title.Caption = #1050#1054#1051'-'#1042#1054
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUMMA'
          Title.Alignment = taCenter
          Title.Caption = #1057#1059#1052#1052#1040
          Width = 101
          Visible = True
        end>
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
      Caption = #1060#1080#1083#1100#1090#1088
      object N_Filtre_Rabota: TMenuItem
        Caption = #1042#1080#1076#1099' '#1088#1072#1073#1086#1090
        OnClick = N_Filtre_RabotaClick
      end
      object N_Filtre_Sotrudnik: TMenuItem
        Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
        OnClick = N_Filtre_SotrudnikClick
      end
      object N_Filtre_Clear: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
        OnClick = N_Filtre_ClearClick
      end
    end
    object N2: TMenuItem
      Caption = #1056#1072#1089#1093#1086#1076' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
      object N_Change_Rashod_firnitura: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1088#1077#1072#1083#1100#1085#1099#1081' '#1088#1072#1089#1093#1086#1076
        OnClick = N_Change_Rashod_firnituraClick
      end
    end
    object N_Podrobno: TMenuItem
      Caption = #1055#1086#1076#1088#1086#1073#1085#1086
      OnClick = N_PodrobnoClick
    end
  end
  object IB_Podrobno: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PEREMESCHENIE_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PEREMESCHENIE_0'
      '  (ID, DATE_PER, PRIMECHANIE)'
      'values'
      '  (:ID, :DATE_PER, :PRIMECHANIE)')
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
      
        'select f.id id_furnitura, fg.name grupa_name,  f.name furnitura_' +
        'name, rfp.kol_vo kol_vo, rfp.summa'
      
        'from rashod_furnitura rf, rashod_furnitura_price rfp, furnitura_' +
        'grupa fg, furnitura f'
      
        'where (fg.id=f.id_parent) and (f.id=rfp.id_furnitura) and (rf.id' +
        '_akt_vip_rabot=:nomer) and (rf.id=rfp.id_parent)'
      'order by 1,2')
    ModifySQL.Strings = (
      'update PEREMESCHENIE_0'
      'set'
      '  ID = :ID,'
      '  DATE_PER = :DATE_PER,'
      '  PRIMECHANIE = :PRIMECHANIE'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    DataSource = DM_Mebeli.DS_Akt_vip_rabot_0
    Left = 728
    Top = 576
    object IB_PodrobnoGRUPA_NAME: TIBStringField
      FieldName = 'GRUPA_NAME'
      Origin = 'FURNITURA_GRUPA.NAME'
      Required = True
      Size = 50
    end
    object IB_PodrobnoFURNITURA_NAME: TIBStringField
      FieldName = 'FURNITURA_NAME'
      Origin = 'FURNITURA.NAME'
      Required = True
      Size = 50
    end
    object IB_PodrobnoKOL_VO: TIBBCDField
      FieldName = 'KOL_VO'
      Origin = 'RASHOD_FURNITURA_PRICE.KOL_VO'
      Required = True
      Precision = 9
      Size = 3
    end
    object IB_PodrobnoSUMMA: TIBBCDField
      FieldName = 'SUMMA'
      Origin = 'RASHOD_FURNITURA_PRICE.SUMMA'
      Precision = 18
      Size = 3
    end
    object IB_PodrobnoID_FURNITURA: TIntegerField
      FieldName = 'ID_FURNITURA'
      Origin = 'FURNITURA.ID'
      Required = True
    end
  end
  object DS_Podrobno: TDataSource
    AutoEdit = False
    DataSet = IB_Podrobno
    Left = 776
    Top = 576
  end
  object PopupMenu_Furnitura: TPopupMenu
    Left = 640
    Top = 440
    object N_Real_Rashod: TMenuItem
      Caption = #1042#1074#1077#1089#1090#1080' '#1088#1077#1072#1083#1100#1085#1099#1081' '#1088#1072#1089#1093#1086#1076
      OnClick = N_Real_RashodClick
    end
  end
  object IB_Rashod_furnitura_F: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PEREMESCHENIE_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PEREMESCHENIE_0'
      '  (ID, DATE_PER, PRIMECHANIE)'
      'values'
      '  (:ID, :DATE_PER, :PRIMECHANIE)')
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
      
        'select rashf.id_akt_vip_rabot id_akt_vip_rabot, rashf.id_gotov_p' +
        'rod id_gotov_prod, rashf.id_furnitura id_furnitura, sum(rashf.ko' +
        'l_vo) kol_vo, sum(rashf.kolvo_norma) kolvo_norma,'
      
        '(select name from furnitura_grupa where id=(select id_parent fro' +
        'm furnitura where id=rashf.id_furnitura)) grupa_name,'
      
        '(select name from furnitura where id=rashf.id_furnitura) furnitu' +
        'ra_name,'
      
        '(select ed_izm from furnitura where id=rashf.id_furnitura) ed_iz' +
        'm'
      'from rashod_furnitura rashf'
      
        'where (rashf.id_akt_vip_rabot=:id_parent) and (rashf.id_gotov_pr' +
        'od= :id_gotov_prod)'
      
        'group by rashf.id_akt_vip_rabot, rashf.id_gotov_prod, rashf.id_f' +
        'urnitura'
      'order by grupa_name, furnitura_name')
    ModifySQL.Strings = (
      'update PEREMESCHENIE_0'
      'set'
      '  ID = :ID,'
      '  DATE_PER = :DATE_PER,'
      '  PRIMECHANIE = :PRIMECHANIE'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    DataSource = DS_Akt_vip_rabot_1
    Left = 672
    Top = 376
  end
  object DS_Rashod_furnitura_F: TDataSource
    AutoEdit = False
    DataSet = IB_Rashod_furnitura_F
    Left = 720
    Top = 376
  end
  object IB_Akt_vip_rabot_1: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PEREMESCHENIE_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into PEREMESCHENIE_0'
      '  (ID, DATE_PER, PRIMECHANIE)'
      'values'
      '  (:ID, :DATE_PER, :PRIMECHANIE)')
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
      
        'select avr1.id_gotov_prod id_gotov_prod, avr1.kol_vo kol_vo, gpg' +
        '.name grupa_name, gp0.name gotov_prod_name, avr1.id_parent id_pa' +
        'rent'
      
        'from AKT_VIP_RABOT_1 avr1, gotov_prod_0 gp0, gotov_prod_grupa gp' +
        'g'
      
        'where (avr1.id_parent=:NOMER) and (avr1.id_gotov_prod=gp0.id) an' +
        'd (gpg.id=gp0.id_grupa)')
    ModifySQL.Strings = (
      'update PEREMESCHENIE_0'
      'set'
      '  ID = :ID,'
      '  DATE_PER = :DATE_PER,'
      '  PRIMECHANIE = :PRIMECHANIE'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    DataSource = DM_Mebeli.DS_Akt_vip_rabot_0
    Left = 32
    Top = 352
  end
  object DS_Akt_vip_rabot_1: TDataSource
    AutoEdit = False
    DataSet = IB_Akt_vip_rabot_1
    Left = 80
    Top = 352
  end
end
