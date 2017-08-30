object F_Sotrudniki: TF_Sotrudniki
  Left = 158
  Top = 102
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
  ClientHeight = 560
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 20
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 681
    Height = 305
    DataSource = DM_Mebeli.DS_Sotrudniki
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'FIO'
        Title.Alignment = taCenter
        Title.Caption = #1060'.'#1048'.'#1054'.'
        Width = 620
        Visible = True
      end>
  end
  object B_Select: TButton
    Left = 592
    Top = 328
    Width = 89
    Height = 33
    Caption = #1042#1099#1073#1088#1072#1090#1100
    TabOrder = 2
    TabStop = False
    Visible = False
    OnClick = B_SelectClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 488
    Width = 681
    Height = 65
    BevelInner = bvLowered
    TabOrder = 1
    object B_Exit: TButton
      Left = 589
      Top = 16
      Width = 89
      Height = 33
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = B_ExitClick
    end
    object B_Edit: TButton
      Left = 112
      Top = 16
      Width = 97
      Height = 33
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = B_EditClick
    end
    object B_Insert: TButton
      Left = 8
      Top = 16
      Width = 97
      Height = 33
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = B_InsertClick
    end
    object B_Delete: TButton
      Left = 216
      Top = 16
      Width = 97
      Height = 33
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 3
      OnClick = B_DeleteClick
    end
  end
end
