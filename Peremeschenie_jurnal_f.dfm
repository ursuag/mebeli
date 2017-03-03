object F_Peremeschenie_jurnal: TF_Peremeschenie_jurnal
  Left = 146
  Top = 0
  Width = 1185
  Height = 728
  Caption = #1046#1091#1088#1085#1072#1083' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081' '#1087#1086' '#1089#1082#1083#1072#1076#1072#1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object Panel1: TPanel
    Left = 0
    Top = 632
    Width = 1169
    Height = 57
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object B_Exit: TButton
      Left = 1064
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1169
    Height = 273
    DataSource = DS_Peremeschenie_0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
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
        FieldName = 'DATE_PER'
        Title.Alignment = taCenter
        Title.Caption = #1044#1040#1058#1040
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SKLAD_OTKUDA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1057#1050#1051#1040#1044' '#1048#1057#1058#1054#1063#1053#1048#1050
        Width = 214
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SKLAD_KUDA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1057#1050#1051#1040#1044' '#1053#1040#1047#1053#1040#1063#1045#1053#1048#1071
        Width = 177
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIMECHANIE'
        Title.Alignment = taCenter
        Title.Caption = #1055#1056#1048#1052#1045#1063#1040#1053#1048#1045
        Width = 308
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 1
    Top = 278
    Width = 1168
    Height = 347
    DataSource = DS_Peremeschenie_1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
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
        Width = 132
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
        Width = 295
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOVAR_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
        Width = 263
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
      end>
  end
  object P_Podrobno: TPanel
    Left = 5
    Top = 280
    Width = 1152
    Height = 337
    BevelInner = bvLowered
    TabOrder = 3
    Visible = False
    object B_Podrobno_Close: TButton
      Left = 1048
      Top = 292
      Width = 97
      Height = 33
      Cancel = True
      Caption = #1057#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = B_Podrobno_CloseClick
    end
    object DBG_Podrodno: TDBGrid
      Left = 1
      Top = 1
      Width = 1144
      Height = 281
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
        end
        item
          Expanded = False
          FieldName = 'ID_PRIHOD_FURNITURA'
          Title.Alignment = taCenter
          Title.Caption = #1055#1056#1048#1061#1054#1044
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_PEREMESCH_FURNITURA'
          Title.Alignment = taCenter
          Title.Caption = #1055#1045#1056#1045#1052#1045#1065
          Width = 96
          Visible = True
        end>
    end
  end
  object IB_Peremeschenie_1: TIBDataSet
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
      
        'select '#39#1083#1080#1089#1090#1099#39' as tip_tovara, pl.id id_tovar, pg.name as grupa_n' +
        'ame, pl.name as tovar_name, perl.kol_vo as kol_vo, '#39#1040#1090#39' as ed_iz' +
        'm'
      
        'from PEREMESCHENIE_LISTY perl, pilomat_grupa pg, pilomat_listy p' +
        'l'
      
        'where (perl.id_parent=:ID) and (perl.id_pilomat_listy=pl.id) and' +
        ' (pg.id=pl.id_grupa)'
      ''
      'union all'
      ''
      
        'select '#39#1076#1077#1090#1072#1083#1080#39' as tip_tovara, pd.id id_tovar, pg.name as grupa_' +
        'name, pd.name as tovar_name, perd.kol_vo as kol_vo, '#39#1040#1090#39' as ed_i' +
        'zm'
      
        'from PEREMESCHENIE_DETALI perd, pilomat_grupa pg, pilomat_detali' +
        ' pd'
      
        'where (perd.id_parent=:ID) and (perd.id_pilomat_detali=pd.id) an' +
        'd (pg.id=pd.id_grupa)'
      ''
      'union all'
      ''
      
        'select '#39#1082#1086#1084#1087#1083#39' as tip_tovara, f.id id_tovar, fg.name as grupa_na' +
        'me, f.name as tovar_name, perf.kol_vo as kol_vo, f.ed_izm as ed_' +
        'izm'
      
        'from PEREMESCHENIE_FURNITURA perf, furnitura_grupa fg, furnitura' +
        ' f'
      
        'where (perf.id_parent=:ID) and (perf.id_furnitura=f.id) and (fg.' +
        'id=f.id_parent) '
      'order by 1,3,4')
    ModifySQL.Strings = (
      'update PEREMESCHENIE_0'
      'set'
      '  ID = :ID,'
      '  DATE_PER = :DATE_PER,'
      '  PRIMECHANIE = :PRIMECHANIE'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    DataSource = DS_Peremeschenie_0
    Left = 112
    Top = 136
  end
  object DS_Peremeschenie_1: TDataSource
    AutoEdit = False
    DataSet = IB_Peremeschenie_1
    Left = 144
    Top = 136
  end
  object MainMenu1: TMainMenu
    Left = 248
    Top = 96
    object N_Period_of_view: TMenuItem
      Caption = #1055#1077#1088#1080#1086#1076' '#1087#1088#1086#1089#1084#1086#1090#1088#1072
      OnClick = N_Period_of_viewClick
    end
    object N_Print: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = N_PrintClick
      object N_Print_akt: TMenuItem
        Caption = #1040#1082#1090' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081
        OnClick = N_Print_aktClick
      end
      object N_Print_jurnal: TMenuItem
        Caption = #1046#1091#1088#1085#1072#1083' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1081
        OnClick = N_Print_jurnalClick
      end
    end
    object N_Podrobno: TMenuItem
      Caption = #1055#1086#1076#1088#1086#1073#1085#1086
      OnClick = N_PodrobnoClick
    end
  end
  object IB_Peremeschenie_0: TIBDataSet
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
      
        'select p.id, p.date_per, (select name from sklad where id =p.id_' +
        'sklad_otkuda) as sklad_otkuda_name, (select name from sklad wher' +
        'e id =p.id_sklad_kuda) as sklad_kuda_name,p.PRIMECHANIE as PRIME' +
        'CHANIE '
      'from PEREMESCHENIE_0 p'
      'where p.date_per>=:date_start'
      'order by p.date_per, p.id')
    ModifySQL.Strings = (
      'update PEREMESCHENIE_0'
      'set'
      '  ID = :ID,'
      '  DATE_PER = :DATE_PER,'
      '  PRIMECHANIE = :PRIMECHANIE'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    Left = 112
    Top = 88
  end
  object DS_Peremeschenie_0: TDataSource
    AutoEdit = False
    DataSet = IB_Peremeschenie_0
    Left = 144
    Top = 88
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
      
        'select '#39#1082#1086#1084#1087#1083#39' as tip_tovara, f.id id_tovar, fg.name as grupa_na' +
        'me, f.name as tovar_name, perfp.kol_vo as kol_vo, f.ed_izm as ed' +
        '_izm, perfp.summa,'
      
        '(select id from prihod_furnitura_0 where id=(select id_parent fr' +
        'om prihod_furnitura_1 where id=perfp.id_prihod_furnitura)) id_pr' +
        'ihod_furnitura,'
      
        '(select id from peremeschenie_0 where id=(select id_parent from ' +
        'peremeschenie_furnitura where id=perfp.id_peremesch_furnitura)) ' +
        'id_peremesch_furnitura'
      
        'from PEREMESCHENIE_FURNITURA perf, PEREMESCHENIE_FURNITURA_PRICE' +
        ' perfp, furnitura_grupa fg, furnitura f'
      
        'where (perf.id_parent=:ID) and (perf.id_furnitura=f.id) and (fg.' +
        'id=f.id_parent) and (perf.id=perfp.id_parent)'
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
    DataSource = DS_Peremeschenie_0
    Left = 24
    Top = 320
  end
  object DS_Podrobno: TDataSource
    AutoEdit = False
    DataSet = IB_Podrobno
    Left = 56
    Top = 320
  end
end
