object F_Sklad: TF_Sklad
  Left = 182
  Top = 185
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1082#1083#1072#1076#1086#1074
  ClientHeight = 379
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 20
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 681
    Height = 305
    DataSource = DM_Mebeli.DS_Sklad
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1089#1082#1083#1072#1076#1072
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 522
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 312
    Width = 681
    Height = 65
    BevelInner = bvLowered
    TabOrder = 1
    object B_Exit: TButton
      Left = 584
      Top = 16
      Width = 89
      Height = 33
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = B_ExitClick
    end
  end
end
