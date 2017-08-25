object F_Contragenty_edit: TF_Contragenty_edit
  Left = 98
  Top = 150
  Width = 872
  Height = 464
  Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 204
    Height = 18
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072':'
  end
  object Label2: TLabel
    Left = 8
    Top = 72
    Width = 121
    Height = 18
    Caption = #1060#1080#1089#1082#1072#1083#1100#1085#1099#1081' '#1082#1086#1076':'
  end
  object DBEdit1: TDBEdit
    Left = 224
    Top = 40
    Width = 593
    Height = 26
    DataField = 'NAME'
    DataSource = DM_Mebeli.DS_Contragenty_1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 224
    Top = 72
    Width = 265
    Height = 26
    DataField = 'CODFISCAL'
    DataSource = DM_Mebeli.DS_Contragenty_1
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 8
    Top = 361
    Width = 841
    Height = 57
    BevelInner = bvLowered
    TabOrder = 2
    object B_Ok: TButton
      Left = 632
      Top = 11
      Width = 89
      Height = 33
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
      OnClick = B_OkClick
    end
    object B_Cancel: TButton
      Left = 736
      Top = 11
      Width = 89
      Height = 33
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
    end
  end
end
