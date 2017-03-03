object F_Vidy_rabot: TF_Vidy_rabot
  Left = 280
  Top = 48
  Width = 777
  Height = 775
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1101#1090#1072#1087#1086#1074' '#1088#1072#1073#1086#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  OnActivate = FormActivate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 248
    Top = 400
    Width = 201
    Height = 20
    Caption = #1056#1040#1057#1062#1045#1053#1050#1048' '#1053#1040' '#1056#1040#1041#1054#1058#1059
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object B_Select: TButton
    Left = 664
    Top = 328
    Width = 89
    Height = 33
    Caption = #1042#1099#1073#1088#1072#1090#1100
    TabOrder = 4
    OnClick = B_SelectClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 761
    Height = 305
    DataSource = DS_Vidy_rabot
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1101#1090#1072#1087#1072
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 555
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 306
    Width = 761
    Height = 65
    BevelInner = bvLowered
    TabOrder = 1
    object B_Exit: TButton
      Left = 664
      Top = 16
      Width = 89
      Height = 33
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 1
      TabOrder = 2
      OnClick = B_ExitClick
    end
    object B_Edit: TButton
      Left = 160
      Top = 16
      Width = 97
      Height = 33
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = B_EditClick
    end
    object B_Insert: TButton
      Left = 8
      Top = 16
      Width = 145
      Height = 33
      Hint = #1042#1089#1090#1072#1074#1083#1103#1077#1090' '#1101#1090#1072#1087' '#1087#1086#1089#1083#1077' '#1090#1077#1082#1091#1097#1077#1075#1086
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1087#1086#1089#1083#1077' '#1090#1077#1082'.'
      TabOrder = 0
      OnClick = B_InsertClick
    end
    object B_Delete: TButton
      Left = 264
      Top = 16
      Width = 97
      Height = 33
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 3
      OnClick = B_DeleteClick
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 424
    Width = 761
    Height = 257
    DataSource = DS_Vidy_rabot_stoimosti
    FixedColor = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDblClick = DBGrid2DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'DATE_STOIM'
        ReadOnly = False
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CATEGORY_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
        Width = 293
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
        Width = 219
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 4
    Top = 688
    Width = 325
    Height = 49
    BevelInner = bvLowered
    TabOrder = 3
    object B_Stoimosti_Edit: TButton
      Left = 112
      Top = 8
      Width = 97
      Height = 33
      Cursor = crHandPoint
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1088#1072#1089#1094#1077#1085#1082#1091
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = B_Stoimosti_EditClick
    end
    object B_Stoimosti_Insert: TButton
      Left = 8
      Top = 8
      Width = 97
      Height = 33
      Cursor = crHandPoint
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1088#1072#1089#1094#1077#1085#1082#1091
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = B_Stoimosti_InsertClick
    end
    object B_Stoimosti_Delete: TButton
      Left = 216
      Top = 8
      Width = 97
      Height = 33
      Cursor = crHandPoint
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1088#1072#1089#1094#1077#1085#1082#1091
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
      OnClick = B_Stoimosti_DeleteClick
    end
  end
  object IB_Vidy_rabot: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from VIDY_RABOT'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into VIDY_RABOT'
      '  (ID, NAME)'
      'values'
      '  (:ID, :NAME)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  NAME'
      'from VIDY_RABOT '
      'where'
      '  ID = :ID'
      'order by ID')
    SelectSQL.Strings = (
      'select *  from  VIDY_RABOT'
      'order by ID')
    ModifySQL.Strings = (
      'update VIDY_RABOT'
      'set'
      '  NAME = :NAME'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_VIDYRABOT_ID'
    Left = 48
    Top = 200
    object IB_Vidy_rabotID: TIntegerField
      FieldName = 'ID'
      Origin = 'VIDY_RABOT.ID'
    end
    object IB_Vidy_rabotNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'VIDY_RABOT.NAME'
      Size = 50
    end
  end
  object IB_Vidy_rabot_stoimosti: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select vrs.date_stoim date_stoim, gpc.name category_name, vrs.pr' +
        'ice price'
      'from  VIDY_RABOT_STOIMOSTI vrs, gotov_prod_categories gpc'
      'where (vrs.ID_VID_RABOT=:ID) and (vrs.id_category=gpc.id)'
      'order by DATE_STOIM')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_VIDY_RABOT_STOIMOSTI_ID'
    DataSource = DS_Vidy_rabot
    Left = 456
    Top = 552
  end
  object DS_Vidy_rabot: TDataSource
    DataSet = IB_Vidy_rabot
    Left = 120
    Top = 200
  end
  object DS_Vidy_rabot_stoimosti: TDataSource
    DataSet = IB_Vidy_rabot_stoimosti
    Left = 504
    Top = 552
  end
end
