object F_Peremeschenie_edit: TF_Peremeschenie_edit
  Left = 128
  Top = 0
  BorderStyle = bsSingle
  Caption = #1040#1082#1090' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103' '#1087#1086' '#1089#1082#1083#1072#1076#1091
  ClientHeight = 690
  ClientWidth = 1176
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 18
  object DBGR_DETALI: TDBGrid
    Left = 640
    Top = 368
    Width = 529
    Height = 281
    DataSource = DM_Mebeli.DS_Peremeschenie_detali
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnEnter = DBGR_DETALIEnter
    Columns = <
      item
        Expanded = False
        FieldName = 'DETALI_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1044#1045#1058#1040#1051#1048
        Width = 278
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDRABOT_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1042#1048#1044' '#1056#1040#1041#1054#1058
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 82
        Visible = True
      end>
  end
  object P_Buttons: TPanel
    Left = 0
    Top = 656
    Width = 1169
    Height = 57
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object B_Exit: TButton
      Left = 1064
      Top = 12
      Width = 97
      Height = 33
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 1
      OnClick = B_ExitClick
    end
    object B_Ok: TButton
      Left = 960
      Top = 12
      Width = 97
      Height = 33
      Hint = '[Ctrl+End] '#1089#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1074#1099#1081#1090#1080
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      TabOrder = 0
      OnClick = B_OkClick
    end
  end
  object P_Shapka: TPanel
    Left = 0
    Top = 0
    Width = 1017
    Height = 65
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 50
      Height = 18
      Caption = #1040#1082#1090' '#8470' '
    end
    object Label2: TLabel
      Left = 192
      Top = 12
      Width = 16
      Height = 18
      Caption = #1086#1090
    end
    object Label3: TLabel
      Left = 546
      Top = 12
      Width = 112
      Height = 18
      Caption = #1057#1082#1083#1072#1076' '#1080#1089#1090#1086#1095#1085#1080#1082
    end
    object Label4: TLabel
      Left = 528
      Top = 39
      Width = 132
      Height = 18
      Caption = #1057#1082#1083#1072#1076' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
    end
    object Label5: TLabel
      Left = 0
      Top = 39
      Width = 59
      Height = 18
      Caption = #1055#1088#1080#1084#1077#1095'.'
    end
    object DBE_ID: TDBEdit
      Left = 48
      Top = 8
      Width = 121
      Height = 26
      DataField = 'ID'
      DataSource = DM_Mebeli.DS_Peremeschenie_0
      ReadOnly = True
      TabOrder = 0
    end
    object DBE_Date_PER: TDBEdit
      Left = 233
      Top = 8
      Width = 224
      Height = 26
      DataField = 'DATE_PER'
      DataSource = DM_Mebeli.DS_Peremeschenie_0
      TabOrder = 1
      OnExit = DBE_Date_PERExit
    end
    object CB_Sklad_otkuda: TDBLookupComboBox
      Left = 652
      Top = 8
      Width = 357
      Height = 26
      DataField = 'SKLAD_OTKUDA_NAME'
      DataSource = DM_Mebeli.DS_Peremeschenie_0
      NullValueKey = 46
      TabOrder = 2
    end
    object CB_Sklad_kuda: TDBLookupComboBox
      Left = 652
      Top = 35
      Width = 357
      Height = 26
      DataField = 'SKLAD_KUDA_NAME'
      DataSource = DM_Mebeli.DS_Peremeschenie_0
      NullValueKey = 46
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 62
      Top = 35
      Width = 443
      Height = 26
      DataField = 'PRIMECHANIE'
      DataSource = DM_Mebeli.DS_Peremeschenie_0
      TabOrder = 4
    end
  end
  object DBG_Furnitura: TDBGrid
    Left = 4
    Top = 66
    Width = 1165
    Height = 295
    DataSource = DM_Mebeli.DS_Peremeschenie_furnitura
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnEditButtonClick = DBG_FurnituraEditButtonClick
    OnEnter = DBG_FurnituraEnter
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_FURNITURA'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Width = 124
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GRUPA_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 270
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'FURNITURA_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1052#1055#1051#1045#1050#1058#1059#1070#1065#1048#1045
        Width = 346
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EDIZM_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1045#1044'.'#1048#1047#1052'.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOTRUDNIK_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1052#1072#1090'.'#1086#1090#1074#1077#1090'. '#1083#1080#1094#1086
        Width = 184
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'X'
        Width = 43
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 3
    Top = 368
    Width = 622
    Height = 281
    DataSource = DM_Mebeli.DS_Peremeschenie_listy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnEnter = DBGrid2Enter
    Columns = <
      item
        Expanded = False
        FieldName = 'LISTY_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1051#1048#1057#1058#1067
        Width = 331
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 59
        Visible = True
      end>
  end
end
