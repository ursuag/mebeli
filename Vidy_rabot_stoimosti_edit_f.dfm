object F_Vidy_rabot_stoimosti_edit: TF_Vidy_rabot_stoimosti_edit
  Left = 360
  Top = 194
  Width = 569
  Height = 431
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1056#1072#1089#1094#1077#1085#1082#1072' '#1079#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1091#1102' '#1088#1072#1073#1086#1090#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 24
    Top = 72
    Width = 84
    Height = 20
    Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090':'
  end
  object Label2: TLabel
    Left = 63
    Top = 128
    Width = 43
    Height = 20
    Caption = #1044#1072#1090#1072':'
  end
  object Label3: TLabel
    Left = 20
    Top = 232
    Width = 88
    Height = 20
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100':'
  end
  object Label4: TLabel
    Left = 112
    Top = 0
    Width = 305
    Height = 24
    Caption = #1056#1072#1089#1094#1077#1085#1082#1080' '#1079#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1091#1102' '#1088#1072#1073#1086#1090#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 17
    Top = 168
    Width = 80
    Height = 40
    Caption = #1043#1086#1090#1086#1074#1072#1103' '#1087#1088#1086#1076#1091#1082#1094#1080#1103
    WordWrap = True
  end
  object DBE_Vid_Rabot: TDBEdit
    Left = 112
    Top = 68
    Width = 441
    Height = 28
    DataField = 'VID_RABOT_NAME'
    DataSource = DM_Mebeli.DS_Vidy_rabot_stoimosti
    ReadOnly = True
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 348
    Width = 553
    Height = 45
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object B_Exit: TButton
      Left = 448
      Top = 6
      Width = 97
      Height = 33
      Cancel = True
      Caption = '&'#1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 0
      OnClick = B_ExitClick
    end
    object B_Ok: TButton
      Left = 336
      Top = 6
      Width = 97
      Height = 33
      Caption = '&'#1047#1072#1087#1080#1089#1072#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 1
      OnClick = B_OkClick
    end
  end
  object DBE_Date_stoim: TDBEdit
    Left = 112
    Top = 121
    Width = 217
    Height = 28
    DataField = 'DATE_STOIM'
    DataSource = DM_Mebeli.DS_Vidy_rabot_stoimosti
    TabOrder = 1
  end
  object DBE_Price: TDBEdit
    Left = 112
    Top = 228
    Width = 217
    Height = 28
    DataField = 'PRICE'
    DataSource = DM_Mebeli.DS_Vidy_rabot_stoimosti
    TabOrder = 3
  end
  object DB_Gotov_prod: TDBLookupComboBox
    Left = 112
    Top = 174
    Width = 441
    Height = 28
    DataField = 'GOTOV_PROD_NAME'
    DataSource = DM_Mebeli.DS_Vidy_rabot_stoimosti
    TabOrder = 2
  end
end
