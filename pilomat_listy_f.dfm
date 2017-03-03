object F_Pilomat_listy: TF_Pilomat_listy
  Left = 106
  Top = 241
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1080#1083#1086#1084#1072#1090#1077#1088#1080#1072#1083' '#1083#1080#1089#1090#1086#1074#1086#1081
  ClientHeight = 324
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 20
  object Label1: TLabel
    Left = 25
    Top = 60
    Width = 186
    Height = 20
    Caption = #1043#1088#1091#1087#1087#1072' '#1087#1080#1083#1086#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
  end
  object Label2: TLabel
    Left = 10
    Top = 96
    Width = 201
    Height = 20
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
  end
  object Label3: TLabel
    Left = 128
    Top = 136
    Width = 83
    Height = 20
    Caption = #1056#1072#1079#1084#1077#1088' "X"'
  end
  object Label4: TLabel
    Left = 128
    Top = 168
    Width = 83
    Height = 20
    Caption = #1056#1072#1079#1084#1077#1088' "Y"'
  end
  object Label5: TLabel
    Left = 416
    Top = 152
    Width = 122
    Height = 20
    Caption = #1055#1083#1086#1097#1072#1076#1100' '#1083#1080#1089#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object L_Area: TLabel
    Left = 552
    Top = 152
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
    Left = 181
    Top = 13
    Width = 30
    Height = 20
    Caption = #1050#1086#1076
  end
  object Panel1: TPanel
    Left = 0
    Top = 264
    Width = 769
    Height = 57
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object B_Exit: TButton
      Left = 664
      Top = 12
      Width = 97
      Height = 33
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
    object B_Ok: TButton
      Left = 552
      Top = 12
      Width = 97
      Height = 33
      Caption = #1047#1072#1087#1080#1089#1072#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = B_OkClick
    end
  end
  object DBE_Razmer_Y: TDBEdit
    Left = 216
    Top = 164
    Width = 161
    Height = 28
    DataField = 'RAZMER_Y'
    DataSource = DS_Pilomat_listy
    TabOrder = 2
    OnExit = DBE_Razmer_YExit
    OnKeyPress = DBE_Razmer_YKeyPress
  end
  object DBE_Razmer_X: TDBEdit
    Left = 216
    Top = 132
    Width = 161
    Height = 28
    DataField = 'RAZMER_X'
    DataSource = DS_Pilomat_listy
    TabOrder = 1
    OnExit = DBE_Razmer_XExit
    OnKeyPress = DBE_Razmer_XKeyPress
  end
  object DBE_Name: TDBEdit
    Left = 216
    Top = 92
    Width = 545
    Height = 28
    DataField = 'NAME'
    DataSource = DS_Pilomat_listy
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 217
    Top = 9
    Width = 112
    Height = 28
    TabStop = False
    DataField = 'ID'
    DataSource = DS_Pilomat_listy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object CB_IsList: TCheckBox
    Left = 216
    Top = 208
    Width = 121
    Height = 17
    Caption = #1069#1090#1086' '#1083#1080#1089#1090
    TabOrder = 5
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 216
    Top = 59
    Width = 433
    Height = 28
    DataField = 'GRUPA_NAME'
    DataSource = DS_Pilomat_listy
    DropDownRows = 20
    TabOrder = 6
  end
  object IB_Pilomat_listy: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from pilomat_listy'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into pilomat_listy'
      '  (ID, ID_GRUPA, RAZMER_X, RAZMER_Y, NAME, AREA, ISLIST)'
      'values'
      '  (:ID, :ID_GRUPA, :RAZMER_X, :RAZMER_Y, :NAME, :AREA, :ISLIST)')
    RefreshSQL.Strings = (
      'Select *'
      'from pilomat_listy '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from pilomat_listy')
    ModifySQL.Strings = (
      'update pilomat_listy'
      'set'
      '  ID = :ID,'
      '  ID_GRUPA = :ID_GRUPA,'
      '  RAZMER_X = :RAZMER_X,'
      '  RAZMER_Y = :RAZMER_Y,'
      '  NAME = :NAME,'
      '  AREA = :AREA,'
      '  ISLIST = :ISLIST'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PILOMAT_liSTY_ID'
    Left = 680
    Top = 14
    object IB_Pilomat_listyID: TIntegerField
      FieldName = 'ID'
      Origin = 'PILOMAT_LISTY.ID'
      Required = True
    end
    object IB_Pilomat_listyID_GRUPA: TIntegerField
      FieldName = 'ID_GRUPA'
      Origin = '"PILOMAT_DETALI"."ID_GRUPA"'
      Required = True
    end
    object IB_Pilomat_listyGRUPA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'GRUPA_NAME'
      LookupDataSet = IB_Pilomat_Grupa_F
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_GRUPA'
      Size = 60
      Lookup = True
    end
    object IB_Pilomat_listyRAZMER_X: TIntegerField
      FieldName = 'RAZMER_X'
      Origin = 'PILOMAT_LISTY.RAZMER_X'
      Required = True
    end
    object IB_Pilomat_listyRAZMER_Y: TIntegerField
      FieldName = 'RAZMER_Y'
      Origin = 'PILOMAT_LISTY.RAZMER_Y'
      Required = True
    end
    object IB_Pilomat_listyNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'PILOMAT_LISTY.NAME'
      Required = True
      Size = 50
    end
    object IB_Pilomat_listyAREA: TIntegerField
      FieldName = 'AREA'
      Origin = 'PILOMAT_LISTY.AREA'
      Required = True
    end
    object IB_Pilomat_listyISLIST: TSmallintField
      FieldName = 'ISLIST'
      Origin = 'PILOMAT_LISTY.ISLIST'
    end
  end
  object DS_Pilomat_listy: TDataSource
    DataSet = IB_Pilomat_listy
    Left = 712
    Top = 14
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
    Left = 680
    Top = 54
  end
end
