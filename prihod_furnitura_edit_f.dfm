object F_prihod_furnitura_edit: TF_prihod_furnitura_edit
  Left = 0
  Top = 81
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1040#1082#1090' '#1087#1088#1080#1093#1086#1076#1072' '#1082#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1080#1093
  ClientHeight = 702
  ClientWidth = 1184
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
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 18
  object Label6: TLabel
    Left = 200
    Top = 8
    Width = 16
    Height = 18
    Caption = #1086#1090
  end
  object P_Shapka: TPanel
    Left = 0
    Top = 0
    Width = 1177
    Height = 105
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 53
      Height = 18
      Caption = #8470' '#1072#1082#1090#1072
    end
    object Label2: TLabel
      Left = 200
      Top = 8
      Width = 16
      Height = 18
      Caption = #1086#1090
    end
    object Label3: TLabel
      Left = 656
      Top = 8
      Width = 45
      Height = 18
      Caption = #1057#1082#1083#1072#1076
    end
    object Label4: TLabel
      Left = 8
      Top = 72
      Width = 59
      Height = 18
      Caption = #1055#1088#1080#1084#1077#1095'.'
    end
    object Label5: TLabel
      Left = 5
      Top = 40
      Width = 79
      Height = 18
      Alignment = taRightJustify
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
    end
    object Label7: TLabel
      Left = 400
      Top = 8
      Width = 29
      Height = 18
      Caption = #1058#1058#1053
    end
    object Label8: TLabel
      Left = 1033
      Top = 46
      Width = 107
      Height = 19
      Alignment = taRightJustify
      Caption = #1048#1090#1086#1075#1086' '#1087#1086' '#1058#1058#1053
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBE_ID: TDBEdit
      Left = 64
      Top = 4
      Width = 129
      Height = 26
      DataField = 'ID'
      DataSource = DM_Mebeli.DS_Prihod_furnitura_0
      ReadOnly = True
      TabOrder = 0
    end
    object DBE_Date_p: TDBEdit
      Left = 224
      Top = 4
      Width = 169
      Height = 26
      DataField = 'DATE_P'
      DataSource = DM_Mebeli.DS_Prihod_furnitura_0
      TabOrder = 1
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 712
      Top = 4
      Width = 281
      Height = 26
      DataField = 'SKLAD_NAME'
      DataSource = DM_Mebeli.DS_Prihod_furnitura_0
      DropDownRows = 20
      TabOrder = 2
    end
    object DBEdit1: TDBEdit
      Left = 80
      Top = 68
      Width = 913
      Height = 26
      DataField = 'PRIMECHANIE'
      DataSource = DM_Mebeli.DS_Prihod_furnitura_0
      TabOrder = 3
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 88
      Top = 36
      Width = 529
      Height = 26
      DataField = 'CONTRAGENT_NAME'
      DataSource = DM_Mebeli.DS_Prihod_furnitura_0
      DropDownRows = 20
      TabOrder = 4
    end
    object E_Itogo: TEdit
      Left = 1024
      Top = 68
      Width = 137
      Height = 26
      AutoSelect = False
      AutoSize = False
      ReadOnly = True
      TabOrder = 5
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 112
    Width = 1168
    Height = 529
    DataSource = DS_Prihod_furnitura_1
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
    OnColExit = DBGrid1ColExit
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnEditButtonClick = DBGrid1EditButtonClick
    Columns = <
      item
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 313
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FURNITURA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1052#1055#1051#1045#1050#1058#1059#1070#1065#1048#1045
        Width = 310
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054
        Width = 174
        Visible = True
      end
      item
        ButtonStyle = cbsNone
        Expanded = False
        FieldName = 'FURNITURA_EDIZM'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1045#1044'.'#1048#1047#1052'.'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Title.Alignment = taCenter
        Title.Caption = #1057#1059#1052#1052#1040
        Width = 128
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 1
    Top = 652
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
      OnClick = B_ExitClick
    end
    object B_Ok: TButton
      Left = 968
      Top = 6
      Width = 97
      Height = 33
      Caption = '&'#1047#1072#1087#1080#1089#1072#1090#1100
      TabOrder = 0
      OnClick = B_OkClick
    end
  end
  object DBEdit2: TDBEdit
    Left = 432
    Top = 4
    Width = 217
    Height = 26
    DataField = 'NOMER_TTN'
    DataSource = DM_Mebeli.DS_Prihod_furnitura_0
    TabOrder = 3
  end
  object DBL_Furnitura: TDBLookupComboBox
    Left = 424
    Top = 180
    Width = 529
    Height = 26
    DataField = 'FURNITURA_NAME'
    DropDownRows = 20
    DropDownWidth = 400
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = DS_Furnitura
    TabOrder = 4
    OnCloseUp = DBL_FurnituraCloseUp
  end
  object DS_Furnitura_Grupa: TDataSource
    AutoEdit = False
    DataSet = IB_Furnitura_Grupa
    Left = 272
    Top = 224
  end
  object IB_Furnitura_Grupa: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from furnitura_grupa'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into furnitura_grupa'
      '  (ID, NAME, ID_VID_RABOT)'
      'values'
      '  (:ID, :NAME, :ID_VID_RABOT)')
    RefreshSQL.Strings = (
      'Select *'
      'from furnitura_grupa '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *'
      'from furnitura_grupa'
      'order by name')
    ModifySQL.Strings = (
      'update furnitura_grupa'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME,'
      '  ID_VID_RABOT = :ID_VID_RABOT'
      'where'
      '  ID = :OLD_ID')
    Left = 224
    Top = 224
  end
  object IB_Furnitura: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from furnitura'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into furnitura'
      
        '  (ID, NAME, ED_IZM, ID_PARENT, MANUFACTURER_NAME, MANUFACTURER_' +
        'CODE, ARTICLE)'
      'values'
      
        '  (:ID, :NAME, :ED_IZM, :ID_PARENT, :MANUFACTURER_NAME, :MANUFAC' +
        'TURER_CODE, '
      '   :ARTICLE)')
    RefreshSQL.Strings = (
      'Select *'
      'from furnitura '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from furnitura'
      'where id_parent=:id_parent'
      'order by name')
    ModifySQL.Strings = (
      'update furnitura'
      'set'
      '  ID = :ID,'
      '  NAME = :NAME,'
      '  ED_IZM = :ED_IZM,'
      '  ID_PARENT = :ID_PARENT,'
      '  MANUFACTURER_NAME = :MANUFACTURER_NAME,'
      '  MANUFACTURER_CODE = :MANUFACTURER_CODE,'
      '  ARTICLE = :ARTICLE'
      'where'
      '  ID = :OLD_ID')
    DataSource = DS_Furnitura_Grupa
    Left = 224
    Top = 256
    object IB_FurnituraID: TIntegerField
      FieldName = 'ID'
      Origin = 'FURNITURA.ID'
      Required = True
    end
    object IB_FurnituraED_IZM: TIBStringField
      FieldName = 'ED_IZM'
      Origin = 'FURNITURA.ED_IZM'
      Required = True
      Size = 8
    end
    object IB_FurnituraID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'FURNITURA.ID_PARENT'
      Required = True
    end
    object IB_FurnituraMANUFACTURER_NAME: TIBStringField
      FieldName = 'MANUFACTURER_NAME'
      Origin = 'FURNITURA.MANUFACTURER_NAME'
      Size = 100
    end
    object IB_FurnituraARTICLE: TIntegerField
      FieldName = 'ARTICLE'
      Origin = 'FURNITURA.ARTICLE'
    end
    object IB_FurnituraNAME: TIBStringField
      FieldName = 'NAME'
      Origin = 'FURNITURA.NAME'
      Required = True
      Size = 100
    end
    object IB_FurnituraMANUFACTURER_CODE: TIBStringField
      FieldName = 'MANUFACTURER_CODE'
      Origin = 'FURNITURA.MANUFACTURER_CODE'
      Size = 100
    end
  end
  object DS_Furnitura: TDataSource
    AutoEdit = False
    DataSet = IB_Furnitura
    Left = 272
    Top = 256
  end
  object IB_Prihod_furnitura_1: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    OnCalcFields = IB_Prihod_furnitura_1CalcFields
    OnNewRecord = IB_Prihod_furnitura_1NewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from prihod_furnitura_1'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into prihod_furnitura_1'
      
        '  (ID_PARENT, ID_FURNITURA, KOL_VO, ID, SUMMA, ID_FURNITURA_GRUP' +
        'A)'
      'values'
      
        '  (:ID_PARENT, :ID_FURNITURA, :KOL_VO, :ID, :SUMMA, :ID_FURNITUR' +
        'A_GRUPA)')
    RefreshSQL.Strings = (
      'Select *'
      'from prihod_furnitura_1 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *'
      'from prihod_furnitura_1'
      'where id_parent=:id')
    ModifySQL.Strings = (
      'update prihod_furnitura_1'
      'set'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_FURNITURA = :ID_FURNITURA,'
      '  KOL_VO = :KOL_VO,'
      '  ID = :ID,'
      '  SUMMA = :SUMMA,'
      '  ID_FURNITURA_GRUPA = :ID_FURNITURA_GRUPA'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PRIHOD_FURNITURA_1_ID'
    DataSource = DM_Mebeli.DS_Prihod_furnitura_0
    Left = 512
    Top = 224
    object IB_Prihod_furnitura_1ID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'PRIHOD_FURNITURA_1.ID_PARENT'
      Required = True
    end
    object IB_Prihod_furnitura_1ID_FURNITURA: TIntegerField
      FieldName = 'ID_FURNITURA'
      Origin = 'PRIHOD_FURNITURA_1.ID_FURNITURA'
      Required = True
    end
    object IB_Prihod_furnitura_1KOL_VO: TIBBCDField
      FieldName = 'KOL_VO'
      Origin = 'PRIHOD_FURNITURA_1.KOL_VO'
      Required = True
      Precision = 9
      Size = 3
    end
    object IB_Prihod_furnitura_1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PRIHOD_FURNITURA_1.ID'
      Required = True
    end
    object IB_Prihod_furnitura_1SUMMA: TIBBCDField
      FieldName = 'SUMMA'
      Origin = 'PRIHOD_FURNITURA_1.SUMMA'
      Precision = 18
      Size = 2
    end
    object IB_Prihod_furnitura_1ID_FURNITURA_GRUPA: TIntegerField
      FieldName = 'ID_FURNITURA_GRUPA'
      Origin = 'PRIHOD_FURNITURA_1.ID_FURNITURA_GRUPA'
    end
    object IB_Prihod_furnitura_1GRUPA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'GRUPA_NAME'
      LookupDataSet = IB_Furnitura_Grupa
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_FURNITURA_GRUPA'
      Size = 200
      Lookup = True
    end
    object IB_Prihod_furnitura_1FURNITURA_EDIZM: TStringField
      FieldKind = fkLookup
      FieldName = 'FURNITURA_EDIZM'
      LookupDataSet = IB_Furnitura
      LookupKeyFields = 'ID'
      LookupResultField = 'ED_IZM'
      KeyFields = 'ID_FURNITURA'
      Size = 100
      Lookup = True
    end
    object IB_Prihod_furnitura_1FURNITURA_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'FURNITURA_NAME'
      Size = 200
      Calculated = True
    end
    object IB_Prihod_furnitura_1PRICE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PRICE'
      Calculated = True
    end
  end
  object DS_Prihod_furnitura_1: TDataSource
    DataSet = IB_Prihod_furnitura_1
    Left = 560
    Top = 224
  end
end
