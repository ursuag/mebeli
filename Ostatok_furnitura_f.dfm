object F_Ostatok_furnitura: TF_Ostatok_furnitura
  Left = 0
  Top = 123
  AutoScroll = False
  Caption = #1054#1089#1090#1072#1090#1082#1080' '#1089#1099#1088#1100#1103' '#1080' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
  ClientHeight = 670
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
    Height = 249
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
        FieldName = 'SKLAD_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1057#1050#1051#1040#1044
        Width = 175
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIMECHANIE'
        Title.Alignment = taCenter
        Title.Caption = #1055#1056#1048#1052#1045#1063#1040#1053#1048#1045
        Width = 498
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 254
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
        Width = 267
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 117
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ED_IZM'
        Title.Alignment = taCenter
        Title.Caption = #1045#1076'.'#1080#1079#1084'.'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Title.Alignment = taCenter
        Title.Caption = #1057#1059#1052#1052#1040
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072
        Width = 95
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 617
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
    object N1: TMenuItem
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      object N_Insert_main: TMenuItem
        Caption = #1053#1086#1074#1099#1081
        OnClick = N_Insert_mainClick
      end
      object N_Edit_main: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        OnClick = N_Edit_mainClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object N_Delete_main: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = N_Delete_mainClick
      end
    end
    object N_Period_of_view: TMenuItem
      Caption = #1055#1077#1088#1080#1086#1076' '#1087#1088#1086#1089#1084#1086#1090#1088#1072
    end
    object N2: TMenuItem
      Caption = #1048#1084#1087#1086#1088#1090' '#1080#1079' '#1092#1072#1081#1083#1072
      object N3: TMenuItem
        Caption = #1048#1084#1087#1086#1088#1090' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1080' '#1089#1091#1084#1084#1072
        OnClick = N3Click
      end
      object N5: TMenuItem
        Caption = #1048#1084#1087#1086#1088#1090' '#1094#1077#1085#1099
        OnClick = N5Click
      end
    end
  end
  object IB_Prihod_furnitura_1_F: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select fg.name grupa_name, f.name furnitura_name, prf1.id_furnit' +
        'ura, prf1.kol_vo, f.ed_izm, prf1.summa summa, cast(prf1.summa/pr' +
        'f1.kol_vo as numeric(15,2)) price'
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
    object IB_Prihod_furnitura_1_FPRICE: TIBBCDField
      FieldName = 'PRICE'
      DisplayFormat = '### ##0.00'
      Precision = 18
      Size = 2
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
      'select prf0.id, prf0.date_p, prf0.primechanie, s.name sklad_name'
      'from prihod_furnitura_0 prf0'
      ''
      'right join sklad s on prf0.id_sklad=s.id'
      ''
      'where (prf0.is_ostatok is not null)'
      'order by prf0.date_p')
    Left = 312
    Top = 112
  end
  object DS_Prihod_furnitura_0_F: TDataSource
    AutoEdit = False
    DataSet = IB_Prihod_furnitura_0_F
    Left = 360
    Top = 112
  end
  object OpenDialog1: TOpenDialog
    Left = 464
    Top = 96
  end
end
