object F_Rashod_na_gotovprod_furnitura: TF_Rashod_na_gotovprod_furnitura
  Left = 110
  Top = 166
  Width = 906
  Height = 624
  Caption = #1056#1072#1089#1093#1086#1076' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074' '#1085#1072' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1077' '#1087#1088#1086#1076#1091#1082#1094#1080#1080
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Label24: TLabel
    Left = 20
    Top = 84
    Width = 109
    Height = 18
    Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
  end
  object Label1: TLabel
    Left = 248
    Top = 6
    Width = 446
    Height = 19
    Caption = #1054#1090#1095#1077#1090' "'#1056#1072#1089#1093#1086#1076' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074' '#1085#1072' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1077' '#1079#1072' '#1087#1077#1088#1080#1086#1076'"'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 20
    Top = 52
    Width = 119
    Height = 18
    Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
  end
  object L_Process: TLabel
    Left = 544
    Top = 54
    Width = 9
    Height = 37
    Caption = '|'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 531
    Width = 881
    Height = 48
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object B_Exit: TButton
      Left = 768
      Top = 8
      Width = 108
      Height = 33
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 0
    end
    object B_ShowReport: TButton
      Left = 652
      Top = 6
      Width = 105
      Height = 36
      Cursor = crHandPoint
      Caption = '&'#1055#1086#1082#1072#1079#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = B_ShowReportClick
    end
    object B_SelectFurnitura: TButton
      Left = 8
      Top = 4
      Width = 125
      Height = 36
      Cursor = crHandPoint
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1084#1072#1090#1077#1088#1080#1072#1083#1099' '#1076#1083#1103' '#1072#1085#1072#1083#1080#1079#1072
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      OnClick = B_SelectFurnituraClick
    end
    object B_Clear_list: TButton
      Left = 152
      Top = 4
      Width = 125
      Height = 36
      Cursor = crHandPoint
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1084#1072#1090#1077#1088#1080#1072#1083#1099' '#1076#1083#1103' '#1072#1085#1072#1083#1080#1079#1072
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      OnClick = B_Clear_listClick
    end
  end
  object Period_End: TDateTimePicker
    Left = 160
    Top = 80
    Width = 177
    Height = 26
    Date = 41519.393055370370000000
    Time = 41519.393055370370000000
    TabOrder = 1
  end
  object Period_Start: TDateTimePicker
    Left = 160
    Top = 48
    Width = 177
    Height = 26
    Date = 41519.393055370370000000
    Time = 41519.393055370370000000
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 120
    Width = 873
    Height = 393
    DataSource = DS_FURNITURA_LIST_FOR_REPORT
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'ARTICLE'
        Title.Alignment = taCenter
        Title.Caption = #1040#1088#1090#1080#1082#1091#1083
        Width = 92
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
        FieldName = 'FURNITURA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1052#1040#1058#1045#1056#1048#1040#1051
        Width = 336
        Visible = True
      end>
  end
  object DS_FURNITURA_LIST_FOR_REPORT: TDataSource
    AutoEdit = False
    DataSet = IB_FURNITURA_LIST_FOR_REPORT
    Left = 760
    Top = 48
  end
  object IB_FURNITURA_LIST_FOR_REPORT: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from FURNITURA_LIST_FOR_REPORT'
      'where'
      '  ID_FURNITURA = :OLD_ID_FURNITURA')
    RefreshSQL.Strings = (
      'Select '
      '  ID_FURNITURA,'
      '  ARTICLE,'
      '  GRUPA_NAME,'
      '  FURNITURA_NAME'
      'from FURNITURA_LIST_FOR_REPORT '
      'where'
      '  ID_FURNITURA = :ID_FURNITURA')
    SelectSQL.Strings = (
      'select * from '
      'FURNITURA_LIST_FOR_REPORT'
      'order by grupa_name, furnitura_name')
    Left = 824
    Top = 48
  end
end
