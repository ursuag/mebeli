object F_furnitura_grupa_vidrabot: TF_furnitura_grupa_vidrabot
  Left = 321
  Top = 287
  Width = 598
  Height = 331
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1043#1088#1091#1087#1087#1072' '#1082#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1080#1093
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 0
    Top = 24
    Width = 91
    Height = 20
    Caption = #1048#1084#1103' '#1075#1088#1091#1087#1087#1099':'
  end
  object DBEdit1: TDBEdit
    Left = 104
    Top = 20
    Width = 473
    Height = 28
    DataField = 'NAME'
    DataSource = DM_Mebeli.DS_Furnitura_grupa
    TabOrder = 0
  end
  object GB_Vid_rabot: TGroupBox
    Left = 0
    Top = 104
    Width = 577
    Height = 73
    Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090':'
    TabOrder = 2
    Visible = False
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 8
      Top = 29
      Width = 553
      Height = 28
      DataField = 'VID_RABOT'
      DataSource = DM_Mebeli.DS_Furnitura_grupa
      TabOrder = 0
    end
  end
  object CB_IsUsed_Akt_viprabot: TCheckBox
    Left = 0
    Top = 64
    Width = 337
    Height = 25
    Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1074' "'#1040#1082#1090#1077' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1088#1072#1073#1086#1090'"'
    TabOrder = 1
    OnClick = CB_IsUsed_Akt_viprabotClick
  end
  object Panel1: TPanel
    Left = 2
    Top = 218
    Width = 577
    Height = 73
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 3
    object B_Cancel: TButton
      Left = 440
      Top = 12
      Width = 129
      Height = 49
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = B_CancelClick
    end
    object B_Ok: TButton
      Left = 296
      Top = 12
      Width = 129
      Height = 49
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      TabOrder = 0
      OnClick = B_OkClick
    end
  end
end
