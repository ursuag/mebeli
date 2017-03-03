object F_Zakaz_select: TF_Zakaz_select
  Left = 241
  Top = 52
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1079#1072#1082#1072#1079#1072
  ClientHeight = 681
  ClientWidth = 953
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 18
  object DBGrid1: TDBGrid
    Left = 1
    Top = 0
    Width = 952
    Height = 217
    DataSource = DM_Mebeli.DS_Zakaz_0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1079#1072#1082#1072#1079#1072
        Width = 193
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATE_Z'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIMECHANIE'
        Title.Alignment = taCenter
        Title.Caption = #1055#1056#1048#1052#1045#1063#1040#1053#1048#1045
        Width = 575
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 224
    Width = 953
    Height = 401
    DataSource = DM_Mebeli.DS_Zakaz_1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_GOTOV_PROD'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 352
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GOTPROD_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1048#1047#1044#1045#1051#1048#1071
        Width = 317
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIORITET'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090
        Width = 101
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 632
    Width = 953
    Height = 49
    BevelInner = bvLowered
    TabOrder = 2
    object B_Exit: TButton
      Left = 856
      Top = 8
      Width = 89
      Height = 33
      Caption = '&'#1054#1090#1084#1077#1085#1080#1090#1100
      ModalResult = 2
      TabOrder = 0
      OnClick = B_ExitClick
    end
    object B_Select: TButton
      Left = 760
      Top = 8
      Width = 89
      Height = 33
      Caption = '&'#1042#1099#1073#1088#1072#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 1
      OnClick = B_SelectClick
    end
  end
end
