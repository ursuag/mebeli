object F_pilomat_grupa: TF_pilomat_grupa
  Left = 260
  Top = 245
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1043#1088#1091#1087#1087#1099' '#1087#1080#1083#1086#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
  ClientHeight = 434
  ClientWidth = 664
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
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 0
    Top = 8
    Width = 27
    Height = 18
    Caption = #1050#1086#1076
  end
  object Label2: TLabel
    Left = 144
    Top = 8
    Width = 57
    Height = 18
    Caption = #1040#1088#1090#1080#1082#1091#1083
  end
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 116
    Height = 18
    Caption = #1050#1086#1076' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 145
    Width = 665
    Height = 209
    DataSource = DM_Mebeli.DS_Pilomat_grupa_vidrabot
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Visible = False
    OnExit = DBGrid1Exit
    Columns = <
      item
        Expanded = False
        FieldName = 'Vid_rabot'
        Title.Alignment = taCenter
        Title.Caption = #1069#1090#1072#1087#1099' '#1088#1072#1073#1086#1090
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 635
        Visible = True
      end>
  end
  object DBE_Grupa_name: TDBEdit
    Left = 0
    Top = 54
    Width = 657
    Height = 26
    BevelOuter = bvRaised
    DataField = 'NAME'
    DataSource = DM_Mebeli.DS_Pilomat_grupa
    TabOrder = 2
    OnExit = DBE_Grupa_nameExit
  end
  object Panel1: TPanel
    Left = -8
    Top = 377
    Width = 662
    Height = 57
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 5
    object B_Exit: TButton
      Left = 552
      Top = 12
      Width = 97
      Height = 33
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
      OnClick = B_ExitClick
    end
    object B_Ok: TButton
      Left = 440
      Top = 12
      Width = 97
      Height = 33
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      TabOrder = 0
      OnClick = B_OkClick
    end
  end
  object DBE_ID: TDBEdit
    Left = 44
    Top = 4
    Width = 93
    Height = 26
    BevelOuter = bvRaised
    Color = cl3DLight
    DataField = 'ID'
    DataSource = DM_Mebeli.DS_Pilomat_grupa
    ReadOnly = True
    TabOrder = 0
    OnExit = DBE_Grupa_nameExit
  end
  object DBE_Article: TDBEdit
    Left = 212
    Top = 4
    Width = 165
    Height = 26
    BevelOuter = bvRaised
    DataField = 'ARTICLE'
    DataSource = DM_Mebeli.DS_Pilomat_grupa
    TabOrder = 1
    OnExit = DBE_Grupa_nameExit
  end
  object DB_MANUFACTURER_CODE: TDBEdit
    Left = 135
    Top = 86
    Width = 522
    Height = 26
    BevelOuter = bvRaised
    DataField = 'MANUFACTURER_CODE'
    DataSource = DM_Mebeli.DS_Pilomat_grupa
    TabOrder = 3
    OnExit = DBE_Grupa_nameExit
  end
end
