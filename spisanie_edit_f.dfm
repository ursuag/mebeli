object F_Spisanie_edit: TF_Spisanie_edit
  Left = 0
  Top = 62
  AutoScroll = False
  Caption = #1040#1082#1090' '#1089#1087#1080#1089#1072#1085#1080#1103
  ClientHeight = 702
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 20
  object Label4: TLabel
    Left = 824
    Top = 338
    Width = 193
    Height = 16
    Caption = #1055#1056#1054#1041#1045#1051'  - '#1080#1079#1084#1077#1085#1080#1090#1100' '#1054#1055#1051#1040#1058#1059
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBGR_DETALI: TDBGrid
    Left = 0
    Top = 352
    Width = 1169
    Height = 257
    DataSource = DM_Mebeli.DS_Spisanie_detali
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnEditButtonClick = DBGR_DETALIEditButtonClick
    OnKeyPress = DBGR_DETALIKeyPress
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 290
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'DETALI_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1044#1045#1058#1040#1051#1048
        Width = 334
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDRABOT_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1042#1048#1044' '#1056#1040#1041#1054#1058
        Width = 194
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OPLATA_NAME'
        PickList.Strings = (
          #1044#1040
          #1053#1045#1058)
        ReadOnly = True
        Title.Caption = #1054#1055#1051#1040#1058#1040
        Width = 83
        Visible = True
      end>
  end
  object P_Buttons: TPanel
    Left = 8
    Top = 624
    Width = 1161
    Height = 57
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object B_Exit: TButton
      Left = 1024
      Top = 12
      Width = 97
      Height = 33
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 1
      OnClick = B_ExitClick
    end
    object B_Ok: TButton
      Left = 920
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
    Left = 8
    Top = 0
    Width = 1161
    Height = 73
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    OnExit = P_ShapkaExit
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 48
      Height = 18
      Caption = #1040#1082#1090' '#8470' '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 176
      Top = 12
      Width = 15
      Height = 18
      Caption = #1086#1090
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 338
      Top = 12
      Width = 47
      Height = 18
      Caption = #1057#1082#1083#1072#1076
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 44
      Width = 62
      Height = 18
      Caption = #1055#1088#1080#1084#1077#1095'.'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 618
      Top = 12
      Width = 86
      Height = 18
      Caption = #1057#1090#1072#1090#1100#1103' '#1088#1072#1089#1093
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBE_ID: TDBEdit
      Left = 56
      Top = 8
      Width = 121
      Height = 28
      DataField = 'ID'
      DataSource = DM_Mebeli.DS_Spisanie_0
      ReadOnly = True
      TabOrder = 0
    end
    object DBE_Date_SPIS: TDBEdit
      Left = 201
      Top = 8
      Width = 128
      Height = 28
      DataField = 'DATE_SPIS'
      DataSource = DM_Mebeli.DS_Spisanie_0
      TabOrder = 1
    end
    object CB_Sklad: TDBLookupComboBox
      Left = 392
      Top = 8
      Width = 217
      Height = 28
      DataField = 'SKLAD_NAME'
      DataSource = DM_Mebeli.DS_Spisanie_0
      NullValueKey = 46
      TabOrder = 2
      OnExit = CB_SkladExit
    end
    object DBEdit1: TDBEdit
      Left = 74
      Top = 40
      Width = 919
      Height = 28
      DataField = 'PRIMECHANIE'
      DataSource = DM_Mebeli.DS_Spisanie_0
      TabOrder = 3
    end
  end
  object DBG_Furn: TDBGrid
    Left = 594
    Top = 80
    Width = 575
    Height = 257
    DataSource = DM_Mebeli.DS_Spisanie_furnitura
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnExit = DBG_FurnExit
    Columns = <
      item
        Expanded = False
        FieldName = 'FURNITURA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1052#1055#1051#1045#1050#1058#1059#1070#1065#1048#1045
        Width = 334
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
      end>
  end
  object DBG_Listy: TDBGrid
    Left = 8
    Top = 80
    Width = 577
    Height = 257
    DataSource = DM_Mebeli.DS_Spisanie_listy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'LISTY_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1051#1048#1057#1058#1067
        Width = 381
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
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 712
    Top = 8
    Width = 289
    Height = 28
    DataField = 'STATYA_NAME'
    DataSource = DM_Mebeli.DS_Spisanie_0
    NullValueKey = 46
    TabOrder = 5
    OnExit = CB_SkladExit
  end
end
