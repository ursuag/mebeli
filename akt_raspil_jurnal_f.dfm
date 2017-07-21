object F_Akt_raspil_jurnal: TF_Akt_raspil_jurnal
  Left = 0
  Top = 108
  AutoScroll = False
  Caption = #1046#1091#1088#1085#1072#1083' '#1072#1082#1090#1086#1074' '#1088#1072#1089#1087#1080#1083#1072
  ClientHeight = 688
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
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
  TextHeight = 16
  object DBGrid1: TDBGrid
    Left = 8
    Top = 0
    Width = 449
    Height = 601
    DataSource = DM_Mebeli.DS_Akt_raspil
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = #8470
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_R'
        Title.Alignment = taCenter
        Title.Caption = #1044#1040#1058#1040
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTHOD'
        Title.Alignment = taCenter
        Title.Caption = #1054#1090#1093#1086#1076', %'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 71
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'OTHOD_M2'
        Title.Alignment = taCenter
        Title.Caption = #1054#1090#1093#1086#1076' '#1084'2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTHOD_SUMMA'
        Title.Alignment = taCenter
        Title.Caption = #1054#1058#1061#1054#1044', '#1083#1077#1081
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_ZAKAZ'
        Title.Alignment = taCenter
        Title.Caption = #1047#1040#1050#1040#1047
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 47
        Visible = True
      end>
  end
  object DBG_Listy: TDBGrid
    Left = 456
    Top = 0
    Width = 881
    Height = 225
    TabStop = False
    DataSource = DS_Akt_raspil_listy
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
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
        FieldName = 'ID_LISTY'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 288
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LISTY_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1051#1048#1057#1058#1067
        Width = 379
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 83
        Visible = True
      end>
  end
  object DBGrid3: TDBGrid
    Left = 456
    Top = 234
    Width = 881
    Height = 287
    TabStop = False
    DataSource = DS_Akt_raspil_detali
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'DETALI_ID'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 310
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETALI_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1044#1045#1058#1040#1051#1048
        Width = 363
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 70
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 620
    Width = 1337
    Height = 57
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object B_Exit: TButton
      Left = 1216
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
    object B_Refresh: TButton
      Left = 400
      Top = 12
      Width = 97
      Height = 33
      Caption = '&'#1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 4
      TabStop = False
      OnClick = B_RefreshClick
    end
  end
  object DBGrid4: TDBGrid
    Left = 456
    Top = 520
    Width = 713
    Height = 89
    TabStop = False
    DataSource = DM_Mebeli.DS_Akt_raspil_ostatok
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1054#1057#1058#1040#1058#1054#1050
        Width = 410
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZMER_X'
        Title.Alignment = taCenter
        Title.Caption = #1056#1072#1079#1084#1077#1088' X'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZMER_Y'
        Title.Alignment = taCenter
        Title.Caption = #1056#1072#1079#1084#1077#1088' Y'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Visible = True
      end>
  end
  object P_Podrobno: TPanel
    Left = 456
    Top = 2
    Width = 881
    Height = 615
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 5
    Visible = False
    object DBG_Listy_price: TDBGrid
      Left = 3
      Top = 8
      Width = 870
      Height = 209
      TabStop = False
      DataSource = DS_Akt_raspil_listy_Price
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
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
          FieldName = 'GRUPA_NAME'
          Title.Alignment = taCenter
          Title.Caption = #1043#1056#1059#1055#1055#1040
          Width = 197
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LISTY_NAME'
          Title.Alignment = taCenter
          Title.Caption = #1051#1048#1057#1058#1067
          Width = 252
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
          FieldName = 'SUMMA'
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRICE_UNIT'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072' '#1096#1090
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRICE_M2'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072' '#1084'2'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_LIST'
          Title.Alignment = taCenter
          Title.Caption = #1050#1054#1044
          Visible = True
        end>
    end
    object B_Podrobno_close: TButton
      Left = 776
      Top = 577
      Width = 97
      Height = 33
      Caption = '&'#1057#1082#1088#1099#1090#1100
      TabOrder = 1
      TabStop = False
      OnClick = B_Podrobno_closeClick
    end
    object DBGrid2: TDBGrid
      Left = 8
      Top = 224
      Width = 865
      Height = 249
      TabStop = False
      DataSource = DS_Akt_raspil_detaly_price
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'GRUPA_NAME'
          Title.Alignment = taCenter
          Title.Caption = #1043#1056#1059#1055#1055#1040
          Width = 228
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DETALY_NAME'
          Title.Alignment = taCenter
          Title.Caption = #1044#1045#1058#1040#1051#1048
          Width = 252
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
          FieldName = 'SUMMA'
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072
          Width = 109
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRICE_M2'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072' '#1084'2'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_DETALI'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
          Visible = True
        end>
    end
    object DBGrid5: TDBGrid
      Left = 8
      Top = 478
      Width = 865
      Height = 91
      TabStop = False
      DataSource = DS_Akt_raspil_ostatok_price
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
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
      Columns = <
        item
          Expanded = False
          FieldName = 'LISTY_NAME'
          Title.Alignment = taCenter
          Title.Caption = #1054#1057#1058#1040#1058#1054#1050
          Width = 410
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'KOL_VO'
          Title.Alignment = taCenter
          Title.Caption = #1050#1054#1051'-'#1042#1054
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUMMA'
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRICE_M2'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072' '#1084'2'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_LISTY'
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1076
          Visible = True
        end>
    end
  end
  object IB_Akt_raspil_listy: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from AKT_RASPIL_listy'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into AKT_RASPIL_listy'
      '  (ID, ID_PARENT, ID_PILOMAT_LISTY, KOL_VO)'
      'values'
      '  (:ID, :ID_PARENT, :ID_PILOMAT_LISTY, :KOL_VO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  ID_PILOMAT_LISTY,'
      '  KOL_VO,'
      '  ID'
      'from AKT_RASPIL_listy '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      
        'select l.id id_listy, g.name as grupa_name, l.name as listy_name' +
        ', arl.kol_vo from AKT_RASPIL_listy as arl, pilomat_grupa as g, p' +
        'ilomat_listy as l'
      
        'where (arl.id_pilomat_listy=l.id) and (l.id_grupa=g.id) and (arl' +
        '.id_parent=:ID)'
      'order by l.name')
    ModifySQL.Strings = (
      'update AKT_RASPIL_listy'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_PILOMAT_LISTY = :ID_PILOMAT_LISTY,'
      '  KOL_VO = :KOL_VO'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_AKT_RASPIL_LISTY_ID'
    DataSource = DM_Mebeli.DS_Akt_raspil
    Left = 288
    Top = 48
    object IB_Akt_raspil_listyID_LISTY: TIntegerField
      FieldName = 'ID_LISTY'
      Origin = 'PILOMAT_LISTY.ID'
      Required = True
    end
    object IB_Akt_raspil_listyGRUPA_NAME: TIBStringField
      FieldName = 'GRUPA_NAME'
      Origin = 'PILOMAT_GRUPA.NAME'
      Required = True
      Size = 60
    end
    object IB_Akt_raspil_listyLISTY_NAME: TIBStringField
      FieldName = 'LISTY_NAME'
      Origin = 'PILOMAT_LISTY.NAME'
      Required = True
      Size = 100
    end
    object IB_Akt_raspil_listyKOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'AKT_RASPIL_LISTY.KOL_VO'
    end
  end
  object DS_Akt_raspil_listy: TDataSource
    AutoEdit = False
    DataSet = IB_Akt_raspil_listy
    Left = 328
    Top = 48
  end
  object DS_Akt_raspil_detali: TDataSource
    DataSet = IB_Akt_raspil_detali
    Left = 328
    Top = 80
  end
  object IB_Akt_raspil_detali: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from AKT_RASPIL_DETALI'
      'where'
      '  ID_PARENT = :OLD_ID_PARENT and'
      '  ID_PILOMAT_DETALI = :OLD_ID_PILOMAT_DETALI')
    InsertSQL.Strings = (
      'insert into AKT_RASPIL_DETALI'
      '  (ID_PARENT, ID_PILOMAT_DETALI, ID_SKLAD, KOL_VO)'
      'values'
      '  (:ID_PARENT, :ID_PILOMAT_DETALI, :ID_SKLAD, :KOL_VO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  ID_PILOMAT_DETALI,'
      '  KOL_VO,'
      '  ID_SKLAD'
      'from AKT_RASPIL_DETALI '
      'where'
      '  ID_PARENT = :ID_PARENT and'
      '  ID_PILOMAT_DETALI = :ID_PILOMAT_DETALI')
    SelectSQL.Strings = (
      
        'select g.name as grupa_name, d.id as detali_id, d.name as detali' +
        '_name, ard.kol_vo from AKT_RASPIL_detali as ard, pilomat_grupa a' +
        's g, pilomat_detali as d'
      
        'where (ard.id_pilomat_detali=d.id) and (d.id_grupa=g.id) and (id' +
        '_parent=:id)'
      'order by g.name, d.name')
    ModifySQL.Strings = (
      'update AKT_RASPIL_DETALI'
      'set'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_PILOMAT_DETALI = :ID_PILOMAT_DETALI,'
      '  ID_SKLAD = :ID_SKLAD,'
      '  KOL_VO = :KOL_VO'
      'where'
      '  ID_PARENT = :OLD_ID_PARENT and'
      '  ID_PILOMAT_DETALI = :OLD_ID_PILOMAT_DETALI')
    DataSource = DM_Mebeli.DS_Akt_raspil
    Left = 288
    Top = 80
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
  end
  object IB_Akt_raspil_listy_price: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from AKT_RASPIL_listy'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into AKT_RASPIL_listy'
      '  (ID, ID_PARENT, ID_PILOMAT_LISTY, KOL_VO)'
      'values'
      '  (:ID, :ID_PARENT, :ID_PILOMAT_LISTY, :KOL_VO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  ID_PILOMAT_LISTY,'
      '  KOL_VO,'
      '  ID'
      'from AKT_RASPIL_listy '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      
        'select l.id id_list, g.name as grupa_name, l.name as listy_name,' +
        ' arl.kol_vo kol_vo, arl.summa summa, arl.summa/arl.kol_vo price_' +
        'unit, arl.summa/arl.kol_vo/(l.area/1000000.000) price_m2'
      
        'from AKT_RASPIL_listy_price as arl, pilomat_grupa as g, pilomat_' +
        'listy as l'
      
        'where (arl.id_pilomat_listy=l.id) and (l.id_grupa=g.id) and ((se' +
        'lect id_parent from akt_raspil_listy where id=arl.id_parent)=:ID' +
        ')'
      'order by l.name')
    ModifySQL.Strings = (
      'update AKT_RASPIL_listy'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_PILOMAT_LISTY = :ID_PILOMAT_LISTY,'
      '  KOL_VO = :KOL_VO'
      'where'
      '  ID = :OLD_ID')
    DataSource = DM_Mebeli.DS_Akt_raspil
    Left = 984
    Top = 64
    object IB_Akt_raspil_listy_priceGRUPA_NAME: TIBStringField
      FieldName = 'GRUPA_NAME'
      Origin = 'PILOMAT_GRUPA.NAME'
      Required = True
      Size = 60
    end
    object IB_Akt_raspil_listy_priceLISTY_NAME: TIBStringField
      FieldName = 'LISTY_NAME'
      Origin = 'PILOMAT_LISTY.NAME'
      Required = True
      Size = 100
    end
    object IB_Akt_raspil_listy_priceKOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'AKT_RASPIL_LISTY_PRICE.KOL_VO'
      Required = True
    end
    object IB_Akt_raspil_listy_priceSUMMA: TIBBCDField
      FieldName = 'SUMMA'
      Origin = 'AKT_RASPIL_LISTY_PRICE.SUMMA'
      DisplayFormat = '### ##0.00'
      Precision = 18
      Size = 3
    end
    object IB_Akt_raspil_listy_priceID_LIST: TIntegerField
      FieldName = 'ID_LIST'
      Origin = 'PILOMAT_LISTY.ID'
      Required = True
    end
    object IB_Akt_raspil_listy_pricePRICE_UNIT: TIBBCDField
      FieldName = 'PRICE_UNIT'
      DisplayFormat = '### ##0.00'
      Precision = 18
      Size = 3
    end
    object IB_Akt_raspil_listy_pricePRICE_M2: TFloatField
      FieldName = 'PRICE_M2'
      DisplayFormat = '### ##0.00'
    end
  end
  object DS_Akt_raspil_listy_Price: TDataSource
    AutoEdit = False
    DataSet = IB_Akt_raspil_listy_price
    Left = 1024
    Top = 64
  end
  object IB_Akt_raspil_detali_price: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from AKT_RASPIL_listy'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into AKT_RASPIL_listy'
      '  (ID, ID_PARENT, ID_PILOMAT_LISTY, KOL_VO)'
      'values'
      '  (:ID, :ID_PARENT, :ID_PILOMAT_LISTY, :KOL_VO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  ID_PILOMAT_LISTY,'
      '  KOL_VO,'
      '  ID'
      'from AKT_RASPIL_listy '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      
        'select d.id id_detali, g.name as grupa_name, d.name as detaly_na' +
        'me, prihd1.kol_vo, prihd1.summa, prihd1.summa/prihd1.kol_vo/(d.a' +
        'rea/1000000.000) price_m2'
      
        'from pilomat_grupa as g, pilomat_detali as d, prihod_detali_1 pr' +
        'ihd1, prihod_detali_0 prihd0'
      
        'where (prihd1.id_pilomat_detali=d.id) and (d.id_grupa=g.id) and ' +
        '(prihd0.id=prihd1.id_parent) and (prihd0.ID_AKT_RASPIL=:ID)'
      'order by d.name')
    ModifySQL.Strings = (
      'update AKT_RASPIL_listy'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_PILOMAT_LISTY = :ID_PILOMAT_LISTY,'
      '  KOL_VO = :KOL_VO'
      'where'
      '  ID = :OLD_ID')
    DataSource = DM_Mebeli.DS_Akt_raspil
    Left = 1056
    Top = 320
    object IB_Akt_raspil_detali_priceGRUPA_NAME: TIBStringField
      FieldName = 'GRUPA_NAME'
      Origin = 'PILOMAT_GRUPA.NAME'
      Required = True
      Size = 60
    end
    object IB_Akt_raspil_detali_priceDETALY_NAME: TIBStringField
      FieldName = 'DETALY_NAME'
      Origin = 'PILOMAT_DETALI.NAME'
      Required = True
      Size = 100
    end
    object IB_Akt_raspil_detali_priceKOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'PRIHOD_DETALI_1.KOL_VO'
      Required = True
    end
    object IB_Akt_raspil_detali_priceSUMMA: TIBBCDField
      FieldName = 'SUMMA'
      Origin = 'PRIHOD_DETALI_1.SUMMA'
      DisplayFormat = '### ##0.00'
      Precision = 18
      Size = 3
    end
    object IB_Akt_raspil_detali_priceID_DETALI: TIntegerField
      FieldName = 'ID_DETALI'
      Origin = 'PILOMAT_DETALI.ID'
      Required = True
    end
    object IB_Akt_raspil_detali_pricePRICE_M2: TFloatField
      FieldName = 'PRICE_M2'
      DisplayFormat = '### ##0.00'
    end
  end
  object DS_Akt_raspil_detaly_price: TDataSource
    AutoEdit = False
    DataSet = IB_Akt_raspil_detali_price
    Left = 1096
    Top = 320
  end
  object IB_Akt_raspil_ostatok_price: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from AKT_RASPIL_listy'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into AKT_RASPIL_listy'
      '  (ID, ID_PARENT, ID_PILOMAT_LISTY, KOL_VO)'
      'values'
      '  (:ID, :ID_PARENT, :ID_PILOMAT_LISTY, :KOL_VO)')
    RefreshSQL.Strings = (
      'Select '
      '  ID_PARENT,'
      '  ID_PILOMAT_LISTY,'
      '  KOL_VO,'
      '  ID'
      'from AKT_RASPIL_listy '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      
        'select l.id id_listy, g.name as grupa_name, l.name as listy_name' +
        ', prl1.kol_vo, prl1.summa, prl1.summa/prl1.kol_vo/(l.area/100000' +
        '0.000) price_m2'
      
        'from pilomat_grupa as g, pilomat_listy as l, prihod_listy_0 prl0' +
        ', prihod_listy_1 prl1, akt_raspil_ostatok arlost'
      
        'where (l.id_grupa=g.id) and (arlost.id_pilomat_listy=l.id) and (' +
        'arlost.id_pilomat_listy=prl1.id_listy)'
      
        'and (prl0.id=prl1.id_parent) and (prl0.id_akt_raspil=arlost.id_p' +
        'arent) and (arlost.id_parent=:ID)'
      'order by l.name')
    ModifySQL.Strings = (
      'update AKT_RASPIL_listy'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_PILOMAT_LISTY = :ID_PILOMAT_LISTY,'
      '  KOL_VO = :KOL_VO'
      'where'
      '  ID = :OLD_ID')
    DataSource = DM_Mebeli.DS_Akt_raspil
    Left = 952
    Top = 496
    object IB_Akt_raspil_ostatok_priceGRUPA_NAME: TIBStringField
      FieldName = 'GRUPA_NAME'
      Origin = 'PILOMAT_GRUPA.NAME'
      Required = True
      Size = 60
    end
    object IB_Akt_raspil_ostatok_priceLISTY_NAME: TIBStringField
      FieldName = 'LISTY_NAME'
      Origin = 'PILOMAT_LISTY.NAME'
      Required = True
      Size = 100
    end
    object IB_Akt_raspil_ostatok_priceKOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'PRIHOD_LISTY_1.KOL_VO'
      Required = True
    end
    object IB_Akt_raspil_ostatok_priceSUMMA: TIBBCDField
      FieldName = 'SUMMA'
      Origin = 'PRIHOD_LISTY_1.SUMMA'
      DisplayFormat = '### ##0.00'
      Precision = 18
      Size = 2
    end
    object IB_Akt_raspil_ostatok_priceID_LISTY: TIntegerField
      FieldName = 'ID_LISTY'
      Origin = 'PILOMAT_LISTY.ID'
      Required = True
    end
    object IB_Akt_raspil_ostatok_pricePRICE_M2: TFloatField
      FieldName = 'PRICE_M2'
      DisplayFormat = '### ##0.00'
    end
  end
  object DS_Akt_raspil_ostatok_price: TDataSource
    AutoEdit = False
    DataSet = IB_Akt_raspil_ostatok_price
    Left = 992
    Top = 496
  end
end
