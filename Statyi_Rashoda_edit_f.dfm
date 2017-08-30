object F_Statyi_Rashoda_edit: TF_Statyi_Rashoda_edit
  Left = 0
  Top = 42
  Width = 1200
  Height = 740
  Caption = #1057#1090#1072#1090#1100#1103' '#1088#1072#1089#1093#1086#1076#1072
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
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 64
    Top = 8
    Width = 49
    Height = 18
    Caption = #1043#1088#1091#1087#1087#1072
  end
  object Label2: TLabel
    Left = 8
    Top = 42
    Width = 108
    Height = 18
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object B_Gruap_clear: TSpeedButton
    Left = 546
    Top = 5
    Width = 27
    Height = 24
    Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1075#1088#1091#1087#1087#1091'.'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333333333333333333FFF33FF333FFF339993370733
      999333777FF37FF377733339993000399933333777F777F77733333399970799
      93333333777F7377733333333999399933333333377737773333333333990993
      3333333333737F73333333333331013333333333333777FF3333333333910193
      333333333337773FF3333333399000993333333337377737FF33333399900099
      93333333773777377FF333399930003999333337773777F777FF339993370733
      9993337773337333777333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
  end
  object Panel1: TPanel
    Left = 1
    Top = 616
    Width = 1176
    Height = 49
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object B_Exit: TButton
      Left = 1082
      Top = 8
      Width = 84
      Height = 33
      Caption = '&'#1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
    object B_Ok: TButton
      Left = 980
      Top = 8
      Width = 84
      Height = 33
      Hint = '[Ctrl+End] '#1089#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1074#1099#1081#1090#1080
      Caption = '&'#1047#1072#1087#1080#1089#1072#1090#1100
      Default = True
      TabOrder = 0
      OnClick = B_OkClick
    end
  end
  object CB_Grupa: TComboBox
    Left = 126
    Top = 6
    Width = 417
    Height = 26
    AutoDropDown = True
    Style = csDropDownList
    ItemHeight = 18
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object DBE_Name: TDBEdit
    Left = 125
    Top = 40
    Width = 417
    Height = 26
    DataField = 'NAME'
    DataSource = DS_Statya_rashoda_edit
    TabOrder = 1
  end
  object CB_Sebestoimosti: TCheckBox
    Left = 8
    Top = 83
    Width = 225
    Height = 17
    Alignment = taLeftJustify
    Caption = #1051#1086#1078#1080#1090#1089#1103' '#1085#1072' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1100
    TabOrder = 2
    OnClick = CB_SebestoimostiClick
  end
  object CB_is_Rashod: TCheckBox
    Left = 72
    Top = 107
    Width = 161
    Height = 17
    Alignment = taLeftJustify
    Caption = #1060#1086#1088#1084#1080#1088#1091#1077#1090' '#1088#1072#1089#1093#1086#1076
    TabOrder = 3
    OnClick = CB_is_RashodClick
  end
  object DS_Statya_rashoda_edit: TDataSource
    DataSet = IB_Statya_rashoda_edit
    Left = 1104
    Top = 56
  end
  object IB_Statya_rashoda_edit: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from STATYI_RASHODA'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into STATYI_RASHODA'
      '  (ID, ID_PARENT, NAME, IS_SEBESTOIMOSTI, IS_RASHOD)'
      'values'
      '  (:ID, :ID_PARENT, :NAME, :IS_SEBESTOIMOSTI, :IS_RASHOD)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_PARENT,'
      '  NAME,'
      '  IS_SEBESTOIMOSTI,'
      '  IS_RASHOD'
      'from STATYI_RASHODA '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from STATYI_RASHODA'
      'where id=:ID')
    ModifySQL.Strings = (
      'update STATYI_RASHODA'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  NAME = :NAME,'
      '  IS_SEBESTOIMOSTI = :IS_SEBESTOIMOSTI,'
      '  IS_RASHOD = :IS_RASHOD'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_STATYA_RASH_PRIH'
    Left = 1056
    Top = 56
  end
end
