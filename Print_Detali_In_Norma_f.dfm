object F_Print_Detali_In_Norma: TF_Print_Detali_In_Norma
  Left = 183
  Top = 181
  AutoScroll = False
  Caption = #1059#1095#1072#1089#1090#1080#1077' '#1076#1077#1090#1072#1083#1077#1081' '#1074' '#1085#1086#1088#1084#1072#1093' '#1085#1072' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1077' '#1096#1082#1072#1092#1086#1074
  ClientHeight = 586
  ClientWidth = 890
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Label24: TLabel
    Left = 20
    Top = 52
    Width = 102
    Height = 18
    Caption = #1053#1072' '#1082#1072#1082#1091#1102' '#1076#1072#1090#1091
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 168
    Top = 6
    Width = 483
    Height = 19
    Caption = #1054#1090#1095#1077#1090' "'#1059#1095#1072#1089#1090#1080#1077' '#1076#1077#1090#1072#1083#1077#1081' '#1074' '#1085#1086#1088#1084#1072#1093' '#1085#1072' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1077' '#1096#1082#1072#1092#1086#1074'"'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
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
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 0
    end
    object B_ShowReport: TButton
      Left = 652
      Top = 6
      Width = 105
      Height = 36
      Cursor = crHandPoint
      Caption = '&'#1055#1086#1082#1072#1079#1072#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = B_ShowReportClick
    end
    object B_SelectDetali: TButton
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
      OnClick = B_SelectDetaliClick
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
    Top = 48
    Width = 177
    Height = 26
    Date = 41519.393055370370000000
    Time = 41519.393055370370000000
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 120
    Width = 873
    Height = 393
    DataSource = DS_DETALI_LIST_FOR_REPORT
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_DETALI'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076
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
        FieldName = 'DETALI_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1044#1045#1058#1040#1051#1068
        Width = 336
        Visible = True
      end>
  end
  object ProgressBar1: TProgressBar
    Left = 384
    Top = 40
    Width = 369
    Height = 41
    Smooth = True
    Step = 1
    TabOrder = 3
  end
  object DS_DETALI_LIST_FOR_REPORT: TDataSource
    AutoEdit = False
    DataSet = IB_DETALI_LIST_FOR_REPORT
    Left = 760
    Top = 48
  end
  object IB_DETALI_LIST_FOR_REPORT: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from DETALI_LIST_FOR_REPORT'
      'where'
      '  ID_DETALI = :OLD_ID_DETALI')
    RefreshSQL.Strings = (
      'Select *'
      'from DETALI_LIST_FOR_REPORT '
      'where'
      '  ID_DETALI = :ID_DETALI')
    SelectSQL.Strings = (
      'select * from '
      'DETALI_LIST_FOR_REPORT'
      'order by grupa_name, detali_name')
    Left = 824
    Top = 48
  end
end
