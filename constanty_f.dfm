object F_Constanty: TF_Constanty
  Left = 158
  Top = 165
  AutoScroll = False
  Caption = 'F_Constanty'
  ClientHeight = 501
  ClientWidth = 1014
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 18
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1009
    Height = 441
    DataSource = DM_Mebeli.DS_Constanty
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Width = 269
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALUE_CONST'
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Width = 549
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 440
    Width = 1009
    Height = 57
    BevelInner = bvLowered
    TabOrder = 1
    object B_Exit: TButton
      Left = 912
      Top = 11
      Width = 89
      Height = 33
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = B_ExitClick
    end
  end
end
