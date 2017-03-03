object F_Contragenty: TF_Contragenty
  Left = 165
  Top = 109
  Width = 869
  Height = 619
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
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 500
    Width = 849
    Height = 57
    BevelInner = bvLowered
    TabOrder = 0
    object B_Exit: TButton
      Left = 752
      Top = 12
      Width = 89
      Height = 33
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 0
      OnClick = B_ExitClick
    end
    object B_Select: TButton
      Left = 656
      Top = 12
      Width = 89
      Height = 33
      Cancel = True
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 1
      Visible = False
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 337
    Height = 489
    DataSource = DM_Mebeli.DS_Contragenty_0
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
        Width = 279
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 346
    Top = 0
    Width = 503
    Height = 489
    DataSource = DM_Mebeli.DS_Contragenty_1
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
