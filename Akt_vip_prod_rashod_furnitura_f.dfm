object F_Akt_vip_prod_rashod_furnitura: TF_Akt_vip_prod_rashod_furnitura
  Left = 155
  Top = 0
  Width = 1200
  Height = 728
  Caption = #1040#1082#1090' '#1074#1099#1087#1091#1089#1082#1072' '#1087#1088#1086#1076#1091#1082#1094#1080#1080' - '#1092#1091#1088#1085#1080#1090#1091#1088#1072
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 4
    Width = 37
    Height = 13
    Caption = #8470' '#1072#1082#1090#1072
  end
  object Label2: TLabel
    Left = 136
    Top = 4
    Width = 11
    Height = 13
    Caption = #1086#1090
  end
  object DBGrid1: TDBGrid
    Left = 2
    Top = 27
    Width = 1175
    Height = 622
    DataSource = DM_Mebeli.DS_Rashod_furnitura
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEditButtonClick = DBGrid1EditButtonClick
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'ID_FURNITURA'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GRUPA_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 328
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'FURNITURA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1052#1055#1051#1045#1050#1058#1059#1070#1065#1048#1045
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 452
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ED_IZM'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1045#1044'.'#1048#1047#1052'.'
        Title.Font.Charset = RUSSIAN_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 91
        Visible = True
      end>
  end
  object DBE_NOMER: TDBEdit
    Left = 64
    Top = 0
    Width = 65
    Height = 21
    DataField = 'NOMER'
    DataSource = DM_Mebeli.DS_Akt_vip_prod_0
    ReadOnly = True
    TabOrder = 1
  end
  object DBE_Date_a: TDBEdit
    Left = 160
    Top = 0
    Width = 129
    Height = 21
    DataField = 'DATE_A'
    DataSource = DM_Mebeli.DS_Akt_vip_prod_0
    ReadOnly = True
    TabOrder = 2
  end
  object P_OK_Cancel: TPanel
    Left = 0
    Top = 659
    Width = 1182
    Height = 45
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
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
end
