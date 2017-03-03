object F_Revizia_edit: TF_Revizia_edit
  Left = 101
  Top = 67
  AutoScroll = False
  Caption = #1040#1082#1090' '#1088#1077#1074#1080#1079#1080#1080' '#1085#1072' '#1089#1082#1083#1072#1076#1077
  ClientHeight = 702
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 53
    Height = 18
    Caption = #8470' '#1072#1082#1090#1072
  end
  object Label2: TLabel
    Left = 144
    Top = 8
    Width = 16
    Height = 18
    Caption = #1086#1090
  end
  object Label4: TLabel
    Left = 312
    Top = 8
    Width = 41
    Height = 18
    Caption = #1089#1082#1083#1072#1076
  end
  object DBG_Listy: TDBGrid
    Left = 0
    Top = 40
    Width = 1177
    Height = 225
    DataSource = DS_Revizia_listy
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Artc'
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1043#1088#1091#1087#1087#1072
        Width = 280
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'MATERIAL_NAME'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099
        Width = 235
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOLVO_PROGRAMA'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1054#1089#1090#1072#1090#1086#1082
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOLVO_REVIZIA'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1056#1077#1074#1080#1079#1080#1103
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZNITSA'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1056#1072#1079#1085#1080#1094#1072
        Width = 186
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 645
    Width = 1169
    Height = 52
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 5
    object B_Exit: TButton
      Left = 1040
      Top = 9
      Width = 117
      Height = 32
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 0
    end
    object B_Ok: TButton
      Left = 912
      Top = 9
      Width = 117
      Height = 32
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 1
    end
    object B_Fill_Tables: TButton
      Left = 12
      Top = 8
      Width = 101
      Height = 36
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      TabStop = False
      OnClick = B_Fill_TablesClick
    end
  end
  object DBE_Date_a: TDBEdit
    Left = 176
    Top = 4
    Width = 129
    Height = 26
    DataField = 'DATE_DOC'
    DataSource = DS_Revizia_0_E
    TabOrder = 2
  end
  object DBL_Sklad: TDBLookupComboBox
    Left = 360
    Top = 3
    Width = 377
    Height = 26
    DataField = 'SKLAD_NAME'
    DataSource = DS_Revizia_0_E
    TabOrder = 3
  end
  object DBE_ID: TDBEdit
    Left = 64
    Top = 4
    Width = 73
    Height = 26
    TabStop = False
    DataField = 'ID'
    DataSource = DS_Revizia_0_E
    ReadOnly = True
    TabOrder = 1
  end
  object DBG_Furnitura: TDBGrid
    Left = -1
    Top = 266
    Width = 1177
    Height = 225
    DataSource = DS_Revizia_Furnitura
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 6
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Artc'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1043#1088#1091#1087#1087#1072
        Width = 280
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MATERIAL_NAME'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099
        Width = 235
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOLVO_PROGRAMA'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1054#1089#1090#1072#1090#1086#1082
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOLVO_REVIZIA'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1056#1077#1074#1080#1079#1080#1103
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZNITSA'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1056#1072#1079#1085#1080#1094#1072
        Width = 186
        Visible = True
      end>
  end
  object DBG_Detali: TDBGrid
    Left = -1
    Top = 491
    Width = 1177
    Height = 150
    DataSource = DS_Revizia_listy
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 7
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'ARTICUL'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Artc'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1043#1088#1091#1087#1087#1072
        Width = 280
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099
        Width = 235
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOLVO_PROGRAMA'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1054#1089#1090#1072#1090#1086#1082
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOLVO_REVIZIA'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1056#1077#1074#1080#1079#1080#1103
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZNITSA'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = #1056#1072#1079#1085#1080#1094#1072
        Width = 186
        Visible = True
      end>
  end
  object DBEdit1: TDBEdit
    Left = 744
    Top = 4
    Width = 433
    Height = 26
    DataField = 'DESCRIPTION'
    DataSource = DS_Revizia_0_E
    TabOrder = 4
  end
  object IB_Revizia_0_E: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from revizia_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into revizia_0'
      '  (ID, DATE_DOC, ID_SKLAD, DESCRIPTION)'
      'values'
      '  (:ID, :DATE_DOC, :ID_SKLAD, :DESCRIPTION)')
    RefreshSQL.Strings = (
      'Select *'
      'from revizia_0 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from revizia_0'
      'where id= :id_akt_revizii')
    ModifySQL.Strings = (
      'update revizia_0'
      'set'
      '  ID = :ID,'
      '  DATE_DOC = :DATE_DOC,'
      '  ID_SKLAD = :ID_SKLAD,'
      '  DESCRIPTION = :DESCRIPTION'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_REVIZIA_0_ID'
    Left = 752
    Top = 8
    object IB_Revizia_0_EID: TIntegerField
      FieldName = 'ID'
      Origin = 'REVIZIA_0.ID'
      Required = True
    end
    object IB_Revizia_0_EDATE_DOC: TDateField
      FieldName = 'DATE_DOC'
      Origin = 'REVIZIA_0.DATE_DOC'
      Required = True
    end
    object IB_Revizia_0_EID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Origin = 'REVIZIA_0.ID_SKLAD'
      Required = True
    end
    object IB_Revizia_0_EDESCRIPTION: TIBStringField
      FieldName = 'DESCRIPTION'
      Origin = 'REVIZIA_0.DESCRIPTION'
      Size = 200
    end
    object IB_Revizia_0_ESKLAD_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'SKLAD_NAME'
      LookupDataSet = DM_Mebeli.IB_Sklad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD'
      Size = 200
      Lookup = True
    end
  end
  object DS_Revizia_0_E: TDataSource
    DataSet = IB_Revizia_0_E
    Left = 792
    Top = 8
  end
  object DS_Revizia_listy: TDataSource
    DataSet = IB_Revizia_listy
    Left = 72
    Top = 120
  end
  object IB_Revizia_listy: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    OnCalcFields = IB_Revizia_listyCalcFields
    OnNewRecord = IB_Revizia_listyNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from revizia_listy'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into revizia_listy'
      '  (ID, ID_PARENT, ID_LISTY, KOLVO_PROGRAMA, KOLVO_REVIZIA)'
      'values'
      '  (:ID, :ID_PARENT, :ID_LISTY, :KOLVO_PROGRAMA, :KOLVO_REVIZIA)')
    RefreshSQL.Strings = (
      'Select *'
      'from revizia_listy '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from revizia_listy'
      'where id_parent= :id')
    ModifySQL.Strings = (
      'update revizia_listy'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_LISTY = :ID_LISTY,'
      '  KOLVO_PROGRAMA = :KOLVO_PROGRAMA,'
      '  KOLVO_REVIZIA = :KOLVO_REVIZIA'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_REVIZIA_LISTY_ID'
    DataSource = DS_Revizia_0_E
    Left = 32
    Top = 120
    object IB_Revizia_listyID: TIntegerField
      FieldName = 'ID'
      Origin = 'REVIZIA_LISTY.ID'
      Required = True
    end
    object IB_Revizia_listyID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'REVIZIA_LISTY.ID_PARENT'
      Required = True
    end
    object IB_Revizia_listyID_LISTY: TIntegerField
      FieldName = 'ID_LISTY'
      Origin = 'REVIZIA_LISTY.ID_LISTY'
      Required = True
    end
    object IB_Revizia_listyKOLVO_PROGRAMA: TIntegerField
      FieldName = 'KOLVO_PROGRAMA'
      Origin = 'REVIZIA_LISTY.KOLVO_PROGRAMA'
      ReadOnly = True
    end
    object IB_Revizia_listyKOLVO_REVIZIA: TIntegerField
      FieldName = 'KOLVO_REVIZIA'
      Origin = 'REVIZIA_LISTY.KOLVO_REVIZIA'
    end
    object IB_Revizia_listyGRUPA_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'GRUPA_NAME'
      Size = 200
      Calculated = True
    end
    object IB_Revizia_listyRAZNITSA: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'RAZNITSA'
      Calculated = True
    end
    object IB_Revizia_listyMATERIAL_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'MATERIAL_NAME'
      Size = 200
      Calculated = True
    end
  end
  object IB_Revizia_Furnitura: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    OnCalcFields = IB_Revizia_FurnituraCalcFields
    OnNewRecord = IB_Revizia_FurnituraNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from revizia_furnitura'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into revizia_furnitura'
      
        '  (ID, ID_PARENT, ID_FURNITURA, NA_DETALIAH, KOLVO_PROGRAMA, KOL' +
        'VO_REVIZIA)'
      'values'
      
        '  (:ID, :ID_PARENT, :ID_FURNITURA, :NA_DETALIAH, :KOLVO_PROGRAMA' +
        ', :KOLVO_REVIZIA)')
    RefreshSQL.Strings = (
      'Select *'
      'from revizia_furnitura '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from revizia_furnitura'
      'where id_parent= :id')
    ModifySQL.Strings = (
      'update revizia_furnitura'
      'set'
      '  ID = :ID,'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_FURNITURA = :ID_FURNITURA,'
      '  NA_DETALIAH = :NA_DETALIAH,'
      '  KOLVO_PROGRAMA = :KOLVO_PROGRAMA,'
      '  KOLVO_REVIZIA = :KOLVO_REVIZIA'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_REVIZIA_FURNITURA_ID'
    DataSource = DS_Revizia_0_E
    Left = 24
    Top = 320
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      Origin = 'REVIZIA_LISTY.ID'
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'REVIZIA_LISTY.ID_PARENT'
      Required = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'KOLVO_PROGRAMA'
      Origin = 'REVIZIA_LISTY.KOLVO_PROGRAMA'
      ReadOnly = True
    end
    object IntegerField5: TIntegerField
      FieldName = 'KOLVO_REVIZIA'
      Origin = 'REVIZIA_LISTY.KOLVO_REVIZIA'
    end
    object StringField1: TStringField
      FieldKind = fkCalculated
      FieldName = 'GRUPA_NAME'
      Size = 200
      Calculated = True
    end
    object IntegerField6: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'RAZNITSA'
      Calculated = True
    end
    object StringField2: TStringField
      FieldKind = fkCalculated
      FieldName = 'MATERIAL_NAME'
      Size = 200
      Calculated = True
    end
    object IB_Revizia_FurnituraID_FURNITURA: TIntegerField
      FieldName = 'ID_FURNITURA'
      Origin = 'REVIZIA_FURNITURA.ID_FURNITURA'
      Required = True
    end
    object IB_Revizia_FurnituraNA_DETALIAH: TSmallintField
      FieldName = 'NA_DETALIAH'
      Origin = 'REVIZIA_FURNITURA.NA_DETALIAH'
      Required = True
    end
  end
  object DS_Revizia_Furnitura: TDataSource
    DataSet = IB_Revizia_Furnitura
    Left = 64
    Top = 320
  end
end
