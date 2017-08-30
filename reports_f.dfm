object F_Reports: TF_Reports
  Left = 34
  Top = 110
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1054#1090#1095#1077#1090#1099
  ClientHeight = 698
  ClientWidth = 881
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 192
    Height = 20
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1080#1076' '#1086#1090#1095#1077#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PC_Report_select: TPageControl
    Left = 48
    Top = 24
    Width = 833
    Height = 609
    ActivePage = Report_Akt_vip_rab
    HotTrack = True
    MultiLine = True
    TabOrder = 0
    OnChange = PC_Report_selectChange
    object Report_Akt_vip_rab: TTabSheet
      Caption = #1054#1090#1095#1077#1090#1099' '#1087#1086' '#1072#1082#1090#1072#1084' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1088#1072#1073#1086#1090
      ImageIndex = 6
      object Label23: TLabel
        Left = 8
        Top = 35
        Width = 119
        Height = 18
        Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
      end
      object Label24: TLabel
        Left = 20
        Top = 68
        Width = 109
        Height = 18
        Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
      end
      object B_AVR_Sotrudnik_select: TSpeedButton
        Left = 410
        Top = 315
        Width = 27
        Height = 24
        Hint = #1042#1099#1073#1086#1088' '#1057#1086#1090#1088#1091#1076#1085#1080#1082#1072
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
        OnClick = B_AVR_Sotrudnik_selectClick
      end
      object B_AVR_Sotrudnik_clear: TSpeedButton
        Left = 442
        Top = 315
        Width = 27
        Height = 24
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1057#1086#1090#1088#1091#1076#1085#1080#1082
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333333333333333333FFF33FF333FFF339993370733
          999333777FF37FF377733339993000399933333777F777F77733333399970799
          93333333777F7377733333333999399933333333377737773333333333990993
          3333333333737F73333333333331013333333333333777FF3333333333910193
          333333333337773FF3333333399000993333333337377737FF33333399900099
          93333333773777377FF333399930003999333337773777F777FF339993370733
          9993337773337333777333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = B_AVR_Sotrudnik_clearClick
      end
      object B_AVR_gotovprod_clear: TSpeedButton
        Left = 442
        Top = 460
        Width = 27
        Height = 24
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' "'#1043#1086#1090#1086#1074#1072#1103' '#1087#1088#1086#1076#1091#1082#1094#1080#1103'"'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333333333333333333FFF33FF333FFF339993370733
          999333777FF37FF377733339993000399933333777F777F77733333399970799
          93333333777F7377733333333999399933333333377737773333333333990993
          3333333333737F73333333333331013333333333333777FF3333333333910193
          333333333337773FF3333333399000993333333337377737FF33333399900099
          93333333773777377FF333399930003999333337773777F777FF339993370733
          9993337773337333777333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = B_AVR_gotovprod_clearClick
      end
      object B_AVR_gotovprod_select: TSpeedButton
        Left = 410
        Top = 460
        Width = 27
        Height = 24
        Hint = #1042#1099#1073#1086#1088' "'#1043#1086#1090#1086#1074#1086#1081' '#1087#1088#1086#1076#1091#1082#1094#1080#1080'"'
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
        OnClick = B_AVR_gotovprod_selectClick
      end
      object B_AVR_Category_select: TSpeedButton
        Left = 410
        Top = 360
        Width = 27
        Height = 24
        Hint = #1042#1099#1073#1086#1088' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
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
        OnClick = B_AVR_Category_selectClick
      end
      object B_AVR_Category_clear: TSpeedButton
        Left = 442
        Top = 360
        Width = 27
        Height = 24
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1050#1072#1090#1077#1075#1086#1088#1080#1103
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333333333333333333FFF33FF333FFF339993370733
          999333777FF37FF377733339993000399933333777F777F77733333399970799
          93333333777F7377733333333999399933333333377737773333333333990993
          3333333333737F73333333333331013333333333333777FF3333333333910193
          333333333337773FF3333333399000993333333337377737FF33333399900099
          93333333773777377FF333399930003999333337773777F777FF339993370733
          9993337773337333777333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = B_AVR_Category_clearClick
      end
      object B_AVR_Vidrabot_select: TSpeedButton
        Left = 410
        Top = 410
        Width = 27
        Height = 24
        Hint = #1042#1099#1073#1086#1088' '#1074#1080#1076#1072' '#1088#1072#1073#1086#1090
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
        OnClick = B_AVR_Vidrabot_selectClick
      end
      object B_AVR_Vidrabot_clear: TSpeedButton
        Left = 442
        Top = 410
        Width = 27
        Height = 24
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' "'#1042#1080#1076' '#1088#1072#1073#1086#1090'"'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333333333333333333FFF33FF333FFF339993370733
          999333777FF37FF377733339993000399933333777F777F77733333399970799
          93333333777F7377733333333999399933333333377737773333333333990993
          3333333333737F73333333333331013333333333333777FF3333333333910193
          333333333337773FF3333333399000993333333337377737FF33333399900099
          93333333773777377FF333399930003999333337773777F777FF339993370733
          9993337773337333777333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = B_AVR_Vidrabot_clearClick
      end
      object Label19: TLabel
        Left = 8
        Top = 292
        Width = 86
        Height = 19
        Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 8
        Top = 340
        Width = 85
        Height = 19
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 8
        Top = 389
        Width = 83
        Height = 19
        Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object Label22: TLabel
        Left = 8
        Top = 438
        Width = 149
        Height = 19
        Caption = #1043#1086#1090#1086#1074#1072#1103' '#1087#1088#1086#1076#1091#1082#1094#1080#1103
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object Label25: TLabel
        Left = 8
        Top = 486
        Width = 43
        Height = 19
        Caption = #1047#1072#1082#1072#1079
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object B_AVR_zakaz_select: TSpeedButton
        Left = 410
        Top = 508
        Width = 27
        Height = 24
        Hint = #1042#1099#1073#1086#1088' "'#1047#1072#1082#1072#1079#1072'"'
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
        OnClick = B_AVR_zakaz_selectClick
      end
      object SpeedButton2: TSpeedButton
        Left = 442
        Top = 508
        Width = 27
        Height = 24
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' "'#1043#1086#1090#1086#1074#1072#1103' '#1087#1088#1086#1076#1091#1082#1094#1080#1103'"'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333333333333333333FFF33FF333FFF339993370733
          999333777FF37FF377733339993000399933333777F777F77733333399970799
          93333333777F7377733333333999399933333333377737773333333333990993
          3333333333737F73333333333331013333333333333777FF3333333333910193
          333333333337773FF3333333399000993333333337377737FF33333399900099
          93333333773777377FF333399930003999333337773777F777FF339993370733
          9993337773337333777333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = SpeedButton2Click
      end
      object Period_Start: TDateTimePicker
        Left = 160
        Top = 31
        Width = 177
        Height = 26
        Date = 41519.393055370370000000
        Time = 41519.393055370370000000
        TabOrder = 0
      end
      object Period_End: TDateTimePicker
        Left = 160
        Top = 64
        Width = 177
        Height = 26
        Date = 41519.393055370370000000
        Time = 41519.393055370370000000
        TabOrder = 1
      end
      object Panel8: TPanel
        Left = 672
        Top = 472
        Width = 145
        Height = 70
        BevelInner = bvLowered
        TabOrder = 2
        object Button4: TButton
          Left = 20
          Top = 17
          Width = 105
          Height = 36
          Cursor = crHandPoint
          Caption = '&'#1055#1086#1082#1072#1079#1072#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = Button4Click
        end
      end
      object RG_AVR_Report_Type: TRadioGroup
        Left = 0
        Top = 104
        Width = 809
        Height = 177
        Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1090#1080#1087' '#1086#1090#1095#1077#1090#1072
        ItemIndex = 0
        Items.Strings = (
          #1057#1086#1090#1088#1091#1076#1085#1080#1082' > '#1082#1072#1090#1077#1075#1086#1088#1080#1080' + '#1074#1080#1076#1099' '#1088#1072#1073#1086#1090
          #1050#1072#1090#1077#1075#1086#1088#1080#1080' + '#1074#1080#1076#1099' '#1088#1072#1073#1086#1090
          #1043#1086#1090#1086#1074#1072#1103' '#1087#1088#1086#1076#1091#1082#1094#1080#1103' > '#1074#1080#1076#1099' '#1088#1072#1073#1086#1090
          #1055#1086' '#1072#1082#1090#1072#1084' '#1088#1072#1089#1087#1080#1083#1072)
        TabOrder = 3
      end
      object E_AVR_Sotrudnik: TEdit
        Left = 8
        Top = 313
        Width = 393
        Height = 26
        TabStop = False
        ReadOnly = True
        TabOrder = 4
      end
      object E_AVR_Gotovprod: TEdit
        Left = 8
        Top = 458
        Width = 393
        Height = 26
        TabStop = False
        ReadOnly = True
        TabOrder = 5
      end
      object E_AVR_Category: TEdit
        Left = 8
        Top = 358
        Width = 393
        Height = 26
        TabStop = False
        ReadOnly = True
        TabOrder = 6
      end
      object E_AVR_Vidrabot: TEdit
        Left = 8
        Top = 408
        Width = 393
        Height = 26
        TabStop = False
        ReadOnly = True
        TabOrder = 7
      end
      object CB_AVR_Podrobno: TCheckBox
        Left = 319
        Top = 145
        Width = 330
        Height = 25
        Caption = #1055#1086#1076#1088#1086#1073#1085#1086' ('#1089' '#1091#1082#1072#1079#1072#1085#1080#1077#1084' '#1075#1086#1090#1086#1074#1086#1081' '#1087#1088#1086#1076#1091#1082#1094#1080#1080')'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object E_AVR_Zakaz: TEdit
        Left = 8
        Top = 506
        Width = 393
        Height = 26
        TabStop = False
        ReadOnly = True
        TabOrder = 9
      end
    end
    object Dvij_mater: TTabSheet
      Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
      ImageIndex = 2
      object Label11: TLabel
        Left = 16
        Top = 16
        Width = 119
        Height = 18
        Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
      end
      object Label12: TLabel
        Left = 28
        Top = 48
        Width = 109
        Height = 18
        Caption = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
      end
      object Label14: TLabel
        Left = 90
        Top = 88
        Width = 49
        Height = 18
        Caption = #1057#1082#1083#1072#1076':'
      end
      object Bevel3: TBevel
        Left = 0
        Top = 432
        Width = 825
        Height = 17
        Shape = bsTopLine
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 253
        Width = 609
        Height = 169
        Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1086#1073#1098#1077#1082#1090' '#1086#1090#1095#1077#1090#1072
        TabOrder = 4
        object B_select_furnitura: TButton
          Left = 515
          Top = 133
          Width = 85
          Height = 28
          Cursor = crHandPoint
          Caption = '&'#1042#1099#1073#1088#1072#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = B_select_furnituraClick
        end
        object DBE_Detali: TDBEdit
          Left = 160
          Top = 61
          Width = 440
          Height = 26
          DataField = 'NAME'
          DataSource = DM_Mebeli.DS_Pilomat_detali
          ReadOnly = True
          TabOrder = 1
        end
        object DBE_Furnitura: TDBEdit
          Left = 160
          Top = 93
          Width = 440
          Height = 26
          DataField = 'NAME'
          DataSource = DM_Mebeli.DS_Furnitura
          ReadOnly = True
          TabOrder = 2
        end
        object RB_Listy: TRadioButton
          Left = 8
          Top = 35
          Width = 89
          Height = 17
          Caption = #1051#1080#1089#1090#1099
          Checked = True
          TabOrder = 3
          TabStop = True
          OnClick = RB_ListyClick
        end
        object RB_Detali: TRadioButton
          Left = 8
          Top = 67
          Width = 89
          Height = 17
          Caption = #1044#1077#1090#1072#1083#1080
          TabOrder = 4
          OnClick = RB_DetaliClick
        end
        object RB_Furnitura: TRadioButton
          Left = 8
          Top = 99
          Width = 146
          Height = 17
          Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1080#1077
          TabOrder = 5
          OnClick = RB_FurnituraClick
        end
        object DBE_Listy: TDBEdit
          Left = 160
          Top = 29
          Width = 440
          Height = 26
          DataField = 'NAME'
          DataSource = DM_Mebeli.DS_Pilomat_listy
          ReadOnly = True
          TabOrder = 6
        end
      end
      object Dvij_mater_date_Begin: TDateTimePicker
        Left = 160
        Top = 16
        Width = 137
        Height = 26
        Date = 39516.790861354180000000
        Format = 'dd.MM.yyyy'
        Time = 39516.790861354180000000
        TabOrder = 0
      end
      object Dvij_mater_date_End: TDateTimePicker
        Left = 160
        Top = 48
        Width = 137
        Height = 26
        Date = 39516.790861354180000000
        Format = 'dd.MM.yyyy'
        Time = 39516.790861354180000000
        TabOrder = 1
      end
      object Panel3: TPanel
        Left = 672
        Top = 352
        Width = 145
        Height = 70
        BevelInner = bvLowered
        TabOrder = 2
        object B_dvijenie_materialov: TButton
          Left = 20
          Top = 17
          Width = 105
          Height = 36
          Cursor = crHandPoint
          Caption = '&'#1055#1086#1082#1072#1079#1072#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = B_dvijenie_materialovClick
        end
      end
      object DBGrid3: TDBGrid
        Left = 160
        Top = 88
        Width = 449
        Height = 161
        DataSource = DM_Mebeli.DS_Sklad
        Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        OnExit = DBGrid1Exit
        Columns = <
          item
            Expanded = False
            FieldName = 'NAME'
            Width = 400
            Visible = True
          end>
      end
      object CB_Excel: TCheckBox
        Left = 672
        Top = 320
        Width = 153
        Height = 25
        Hint = #1054#1090#1084#1077#1090#1080#1090#1100' '#1076#1083#1103' '#1101#1082#1089#1087#1086#1088#1090#1072' '#1074' Excel'
        Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' &Excel'
        TabOrder = 5
      end
    end
    object Ostat_vid_rab: TTabSheet
      Caption = #1054#1089#1090#1072#1090#1082#1080' '#1087#1086' '#1074#1080#1076' '#1088#1072#1073#1086#1090
      ImageIndex = 1
      object Label7: TLabel
        Left = 264
        Top = 8
        Width = 289
        Height = 20
        Caption = #1054#1089#1090#1072#1090#1082#1080' '#1076#1077#1090#1072#1083#1077#1081' '#1087#1086' '#1074#1080#1076#1072#1084' '#1088#1072#1073#1086#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 16
        Top = 48
        Width = 115
        Height = 18
        Caption = #1054#1089#1090#1072#1090#1082#1080' '#1085#1072' '#1076#1072#1090#1091
      end
      object Label9: TLabel
        Left = 16
        Top = 88
        Width = 79
        Height = 18
        Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090':'
      end
      object Label10: TLabel
        Left = 16
        Top = 312
        Width = 56
        Height = 18
        Caption = #1044#1077#1090#1072#1083#1100':'
      end
      object Bevel2: TBevel
        Left = 0
        Top = 432
        Width = 825
        Height = 17
        Shape = bsTopLine
      end
      object Date_Ostatok_vidrab: TDateTimePicker
        Left = 160
        Top = 44
        Width = 137
        Height = 26
        Date = 39516.790861354180000000
        Format = 'dd.MM.yyyy'
        Time = 39516.790861354180000000
        TabOrder = 0
      end
      object DBGrid2: TDBGrid
        Left = 160
        Top = 88
        Width = 449
        Height = 201
        DataSource = DM_Mebeli.DS_Vidy_rabot
        Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NAME'
            Width = 400
            Visible = True
          end>
      end
      object DBEdit1: TDBEdit
        Left = 160
        Top = 306
        Width = 361
        Height = 26
        DataField = 'NAME'
        DataSource = DM_Mebeli.DS_Pilomat_detali
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object Button2: TButton
        Left = 528
        Top = 306
        Width = 85
        Height = 28
        Cursor = crHandPoint
        Caption = '&'#1042#1099#1073#1088#1072#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = B_Select_detaliClick
      end
      object Panel2: TPanel
        Left = 672
        Top = 352
        Width = 145
        Height = 70
        BevelInner = bvLowered
        TabOrder = 4
        object B_OK_Ostatok_vidrab: TButton
          Left = 20
          Top = 17
          Width = 105
          Height = 36
          Cursor = crHandPoint
          Caption = '&'#1055#1086#1082#1072#1079#1072#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = B_OK_Ostatok_vidrabClick
        end
      end
      object CheckBox1: TCheckBox
        Left = 16
        Top = 152
        Width = 129
        Height = 17
        Hint = #1043#1072#1083#1086#1095#1082#1072' - '#1086#1090#1095#1077#1090' '#1087#1086' '#1042#1057#1045#1052' '#1074#1080#1076#1072#1084' '#1088#1072#1073#1086#1090' '#1089#1088#1072#1079#1091
        Caption = #1053#1077' '#1091#1095#1080#1090#1099#1074#1072#1090#1100
        TabOrder = 5
      end
      object PB_Ostatki_vidrab: TProgressBar
        Left = 16
        Top = 360
        Width = 545
        Height = 41
        Smooth = True
        Step = 1
        TabOrder = 6
      end
    end
    object Tab_Sverka: TTabSheet
      Caption = #1057#1074#1077#1088#1082#1072' '#1089' 1'#1057
      ImageIndex = 4
      object Label2: TLabel
        Left = 0
        Top = 1
        Width = 415
        Height = 18
        Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099', '#1082#1086#1090#1086#1088#1099#1081' '#1073#1099#1083' '#1101#1082#1089#1087#1086#1088#1090#1080#1088#1086#1074#1072#1085' '#1080#1079' 1'#1057
      end
      object Label3: TLabel
        Left = 0
        Top = 83
        Width = 112
        Height = 18
        Caption = #1057#1074#1077#1088#1082#1072' '#1085#1072' '#1076#1072#1090#1091
      end
      object L_Export1C_date: TLabel
        Left = 328
        Top = 80
        Width = 4
        Height = 18
      end
      object Panel4: TPanel
        Left = 680
        Top = 488
        Width = 137
        Height = 54
        BevelInner = bvLowered
        TabOrder = 0
        object B_Show_sverka: TButton
          Left = 16
          Top = 9
          Width = 105
          Height = 36
          Cursor = crHandPoint
          Caption = '&'#1055#1086#1082#1072#1079#1072#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = B_Show_sverkaClick
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 24
        Width = 585
        Height = 50
        BevelInner = bvLowered
        TabOrder = 1
        object Sverka_fileName: TEdit
          Left = 8
          Top = 10
          Width = 529
          Height = 26
          TabOrder = 0
        end
        object B_load_from_1c: TBitBtn
          Left = 544
          Top = 10
          Width = 33
          Height = 28
          TabOrder = 1
          OnClick = B_load_from_1cClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            555555555555555555555555555555555555555FFFFFFFFFF555550000000000
            55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
            B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
            000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
            555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
            55555575FFF75555555555700007555555555557777555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
        end
      end
      object DBG_Sverka: TDBGrid
        Left = 0
        Top = 232
        Width = 817
        Height = 249
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = RUSSIAN_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -16
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_TOVAR_1C'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_TOVAR'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NAME_TOVAR'
            Width = 347
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KOLVO_1C'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KOLVO_INTERN'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SKLAD'
            Width = 77
            Visible = True
          end>
      end
      object DT_Sverka_date: TDateTimePicker
        Left = 130
        Top = 79
        Width = 137
        Height = 26
        Date = 39516.790861354180000000
        Format = 'dd.MM.yyyy'
        Time = 39516.790861354180000000
        TabOrder = 3
      end
      object RG_Sverka: TRadioGroup
        Left = 8
        Top = 120
        Width = 377
        Height = 105
        Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1089#1082#1083#1072#1076':'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          #1057#1073#1086#1088#1086#1095#1085#1099#1081' '#1094#1077#1093
          #1057#1082#1083#1072#1076' '#1094#1077#1093
          #1055#1086' '#1074#1089#1077#1084' '#1089#1082#1083#1072#1076#1072#1084)
        ParentFont = False
        TabOrder = 4
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 641
    Width = 833
    Height = 57
    BevelInner = bvLowered
    TabOrder = 1
    object B_Exit: TButton
      Left = 725
      Top = 11
      Width = 105
      Height = 36
      Caption = '&'#1047#1072#1082#1088#1099#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = B_ExitClick
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = F_Print_Forms.IBQuery1
    Left = 324
    Top = 7
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'Text files|*.txt'
    Left = 708
    Top = 96
  end
  object EXL_Sverka: TEXLReport
    About = 'EMS Advanced Excel Report(tm) Component Suite for Delphi(R)'
    Bands.BandCount = 4
    Bands.Items = <
      item
        Bands.Range = 'A1:G3'
        Bands.BandType = 0
      end
      item
        Bands.Range = 'A4:G4'
        Bands.BandType = 2
      end
      item
        Bands.Range = 'A3:G3'
        Bands.BandType = 3
      end
      item
        Bands.Range = 'A4:G4'
        Bands.BandType = 4
      end>
    Dictionary = <>
    StoreInDFM = True
    TemplSheet = 'sverka'
    Title = #1057#1074#1077#1088#1082#1072' '#1089' 1'#1057
    _Version = '1.60'
    OnGetFieldValue = EXL_SverkaGetFieldValue
    Left = 708
    Top = 140
    XLTemplate = {
      006A0000D0CF11E0A1B11AE1000000000000000000000000000000003E000300
      FEFF090006000000000000000000000001000000010000000000000000100000
      0200000001000000FEFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFDFFFFFF32000000FEFFFFFF33000000050000000600000007000000
      08000000090000000A0000000B0000000C0000000D000000FEFFFFFF0F000000
      1000000011000000120000001300000014000000150000001600000017000000
      18000000190000001A0000001B0000001C0000001D0000001E0000001F000000
      2000000021000000220000002300000024000000250000002600000027000000
      28000000290000002A0000002B0000002C0000002D0000002E0000002F000000
      3000000031000000FEFFFFFFFEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF52006F006F007400200045006E007400720079000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000016000500FFFFFFFFFFFFFFFF010000002008020000000000C0000000
      00000046000000000000000000000000A0FDEC5A5C97CF0103000000C0020000
      0000000057006F0072006B0062006F006F006B00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000120002010200000004000000FFFFFFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000E00000021460000
      0000000001004F006C0065000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000A000201FFFFFFFF06000000FFFFFFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000014000000
      0000000002004F006C0065005000720065007300300030003000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000018000200FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000400000014130000
      00000000FEFFFFFF020000000300000004000000FEFFFFFF0600000007000000
      08000000FEFFFFFF0A000000FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF01000002000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FEFF0000060102000000000000000000000000000000000001000000
      E0859FF2F94F6810AB9108002B27B3D930000000A00000000700000001000000
      400000000400000048000000080000005800000012000000680000000C000000
      800000000D0000008C000000130000009800000002000000E30400001E000000
      0800000075727375616700001E0000000800000075727375616700001E000000
      100000004D6963726F736F667420457863656C00400000008033F7B6B396CF01
      40000000801E9C5A5C97CF010300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FEFF0000060102000000000000000000000000000000000001000000
      02D5CDD59C2E1B10939708002B2CF9AE30000000D00000000900000001000000
      500000000F0000005800000017000000740000000B0000007C00000010000000
      84000000130000008C00000016000000940000000D0000009C0000000C000000
      AF00000002000000E30400001E000000140000005350656369616C6953542052
      655061636B0000000300000000000E000B000000000000000B00000000000000
      0B000000FFFFFFFF030000000400000001000000FFFFFFFF0200000000000000
      DA570000700A0000D21200000100090000036909000008004300000000000400
      000003010800050000000B0200000000050000000C0266005303050000000902
      00000000050000000102FFFFFF000400000004010D0004000000020102000300
      00001E00040000002701FFFF030000001E00040000002701FFFF030000001E00
      050000000102FFFFFF0005000000090200000000040000002701FFFF03000000
      1E00050000000102FFFFFF000500000009020000000007000000160465005203
      00000000040000002701FFFF030000001E00050000000102FFFFFF0005000000
      0902000000000700000016046500520300000000040000002701FFFF03000000
      1E00050000000102FFFFFF000500000009020000000007000000160465005203
      01000100040000002701FFFF030000001E00050000000102FFFFFF0005000000
      0902000000000700000016046500520301000100040000002701FFFF03000000
      1E00050000000102FFFFFF000500000009020000000007000000160465005203
      0100010007000000FC020000008000000000040000002D010000050000000902
      00800000050000000102008000000400000004010D0004000000020102000800
      0000FA0200000000000000800000040000002D0101000500000014025100B102
      0500000013025100B60208000000FA0200000000000000000000040000002D01
      02000C00000040092100F000000000000000010005005100B102040000002D01
      01000500000014025200B1020500000013025200B502040000002D0102000C00
      000040092100F000000000000000010004005200B102040000002D0101000500
      000014025300B1020500000013025300B402040000002D0102000C0000004009
      2100F000000000000000010003005300B102040000002D010100050000001402
      5400B1020500000013025400B302040000002D0102000C00000040092100F000
      000000000000010002005400B102040000002D0101000500000014025500B102
      0500000013025500B202040000002D0102000C00000040092100F00000000000
      0000010001005500B10207000000FC020000000000000000040000002D010300
      04000000F00100001C000000FB02F1FF000000000000BC02000000CC00000020
      43616C6962726900000000000000000000000000000000000000000000000000
      040000002D01000005000000090200000000050000000102FFFFFF0004000000
      0201010043000000320A02009D0028000000D1E2E5F0EAE02031D120F120ECE5
      E1E5EBFCEDEEE920EFF0EEE3F0E0ECECEEE920EDE020E4E0F2F3080007000800
      0800070007000300070008000300060003000B00080008000800080007000800
      0800080003000800080008000500080007000B000B0008000800030008000700
      030009000700060007001C000000FB02F1FF0000000000009001000000CC0000
      002043616C696272690000000000000000000000000000000000000000000000
      0000040000002D01040019000000320A0200DE010C00000023444154415F5356
      45524B4907000900090007000900070007000900070008000800040004000000
      2D0100001C000000FB021000070000000000BC02000000CC0102022253797374
      656D0076C063720078EA380019E28376800188765C8B520B84EA380004000000
      2D010500040000002701FFFF030000001E00040000002D010000050000000102
      FFFFFF0005000000090200000000070000001604500052032900010004000000
      04010D00040000000201010010000000320A2A000B0006000000CACEC42031D1
      08000A000A00030007000800040000002D010500040000002D01000016000000
      320A2A0046000A000000CACEC420ECE5E1E5EBFC08000A000A0003000B000800
      0800080008000700040000002D010500040000002D01000019000000320A2A00
      0A010C000000CDE0E8ECE5EDEEE2E0EDE8E50900070008000B00080008000800
      07000700080008000800040000002D010500040000002D01000015000000320A
      2A00E90109000000CACECB2DC2CE2031D10008000A000900050008000A000300
      07000800040000002D010500040000002D0100001B000000320A2A0042020D00
      0000CACECB2DC2CE20ECE5E1E5EBFC0008000A000900050008000A0003000B00
      08000800080008000700040000002D010500040000002D010000040000002D01
      0500040000002701FFFF030000001E00040000002D010000050000000102FFFF
      FF0005000000090200000000070000001604500007032900B102040000000401
      0D00040000000201010012000000320A2A00BD0207000000D0C0C7CDC8D6C000
      08000900070009000A000A00090015000000320A3E00B9020900000031D12DEC
      E5E1E5EBFC000700080005000B0008000800080008000700040000002D010500
      040000002D010000040000002D010500040000002701FFFF030000001E000400
      00002D010000050000000102FFFFFF0005000000090200000000070000001604
      50005203290001000400000004010D0004000000020101000F000000320A2A00
      160305000000D1CACBC0C40008000800090009000A00040000002D0105000400
      00002D010000040000002D010500040000002701FFFF030000001E0004000000
      2D010000050000000102FFFFFF00050000000902000000000700000016046500
      520301000100040000002D010400040000002D010500040000002701FFFF0300
      00001E00040000002D010400050000000102FFFFFF0005000000090200000000
      07000000160464004300510001000400000004010D0004000000020101001900
      0000320A520003000C0000002349445F544F5641525F31430700040009000700
      07000A00090009000800070007000800040000002D010500040000002701FFFF
      030000001E00040000002D010400050000000102FFFFFF000500000009020000
      000007000000160465005203010001000400000004010D000400000002010100
      15000000320A52004600090000002349445F544F564152000700040009000700
      07000A0009000900080018000000320A52009D000B000000234E414D455F544F
      5641520007000A0009000C000700070007000A0009000900080015000000320A
      5200DE0109000000234B4F4C564F5F314300070008000A00060009000A000700
      070008001B000000320A52003D020D000000234B4F4C564F5F494E5445524E00
      070008000A00060009000A00070004000A000700070008000A0010000000320A
      5200C6020600000023C7CDC0D72107000700090009000800050010000000320A
      52000A030600000023534B4C4144070007000800060009000900040000002D01
      0500040000002701FFFF030000001E00040000002D010400050000000102FFFF
      FF0005000000090200000000070000001604650052030000000007000000FC02
      0000DADCDD000000040000002D010600050000000902DADCDD00050000000102
      DADCDD000400000004010D00040000000201020004000000F001010008000000
      FA02000000000000DADCDD00040000002D010100050000001402000000000500
      0000130228000000040000002D0102000C00000040092100F000000000000000
      2800010000000000040000002D01010005000000140200004300050000001302
      28004300040000002D0102000C00000040092100F00000000000000028000100
      00004300040000002D01010005000000140200009A0005000000130228009A00
      040000002D0102000C00000040092100F0000000000000002800010000009A00
      040000002D0101000500000014020000DB010500000013022800DB0104000000
      2D0102000C00000040092100F000000000000000280001000000DB0104000000
      2D01010005000000140200003A0205000000130228003A02040000002D010200
      0C00000040092100F0000000000000002800010000003A02040000002D010100
      0500000014020000B0020500000013022800B002040000002D0102000C000000
      40092100F000000000000000280001000000B002040000002D01010005000000
      14020000070305000000130228000703040000002D0102000C00000040092100
      F000000000000000280001000000070307000000FC0200000000000000000400
      00002D01070005000000090200000000050000000102FFFFFF0004000000F001
      010008000000FA0200000000000000000000040000002D010100050000001402
      2800010005000000130228005203040000002D0102000C00000040092100F000
      0000000000000100510328000100040000002D01060004000000F00107000500
      00000902DADCDD00050000000102DADCDD0004000000F001010008000000FA02
      000000000000DADCDD00040000002D0101000500000014020000510305000000
      130228005103040000002D0102000C00000040092100F0000000000000002800
      01000000510307000000FC020000000000000000040000002D01070005000000
      090200000000050000000102FFFFFF0004000000F001010008000000FA020000
      0000000000000000040000002D01010005000000140250000100050000001302
      50005203040000002D0102000C00000040092100F00000000000000001005103
      50000100040000002D0101000500000014022800000005000000130265000000
      040000002D0102000C00000040092100F0000000000000003D00010028000000
      040000002D010100050000001402290043000500000013026500430004000000
      2D0102000C00000040092100F0000000000000003C0001002900430004000000
      2D01010005000000140229009A0005000000130265009A00040000002D010200
      0C00000040092100F0000000000000003C00010029009A00040000002D010100
      0500000014022900DB010500000013026500DB01040000002D0102000C000000
      40092100F0000000000000003C0001002900DB01040000002D01010005000000
      140229003A0205000000130265003A02040000002D0102000C00000040092100
      F0000000000000003C00010029003A02040000002D0101000500000014022900
      B0020500000013026500B002040000002D0102000C00000040092100F0000000
      000000003C0001002900B002040000002D010100050000001402290007030500
      0000130265000703040000002D0102000C00000040092100F000000000000000
      3C00010029000703040000002D01010005000000140264000100050000001302
      64005203040000002D0102000C00000040092100F00000000000000001005103
      64000100040000002D0101000500000014022900510305000000130265005103
      040000002D0102000C00000040092100F0000000000000003C00010029005103
      040000002D01060004000000F0010700050000000902DADCDD00050000000102
      DADCDD0004000000F001010008000000FA02000000000000DADCDD0004000000
      2D0101000500000014026500000005000000130266000000040000002D010200
      0C00000040092100F0000000000000000100010065000000040000002D010100
      0500000014026500430005000000130266004300040000002D0102000C000000
      40092100F0000000000000000100010065004300040000002D01010005000000
      140265009A0005000000130266009A00040000002D0102000C00000040092100
      F0000000000000000100010065009A00040000002D0101000500000014026500
      DB010500000013026600DB01040000002D0102000C00000040092100F0000000
      00000000010001006500DB01040000002D01010005000000140265003A020500
      0000130266003A02040000002D0102000C00000040092100F000000000000000
      0100010065003A02040000002D0101000500000014026500B002050000001302
      6600B002040000002D0102000C00000040092100F00000000000000001000100
      6500B002040000002D0101000500000014026500070305000000130266000703
      040000002D0102000C00000040092100F0000000000000000100010065000703
      040000002D010100050000001402650051030500000013026600510304000000
      2D0102000C00000040092100F000000000000000010001006500510304000000
      2D0101000500000014020000000005000000130200005303040000002D010200
      0C00000040092100F0000000000000000100530300000000040000002D010100
      0500000014021400000005000000130214005303040000002D0102000C000000
      40092100F0000000000000000100530314000000040000002D01010005000000
      14022800520305000000130228005303040000002D0102000C00000040092100
      F0000000000000000100010028005203040000002D0101000500000014025000
      520305000000130250005303040000002D0102000C00000040092100F0000000
      000000000100010050005203040000002D010100050000001402640052030500
      0000130264005303040000002D0102000C00000040092100F000000000000000
      0100010064005203040000002D010300040000002D010500040000002701FFFF
      030000001E00040000002D010400050000000102DADCDD00050000000902DADC
      DD000700000016046500520301000100040000002701FFFF0300000000000000
      000000000000000000000000000000004E414E49000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000009081000000605006732CD07C180010006060000E1000200B004C100
      02000000E20000005C0070000600007572737561672020202020202020202020
      2020202020202020202020202020202020202020202020202020202020202020
      2020202020202020202020202020202020202020202020202020202020202020
      2020202020202020202020202020202020202020202020202020202042000200
      B004610102000000C00100003D01020001009C00020011001900020000001200
      02000000130002000000AF0102000000BC01020000003D001200F0002D005352
      3327380000000000010058024000020000008D00020000002200020000000E00
      02000100B70102000000DA000200000031001E00DC0000000800900100000002
      CC8A0701430061006C00690062007200690031001E00DC000000080090010000
      0002CC8A0701430061006C00690062007200690031001E00DC00000008009001
      00000002CC8A0701430061006C00690062007200690031001E00DC0000000800
      900100000002CC8A0701430061006C00690062007200690031001E00DC000000
      0800900100000002CC8A0701430061006C00690062007200690031001E00DC00
      00000900900100000002CC8A0701430061006C00690062007200690031001E00
      DC0000003E00900100000002CC8A0701430061006C0069006200720069003100
      1E00DC0001003F00BC0200000002CC8A0701430061006C006900620072006900
      31001E00DC0001003400BC0200000002CC8A0701430061006C00690062007200
      690031001E002C0101003800BC0200000002CC8A0701430061006C0069006200
      7200690031001E00040101003800BC0200000002CC8A0701430061006C006900
      62007200690031001E00DC0001003800BC0200000002CC8A0701430061006C00
      690062007200690031001E00DC0001000800BC0200000002CC8A070143006100
      6C00690062007200690031001E00DC0001000900BC0200000002CC8A07014300
      61006C00690062007200690031001E00680101003800BC0200000002CC8A0701
      430061006D00620072006900610031001E00DC0000003C00900100000002CC8A
      0701430061006C00690062007200690031001E00DC0000001400900100000002
      CC8A0701430061006C00690062007200690031001E00DC000200170090010000
      0002CC8A0701430061006C00690062007200690031001E00DC00000034009001
      00000002CC8A0701430061006C00690062007200690031001E00DC0000000A00
      900100000002CC8A0701430061006C00690062007200690031001E00DC000000
      1100900100000002CC8A0701430061006C0069006200720069001E042F000500
      15000123002C00230023003000220040042E0022003B005C002D0023002C0023
      0023003000220040042E0022001E04390006001A000123002C00230023003000
      220040042E0022003B005B005200650064005D005C002D0023002C0023002300
      3000220040042E0022001E043B0007001B000123002C002300230030002E0030
      003000220040042E0022003B005C002D0023002C002300230030002E00300030
      00220040042E0022001E044500080020000123002C002300230030002E003000
      3000220040042E0022003B005B005200650064005D005C002D0023002C002300
      230030002E0030003000220040042E0022001E046B002A003300015F002D002A
      00200023002C00230023003000220040042E0022005F002D003B005C002D002A
      00200023002C00230023003000220040042E0022005F002D003B005F002D002A
      00200022002D002200220040042E0022005F002D003B005F002D0040005F002D
      001E046B0029003300015F002D002A00200023002C002300230030005F004004
      5F002E005F002D003B005C002D002A00200023002C002300230030005F004004
      5F002E005F002D003B005F002D002A00200022002D0022005F0040045F002E00
      5F002D003B005F002D0040005F002D001E047B002C003B00015F002D002A0020
      0023002C002300230030002E0030003000220040042E0022005F002D003B005C
      002D002A00200023002C002300230030002E0030003000220040042E0022005F
      002D003B005F002D002A00200022002D0022003F003F00220040042E0022005F
      002D003B005F002D0040005F002D001E047B002B003B00015F002D002A002000
      23002C002300230030002E00300030005F0040045F002E005F002D003B005C00
      2D002A00200023002C002300230030002E00300030005F0040045F002E005F00
      2D003B005F002D002A00200022002D0022003F003F005F0040045F002E005F00
      2D003B005F002D0040005F002D00E000140000000000F5FF2000000000000000
      00000000C020E000140005000000F5FF200000F40000000000000000C020E000
      140005000000F5FF200000F40000000000000000C020E000140005000000F5FF
      200000F40000000000000000C020E000140005000000F5FF200000F400000000
      00000000C020E000140005000000F5FF200000F40000000000000000C020E000
      140005000000F5FF200000F40000000000000000C020E000140005000000F5FF
      200000F40000000000000000C020E000140005000000F5FF200000F400000000
      00000000C020E000140005000000F5FF200000F40000000000000000C020E000
      140005000000F5FF200000F40000000000000000C020E000140005000000F5FF
      200000F40000000000000000C020E000140005000000F5FF200000F400000000
      00000000C020E000140005000000F5FF200000F40000000000000000C020E000
      140005000000F5FF200000F40000000000000000C020E0001400000000000100
      200000000000000000000002C020E000140005000000F5FF200000B400000000
      000000049F20E000140005000000F5FF200000B40000000000000004AD20E000
      140005000000F5FF200000B40000000000000004AA20E000140005000000F5FF
      200000B40000000000000004AE20E000140005000000F5FF200000B400000000
      000000049B20E000140005000000F5FF200000B40000000000000004AF20E000
      140005000000F5FF200000B40000000000000004AC20E000140005000000F5FF
      200000B400000000000000049D20E000140005000000F5FF200000B400000000
      000000048B20E000140005000000F5FF200000B40000000000000004AE20E000
      140005000000F5FF200000B40000000000000004AC20E000140005000000F5FF
      200000B40000000000000004B320E000140006000000F5FF200000B400000000
      000000049E20E000140006000000F5FF200000B400000000000000049D20E000
      140006000000F5FF200000B400000000000000048B20E000140006000000F5FF
      200000B40000000000000004A420E000140006000000F5FF200000B400000000
      00000004B120E000140006000000F5FF200000B40000000000000004B420E000
      140006000000F5FF200000B40000000000000004BE20E000140006000000F5FF
      200000B400000000000000048A20E000140006000000F5FF200000B400000000
      00000004B920E000140006000000F5FF200000B40000000000000004A420E000
      140006000000F5FF200000B40000000000000004B120E000140006000000F5FF
      200000B40000000000000004B520E000140007000000F5FF200000941111970B
      970B0004AF20E000140008000000F5FF200000941111BF1FBF1F00049620E000
      140009000000F5FF200000941111970B970B00049620E000140005002C00F5FF
      200000F80000000000000000C020E000140005002A00F5FF200000F800000000
      00000000C020E00014000A000000F5FF200000D400500000001F0000C020E000
      14000B000000F5FF200000D400500000000B0000C020E00014000C000000F5FF
      200000D400200000000F0000C020E00014000C000000F5FF200000F400000000
      00000000C020E00014000D000000F5FF200000D4006100003E1F0000C020E000
      14000E000000F5FF200000946666BF1FBF1F0004B720E00014000F000000F5FF
      200000F40000000000000000C020E000140010000000F5FF200000B400000000
      00000004AB20E000140011000000F5FF200000B40000000000000004AD20E000
      140012000000F5FF200000F40000000000000000C020E000140005000000F5FF
      2000009C1111160B160B00049A20E000140005000900F5FF200000F800000000
      00000000C020E000140013000000F5FF200000D400600000001A0000C020E000
      140014000000F5FF200000F40000000000000000C020E000140005002B00F5FF
      200000F80000000000000000C020E000140005002900F5FF200000F800000000
      00000000C020E000140015000000F5FF200000B40000000000000004AA20E000
      14000D00000001000A0000381111402040200002C020E0001400000000000100
      200000201111402040200002C020E00014000D00000001002000000800000000
      00000002C020E0001400000000000100200000241111402040200002C0207C08
      14007C08000000000000000000000000420076EEC11E7D082D007D0800000000
      00000000000000000000000002000D0014000300000001000000045F002E005F
      002D0E000500027D082D007D080000000000000000000000000100000002000D
      0014000300000001000000045F002E005F002D0E000500027D082D007D080000
      000000000000000000000200000002000D0014000300000001000000045F002E
      005F002D0E000500027D082D007D080000000000000000000000000300000002
      000D0014000300000001000000045F002E005F002D0E000500027D082D007D08
      0000000000000000000000000400000002000D0014000300000001000000045F
      002E005F002D0E000500027D082D007D08000000000000000000000000050000
      0002000D0014000300000001000000045F002E005F002D0E000500027D082D00
      7D080000000000000000000000000600000002000D0014000300000001000000
      045F002E005F002D0E000500027D082D007D0800000000000000000000000007
      00000002000D0014000300000001000000045F002E005F002D0E000500027D08
      2D007D080000000000000000000000000800000002000D001400030000000100
      0000045F002E005F002D0E000500027D082D007D080000000000000000000000
      000900000002000D0014000300000001000000045F002E005F002D0E00050002
      7D082D007D080000000000000000000000000A00000002000D00140003000000
      01000000045F002E005F002D0E000500027D082D007D08000000000000000000
      0000000B00000002000D0014000300000001000000045F002E005F002D0E0005
      00027D082D007D080000000000000000000000000C00000002000D0014000300
      000001000000045F002E005F002D0E000500027D082D007D0800000000000000
      00000000000D00000002000D0014000300000001000000045F002E005F002D0E
      000500027D082D007D080000000000000000000000000E00000002000D001400
      0300000001000000045F002E005F002D0E000500027D082D007D080000000000
      000000000000000F00000002000D0014000300000001000000045F002E005F00
      2D0E000500027D0841007D080000000000000000000000001000000003000D00
      14000300000001000000045F002E005F002D0E00050002040014000300656604
      000000230030002E0030007D0841007D08000000000000000000000000110000
      0003000D0014000300000001000000045F002E005F002D0E0005000204001400
      0300656605000000230030002E0030007D0841007D0800000000000000000000
      00001200000003000D0014000300000001000000045F002E005F002D0E000500
      02040014000300656606000000230030002E0030007D0841007D080000000000
      000000000000001300000003000D0014000300000001000000045F002E005F00
      2D0E00050002040014000300656607000000230030002E0030007D0841007D08
      0000000000000000000000001400000003000D0014000300000001000000045F
      002E005F002D0E00050002040014000300656608000000230030002E0030007D
      0841007D080000000000000000000000001500000003000D0014000300000001
      000000045F002E005F002D0E0005000204001400030065660900000023003000
      2E0030007D0841007D080000000000000000000000001600000003000D001400
      0300000001000000045F002E005F002D0E00050002040014000300CC4C040000
      00230030002E0030007D0841007D080000000000000000000000001700000003
      000D0014000300000001000000045F002E005F002D0E00050002040014000300
      CC4C05000000230030002E0030007D0841007D08000000000000000000000000
      1800000003000D0014000300000001000000045F002E005F002D0E0005000204
      0014000300CC4C06000000230030002E0030007D0841007D0800000000000000
      00000000001900000003000D0014000300000001000000045F002E005F002D0E
      00050002040014000300CC4C07000000230030002E0030007D0841007D080000
      000000000000000000001A00000003000D0014000300000001000000045F002E
      005F002D0E00050002040014000300CC4C08000000230030002E0030007D0841
      007D080000000000000000000000001B00000003000D00140003000000010000
      00045F002E005F002D0E00050002040014000300CC4C09000000230030002E00
      30007D0841007D080000000000000000000000001C00000003000D0014000300
      000000000000045F002E005F002D0E0005000204001400030032330400000023
      0030002E0030007D0841007D080000000000000000000000001D00000003000D
      0014000300000000000000045F002E005F002D0E000500020400140003003233
      05000000230030002E0030007D0841007D080000000000000000000000001E00
      000003000D0014000300000000000000045F002E005F002D0E00050002040014
      000300323306000000230030002E0030007D0841007D08000000000000000000
      0000001F00000003000D0014000300000000000000045F002E005F002D0E0005
      0002040014000300323307000000230030002E0030007D0841007D0800000000
      00000000000000002000000003000D0014000300000000000000045F002E005F
      002D0E00050002040014000300323308000000230030002E0030007D0841007D
      080000000000000000000000002100000003000D001400030000000000000004
      5F002E005F002D0E00050002040014000300323309000000230030002E003000
      7D0841007D080000000000000000000000002200000003000D00140003000000
      00000000045F002E005F002D0E00050002040014000300000004000000230030
      002E0030007D0841007D080000000000000000000000002300000003000D0014
      000300000000000000045F002E005F002D0E0005000204001400030000000500
      0000230030002E0030007D0841007D0800000000000000000000000024000000
      03000D0014000300000000000000045F002E005F002D0E000500020400140003
      00000006000000230030002E0030007D0841007D080000000000000000000000
      002500000003000D0014000300000000000000045F002E005F002D0E00050002
      040014000300000007000000230030002E0030007D0841007D08000000000000
      0000000000002600000003000D0014000300000000000000045F002E005F002D
      0E00050002040014000300000008000000230030002E0030007D0841007D0800
      00000000000000000000002700000003000D0014000300000000000000045F00
      2E005F002D0E00050002040014000300000009000000230030002E0030007D08
      91007D080000000000000000000000002800000007000D001400020000003F3F
      76FF045F002E005F002D0E000500020400140002000000FFCC99FF230030002E
      00300007001400020000007F7F7FFF2D003B005F002D0008001400020000007F
      7F7FFF3F005F0040045F0009001400020000007F7F7FFF40005F002D0000000A
      001400020000007F7F7FFF00000000000000007D0891007D0800000000000000
      00000000002900000007000D001400020000003F3F3FFF045F002E005F002D0E
      000500020400140002000000F2F2F2FF230030002E0030000700140002000000
      3F3F3FFF2D003B005F002D0008001400020000003F3F3FFF3F005F0040045F00
      09001400020000003F3F3FFF40005F002D0000000A001400020000003F3F3FFF
      00000000000000007D0891007D080000000000000000000000002A0000000700
      0D00140002000000FA7D00FF045F002E005F002D0E0005000204001400020000
      00F2F2F2FF230030002E00300007001400020000007F7F7FFF2D003B005F002D
      0008001400020000007F7F7FFF3F005F0040045F0009001400020000007F7F7F
      FF40005F002D0000000A001400020000007F7F7FFF00000000000000007D082D
      007D080000000000000000000000002B00000002000D00140003000000010000
      00045F002E005F002D0E000500027D082D007D08000000000000000000000000
      2C00000002000D0014000300000001000000045F002E005F002D0E000500027D
      0841007D080000000000000000000000002D00000003000D0014000300000003
      000000045F002E005F002D0E0005000208001400030000000400000023003000
      2E0030007D0841007D080000000000000000000000002E00000003000D001400
      0300000003000000045F002E005F002D0E00050002080014000300FF3F040000
      00230030002E0030007D0841007D080000000000000000000000002F00000003
      000D0014000300000003000000045F002E005F002D0E00050002080014000300
      323304000000230030002E0030007D082D007D08000000000000000000000000
      3000000002000D0014000300000003000000045F002E005F002D0E000500027D
      0855007D080000000000000000000000003100000004000D0014000300000001
      000000045F002E005F002D0E0005000207001400030000000400000023003000
      2E0030000800140003000000040000002D003B005F002D007D0891007D080000
      000000000000000000003200000007000D0014000300000000000000045F002E
      005F002D0E000500020400140002000000A5A5A5FF230030002E003000070014
      00020000003F3F3FFF2D003B005F002D0008001400020000003F3F3FFF3F005F
      0040045F0009001400020000003F3F3FFF40005F002D0000000A001400020000
      003F3F3FFF00000000000000007D082D007D0800000000000000000000000033
      00000002000D0014000300000003000000045F002E005F002D0E000500017D08
      41007D080000000000000000000000003400000003000D001400020000009C65
      00FF045F002E005F002D0E000500020400140002000000FFEB9CFF230030002E
      0030007D0841007D080000000000000000000000003500000003000D00140002
      0000009C0006FF045F002E005F002D0E000500020400140002000000FFC7CEFF
      230030002E0030007D082D007D08000000000000000000000000360000000200
      0D001400020000007F7F7FFF045F002E005F002D0E000500027D0891007D0800
      00000000000000000000003700000007000D0014000300000001000000045F00
      2E005F002D0E000500020400140002000000FFFFCCFF230030002E0030000700
      140002000000B2B2B2FF2D003B005F002D000800140002000000B2B2B2FF3F00
      5F0040045F000900140002000000B2B2B2FF40005F002D0000000A0014000200
      0000B2B2B2FF00000000000000007D082D007D08000000000000000000000000
      3800000002000D0014000300000001000000045F002E005F002D0E000500027D
      0841007D080000000000000000000000003900000003000D00140002000000FA
      7D00FF045F002E005F002D0E000500020800140002000000FF8001FF23003000
      2E0030007D082D007D080000000000000000000000003A00000002000D001400
      02000000FF0000FF045F002E005F002D0E000500027D082D007D080000000000
      000000000000003B00000002000D0014000300000001000000045F002E005F00
      2D0E000500027D082D007D080000000000000000000000003C00000002000D00
      14000300000001000000045F002E005F002D0E000500027D0841007D08000000
      0000000000000000003D00000003000D00140002000000006100FF045F002E00
      5F002D0E000500020400140002000000C6EFCEFF230030002E0030007D082D00
      7D080000000000000000000000003E00000002000D0014000300000001000000
      045F002E005F002D0E000500027D082D007D080000000000000000000000003F
      00000002000D0014000300000001000000045F002E005F002D0E000500027D08
      2D007D080000000000000000000000004000000002000D001400030000000100
      0000045F002E005F002D0E000500027D082D007D080000000000000000000000
      004100000002000D0014000300000001000000045F002E005F002D0E00050002
      8D0823008D080000000000000000000003000000020005000C0007000000FFFF
      FFFF250005000093021F0010000D000132003000250020002D00200010043A04
      460435043D044204310092084D0092080000000000000000000001041EFF0D00
      32003000250020002D00200010043A04460435043D0442043100000003000100
      0C0007046566DCE6F1FF05000C0007010000000000FF250005000293021F0011
      000D000132003000250020002D00200010043A04460435043D04420432009208
      4D00920800000000000000000000010422FF0D0032003000250020002D002000
      10043A04460435043D04420432000000030001000C0007056566F2DCDBFF0500
      0C0007010000000000FF250005000293021F0012000D00013200300025002000
      2D00200010043A04460435043D044204330092084D0092080000000000000000
      0000010426FF0D0032003000250020002D00200010043A04460435043D044204
      33000000030001000C0007066566EBF1DEFF05000C0007010000000000FF2500
      05000293021F0013000D000132003000250020002D00200010043A0446043504
      3D044204340092084D0092080000000000000000000001042AFF0D0032003000
      250020002D00200010043A04460435043D04420434000000030001000C000707
      6566E4DFECFF05000C0007010000000000FF250005000293021F0014000D0001
      32003000250020002D00200010043A04460435043D044204350092084D009208
      0000000000000000000001042EFF0D0032003000250020002D00200010043A04
      460435043D04420435000000030001000C0007086566DAEEF3FF05000C000701
      0000000000FF250005000293021F0015000D000132003000250020002D002000
      10043A04460435043D044204360092084D009208000000000000000000000104
      32FF0D0032003000250020002D00200010043A04460435043D04420436000000
      030001000C0007096566FDE9D9FF05000C0007010000000000FF250005000293
      021F0016000D000134003000250020002D00200010043A04460435043D044204
      310092084D0092080000000000000000000001041FFF0D003400300025002000
      2D00200010043A04460435043D04420431000000030001000C000704CC4CB8CC
      E4FF05000C0007010000000000FF250005000293021F0017000D000134003000
      250020002D00200010043A04460435043D044204320092084D00920800000000
      000000000000010423FF0D0034003000250020002D00200010043A0446043504
      3D04420432000000030001000C000705CC4CE6B8B7FF05000C00070100000000
      00FF250005000293021F0018000D000134003000250020002D00200010043A04
      460435043D044204330092084D00920800000000000000000000010427FF0D00
      34003000250020002D00200010043A04460435043D0442043300000003000100
      0C000706CC4CD8E4BCFF05000C0007010000000000FF250005000293021F0019
      000D000134003000250020002D00200010043A04460435043D04420434009208
      4D0092080000000000000000000001042BFF0D0034003000250020002D002000
      10043A04460435043D04420434000000030001000C000707CC4CCCC0DAFF0500
      0C0007010000000000FF250005000293021F001A000D00013400300025002000
      2D00200010043A04460435043D044204350092084D0092080000000000000000
      000001042FFF0D0034003000250020002D00200010043A04460435043D044204
      35000000030001000C000708CC4CB7DEE8FF05000C0007010000000000FF2500
      05000293021F001B000D000134003000250020002D00200010043A0446043504
      3D044204360092084D00920800000000000000000000010433FF0D0034003000
      250020002D00200010043A04460435043D04420436000000030001000C000709
      CC4CFCD5B4FF05000C0007010000000000FF250005000293021F001C000D0001
      36003000250020002D00200010043A04460435043D044204310092084D009208
      00000000000000000000010420FF0D0036003000250020002D00200010043A04
      460435043D04420431000000030001000C000704323395B3D7FF05000C000700
      0000FFFFFFFF250005000293021F001D000D000136003000250020002D002000
      10043A04460435043D044204320092084D009208000000000000000000000104
      24FF0D0036003000250020002D00200010043A04460435043D04420432000000
      030001000C0007053233DA9694FF05000C0007000000FFFFFFFF250005000293
      021F001E000D000136003000250020002D00200010043A04460435043D044204
      330092084D00920800000000000000000000010428FF0D003600300025002000
      2D00200010043A04460435043D04420433000000030001000C0007063233C4D7
      9BFF05000C0007000000FFFFFFFF250005000293021F001F000D000136003000
      250020002D00200010043A04460435043D044204340092084D00920800000000
      00000000000001042CFF0D0036003000250020002D00200010043A0446043504
      3D04420434000000030001000C0007073233B1A0C7FF05000C0007000000FFFF
      FFFF250005000293021F0020000D000136003000250020002D00200010043A04
      460435043D044204350092084D00920800000000000000000000010430FF0D00
      36003000250020002D00200010043A04460435043D0442043500000003000100
      0C000708323392CDDCFF05000C0007000000FFFFFFFF250005000293021F0021
      000D000136003000250020002D00200010043A04460435043D04420436009208
      4D00920800000000000000000000010434FF0D0036003000250020002D002000
      10043A04460435043D04420436000000030001000C0007093233FABF8FFF0500
      0C0007000000FFFFFFFF250005000293021300220007000110043A0446043504
      3D04420431009208410092080000000000000000000001041DFF070010043A04
      460435043D04420431000000030001000C00070400004F81BDFF05000C000700
      0000FFFFFFFF250005000293021300230007000110043A04460435043D044204
      320092084100920800000000000000000000010421FF070010043A0446043504
      3D04420432000000030001000C0007050000C0504DFF05000C0007000000FFFF
      FFFF250005000293021300240007000110043A04460435043D04420433009208
      4100920800000000000000000000010425FF070010043A04460435043D044204
      33000000030001000C00070600009BBB59FF05000C0007000000FFFFFFFF2500
      05000293021300250007000110043A04460435043D0442043400920841009208
      00000000000000000000010429FF070010043A04460435043D04420434000000
      030001000C00070700008064A2FF05000C0007000000FFFFFFFF250005000293
      021300260007000110043A04460435043D044204350092084100920800000000
      00000000000001042DFF070010043A04460435043D0442043500000003000100
      0C00070800004BACC6FF05000C0007000000FFFFFFFF25000500029302130027
      0007000110043A04460435043D04420436009208410092080000000000000000
      0000010431FF070010043A04460435043D04420436000000030001000C000709
      0000F79646FF05000C0007000000FFFFFFFF250005000293020F002800050001
      120432043E043404200092087500920800000000000000000000010214FF0500
      120432043E04340420000000070001000C0005FF0000FFCC99FF05000C0005FF
      00003F3F76FF250005000206000E0005FF00007F7F7FFF010007000E0005FF00
      007F7F7FFF010008000E0005FF00007F7F7FFF010009000E0005FF00007F7F7F
      FF010093020F00290005000112044B0432043E04340492087500920800000000
      000000000000010215FF050012044B0432043E0434040000070001000C0005FF
      0000F2F2F2FF05000C0005FF00003F3F3FFF250005000206000E0005FF00003F
      3F3FFF010007000E0005FF00003F3F3FFF010008000E0005FF00003F3F3FFF01
      0009000E0005FF00003F3F3FFF0100930219002A000A000112044B0447043804
      41043B0435043D043804350492087F00920800000000000000000000010216FF
      0A0012044B044704380441043B0435043D04380435040000070001000C0005FF
      0000F2F2F2FF05000C0005FF0000FA7D00FF250005000206000E0005FF00007F
      7F7FFF010007000E0005FF00007F7F7FFF010008000E0005FF00007F7F7FFF01
      0009000E0005FF00007F7F7FFF0100930204002B8004FF920826009208000000
      00000000000000010504FF0800140435043D04350436043D044B043904000000
      00930204002C8007FF92082E00920800000000000000000000010507FF0C0014
      0435043D04350436043D044B04390420005B0030005D000000000093021B002D
      000B00011704300433043E043B043E0432043E043A042000310092084B009208
      00000000000000000000010310FF0B001704300433043E043B043E0432043E04
      3A04200031000000030005000C00070300001F497DFF250005000207000E0007
      0400004F81BDFF050093021B002E000B00011704300433043E043B043E043204
      3E043A042000320092084B00920800000000000000000000010311FF0B001704
      300433043E043B043E0432043E043A04200032000000030005000C0007030000
      1F497DFF250005000207000E000704FF3FA7BFDEFF050093021B002F000B0001
      1704300433043E043B043E0432043E043A042000330092084B00920800000000
      000000000000010312FF0B001704300433043E043B043E0432043E043A042000
      33000000030005000C00070300001F497DFF250005000207000E000704323395
      B3D7FF020093021B0030000B00011704300433043E043B043E0432043E043A04
      2000340092083D00920800000000000000000000010313FF0B00170430043304
      3E043B043E0432043E043A04200034000000020005000C00070300001F497DFF
      250005000293020D003100040001180442043E04330492084B00920800000000
      000000000000010319FF0400180442043E0433040000040005000C0007010000
      000000FF250005000206000E00070400004F81BDFF010007000E00070400004F
      81BDFF06009302290032001200011A043E043D04420440043E043B044C043D04
      30044F0420004F044704350439043A04300492088F0092080000000000000000
      0000010217FF12001A043E043D04420440043E043B044C043D0430044F042000
      4F044704350439043A0430040000070001000C0005FF0000A5A5A5FF05000C00
      07000000FFFFFFFF250005000206000E0005FF00003F3F3FFF060007000E0005
      FF00003F3F3FFF060008000E0005FF00003F3F3FFF060009000E0005FF00003F
      3F3FFF06009302150033000800011D0430043704320430043D04380435049208
      370092080000000000000000000001030FFF08001D0430043704320430043D04
      380435040000020005000C00070300001F497DFF250005000193021B0034000B
      00011D04350439044204400430043B044C043D044B0439049208490092080000
      000000000000000001011CFF0B001D04350439044204400430043B044C043D04
      4B0439040000030001000C0005FF0000FFEB9CFF05000C0005FF00009C6500FF
      250005000293020400008000FF92083500920800000000000000000000010100
      FF07001E0431044B0447043D044B0439040000020005000C0007010000000000
      FF25000500029302110035000600011F043B043E0445043E04390492083F0092
      080000000000000000000001011BFF06001F043B043E0445043E043904000003
      0001000C0005FF0000FFC7CEFF05000C0005FF00009C0006FF25000500029302
      170036000900011F043E044F0441043D0435043D043804350492083900920800
      000000000000000000010235FF09001F043E044F0441043D0435043D04380435
      040000020005000C0005FF00007F7F7FFF25000500029302190037000A00011F
      04400438043C043504470430043D043804350492086E00920800000000000000
      00000001020AFF0A001F04400438043C043504470430043D0438043504000005
      0001000C0005FF0000FFFFCCFF06000E0005FF0000B2B2B2FF010007000E0005
      FF0000B2B2B2FF010008000E0005FF0000B2B2B2FF010009000E0005FF0000B2
      B2B2FF010093020400388005FF92082A00920800000000000000000000010505
      FF0A001F0440043E04460435043D0442043D044B043904000000009302250039
      00100001210432044F04370430043D043D0430044F0420004F04470435043904
      3A04300492085500920800000000000000000000010218FF1000210432044F04
      370430043D043D0430044F0420004F044704350439043A043004000003000500
      0C0005FF0000FA7D00FF250005000207000E0005FF0000FF8001FF060093022D
      003A00140001220435043A044104420420003F0440043504340443043F044004
      35043604340435043D0438044F0492084F009208000000000000000000000102
      0BFF1400220435043A044104420420003F0440043504340443043F0440043504
      3604340435043D0438044F040000020005000C0005FF0000FF0000FF25000500
      02930204003B8003FF92082A00920800000000000000000000010503FF0A0024
      0438043D0430043D0441043E0432044B04390400000000930204003C8006FF92
      083200920800000000000000000000010506FF0E00240438043D0430043D0441
      043E0432044B04390420005B0030005D0000000000930213003D000700012504
      3E0440043E044804380439049208410092080000000000000000000001011AFF
      070025043E0440043E044804380439040000030001000C0005FF0000C6EFCEFF
      05000C0005FF0000006100FF25000500028E0858008E08000000000000000000
      0090000000110011005400610062006C0065005300740079006C0065004D0065
      006400690075006D0032005000690076006F0074005300740079006C0065004C
      0069006700680074003100360060010200000085000E006A3400000000060073
      7665726B619A0818009A08000000000000000000000100000000000000040000
      00A3081000A30800000000000000000000000000008C00040007000700AE0104
      0001000104170008000100000000000000C1010800C1010000D5380200FC005D
      010F0000000F0000000600011A041E0414042000310021040A00011A041E0414
      0420003C043504310435043B044C040C00011D04300438043C0435043D043E04
      320430043D04380435040900011A041E041B042D0012041E042000310021040D
      00011A041E041B042D0012041E0420003C043504310435043B044C0405000121
      041A041B04100414041100012004100417041D041804260410040A0031002104
      2D003C043504310435043B044C040C00002349445F544F5641525F3143090000
      2349445F544F5641520B0000234E414D455F544F564152090000234B4F4C564F
      5F31430D0000234B4F4C564F5F494E5445524E06000023534B4C414428000121
      043204350440043A0430042000310021042000410420003C043504310435043B
      044C043D043E04390420003F0440043E043304400430043C043C043E04390420
      003D043004200034043004420443040C000023444154415F535645524B49FF00
      12000800A53200000C00000059330000C0000000630816006308000000000000
      00000000160000000000000002009608100096080000000000000000000042E5
      01009B0810009B0800000000000000000000010000008C0810008C0800000000
      000000000000000000000A00000009081000000610006732CD07C18001000606
      00000B0214000000000000000000040000008E420000494400000D0002000100
      0C00020064000F000200010011000200000010000800FCA9F1D24D62503F5F00
      020001002A00020000002B000200000082000200010080000800000000000000
      00002502040000002C0181000200C10414000000150000008300020000008400
      0200000026000800666666666666E63F27000800666666666666E63F28000800
      000000000000E83F29000800000000000000E83F4D000A0D0000430061006E00
      6F006E0020004D00460034003000310030002000530065007200690065007300
      20005500460052004900490020004C005400000000000000000001040A02DC00
      2C0C03470100010009009A0B3408640001000700580201000100000001000000
      4100340000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001000000020000000100
      0000020000000000000000000000000000000000000043616E6F6E0000006C0A
      00000000000000010000010000000206000009042E05006019043E0043006100
      6E006F006E0020004D0046003400300031003000200053006500720069006500
      730020005500460052004900490020004C005400000000000000000000000200
      0000FF0700007D028A010000016401030201030304020502066401010201030F
      0410050600076401010201030F0410050600080309010A010B020C020D020E02
      0F03000A64010102020302040205020602070208020964010302020302040100
      0A640102020103010401050A066401070207030704020508200000000B640101
      0202030204020502060207020802000C0D0D6401030202040205020602070100
      0E6401030202030204020501060480070440080440000F640103020820030820
      0464010702070307040205082000050A060E0701001064010302020301040105
      0106010701080812090200116401010012640108200013640102020422006564
      0164010302020364010202020302000402050206020702080109020A020B020C
      020D030E010F0110031102120113011401150216021702180219031A021B021C
      021D021E021F0220022102220223020002640103020603020402050422060207
      02080209040A040B020C04400D030E030F011001110312021302140115021602
      1702180219021A021B041C041D041E041F062002210122012301240225022602
      2701280129012A012B012C022D642E642F643002310132013301340135013601
      3701380239020003640103020203020402050206020702080609060A060B060C
      070D070E010F0110011101120113011401150116011701180119011A011B011C
      011D01641E01641F016420022101220223012401250126012701280129012A01
      2B012C012D012E012F0130013101320133013401000464010821020811000564
      0103000664010202020308100408100008640101020303030403050300096401
      0102030308210406050606060706080609060A060B06000A64010202020D0302
      0408190007021C000040380000010000000400000009000900340800009A0B00
      00320000003C000000020800005E0B0000318509000900340800009A0B000032
      0000003C000000020800005E0B00003185010282005802580200010118010000
      00640000000000000000000000000F00320001010001000100000000000B0000
      0000000000900100000041007200690061006C00200043007900720000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000007000101000100029600000000000000000000000000
      0000000000000000000000000000000000000000000000000201005C434E5A30
      30352E4943430000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000201005C434E5A3030352E4943430000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000001005C434E5A3030352E49434300000000000000000201
      010101020200000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000920000001A04
      1E041D0424041804140415041D042604180410041B042C041D041E0400000000
      0000000000000000000000000000000000000000000000000000000000001A04
      1E041D0424041804140415041D042604180410041B042C041D041E0400000000
      0000000000000000000000000000000000000000000000000000000000004800
      000000000000900100000041007200690061006C002000430079007200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000808080000000000000000000C20100000000000700
      0700070004000700000000000000000000000000000000000000000000000000
      0000000000000000000000000200001D0430044104420440042D003A04380420
      003F043E04200043043C043E043B0447042E0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000800000C000000010101185802
      010C0001010282000700070000080000FFFFFFFFFFFFFFFF019601FEFFFFFF00
      0200030000000201001000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000001020000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0007000200010000000000000000000000000000000000010000000008001101
      0000000900090000000000000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000202020202
      0400000000010001007F0000007F000000000000000100010002000200000001
      0001000200010001000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000005000000000000000000000000000000000002000200020002
      0000000200000004000000090009000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000101000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A100220009006400010001000100020058020000333333333333D33F3333
      33333333D33F01009C0826009C08000000000000000000000000000000000000
      00000000000000003C3300000000000000005500020008007D000C0000000000
      92090F00020000007D000C00010001006D0C0F00060000007D000C0002000200
      DB2D0F00020000007D000C0003000300920D0F00020000007D000C0004000400
      DB100F00020000007D000C00050005006D0C0F00020000007D000C0006000600
      920A0F000200000000020E000000000004000000000007000000080210000000
      000007002C010000000000010F00080210000200000007005802000000000001
      0F00080210000300000007002C010000000000010F00FD000A00000002004000
      0D000000FD000A00000003000F000E000000FD000A00020000003E0000000000
      FD000A00020001003E0001000000FD000A00020002003E0002000000FD000A00
      020003003E0003000000FD000A00020004003E0004000000FD000A0002000500
      3E0006000000FD000A00020006003E0005000000FD000A00030000003F000700
      0000FD000A00030001003F0008000000FD000A00030002003F0009000000FD00
      0A000300030041000A000000FD000A000300040041000B000000060021000300
      0500410002000F000000FFFF0000062000FC0B0044030003C044030004C004FD
      000A00030006003F000C000000D7000A003301000028001C0062003E021200B6
      06000000004000000000000000000000008B0810008B08000000000000000000
      00000002001D000F00030300030000000100030003000305B001160001000200
      030003000500050001000300030005000500B1018500010303000000FFFF3F84
      02800000030003000500050000FC0B0044030003C044030004C004C004C00400
      5500460052004900490020004C005400000000000000000001040A02DC002C0C
      0347FFFFFFFF00000000FFFFFFFFFF0000000900000000000000FFFFFFFF0100
      0000010000000100000001000000000000000000000001001E00007B08C7007B
      0801000300030005000500000000000100000003000100030198000000FFFF3F
      84028000C004C004005500460052004900490020004C00540000000000000000
      0001040A02DC002C0C0347FFFFFFFF00000000FFFFFFFFFF0000000900000000
      000000FFFFFFFF00000000FFFFFFFFFF0000000900000000000000FFFFFFFF01
      000000010000000100000001000000000000000000000001000000FFFF000001
      000D001400030000000000000000000000000000001000000000000000000000
      00000000000067081700670800000000000000000000020001FFFFFFFF034400
      000A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000500530075006D006D0061007200790049006E0066006F0072006D00
      6100740069006F006E0000000000000000000000000000000000000000000000
      00000000280002010300000005000000FFFFFFFF000000000000000000000000
      00000000000000000000000000000000000000000000000001000000D0000000
      00000000050044006F00630075006D0065006E007400530075006D006D006100
      7200790049006E0066006F0072006D006100740069006F006E00000000000000
      0000000038000200FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000500000000010000
      00000000010043006F006D0070004F0062006A00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000012000200FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000900000066000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000B000000000000001E100000010000000700000073766572
      6B61000C100000020000001E00000006000000CBE8F1F2FB0003000000010000
      000000000100FEFF030A0000FFFFFFFF2008020000000000C000000000000046
      1A000000CBE8F1F2204D6963726F736F667420457863656C2032303033000600
      00004269666638000E000000457863656C2E53686565742E3800F439B2710000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000}
  end
  object SaveDialog1: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 741
    Top = 96
  end
end
