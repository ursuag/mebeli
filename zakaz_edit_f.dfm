object F_Zakaz_edit: TF_Zakaz_edit
  Left = 0
  Top = 0
  AutoScroll = False
  Caption = #1047#1072#1082#1072#1079
  ClientHeight = 690
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 67
    Height = 18
    Caption = #1047#1072#1082#1072#1079' '#8470' '
  end
  object Label2: TLabel
    Left = 200
    Top = 12
    Width = 16
    Height = 18
    Caption = #1086#1090
  end
  object Label3: TLabel
    Left = 344
    Top = 12
    Width = 89
    Height = 18
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object Panel1: TPanel
    Left = 8
    Top = 635
    Width = 1169
    Height = 45
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object B_Exit: TButton
      Left = 1064
      Top = 6
      Width = 97
      Height = 33
      Cancel = True
      Caption = '&'#1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 0
      OnClick = B_ExitClick
    end
    object B_Ok: TButton
      Left = 960
      Top = 6
      Width = 97
      Height = 33
      Caption = '&'#1047#1072#1087#1080#1089#1072#1090#1100
      Default = True
      TabOrder = 1
      OnClick = B_OkClick
    end
  end
  object DBEdit1: TDBEdit
    Left = 72
    Top = 8
    Width = 121
    Height = 26
    DataField = 'ID'
    DataSource = DM_Mebeli.DS_Zakaz_0
    TabOrder = 1
  end
  object DBE_Date_z: TDBEdit
    Left = 222
    Top = 8
    Width = 115
    Height = 26
    DataField = 'DATE_Z'
    DataSource = DM_Mebeli.DS_Zakaz_0
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 7
    Top = 40
    Width = 1170
    Height = 585
    DataSource = DM_Mebeli.DS_Zakaz_1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnEditButtonClick = DBGrid1EditButtonClick
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
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
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 303
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GOTPROD_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
        Width = 286
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 170
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIORITET'
        Title.Alignment = taCenter
        Title.Caption = #1055#1056#1048#1054#1056#1048#1058#1045#1058
        Width = 141
        Visible = True
      end>
  end
  object DBEdit2: TDBEdit
    Left = 446
    Top = 8
    Width = 731
    Height = 26
    DataField = 'PRIMECHANIE'
    DataSource = DM_Mebeli.DS_Zakaz_0
    TabOrder = 4
  end
end
