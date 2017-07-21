object F_Akt_vip_prod_jurnal: TF_Akt_vip_prod_jurnal
  Left = 0
  Top = 0
  AutoScroll = False
  Caption = #1040#1082#1090#1099' '#1074#1099#1087#1091#1089#1082#1072' '#1075#1086#1090#1086#1074#1086#1081' '#1087#1088#1086#1076#1091#1082#1094#1080#1080
  ClientHeight = 693
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object DBG_Group_area: TDBGrid
    Left = 8
    Top = 408
    Width = 529
    Height = 209
    TabStop = False
    DataSource = DS_Group_area
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu_detali
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Visible = False
    Columns = <
      item
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1043#1056#1059#1055#1055#1067
        Width = 357
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AREA'
        Title.Alignment = taCenter
        Title.Caption = 'S, '#1084'2'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ARTICLE'
        Title.Alignment = taCenter
        Title.Caption = #1040#1088#1090
        Width = 76
        Visible = True
      end>
  end
  object P_Podrobno: TPanel
    Left = 1
    Top = 405
    Width = 1172
    Height = 217
    BevelInner = bvLowered
    TabOrder = 6
    Visible = False
    object B_Podrobno_Close: TButton
      Left = 1048
      Top = 172
      Width = 97
      Height = 33
      Cancel = True
      Caption = #1057#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = B_Podrobno_CloseClick
    end
    object DBG_Podrodno: TDBGrid
      Left = 11
      Top = 9
      Width = 1166
      Height = 168
      DataSource = DS_Podrobno
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -15
      TitleFont.Name = 'Arial'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'TIP_TOVARA'
          Title.Alignment = taCenter
          Title.Caption = #1058#1048#1055
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_TOVAR'
          Title.Alignment = taCenter
          Title.Caption = #1050#1054#1044
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GRUPA_NAME'
          Title.Alignment = taCenter
          Title.Caption = #1043#1056#1059#1055#1055#1040
          Width = 227
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOVAR_NAME'
          Title.Alignment = taCenter
          Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
          Width = 253
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KOL_VO'
          Title.Alignment = taCenter
          Title.Caption = #1050#1054#1051'-'#1042#1054
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ED_IZM'
          Title.Alignment = taCenter
          Title.Caption = #1045#1076'.'#1048#1079#1084'.'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUMMA'
          Title.Alignment = taCenter
          Title.Caption = #1057#1059#1052#1052#1040
          Width = 116
          Visible = True
        end>
    end
  end
  object DBGrid1: TDBGrid
    Left = 1
    Top = 0
    Width = 1176
    Height = 233
    DataSource = DM_Mebeli.DS_Akt_vip_prod_0
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
        FieldName = 'NOMER'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1072#1082#1090#1072
        Width = 89
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATE_A'
        Title.Alignment = taCenter
        Title.Caption = #1044#1040#1058#1040
        Width = 162
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_ZAKAZ'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1047#1040#1050#1040#1047#1040
        Width = 167
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SKLAD_KUDA'
        Title.Alignment = taCenter
        Title.Caption = #1057#1050#1051#1040#1044' '#1053#1040#1047#1053#1040#1063#1045#1053#1048#1071
        Width = 570
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 1
    Top = 240
    Width = 1176
    Height = 169
    TabStop = False
    DataSource = DM_Mebeli.DS_Akt_vip_prod_1
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
        Title.Caption = #1040#1088#1090#1080#1082#1091#1083
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 385
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GOTOVPROD_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
        Width = 427
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 186
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 624
    Width = 1177
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
    object Button1: TButton
      Left = 504
      Top = 12
      Width = 97
      Height = 33
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 4
      OnClick = Button1Click
    end
  end
  object DBG_Detali: TDBGrid
    Left = 0
    Top = 408
    Width = 545
    Height = 209
    TabStop = False
    DataSource = DS_Rashod_detali
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu_detali
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'DETALI_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1044#1045#1058#1040#1051#1048
        Width = 313
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AREA'
        Title.Alignment = taCenter
        Title.Caption = 'S, '#1084'2'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_PILOMAT_DETALI'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076
        Width = 54
        Visible = True
      end>
  end
  object DBG_Furnitura: TDBGrid
    Left = 544
    Top = 408
    Width = 625
    Height = 209
    TabStop = False
    DataSource = DS_Rashod_furnitura_F
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu_Furnitura
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FURNITURA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1052#1055#1051#1045#1050#1058#1059#1070#1065#1048#1045
        Width = 215
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOLVO_NORMA'
        Title.Alignment = taCenter
        Title.Caption = #1053#1054#1056#1052#1040
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ED_IZM'
        Title.Alignment = taCenter
        Title.Caption = #1045#1076'.'#1080#1079#1084'.'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_FURNITURA'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Visible = True
      end>
  end
  object IB_Rashod_detali: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select rd.id_pilomat_detali, d.name as detali_name, rd.kol_vo as' +
        ' kol_vo, rd.area/1000000.0000 as area'
      'from pilomat_detali as d, rashod_detali as rd'
      
        'where (rd.id_pilomat_detali=d.id) and (rd.ID_AKT_VIP_PROD=:NOMER' +
        ')'
      'order by 2')
    DataSource = DM_Mebeli.DS_Akt_vip_prod_0
    Left = 432
    Top = 128
    object IB_Rashod_detaliID_PILOMAT_DETALI: TIntegerField
      FieldName = 'ID_PILOMAT_DETALI'
      Origin = '"RASHOD_DETALI"."ID_PILOMAT_DETALI"'
      Required = True
    end
    object IB_Rashod_detaliDETALI_NAME: TIBStringField
      FieldName = 'DETALI_NAME'
      Origin = '"PILOMAT_DETALI"."NAME"'
      Required = True
      Size = 100
    end
    object IB_Rashod_detaliKOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = '"RASHOD_DETALI"."KOL_VO"'
      Required = True
    end
    object IB_Rashod_detaliAREA: TIBBCDField
      FieldName = 'AREA'
      ProviderFlags = []
      DisplayFormat = '0.000'
      Precision = 18
      Size = 4
    end
  end
  object DS_Rashod_detali: TDataSource
    DataSet = IB_Rashod_detali
    Left = 432
    Top = 176
  end
  object PopupMenu_detali: TPopupMenu
    Left = 48
    Top = 488
    object N1: TMenuItem
      Caption = #1055#1083#1086#1097#1072#1076#1100' '#1087#1086' '#1075#1088#1091#1087#1087#1072#1084
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1075#1088#1091#1087#1087#1091
      OnClick = N2Click
    end
  end
  object IB_Group_area: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select pg.article article, pg.name as grupa_name, sum(rd.area)/1' +
        '000000.0000 as area'
      
        'from pilomat_grupa as pg, rashod_detali as rd, pilomat_detali as' +
        ' pd'
      
        'where (pg.id=pd.id_grupa) and (rd.id_pilomat_detali=pd.id) and (' +
        'rd.id_akt_vip_prod=:NOMER)'
      'group by 1, 2'
      'order by 2')
    DataSource = DM_Mebeli.DS_Akt_vip_prod_0
    Left = 688
    Top = 128
  end
  object DS_Group_area: TDataSource
    DataSet = IB_Group_area
    Left = 688
    Top = 176
  end
  object PopupMenu_Furnitura: TPopupMenu
    Left = 600
    Top = 488
    object M_Edit_furnitura: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = M_Edit_furnituraClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 216
    Top = 112
    object N4: TMenuItem
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090
      object N_Insert_main: TMenuItem
        Caption = #1053#1086#1074#1099#1081
      end
      object N_Edit_main: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object N_Delete_main: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object N_Search_ID: TMenuItem
        Caption = #1053#1072#1081#1090#1080' '#1087#1086' '#1085#1086#1084#1077#1088#1091
        OnClick = N_Search_IDClick
      end
    end
    object N_Period_of_view: TMenuItem
      Caption = #1055#1077#1088#1080#1086#1076' '#1087#1088#1086#1089#1084#1086#1090#1088#1072
      OnClick = N_Period_of_viewClick
    end
    object N3: TMenuItem
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
      
        'select '#39#1076#1077#1090#1072#1083#1080#39' as tip_tovara, pd.id id_tovar, pg.name as grupa_' +
        'name, pd.name as tovar_name, rashdp.kol_vo as kol_vo, '#39#1096#1090#39' as ed' +
        '_izm, rashdp.summa'
      
        'from RASHOD_DETALI rashd, RASHOD_DETALI_PRICE rashdp, pilomat_gr' +
        'upa pg, pilomat_detali pd'
      
        'where (rashd.id_akt_vip_prod=:NOMER) and (rashd.id_pilomat_detal' +
        'i=pd.id) and (pg.id=pd.id_grupa) and (rashd.id=rashdp.id_parent)'
      ''
      'union all'
      ''
      
        'select '#39#1082#1086#1084#1087#1083#39' as tip_tovara, f.id id_tovar, fg.name as grupa_na' +
        'me, f.name as tovar_name, rashfp.kol_vo as kol_vo, f.ed_izm as e' +
        'd_izm, rashfp.summa'
      
        'from RASHOD_FURNITURA rashf, RASHOD_FURNITURA_PRICE rashfp, furn' +
        'itura_grupa fg, furnitura f'
      
        'where (rashf.id_akt_vip_prod=:NOMER) and (rashf.id_furnitura=f.i' +
        'd) and (fg.id=f.id_parent) and (rashf.id=rashfp.id_parent)'
      'order by 1, 3, 4')
    ModifySQL.Strings = (
      'update PEREMESCHENIE_0'
      'set'
      '  ID = :ID,'
      '  DATE_PER = :DATE_PER,'
      '  PRIMECHANIE = :PRIMECHANIE'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    DataSource = DM_Mebeli.DS_Akt_vip_prod_0
    Left = 24
    Top = 432
  end
  object DS_Podrobno: TDataSource
    AutoEdit = False
    DataSet = IB_Podrobno
    Left = 56
    Top = 432
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
      
        'select rashf.id_akt_vip_prod id_akt_vip_prod, rashf.id_gotov_pro' +
        'd id_gotov_prod, rashf.id_furnitura id_furnitura, sum(rashf.kol_' +
        'vo) kol_vo, sum(rashf.kolvo_norma) kolvo_norma,'
      
        '(select name from furnitura_grupa where id=(select id_parent fro' +
        'm furnitura where id=rashf.id_furnitura)) grupa_name,'
      
        '(select name from furnitura where id=rashf.id_furnitura) furnitu' +
        'ra_name,'
      
        '(select ed_izm from furnitura where id=rashf.id_furnitura) ed_iz' +
        'm'
      'from rashod_furnitura rashf'
      'where rashf.id_akt_vip_prod=:nomer'
      
        'group by rashf.id_akt_vip_prod, rashf.id_gotov_prod, rashf.id_fu' +
        'rnitura'
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
    DataSource = DM_Mebeli.DS_Akt_vip_prod_0
    Left = 736
    Top = 536
  end
  object DS_Rashod_furnitura_F: TDataSource
    AutoEdit = False
    DataSet = IB_Rashod_furnitura_F
    Left = 784
    Top = 536
  end
end
