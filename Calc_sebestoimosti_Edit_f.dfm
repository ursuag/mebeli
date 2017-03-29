object F_Calc_sebestoimosti_Edit: TF_Calc_sebestoimosti_Edit
  Left = 0
  Top = 0
  AutoScroll = False
  Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1094#1080#1103' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1080' '#1087#1088#1086#1076#1091#1082#1094#1080#1080
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
  PrintScale = poNone
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object P_Shapka: TPanel
    Left = 0
    Top = 0
    Width = 1177
    Height = 89
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 157
      Top = 11
      Width = 16
      Height = 18
      Caption = #1086#1090
    end
    object Label5: TLabel
      Left = 0
      Top = 43
      Width = 89
      Height = 18
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object Label1: TLabel
      Left = 3
      Top = 11
      Width = 50
      Height = 18
      Caption = #8470' '#1076#1086#1082'.'
    end
    object DBE_ID: TDBEdit
      Left = 59
      Top = 7
      Width = 89
      Height = 26
      AutoSize = False
      DataField = 'ID'
      DataSource = DS_Calc_Sebest_0
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 96
      Top = 39
      Width = 729
      Height = 26
      AutoSize = False
      DataField = 'DESCRIPTION'
      DataSource = DS_Calc_Sebest_0
      TabOrder = 1
    end
    object DT_Date_calc: TDateTimePicker
      Left = 192
      Top = 8
      Width = 153
      Height = 26
      Date = 42797.638667210650000000
      Time = 42797.638667210650000000
      TabOrder = 2
      OnExit = DT_Date_calcExit
    end
    object DBEdit2: TDBEdit
      Left = 403
      Top = 7
      Width = 89
      Height = 26
      AutoSize = False
      DataField = 'DATE_DOC'
      DataSource = DS_Calc_Sebest_0
      ReadOnly = True
      TabOrder = 3
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 96
    Width = 1176
    Height = 273
    DataSource = DS_Calc_Sebest_1
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
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'ARTICLE'
        Title.Alignment = taCenter
        Title.Caption = #1040#1088#1090#1080#1082#1091#1083
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 335
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GOTOVPROD_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1055#1056#1054#1044#1059#1050#1062#1048#1071
        Width = 324
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE_SEBEST'
        Title.Alignment = taCenter
        Title.Caption = #1057#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1100
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 640
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
    end
    object B_Ok: TButton
      Left = 976
      Top = 6
      Width = 97
      Height = 33
      Caption = '&'#1047#1072#1087#1080#1089#1072#1090#1100
      Default = True
      TabOrder = 0
    end
    object B_Calc_Sebest: TButton
      Left = 8
      Top = 4
      Width = 145
      Height = 33
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100
      Default = True
      TabOrder = 2
      OnClick = B_Calc_SebestClick
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 376
    Width = 1176
    Height = 257
    DataSource = DS_Calc_Sebest_2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        ButtonStyle = cbsNone
        Expanded = False
        FieldName = 'DOC_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        Width = 280
        Visible = True
      end
      item
        ButtonStyle = cbsNone
        Expanded = False
        FieldName = 'STATYA_RASHODA'
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1072#1090#1100#1103' '#1088#1072#1089#1093
        Width = 367
        Visible = True
      end
      item
        ButtonStyle = cbsNone
        Expanded = False
        FieldName = 'MATERIAL_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083
        Width = 341
        Visible = True
      end
      item
        ButtonStyle = cbsNone
        Expanded = False
        FieldName = 'SUMMA'
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 105
        Visible = True
      end>
  end
  object DS_Calc_Sebest_0: TDataSource
    DataSet = IB_Calc_Sebest_0
    Left = 568
    Top = 8
  end
  object IB_Calc_Sebest_0: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from calc_sebest_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into calc_sebest_0'
      '  (ID, DATE_DOC, DESCRIPTION)'
      'values'
      '  (:ID, :DATE_DOC, :DESCRIPTION)')
    RefreshSQL.Strings = (
      'Select *'
      'from calc_sebest_0 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from calc_sebest_0'
      'where id=:ID')
    ModifySQL.Strings = (
      'update calc_sebest_0'
      'set'
      '  ID = :ID,'
      '  DATE_DOC = :DATE_DOC,'
      '  DESCRIPTION = :DESCRIPTION'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_CALC_SEBEST_0_ID'
    DataSource = F_Calc_sebestoimosti.DS_Calc_Sebest_Jurnal
    Left = 528
    Top = 8
  end
  object IB_Calc_Sebest_1: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    OnCalcFields = IB_Calc_Sebest_1CalcFields
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from calc_sebest_1'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into calc_sebest_1'
      '  (ID, ID_PARENT, ID_GOTOVPROD, PRICE_SEBEST)'
      'values'
      '  (:ID, :ID_PARENT, :ID_GOTOVPROD, :PRICE_SEBEST)')
    RefreshSQL.Strings = (
      'Select *'
      'from calc_sebest_1 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from calc_sebest_1'
      'where id_parent=:ID')
    ModifySQL.Strings = (
      'update calc_sebest_1'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_GOTOVPROD = :ID_GOTOVPROD,'
      '  PRICE_SEBEST = :PRICE_SEBEST'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_CALC_SEBEST_1_ID'
    DataSource = DS_Calc_Sebest_0
    Left = 96
    Top = 264
    object IB_Calc_Sebest_1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'CALC_SEBEST_1.ID'
      Required = True
    end
    object IB_Calc_Sebest_1ID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'CALC_SEBEST_1.ID_PARENT'
      Required = True
    end
    object IB_Calc_Sebest_1ID_GOTOVPROD: TIntegerField
      FieldName = 'ID_GOTOVPROD'
      Origin = 'CALC_SEBEST_1.ID_GOTOVPROD'
      Required = True
    end
    object IB_Calc_Sebest_1PRICE_SEBEST: TIBBCDField
      FieldName = 'PRICE_SEBEST'
      Origin = 'CALC_SEBEST_1.PRICE_SEBEST'
      Required = True
      Precision = 18
      Size = 3
    end
    object IB_Calc_Sebest_1GRUPA_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'GRUPA_NAME'
      Size = 200
      Calculated = True
    end
    object IB_Calc_Sebest_1GOTOVPROD_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'GOTOVPROD_NAME'
      Size = 200
      Calculated = True
    end
    object IB_Calc_Sebest_1ARTICLE: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ARTICLE'
      Calculated = True
    end
  end
  object DS_Calc_Sebest_1: TDataSource
    AutoEdit = False
    DataSet = IB_Calc_Sebest_1
    Left = 136
    Top = 264
  end
  object DS_Calc_Sebest_2: TDataSource
    AutoEdit = False
    DataSet = IB_Calc_Sebest_2
    Left = 120
    Top = 408
  end
  object IB_Calc_Sebest_2: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    OnCalcFields = IB_Calc_Sebest_1CalcFields
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from calc_sebest_1'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into calc_sebest_1'
      '  (ID, ID_PARENT, ID_GOTOVPROD, PRICE_SEBEST)'
      'values'
      '  (:ID, :ID_PARENT, :ID_GOTOVPROD, :PRICE_SEBEST)')
    RefreshSQL.Strings = (
      'Select *'
      'from calc_sebest_1 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from calc_sebest_2'
      'where id_parent=:ID')
    ModifySQL.Strings = (
      'update calc_sebest_1'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_GOTOVPROD = :ID_GOTOVPROD,'
      '  PRICE_SEBEST = :PRICE_SEBEST'
      'where'
      '  ID = :OLD_ID')
    DataSource = DS_Calc_Sebest_0
    Left = 80
    Top = 408
  end
end
