object F_Akt_vip_prod_edit: TF_Akt_vip_prod_edit
  Left = 0
  Top = 0
  Anchors = []
  AutoScroll = False
  Caption = #1040#1082#1090' '#1074#1099#1087#1091#1089#1082#1072' '#1075#1086#1090#1086#1074#1086#1081' '#1087#1088#1086#1076#1091#1082#1094#1080#1080
  ClientHeight = 690
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
  PrintScale = poNone
  Scaled = False
  ShowHint = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 18
  object P_OK_Cancel: TPanel
    Left = 0
    Top = 658
    Width = 1185
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
      TabOrder = 0
      OnClick = B_OkClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 88
    Width = 1177
    Height = 561
    DataSource = DM_Mebeli.DS_Akt_vip_prod_1
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
    OnEnter = DBGrid1Enter
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'ID_GOTOV_PROD'
        ReadOnly = True
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
        Width = 324
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GOTOVPROD_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
        Width = 500
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 145
        Visible = True
      end>
  end
  object P_Shapka: TPanel
    Left = 0
    Top = 0
    Width = 1177
    Height = 81
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
      Left = 136
      Top = 8
      Width = 16
      Height = 18
      Caption = #1086#1090
    end
    object Label3: TLabel
      Left = 8
      Top = 48
      Width = 108
      Height = 18
      Caption = #1057#1082#1083#1072#1076' '#1086#1090#1087#1091#1089#1082#1072':'
    end
    object Label4: TLabel
      Left = 538
      Top = 48
      Width = 132
      Height = 18
      Caption = #1057#1082#1083#1072#1076' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
    end
    object Label5: TLabel
      Left = 288
      Top = 8
      Width = 69
      Height = 18
      Caption = #8470' '#1079#1072#1082#1072#1079#1072
    end
    object B_Select_Zakaz: TSpeedButton
      Left = 432
      Top = 4
      Width = 33
      Height = 24
      Hint = #1042#1099#1073#1086#1088' '#1079#1072#1082#1072#1079#1072
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = B_Select_ZakazClick
    end
    object Label6: TLabel
      Left = 581
      Top = 8
      Width = 89
      Height = 18
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object DBE_NOMER: TDBEdit
      Left = 64
      Top = 4
      Width = 65
      Height = 26
      DataField = 'NOMER'
      DataSource = DM_Mebeli.DS_Akt_vip_prod_0
      ReadOnly = True
      TabOrder = 0
    end
    object DBE_Date_a: TDBEdit
      Left = 160
      Top = 4
      Width = 129
      Height = 26
      DataField = 'DATE_A'
      DataSource = DM_Mebeli.DS_Akt_vip_prod_0
      TabOrder = 1
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 128
      Top = 44
      Width = 393
      Height = 26
      DataField = 'Sklad_otkuda'
      DataSource = DM_Mebeli.DS_Akt_vip_prod_0
      ReadOnly = True
      TabOrder = 3
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 688
      Top = 44
      Width = 481
      Height = 26
      DataField = 'SKLAD_KUDA'
      DataSource = DM_Mebeli.DS_Akt_vip_prod_0
      DropDownRows = 50
      TabOrder = 4
    end
    object DBE_ID_Zakaz: TDBEdit
      Left = 356
      Top = 4
      Width = 73
      Height = 26
      DataField = 'ID_ZAKAZ'
      DataSource = DM_Mebeli.DS_Akt_vip_prod_0
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit1: TDBEdit
      Left = 688
      Top = 4
      Width = 481
      Height = 26
      DataField = 'PRIMECHANIE'
      DataSource = DM_Mebeli.DS_Akt_vip_prod_0
      TabOrder = 5
    end
  end
end
