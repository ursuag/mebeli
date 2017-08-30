object F_Contragenty: TF_Contragenty
  Left = 138
  Top = 124
  Width = 998
  Height = 662
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' "'#1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099'"'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 8
    Top = 540
    Width = 969
    Height = 57
    BevelInner = bvLowered
    TabOrder = 0
    object B_Exit: TButton
      Left = 856
      Top = 12
      Width = 105
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
      OnClick = B_ExitClick
    end
    object B_Select: TButton
      Left = 736
      Top = 12
      Width = 105
      Height = 33
      Cancel = True
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Default = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 0
    Width = 401
    Height = 489
    DataSource = DM_Mebeli.DS_Contragenty_0
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 365
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 416
    Top = 0
    Width = 561
    Height = 489
    DataSource = DM_Mebeli.DS_Contragenty_1
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1053#1058#1056#1040#1043#1045#1053#1058
        Width = 522
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 8
    object N1: TMenuItem
      Caption = #1043#1088#1091#1087#1087#1072
      object N_Grupa_Insert: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        OnClick = N_Grupa_InsertClick
      end
      object N_Grupa_Edit: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        OnClick = N_Grupa_EditClick
      end
      object N_Grupa_Delete: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = N_Grupa_DeleteClick
      end
    end
    object N2: TMenuItem
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      object N_Contragent_Insert: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        OnClick = N_Contragent_InsertClick
      end
      object N_Contragent_edit: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        OnClick = N_Contragent_editClick
      end
      object N_Contragent_Delete: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = N_Contragent_DeleteClick
      end
    end
  end
end
