object F_Pilomat_detali: TF_Pilomat_detali
  Left = 199
  Top = 163
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1080#1083#1086#1084#1072#1090#1077#1088#1080#1072#1083#1099' '#1076#1077#1090#1072#1083#1080
  ClientHeight = 489
  ClientWidth = 875
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 23
    Top = 39
    Width = 186
    Height = 20
    Caption = #1043#1088#1091#1087#1087#1072' '#1087#1080#1083#1086#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
  end
  object Label2: TLabel
    Left = 8
    Top = 75
    Width = 201
    Height = 20
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
  end
  object Label3: TLabel
    Left = 128
    Top = 115
    Width = 83
    Height = 20
    Caption = #1056#1072#1079#1084#1077#1088' "X"'
  end
  object Label4: TLabel
    Left = 128
    Top = 147
    Width = 83
    Height = 20
    Caption = #1056#1072#1079#1084#1077#1088' "Y"'
  end
  object Label5: TLabel
    Left = 408
    Top = 131
    Width = 134
    Height = 20
    Caption = #1055#1083#1086#1097#1072#1076#1100' '#1076#1077#1090#1072#1083#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object L_Area: TLabel
    Left = 552
    Top = 131
    Width = 59
    Height = 20
    Caption = 'L_Area'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 179
    Top = 6
    Width = 30
    Height = 20
    Caption = #1050#1086#1076
  end
  object Panel1: TPanel
    Left = 0
    Top = 432
    Width = 873
    Height = 57
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object B_Exit: TButton
      Left = 768
      Top = 12
      Width = 97
      Height = 33
      Cancel = True
      Caption = '&'#1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
    object B_Ok: TButton
      Left = 656
      Top = 12
      Width = 97
      Height = 33
      Caption = '&'#1047#1072#1087#1080#1089#1072#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = B_OkClick
    end
  end
  object DBE_Razmer_Y: TDBEdit
    Left = 216
    Top = 143
    Width = 161
    Height = 28
    DataField = 'RAZMER_Y'
    DataSource = DSPilomat_detali
    TabOrder = 2
    OnExit = DBE_Razmer_YExit
    OnKeyPress = DBE_Razmer_YKeyPress
  end
  object DBE_Razmer_X: TDBEdit
    Left = 216
    Top = 111
    Width = 161
    Height = 28
    DataField = 'RAZMER_X'
    DataSource = DSPilomat_detali
    TabOrder = 1
    OnExit = DBE_Razmer_XExit
    OnKeyPress = DBE_Razmer_XKeyPress
  end
  object DBE_Name: TDBEdit
    Left = 216
    Top = 71
    Width = 553
    Height = 28
    DataField = 'NAME'
    DataSource = DSPilomat_detali
    TabOrder = 0
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 216
    Top = 35
    Width = 433
    Height = 24
    DataField = 'GRUPA_NAME'
    DataSource = DSPilomat_detali
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object DBEdit1: TDBEdit
    Left = 216
    Top = 2
    Width = 113
    Height = 28
    DataField = 'ID'
    DataSource = DSPilomat_detali
    ReadOnly = True
    TabOrder = 5
  end
  object DSPilomat_detali: TDataSource
    DataSet = IBPilomat_detali
    Left = 712
    Top = 14
  end
  object IBPilomat_detali: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BeforePost = IBPilomat_detaliBeforePost
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from pilomat_detali'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into pilomat_detali'
      '  (ID, RAZMER_X, RAZMER_Y, NAME, AREA, ID_GRUPA)'
      'values'
      '  (:ID, :RAZMER_X, :RAZMER_Y, :NAME, :AREA, :ID_GRUPA)')
    RefreshSQL.Strings = (
      'Select *'
      'from pilomat_detali '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from pilomat_detali')
    ModifySQL.Strings = (
      'update pilomat_detali'
      'set'
      '  ID = :ID,'
      '  RAZMER_X = :RAZMER_X,'
      '  RAZMER_Y = :RAZMER_Y,'
      '  NAME = :NAME,'
      '  AREA = :AREA,'
      '  ID_GRUPA = :ID_GRUPA'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PILOMAT_DETALI_ID'
    Left = 680
    Top = 14
    object IBPilomat_detaliID: TIntegerField
      FieldName = 'ID'
      Origin = '"PILOMAT_DETALI"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBPilomat_detaliRAZMER_X: TIntegerField
      FieldName = 'RAZMER_X'
      Origin = '"PILOMAT_DETALI"."RAZMER_X"'
      Required = True
    end
    object IBPilomat_detaliRAZMER_Y: TIntegerField
      FieldName = 'RAZMER_Y'
      Origin = '"PILOMAT_DETALI"."RAZMER_Y"'
      Required = True
    end
    object IBPilomat_detaliNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"PILOMAT_DETALI"."NAME"'
      Required = True
      Size = 50
    end
    object IBPilomat_detaliAREA: TIntegerField
      FieldName = 'AREA'
      Origin = '"PILOMAT_DETALI"."AREA"'
      Required = True
    end
    object IBPilomat_detaliID_GRUPA: TIntegerField
      FieldName = 'ID_GRUPA'
      Origin = '"PILOMAT_DETALI"."ID_GRUPA"'
      Required = True
    end
    object IBPilomat_detaliGRUPA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'GRUPA_NAME'
      LookupDataSet = IB_Pilomat_Grupa_F
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_GRUPA'
      Size = 60
      Lookup = True
    end
  end
  object IB_Pilomat_Grupa_F: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from pilomat_grupa'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into pilomat_grupa'
      '  (ID, NAME, ARTICLE)'
      'values'
      '  (:ID, :NAME, :ARTICLE)')
    RefreshSQL.Strings = (
      'Select *'
      'from pilomat_grupa '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * '
      'from pilomat_grupa')
    ModifySQL.Strings = (
      'update pilomat_grupa'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME,'
      '  ARTICLE = :ARTICLE'
      'where'
      '  ID = :OLD_ID')
    Left = 792
    Top = 14
  end
end
