object F_Prihod_detali_jurnal: TF_Prihod_detali_jurnal
  Left = 120
  Top = 0
  Width = 1200
  Height = 728
  Caption = #1046#1091#1088#1085#1072#1083' '#1087#1088#1080#1093#1086#1076#1072' '#1076#1077#1090#1072#1083#1077#1081
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
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
    OnDblClick = DBGrid1DblClick
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
        FieldName = 'CONTRAGENT'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1053#1058#1056#1040#1043#1045#1053#1058
        Width = 322
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
        FieldName = 'DOC_OSNOV'
        Title.Alignment = taCenter
        Title.Caption = #1044#1054#1050'. '#1054#1057#1053#1054#1042#1040#1053#1048#1045
        Width = 191
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 304
    Width = 1177
    Height = 321
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
        Width = 279
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 181
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 140
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 629
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
        'li.name detali_name, pd1.ID_PILOMAT_DETALI'
      
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
      
        'select pd0.id_akt_raspil, pd0.id, pd0.date_p, pd0.primechanie, s' +
        '.name sklad_name, iif(pd0.id_akt_raspil is null,'#39#1055#1088#1080#1093#1086#1076#39','#39#1040'/'#1088#1072#1089#1087 +
        ' N'#39'||pd0.id_akt_raspil) doc_osnov, (select name from contragenty' +
        '_1 where pd0.id_contragent=id) contragent'
      'from prihod_detali_0 pd0, sklad s'
      'where (pd0.id_sklad=s.id) and (pd0.date_p>=:date_prih)'
      'order by pd0.date_p, pd0.id')
    Left = 784
    Top = 80
  end
end
