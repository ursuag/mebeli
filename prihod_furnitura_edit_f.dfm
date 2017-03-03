object F_prihod_furnitura_edit: TF_prihod_furnitura_edit
  Left = 167
  Top = 92
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1040#1082#1090' '#1087#1088#1080#1093#1086#1076#1072' '#1082#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1080#1093
  ClientHeight = 701
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
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
  TextHeight = 18
  object Label6: TLabel
    Left = 200
    Top = 8
    Width = 16
    Height = 18
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
      Top = 8
      Width = 53
      Height = 18
      Caption = #8470' '#1072#1082#1090#1072
    end
    object Label2: TLabel
      Left = 200
      Top = 8
      Width = 16
      Height = 18
      Caption = #1086#1090
    end
    object Label3: TLabel
      Left = 656
      Top = 8
      Width = 45
      Height = 18
      Caption = #1057#1082#1083#1072#1076
    end
    object Label4: TLabel
      Left = 8
      Top = 72
      Width = 59
      Height = 18
      Caption = #1055#1088#1080#1084#1077#1095'.'
    end
    object Label5: TLabel
      Left = 5
      Top = 40
      Width = 79
      Height = 18
      Alignment = taRightJustify
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
    end
    object Label7: TLabel
      Left = 400
      Top = 8
      Width = 29
      Height = 18
      Caption = #1058#1058#1053
    end
    object Label8: TLabel
      Left = 1033
      Top = 46
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
      Top = 4
      Width = 129
      Height = 26
      DataField = 'ID'
      DataSource = DM_Mebeli.DS_Prihod_furnitura_0
      ReadOnly = True
      TabOrder = 0
    end
    object DBE_Date_p: TDBEdit
      Left = 224
      Top = 4
      Width = 169
      Height = 26
      DataField = 'DATE_P'
      DataSource = DM_Mebeli.DS_Prihod_furnitura_0
      TabOrder = 1
      OnExit = DBE_Date_pExit
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 712
      Top = 4
      Width = 281
      Height = 26
      DataField = 'SKLAD_NAME'
      DataSource = DM_Mebeli.DS_Prihod_furnitura_0
      DropDownRows = 20
      TabOrder = 2
    end
    object DBEdit1: TDBEdit
      Left = 80
      Top = 68
      Width = 913
      Height = 26
      DataField = 'PRIMECHANIE'
      DataSource = DM_Mebeli.DS_Prihod_furnitura_0
      TabOrder = 3
      OnExit = DBE_Date_pExit
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 88
      Top = 36
      Width = 529
      Height = 26
      DataField = 'CONTRAGENT_NAME'
      DataSource = DM_Mebeli.DS_Prihod_furnitura_0
      DropDownRows = 20
      TabOrder = 4
    end
    object E_Itogo: TEdit
      Left = 1024
      Top = 68
      Width = 137
      Height = 26
      AutoSelect = False
      AutoSize = False
      ReadOnly = True
      TabOrder = 5
    end
  end
  object DBGrid1: TDBGrid
    Left = 9
    Top = 112
    Width = 1168
    Height = 529
    DataSource = DM_Mebeli.DS_Prihod_furnitura_1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnEditButtonClick = DBGrid1EditButtonClick
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 313
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        DropDownRows = 25
        Expanded = False
        FieldName = 'FURNITURA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
        Width = 391
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 174
        Visible = True
      end
      item
        ButtonStyle = cbsNone
        Expanded = False
        FieldName = 'FURNITURA_EDIZM'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1045#1044'.'#1048#1047#1052'.'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Title.Alignment = taCenter
        Title.Caption = #1057#1059#1052#1052#1040
        Width = 128
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 1
    Top = 652
    Width = 1184
    Height = 45
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object B_Exit: TButton
      Left = 1080
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
      Caption = '&'#1047#1072#1087#1080#1089#1072#1090#1100
      Default = True
      TabOrder = 0
      OnClick = B_OkClick
    end
  end
  object DBEdit2: TDBEdit
    Left = 432
    Top = 4
    Width = 217
    Height = 26
    DataField = 'NOMER_TTN'
    DataSource = DM_Mebeli.DS_Prihod_furnitura_0
    TabOrder = 3
    OnExit = DBE_Date_pExit
  end
end
