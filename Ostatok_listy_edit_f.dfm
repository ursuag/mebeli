object F_Ostatok_listy_edit: TF_Ostatok_listy_edit
  Left = 36
  Top = 49
  AutoScroll = False
  Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1054#1089#1090#1072#1090#1082#1080' '#1083#1080#1089#1090#1086#1074' '
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
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Label7: TLabel
    Left = 392
    Top = 12
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
      Top = 12
      Width = 46
      Height = 18
      Caption = #8470' '#1076#1086#1082
    end
    object Label2: TLabel
      Left = 144
      Top = 12
      Width = 16
      Height = 18
      Caption = #1086#1090
    end
    object Label4: TLabel
      Left = 8
      Top = 44
      Width = 59
      Height = 18
      Caption = #1055#1088#1080#1084#1077#1095'.'
    end
    object Label6: TLabel
      Left = 376
      Top = 12
      Width = 45
      Height = 18
      Caption = #1057#1082#1083#1072#1076
    end
    object DBE_ID: TDBEdit
      Left = 64
      Top = 8
      Width = 81
      Height = 26
      DataField = 'ID'
      DataSource = DS_Prihod_listy_0_Edit
      ReadOnly = True
      TabOrder = 0
    end
    object DBE_Date_p: TDBEdit
      Left = 168
      Top = 8
      Width = 169
      Height = 26
      DataField = 'DATE_P'
      DataSource = DS_Prihod_listy_0_Edit
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 80
      Top = 40
      Width = 929
      Height = 26
      DataField = 'PRIMECHANIE'
      DataSource = DS_Prihod_listy_0_Edit
      TabOrder = 3
    end
    object DBL_Sklad: TDBLookupComboBox
      Left = 432
      Top = 8
      Width = 297
      Height = 26
      DataField = 'SKLAD_NAME'
      DataSource = DS_Prihod_listy_0_Edit
      DropDownRows = 20
      TabOrder = 2
    end
  end
  object DBGrid1: TDBGrid
    Left = 1
    Top = 80
    Width = 1176
    Height = 561
    DataSource = DS_Prihod_listy_1_Edit
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    OnEditButtonClick = DBGrid1EditButtonClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_LISTY'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'GRUPA_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 310
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        DropDownRows = 15
        Expanded = False
        FieldName = 'LISTY_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
        Width = 437
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054', '#1096#1090
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA'
        Title.Alignment = taCenter
        Title.Caption = #1057#1059#1052#1052#1040' '#1079#1072' '#1084#1077#1090#1088#1072#1078
        Width = 135
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 1
    Top = 646
    Width = 1176
    Height = 45
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object B_Exit: TButton
      Left = 1072
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
      Hint = '[Ctrl+End] '#1089#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1074#1099#1081#1090#1080
      Caption = '&'#1047#1072#1087#1080#1089#1072#1090#1100
      Default = True
      TabOrder = 0
      OnClick = B_OkClick
    end
  end
  object IB_Prihod_listy_0_Edit: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    OnNewRecord = IB_Prihod_listy_0_EditNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from prihod_listy_0'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into prihod_listy_0'
      
        '  (ID, DATE_P, ID_SKLAD, ID_AKT_RASPIL, PRIMECHANIE, ID_CONTRAGE' +
        'NT, ID_STATYA_DOHODA, '
      '   NOMER_TTN, ID_REVIZIA, IS_OSTATOK)'
      'values'
      
        '  (:ID, :DATE_P, :ID_SKLAD, :ID_AKT_RASPIL, :PRIMECHANIE, :ID_CO' +
        'NTRAGENT, '
      '   :ID_STATYA_DOHODA, :NOMER_TTN, :ID_REVIZIA, :IS_OSTATOK)')
    RefreshSQL.Strings = (
      'Select *'
      'from prihod_listy_0 '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from prihod_listy_0'
      'where id= :id_akt')
    ModifySQL.Strings = (
      'update prihod_listy_0'
      'set'
      '  ID = :ID,'
      '  DATE_P = :DATE_P,'
      '  ID_SKLAD = :ID_SKLAD,'
      '  ID_AKT_RASPIL = :ID_AKT_RASPIL,'
      '  PRIMECHANIE = :PRIMECHANIE,'
      '  ID_CONTRAGENT = :ID_CONTRAGENT,'
      '  ID_STATYA_DOHODA = :ID_STATYA_DOHODA,'
      '  NOMER_TTN = :NOMER_TTN,'
      '  ID_REVIZIA = :ID_REVIZIA,'
      '  IS_OSTATOK = :IS_OSTATOK'
      'where'
      '  ID = :OLD_ID')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PRIHOD_LISTY_0_ID'
    Left = 1008
    Top = 8
    object IB_Prihod_listy_0_EditID: TIntegerField
      FieldName = 'ID'
      Origin = 'PRIHOD_LISTY_0.ID'
      Required = True
    end
    object IB_Prihod_listy_0_EditDATE_P: TDateField
      FieldName = 'DATE_P'
      Origin = 'PRIHOD_LISTY_0.DATE_P'
      Required = True
    end
    object IB_Prihod_listy_0_EditID_SKLAD: TIntegerField
      FieldName = 'ID_SKLAD'
      Origin = 'PRIHOD_LISTY_0.ID_SKLAD'
      Required = True
    end
    object IB_Prihod_listy_0_EditPRIMECHANIE: TIBStringField
      FieldName = 'PRIMECHANIE'
      Origin = 'PRIHOD_LISTY_0.PRIMECHANIE'
      Size = 255
    end
    object IB_Prihod_listy_0_EditSKLAD_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'SKLAD_NAME'
      LookupDataSet = DM_Mebeli.IB_Sklad
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_SKLAD'
      Size = 200
      Lookup = True
    end
    object IB_Prihod_listy_0_EditID_AKT_RASPIL: TIntegerField
      FieldName = 'ID_AKT_RASPIL'
      Origin = 'PRIHOD_LISTY_0.ID_AKT_RASPIL'
    end
    object IB_Prihod_listy_0_EditID_CONTRAGENT: TIntegerField
      FieldName = 'ID_CONTRAGENT'
      Origin = 'PRIHOD_LISTY_0.ID_CONTRAGENT'
    end
    object IB_Prihod_listy_0_EditID_STATYA_DOHODA: TIntegerField
      FieldName = 'ID_STATYA_DOHODA'
      Origin = 'PRIHOD_LISTY_0.ID_STATYA_DOHODA'
    end
    object IB_Prihod_listy_0_EditNOMER_TTN: TIBStringField
      FieldName = 'NOMER_TTN'
      Origin = 'PRIHOD_LISTY_0.NOMER_TTN'
      Size = 50
    end
    object IB_Prihod_listy_0_EditID_REVIZIA: TIntegerField
      FieldName = 'ID_REVIZIA'
      Origin = 'PRIHOD_LISTY_0.ID_REVIZIA'
    end
    object IB_Prihod_listy_0_EditIS_OSTATOK: TSmallintField
      FieldName = 'IS_OSTATOK'
      Origin = 'PRIHOD_LISTY_0.IS_OSTATOK'
    end
  end
  object DS_Prihod_listy_0_Edit: TDataSource
    DataSet = IB_Prihod_listy_0_Edit
    Left = 1056
    Top = 8
  end
  object IB_Prihod_listy_1_Edit: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    OnCalcFields = IB_Prihod_listy_1_EditCalcFields
    OnNewRecord = IB_Prihod_listy_1_EditNewRecord
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from prihod_listy_1'
      'where id_parent= :id')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_PRIHOD_LISTY_1_ID'
    DataSource = DS_Prihod_listy_0_Edit
    Left = 1000
    Top = 280
    object IB_Prihod_listy_1_EditID: TIntegerField
      FieldName = 'ID'
      Origin = 'PRIHOD_LISTY_1.ID'
      Required = True
    end
    object IB_Prihod_listy_1_EditID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
      Origin = 'PRIHOD_LISTY_1.ID_PARENT'
      Required = True
    end
    object IB_Prihod_listy_1_EditID_LISTY: TIntegerField
      FieldName = 'ID_LISTY'
      Origin = 'PRIHOD_LISTY_1.ID_LISTY'
      Required = True
    end
    object IB_Prihod_listy_1_EditKOL_VO: TIntegerField
      FieldName = 'KOL_VO'
      Origin = 'PRIHOD_LISTY_1.KOL_VO'
      Required = True
    end
    object IB_Prihod_listy_1_EditID_GRUPA: TIntegerField
      FieldName = 'ID_GRUPA'
      Origin = 'PRIHOD_LISTY_1.ID_GRUPA'
    end
    object IB_Prihod_listy_1_EditSUMMA: TIBBCDField
      FieldName = 'SUMMA'
      Origin = 'PRIHOD_LISTY_1.SUMMA'
      Precision = 18
      Size = 2
    end
    object IB_Prihod_listy_1_EditGRUPA_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'GRUPA_NAME'
      Size = 200
      Calculated = True
    end
    object IB_Prihod_listy_1_EditLISTY_NAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'LISTY_NAME'
      Size = 200
      Calculated = True
    end
  end
  object DS_Prihod_listy_1_Edit: TDataSource
    DataSet = IB_Prihod_listy_1_Edit
    Left = 1048
    Top = 280
  end
end
