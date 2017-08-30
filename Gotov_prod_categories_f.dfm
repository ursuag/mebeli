object F_Gotov_prod_categories: TF_Gotov_prod_categories
  Left = 148
  Top = 198
  Width = 700
  Height = 412
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1082#1072#1090#1077#1075#1086#1088#1080#1081' '#1075#1086#1090#1086#1074#1086#1081' '#1087#1088#1086#1076#1091#1082#1094#1080#1080
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial Narrow'
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
    DataSource = DM_Mebeli.DS_GOTOV_PROD_CATEGORIES
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
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1050#1040#1058#1045#1043#1054#1056#1048#1071
        Width = 620
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 1
    Top = 306
    Width = 681
    Height = 65
    BevelInner = bvLowered
    TabOrder = 1
    object B_Exit: TButton
      Left = 568
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
  object B_Select: TButton
    Left = 563
    Top = 322
    Width = 89
    Height = 33
    Caption = #1042#1099#1073#1088#1072#1090#1100
    TabOrder = 2
    TabStop = False
    OnClick = B_SelectClick
  end
end
