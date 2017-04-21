object F_Furnitura: TF_Furnitura
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1080#1077
  ClientHeight = 670
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object DBG_Furnitura: TDBGrid
    Left = 504
    Top = 0
    Width = 673
    Height = 601
    DataSource = DM_Mebeli.DS_Furnitura
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDblClick = DBG_FurnituraDblClick
    OnKeyUp = DBG_FurnituraKeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'ARTICLE'
        Title.Alignment = taCenter
        Title.Caption = #1040#1088#1090
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 367
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ED_IZM'
        PickList.Strings = (
          #1096#1090'.'
          #1084
          #1082#1075
          #1091#1087#1072#1082)
        Title.Alignment = taCenter
        Title.Caption = #1045#1076'.'#1080#1079#1084'.'
        Width = 86
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 616
    Width = 1172
    Height = 49
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 1
    object B_Exit: TButton
      Left = 1066
      Top = 8
      Width = 97
      Height = 33
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 0
      OnClick = B_ExitClick
    end
    object B_Select: TButton
      Left = 962
      Top = 8
      Width = 97
      Height = 33
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ModalResult = 1
      TabOrder = 1
      OnClick = B_SelectClick
    end
    object E_Grupa_Filter: TEdit
      Left = 7
      Top = 11
      Width = 385
      Height = 28
      TabStop = False
      TabOrder = 2
      Text = #1042#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1087#1086' '#1075#1088#1091#1087#1087#1077
      OnEnter = E_Grupa_FilterEnter
      OnExit = E_Grupa_FilterExit
      OnKeyUp = E_Grupa_FilterKeyUp
    end
    object E_Furnitura_Filter: TEdit
      Left = 562
      Top = 11
      Width = 385
      Height = 28
      TabOrder = 3
      Text = #1042#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
      OnEnter = E_Furnitura_FilterEnter
      OnExit = E_Furnitura_FilterExit
      OnKeyUp = E_Furnitura_FilterKeyUp
    end
  end
  object DBG_Grupa: TDBGrid
    Left = 0
    Top = 0
    Width = 497
    Height = 601
    TabStop = False
    DataSource = DM_Mebeli.DS_Furnitura_grupa
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDblClick = DBG_GrupaDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 405
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 104
    object N_Insert: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      object N_Insert_grupa: TMenuItem
        Caption = #1043#1088#1091#1087#1087#1091
        OnClick = N_Insert_grupaClick
      end
      object N_Insert_furnitura: TMenuItem
        Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1080#1077
        OnClick = N_Insert_furnituraClick
      end
    end
    object N_Edit: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      object N_Edit_grupa: TMenuItem
        Caption = #1043#1088#1091#1087#1087#1091
        OnClick = N_Edit_grupaClick
      end
      object N_Edit_furnitura: TMenuItem
        Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1080#1077
        OnClick = N_Edit_furnituraClick
      end
    end
    object N_Delete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      object N_Delete_grupa: TMenuItem
        Caption = #1043#1088#1091#1087#1087#1091
        OnClick = N_Delete_grupaClick
      end
      object N_Delete_furnitura: TMenuItem
        Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1080#1077
        OnClick = N_Delete_furnituraClick
      end
    end
    object N_Close: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N_CloseClick
    end
  end
end
