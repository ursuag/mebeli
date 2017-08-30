object F_Prihod_furnitura_jurnal: TF_Prihod_furnitura_jurnal
  Left = 0
  Top = 92
  AutoScroll = False
  Caption = #1046#1091#1088#1085#1072#1083' '#1087#1088#1080#1093#1086#1076#1072' '#1082#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1080#1093
  ClientHeight = 681
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1177
    Height = 273
    DataSource = DS_Prihod_furnitura_0_F
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
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_P'
        Title.Alignment = taCenter
        Title.Caption = #1044#1040#1058#1040
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMER_TTN'
        Title.Alignment = taCenter
        Title.Caption = #1058#1058#1053
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SKLAD_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1057#1050#1051#1040#1044
        Width = 175
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRAGENT_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1055#1054#1057#1058#1040#1042#1065#1048#1050
        Width = 224
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Title.Alignment = taCenter
        Title.Caption = #1048#1058#1054#1043#1054
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIMECHANIE'
        Title.Alignment = taCenter
        Title.Caption = #1055#1056#1048#1052#1045#1063#1040#1053#1048#1045
        Width = 301
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 280
    Width = 1177
    Height = 337
    DataSource = DS_Prihod_furnitura_1_F
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
        FieldName = 'ID_FURNITURA'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 319
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FURNITURA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
        Width = 323
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ED_IZM'
        Title.Alignment = taCenter
        Title.Caption = #1045#1076'.'#1080#1079#1084'.'
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Title.Alignment = taCenter
        Title.Caption = #1057#1059#1052#1052#1040
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072
        Width = 82
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 624
    Width = 1176
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
  object IB_Prihod_furnitura_1_F: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select fg.name grupa_name, f.name furnitura_name, prf1.id_furnit' +
        'ura, prf1.kol_vo, f.ed_izm, prf1.summa summa, prf1.summa/prf1.ko' +
        'l_vo price'
      'from furnitura_grupa fg, furnitura f, prihod_furnitura_1 prf1'
      
        'where (fg.id=f.id_parent ) and (prf1.id_furnitura=f.id) and (prf' +
        '1.id_parent=:ID)'
      'order by 1,2')
    DataSource = DS_Prihod_furnitura_0_F
    Left = 688
    Top = 368
    object IB_Prihod_furnitura_1_FGRUPA_NAME: TIBStringField
      FieldName = 'GRUPA_NAME'
      Origin = 'FURNITURA_GRUPA.NAME'
      Required = True
      Size = 50
    end
    object IB_Prihod_furnitura_1_FFURNITURA_NAME: TIBStringField
      FieldName = 'FURNITURA_NAME'
      Origin = 'FURNITURA.NAME'
      Required = True
      Size = 100
    end
    object IB_Prihod_furnitura_1_FID_FURNITURA: TIntegerField
      FieldName = 'ID_FURNITURA'
      Origin = 'PRIHOD_FURNITURA_1.ID_FURNITURA'
      Required = True
    end
    object IB_Prihod_furnitura_1_FKOL_VO: TIBBCDField
      FieldName = 'KOL_VO'
      Origin = 'PRIHOD_FURNITURA_1.KOL_VO'
      Required = True
      Precision = 9
      Size = 3
    end
    object IB_Prihod_furnitura_1_FED_IZM: TIBStringField
      FieldName = 'ED_IZM'
      Origin = 'FURNITURA.ED_IZM'
      Required = True
      Size = 8
    end
    object IB_Prihod_furnitura_1_FSUMMA: TIBBCDField
      FieldName = 'SUMMA'
      Origin = 'PRIHOD_FURNITURA_1.SUMMA'
      DisplayFormat = '### ##0.00'
      Precision = 18
      Size = 2
    end
    object IB_Prihod_furnitura_1_FPRICE: TFloatField
      FieldName = 'PRICE'
      DisplayFormat = '### ##0.00'
    end
  end
  object DS_Prihod_furnitura_1_F: TDataSource
    AutoEdit = False
    DataSet = IB_Prihod_furnitura_1_F
    Left = 736
    Top = 368
  end
  object IB_Prihod_furnitura_0_F: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    RefreshSQL.Strings = (
      'Select *'
      'from prihod_furnitura_0 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      
        'select prf0.id, prf0.date_p, prf0.nomer_ttn, prf0.primechanie, p' +
        'rf1.summa summa, c.name contragent_name, s.name sklad_name'
      'from prihod_furnitura_0 prf0'
      ''
      'right join'
      'contragenty_1 c'
      'on prf0.id_contragent=c.id'
      ''
      'right join sklad s on prf0.id_sklad=s.id'
      ''
      'right join'
      '(select id_parent, sum(summa) summa from prihod_furnitura_1 prf1'
      'group by id_parent) prf1'
      'on prf0.id=prf1.id_parent'
      ''
      'where prf0.date_p>=:date_start'
      'order by prf0.date_p, prf0.id')
    DataSource = DM_Mebeli.DS_Prihod_furnitura_0
    Left = 312
    Top = 112
  end
  object DS_Prihod_furnitura_0_F: TDataSource
    AutoEdit = False
    DataSet = IB_Prihod_furnitura_0_F
    Left = 360
    Top = 112
  end
end
