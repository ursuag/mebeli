object F_Prihod_listy_edit: TF_Prihod_listy_edit
  Left = 0
  Top = 114
  ActiveControl = B_Exit
  AutoScroll = False
  Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103' - '#1087#1088#1080#1093#1086#1076' '#1083#1080#1089#1090#1086#1074#1099#1093' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
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
  ShowHint = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 20
  object Label7: TLabel
    Left = 392
    Top = 12
    Width = 18
    Height = 20
    Caption = #1086#1090
  end
  object P_Shapka: TPanel
    Left = 0
    Top = 0
    Width = 1177
    Height = 105
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 47
      Height = 20
      Caption = #8470' '#1076#1086#1082
    end
    object Label2: TLabel
      Left = 144
      Top = 12
      Width = 18
      Height = 20
      Caption = #1086#1090
    end
    object Label3: TLabel
      Left = 592
      Top = 12
      Width = 116
      Height = 20
      Caption = #1057#1090#1072#1090#1100#1103' '#1076#1086#1093#1086#1076#1072
    end
    object Label4: TLabel
      Left = 8
      Top = 76
      Width = 63
      Height = 20
      Caption = #1055#1088#1080#1084#1077#1095'.'
    end
    object Label5: TLabel
      Left = 363
      Top = 44
      Width = 86
      Height = 20
      Alignment = taRightJustify
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
    end
    object Label6: TLabel
      Left = 0
      Top = 44
      Width = 49
      Height = 20
      Caption = #1057#1082#1083#1072#1076
    end
    object Label8: TLabel
      Left = 344
      Top = 12
      Width = 30
      Height = 20
      Caption = #1058#1058#1053
    end
    object Label9: TLabel
      Left = 1038
      Top = 54
      Width = 107
      Height = 19
      Alignment = taRightJustify
      Caption = #1048#1090#1086#1075#1086' '#1087#1086' '#1058#1058#1053
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBE_ID: TDBEdit
      Left = 64
      Top = 8
      Width = 81
      Height = 28
      DataField = 'ID'
      DataSource = DM_Mebeli.DS_Prihod_listy_0
      ReadOnly = True
      TabOrder = 0
    end
    object DBE_Date_p: TDBEdit
      Left = 168
      Top = 8
      Width = 169
      Height = 28
      DataField = 'DATE_P'
      DataSource = DM_Mebeli.DS_Prihod_listy_0
      TabOrder = 1
      OnExit = DBE_Date_pExit
    end
    object DBL_STATYA_DOHODA: TDBLookupComboBox
      Left = 720
      Top = 8
      Width = 289
      Height = 28
      DataField = 'STATYA_DOHODA'
      DataSource = DM_Mebeli.DS_Prihod_listy_0
      DropDownRows = 20
      TabOrder = 2
    end
    object DBEdit1: TDBEdit
      Left = 80
      Top = 72
      Width = 929
      Height = 28
      DataField = 'PRIMECHANIE'
      DataSource = DM_Mebeli.DS_Prihod_listy_0
      TabOrder = 5
    end
    object DBL_Contragent: TDBLookupComboBox
      Left = 456
      Top = 40
      Width = 553
      Height = 28
      DataField = 'contragent_name'
      DataSource = DM_Mebeli.DS_Prihod_listy_0
      DropDownRows = 20
      TabOrder = 4
    end
    object DBL_Sklad: TDBLookupComboBox
      Left = 56
      Top = 40
      Width = 297
      Height = 28
      DataField = 'SKLAD_NAME'
      DataSource = DM_Mebeli.DS_Prihod_listy_0
      DropDownRows = 20
      TabOrder = 3
    end
    object E_Itogo: TEdit
      Left = 1024
      Top = 74
      Width = 137
      Height = 26
      AutoSelect = False
      AutoSize = False
      ReadOnly = True
      TabOrder = 6
    end
  end
  object DBGrid1: TDBGrid
    Left = 1
    Top = 112
    Width = 1176
    Height = 529
    DataSource = DM_Mebeli.DS_Prihod_listy_1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    OnEditButtonClick = DBGrid1EditButtonClick
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_LISTY'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GRUPA_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 310
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        DropDownRows = 15
        Expanded = False
        FieldName = 'LISTY_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
        Width = 437
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054', '#1096#1090
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Title.Alignment = taCenter
        Title.Caption = #1057#1059#1052#1052#1040' '#1079#1072' '#1084#1077#1090#1088#1072#1078
        Width = 135
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 1
    Top = 646
    Width = 1176
    Height = 45
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object B_Exit: TButton
      Left = 1072
      Top = 6
      Width = 97
      Height = 33
      Caption = '&'#1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
      OnClick = B_ExitClick
    end
    object B_Ok: TButton
      Left = 968
      Top = 6
      Width = 97
      Height = 33
      Hint = '[Ctrl+End] '#1089#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1074#1099#1081#1090#1080
      Caption = '&'#1047#1072#1087#1080#1089#1072#1090#1100
      Default = True
      TabOrder = 0
      OnClick = B_OkClick
    end
  end
  object DBEdit2: TDBEdit
    Left = 376
    Top = 8
    Width = 209
    Height = 28
    DataField = 'NOMER_TTN'
    DataSource = DM_Mebeli.DS_Prihod_listy_0
    TabOrder = 3
    OnExit = DBE_Date_pExit
  end
end
