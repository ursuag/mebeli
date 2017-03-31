object F_Ostatok_furnitura_edit: TF_Ostatok_furnitura_edit
  Left = -4
  Top = 54
  AutoScroll = False
  Caption = #1054#1089#1090#1072#1090#1082#1080' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074' '#1085#1072' '#1085#1072#1095#1072#1083#1086
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
  PrintScale = poNone
  Scaled = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
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
    Height = 73
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 46
      Height = 18
      Caption = #8470' '#1076#1086#1082
    end
    object Label2: TLabel
      Left = 192
      Top = 8
      Width = 16
      Height = 18
      Caption = #1086#1090
    end
    object Label3: TLabel
      Left = 396
      Top = 8
      Width = 45
      Height = 18
      Caption = #1057#1082#1083#1072#1076
    end
    object Label4: TLabel
      Left = 16
      Top = 40
      Width = 59
      Height = 18
      Caption = #1055#1088#1080#1084#1077#1095'.'
    end
    object DBE_ID: TDBEdit
      Left = 59
      Top = 4
      Width = 129
      Height = 26
      DataField = 'ID'
      DataSource = DS_Prihod_furnitura_0
      ReadOnly = True
      TabOrder = 0
    end
    object DBE_Date_p: TDBEdit
      Left = 216
      Top = 4
      Width = 169
      Height = 26
      DataField = 'DATE_P'
      DataSource = DS_Prihod_furnitura_0
      TabOrder = 1
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 444
      Top = 4
      Width = 281
      Height = 26
      DataField = 'SKLAD_NAME'
      DataSource = DS_Prihod_furnitura_0
      DropDownRows = 20
      TabOrder = 2
    end
    object DBEdit1: TDBEdit
      Left = 88
      Top = 36
      Width = 913
      Height = 26
      DataField = 'PRIMECHANIE'
      DataSource = DS_Prihod_furnitura_0
      TabOrder = 3
    end
  end
  object DBGrid1: TDBGrid
    Left = 5
    Top = 80
    Width = 1168
    Height = 561
    DataSource = DS_Prihod_furnitura_1
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnEditButtonClick = DBGrid1EditButtonClick
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 313
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        DropDownRows = 25
        Expanded = False
        FieldName = 'FURNITURA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
        Width = 391
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
    Left = 0
    Top = 646
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
      Default = True
      TabOrder = 0
      OnClick = B_OkClick
    end
  end
  object IB_Prihod_furnitura_0: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from prihod_furnitura_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into prihod_furnitura_0'
      
        '  (ID, DATE_P, ID_SKLAD, PRIMECHANIE, ID_CONTRAGENT, ID_STATYA_D' +
        'OHODA, '
      '   NOMER_TTN, ID_REVIZIA, IS_OSTATOK)'
      'values'
      
        '  (:ID, :DATE_P, :ID_SKLAD, :PRIMECHANIE, :ID_CONTRAGENT, :ID_ST' +
        'ATYA_DOHODA, '
      '   :NOMER_TTN, :ID_REVIZIA, :IS_OSTATOK)')
    RefreshSQL.Strings = (
      'Select *'
      'from prihod_furnitura_0 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from prihod_furnitura_0'
      'where id=:id')
    ModifySQL.Strings = (
      'update prihod_furnitura_0'
      'set'
      '  ID = :ID,'
      '  DATE_P = :DATE_P,'
      '  ID_SKLAD = :ID_SKLAD,'
      '  PRIMECHANIE = :PRIMECHANIE,'
      '  ID_CONTRAGENT = :ID_CONTRAGENT,'
      '  ID_STATYA_DOHODA = :ID_STATYA_DOHODA,'
      '  NOMER_TTN = :NOMER_TTN,'
      '  ID_REVIZIA = :ID_REVIZIA,'
      '  IS_OSTATOK = :IS_OSTATOK'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PRIHOD_FURNITURA_0_ID'
    DataSource = F_Ostatok_furnitura.DS_Prihod_furnitura_0_F
    Left = 312
    Top = 112
    object IB_Prihod_furnitura_0ID: TIntegerField
      FieldName = 'ID'
      Origin = 'PRIHOD_FURNITURA_0.ID'
      Required = True
    end
    object IB_Prihod_furnitura_0DATE_P: TDateField
      FieldName = 'DATE_P'
      Origin = 'PRIHOD_FURNITURA_0.DATE_P'
      Required = True
    end
    object IB_Prihod_furnitura_0ID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Origin = 'PRIHOD_FURNITURA_0.ID_SKLAD'
      Required = True
    end
    object IB_Prihod_furnitura_0PRIMECHANIE: TIBStringField
      FieldName = 'PRIMECHANIE'
      Origin = 'PRIHOD_FURNITURA_0.PRIMECHANIE'
      Size = 255
    end
    object IB_Prihod_furnitura_0ID_CONTRAGENT: TIntegerField
      FieldName = 'ID_CONTRAGENT'
      Origin = 'PRIHOD_FURNITURA_0.ID_CONTRAGENT'
    end
    object IB_Prihod_furnitura_0ID_STATYA_DOHODA: TIntegerField
      FieldName = 'ID_STATYA_DOHODA'
      Origin = 'PRIHOD_FURNITURA_0.ID_STATYA_DOHODA'
    end
    object IB_Prihod_furnitura_0NOMER_TTN: TIBStringField
      FieldName = 'NOMER_TTN'
      Origin = 'PRIHOD_FURNITURA_0.NOMER_TTN'
      Size = 50
    end
    object IB_Prihod_furnitura_0ID_REVIZIA: TIntegerField
      FieldName = 'ID_REVIZIA'
      Origin = 'PRIHOD_FURNITURA_0.ID_REVIZIA'
    end
    object IB_Prihod_furnitura_0IS_OSTATOK: TSmallintField
      FieldName = 'IS_OSTATOK'
      Origin = 'PRIHOD_FURNITURA_0.IS_OSTATOK'
    end
    object IB_Prihod_furnitura_0SKLAD_NAME: TStringField
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
  object DS_Prihod_furnitura_0: TDataSource
    DataSet = IB_Prihod_furnitura_0
    Left = 360
    Top = 112
  end
  object IB_Prihod_furnitura_1: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
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
      '  (ID_PARENT, ID_FURNITURA, KOL_VO, ID, SUMMA)'
      'values'
      '  (:ID_PARENT, :ID_FURNITURA, :KOL_VO, :ID, :SUMMA)')
    RefreshSQL.Strings = (
      'Select *'
      'from prihod_furnitura_1 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from prihod_furnitura_1'
      'where id_parent= :id')
    ModifySQL.Strings = (
      'update prihod_furnitura_1'
      'set'
      '  ID_PARENT = :ID_PARENT,'
      '  ID_FURNITURA = :ID_FURNITURA,'
      '  KOL_VO = :KOL_VO,'
      '  ID = :ID,'
      '  SUMMA = :SUMMA'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PRIHOD_FURNITURA_1_ID'
    DataSource = DS_Prihod_furnitura_0
    Left = 688
    Top = 368
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
    object IB_Prihod_furnitura_1GRUPA_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'GRUPA_NAME'
      Size = 200
      Calculated = True
    end
    object IB_Prihod_furnitura_1FURNITURA_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'FURNITURA_NAME'
      Size = 200
      Calculated = True
    end
    object IB_Prihod_furnitura_1FURNITURA_EDIZM: TStringField
      FieldKind = fkCalculated
      FieldName = 'FURNITURA_EDIZM'
      Size = 50
      Calculated = True
    end
  end
  object DS_Prihod_furnitura_1: TDataSource
    DataSet = IB_Prihod_furnitura_1
    Left = 736
    Top = 368
  end
end
