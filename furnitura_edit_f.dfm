object F_Furnitura_edit: TF_Furnitura_edit
  Left = 207
  Top = 57
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1091#1102#1097#1080#1077
  ClientHeight = 633
  ClientWidth = 689
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 8
    Top = 32
    Width = 49
    Height = 18
    Caption = #1043#1088#1091#1087#1087#1072
  end
  object Label2: TLabel
    Left = 8
    Top = 60
    Width = 108
    Height = 18
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 8
    Top = 92
    Width = 102
    Height = 18
    Caption = #1045#1076'.'#1080#1079#1084#1077#1088#1077#1085#1080#1103
  end
  object Label4: TLabel
    Left = 8
    Top = 4
    Width = 27
    Height = 18
    Caption = #1050#1086#1076
  end
  object Label5: TLabel
    Left = 8
    Top = 132
    Width = 197
    Height = 18
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 158
    Width = 116
    Height = 18
    Caption = #1050#1086#1076' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 216
    Top = 4
    Width = 57
    Height = 18
    Caption = #1040#1088#1090#1080#1082#1091#1083
  end
  object Panel1: TPanel
    Left = 0
    Top = 576
    Width = 681
    Height = 57
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 5
    object B_Ok: TButton
      Left = 456
      Top = 8
      Width = 105
      Height = 41
      Caption = '&'#1047#1072#1087#1080#1089#1072#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = B_OkClick
    end
    object B_Exit: TButton
      Left = 568
      Top = 8
      Width = 105
      Height = 41
      Caption = '&'#1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = B_ExitClick
    end
  end
  object DBE_Name: TDBEdit
    Left = 123
    Top = 56
    Width = 558
    Height = 26
    DataField = 'NAME'
    DataSource = DSFurnitura
    TabOrder = 0
  end
  object DBComboBox1: TDBComboBox
    Left = 123
    Top = 88
    Width = 185
    Height = 26
    DataField = 'ED_IZM'
    DataSource = DSFurnitura
    ItemHeight = 18
    Items.Strings = (
      #1096#1090'.'
      #1084
      #1083
      #1082#1075
      #1091#1087#1072#1082)
    TabOrder = 2
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 123
    Top = 28
    Width = 558
    Height = 26
    DataField = 'GRUPA_NAME'
    DataSource = DSFurnitura
    TabOrder = 4
    TabStop = False
  end
  object CB_IsUsed_Akt_viprabot: TCheckBox
    Left = 8
    Top = 203
    Width = 337
    Height = 25
    Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1074' "'#1040#1082#1090#1077' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1088#1072#1073#1086#1090'"'
    TabOrder = 3
    OnClick = CB_IsUsed_Akt_viprabotClick
  end
  object GB_Vid_rabot: TGroupBox
    Left = 8
    Top = 232
    Width = 681
    Height = 273
    TabOrder = 6
    Visible = False
    object DBGrid1: TDBGrid
      Left = 8
      Top = 16
      Width = 665
      Height = 241
      DataSource = DSFurnitura_vidrabot
      TabOrder = 0
      TitleFont.Charset = RUSSIAN_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -16
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'VIDRABOT_NAME'
          Title.Alignment = taCenter
          Title.Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090
          Visible = True
        end>
    end
  end
  object DBEdit1: TDBEdit
    Left = 123
    Top = 0
    Width = 78
    Height = 26
    TabStop = False
    Color = cl3DLight
    DataField = 'ID'
    DataSource = DSFurnitura
    ReadOnly = True
    TabOrder = 7
  end
  object DBEdit2: TDBEdit
    Left = 208
    Top = 128
    Width = 473
    Height = 26
    DataField = 'MANUFACTURER_NAME'
    DataSource = DSFurnitura
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object DBEdit3: TDBEdit
    Left = 208
    Top = 154
    Width = 209
    Height = 26
    DataField = 'MANUFACTURER_CODE'
    DataSource = DSFurnitura
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object DBE_Article: TDBEdit
    Left = 283
    Top = 0
    Width = 118
    Height = 26
    TabStop = False
    AutoSize = False
    DataField = 'ARTICLE'
    DataSource = DSFurnitura
    TabOrder = 1
  end
  object DSFurnitura: TDataSource
    DataSet = IBFurnitura
    Left = 616
    Top = 16
  end
  object IBFurnitura: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    OnNewRecord = IBFurnituraNewRecord
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
      'where id=:nomer_akt')
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
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_FURNITURA_ID'
    Left = 584
    Top = 16
    object IBFurnituraID: TIntegerField
      FieldName = 'ID'
      Origin = '"FURNITURA"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBFurnituraNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"FURNITURA"."NAME"'
      Required = True
      Size = 50
    end
    object IBFurnituraED_IZM: TIBStringField
      FieldName = 'ED_IZM'
      Origin = '"FURNITURA"."ED_IZM"'
      Required = True
      Size = 8
    end
    object IBFurnituraID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = '"FURNITURA"."ID_PARENT"'
      Required = True
    end
    object IBFurnituraGRUPA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'GRUPA_NAME'
      LookupDataSet = DM_Mebeli.IB_Furnitura_grupa
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_PARENT'
      Size = 60
      Lookup = True
    end
    object IBFurnituraMANUFACTURER_NAME: TIBStringField
      FieldName = 'MANUFACTURER_NAME'
      Origin = 'FURNITURA.MANUFACTURER_NAME'
      Size = 100
    end
    object IBFurnituraMANUFACTURER_CODE: TIBStringField
      FieldName = 'MANUFACTURER_CODE'
      Origin = 'FURNITURA.MANUFACTURER_CODE'
    end
    object IBFurnituraARTICLE: TIntegerField
      FieldName = 'ARTICLE'
      Origin = 'FURNITURA.ARTICLE'
    end
  end
  object IBFurnitura_vidrabot: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    OnNewRecord = IBFurnitura_vidrabotNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from FURNITURA_VIDRABOT'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into FURNITURA_VIDRABOT'
      '  (ID, ID_FURNITURA, ID_VID_RABOT)'
      'values'
      '  (:ID, :ID_FURNITURA, :ID_VID_RABOT)')
    RefreshSQL.Strings = (
      'Select '
      '  ID,'
      '  ID_FURNITURA,'
      '  ID_VID_RABOT'
      'from FURNITURA_VIDRABOT '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select *   from FURNITURA_VIDRABOT'
      'where id_furnitura=:id'
      'order by id_vid_rabot')
    ModifySQL.Strings = (
      'update FURNITURA_VIDRABOT'
      'set'
      '  ID = :ID,'
      '  ID_FURNITURA = :ID_FURNITURA,'
      '  ID_VID_RABOT = :ID_VID_RABOT'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_FURNITURA_VIDRABOT_ID'
    DataSource = DSFurnitura
    Left = 584
    Top = 52
    object IBFurnitura_vidrabotID: TIntegerField
      FieldName = 'ID'
      Origin = 'FURNITURA_VIDRABOT.ID'
      Required = True
    end
    object IBFurnitura_vidrabotID_FURNITURA: TIntegerField
      FieldName = 'ID_FURNITURA'
      Origin = 'FURNITURA_VIDRABOT.ID_FURNITURA'
      Required = True
    end
    object IBFurnitura_vidrabotID_VID_RABOT: TIntegerField
      FieldName = 'ID_VID_RABOT'
      Origin = 'FURNITURA_VIDRABOT.ID_VID_RABOT'
      Required = True
    end
    object IBFurnitura_vidrabotVIDRABOT_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'VIDRABOT_NAME'
      LookupDataSet = DM_Mebeli.IB_Vidy_rabot
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_VID_RABOT'
      Size = 50
      Lookup = True
    end
  end
  object DSFurnitura_vidrabot: TDataSource
    DataSet = IBFurnitura_vidrabot
    Left = 616
    Top = 52
  end
end
