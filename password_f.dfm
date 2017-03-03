object F_Password: TF_Password
  Left = 202
  Top = 180
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
  ClientHeight = 141
  ClientWidth = 441
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 0
    Top = 4
    Width = 144
    Height = 20
    Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  end
  object Label2: TLabel
    Left = 88
    Top = 40
    Width = 58
    Height = 20
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object E_User_Name: TEdit
    Left = 152
    Top = 0
    Width = 289
    Height = 28
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object E_Password: TEdit
    Left = 152
    Top = 36
    Width = 289
    Height = 28
    PasswordChar = '*'
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 76
    Width = 441
    Height = 65
    BevelInner = bvLowered
    BevelOuter = bvSpace
    TabOrder = 2
    object B_Ok: TButton
      Left = 224
      Top = 16
      Width = 97
      Height = 41
      Caption = #1042#1093#1086#1076
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object B_Exit: TButton
      Left = 336
      Top = 16
      Width = 97
      Height = 41
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 3
      TabOrder = 1
      OnClick = B_ExitClick
    end
  end
end
