object F_Bank_rashod: TF_Bank_rashod
  Left = 83
  Top = 102
  AutoScroll = False
  Caption = #1056#1072#1089#1093#1086#1076' '#1087#1086' '#1073#1072#1085#1082#1091
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
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 17
    Height = 18
    Caption = #8470
  end
  object Label2: TLabel
    Left = 208
    Top = 8
    Width = 152
    Height = 19
    Caption = #1056#1040#1057#1061#1054#1044' '#1055#1054' '#1041#1040#1053#1050#1059
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 128
    Top = 56
    Width = 34
    Height = 18
    Caption = #1076#1072#1090#1072
  end
  object Label4: TLabel
    Left = 8
    Top = 160
    Width = 50
    Height = 18
    Caption = #1057#1091#1084#1084#1072
  end
  object Label5: TLabel
    Left = 205
    Top = 160
    Width = 25
    Height = 18
    Caption = #1083#1077#1081
  end
  object Label7: TLabel
    Left = 5
    Top = 201
    Width = 81
    Height = 18
    Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
  end
  object B_Contragent_clear: TSpeedButton
    Left = 494
    Top = 196
    Width = 27
    Height = 24
    Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333333333333333333FFF33FF333FFF339993370733
      999333777FF37FF377733339993000399933333777F777F77733333399970799
      93333333777F7377733333333999399933333333377737773333333333990993
      3333333333737F73333333333331013333333333333777FF3333333333910193
      333333333337773FF3333333399000993333333337377737FF33333399900099
      93333333773777377FF333399930003999333337773777F777FF339993370733
      9993337773337333777333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    OnClick = B_Contragent_clearClick
  end
  object Label6: TLabel
    Left = 5
    Top = 241
    Width = 75
    Height = 18
    Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
  end
  object B_Sotrudnik_Clear: TSpeedButton
    Left = 494
    Top = 236
    Width = 27
    Height = 24
    Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1057#1086#1090#1088#1091#1076#1085#1080#1082
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333333333333333333FFF33FF333FFF339993370733
      999333777FF37FF377733339993000399933333777F777F77733333399970799
      93333333777F7377733333333999399933333333377737773333333333990993
      3333333333737F73333333333331013333333333333777FF3333333333910193
      333333333337773FF3333333399000993333333337377737FF33333399900099
      93333333773777377FF333399930003999333337773777F777FF339993370733
      9993337773337333777333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    OnClick = B_Sotrudnik_ClearClick
  end
  object Label8: TLabel
    Left = 5
    Top = 273
    Width = 117
    Height = 18
    Caption = #1057#1090#1072#1090#1100#1103' '#1088#1072#1089#1093#1086#1076#1072
  end
  object Label9: TLabel
    Left = 8
    Top = 96
    Width = 89
    Height = 18
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object P_Buttons: TPanel
    Left = 0
    Top = 640
    Width = 1177
    Height = 57
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object B_Exit: TButton
      Left = 1058
      Top = 12
      Width = 97
      Height = 33
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      OnClick = B_ExitClick
    end
    object B_Ok: TButton
      Left = 954
      Top = 12
      Width = 97
      Height = 33
      Hint = '[Ctrl+End] '#1089#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1074#1099#1081#1090#1080
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      TabOrder = 0
      OnClick = B_OkClick
    end
  end
  object DBEdit1: TDBEdit
    Left = 32
    Top = 48
    Width = 89
    Height = 26
    TabStop = False
    DataField = 'ID'
    DataSource = DS_Bank_Rashod
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 64
    Top = 152
    Width = 137
    Height = 26
    DataField = 'SUMMA'
    DataSource = DS_Bank_Rashod
    TabOrder = 2
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 104
    Top = 197
    Width = 384
    Height = 26
    DataField = 'CONTRAGENT_NAME'
    DataSource = DS_Bank_Rashod
    TabOrder = 3
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 104
    Top = 237
    Width = 384
    Height = 26
    DataField = 'SOTRUDNIK_NAME'
    DataSource = DS_Bank_Rashod
    TabOrder = 4
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 128
    Top = 269
    Width = 360
    Height = 26
    DataField = 'STATYA_NAME'
    DataSource = DS_Bank_Rashod
    TabOrder = 5
  end
  object DBEdit4: TDBEdit
    Left = 104
    Top = 88
    Width = 553
    Height = 26
    DataField = 'DESCRIPTION'
    DataSource = DS_Bank_Rashod
    TabOrder = 6
  end
  object DateTimePicker1: TDateTimePicker
    Left = 176
    Top = 48
    Width = 137
    Height = 26
    Date = 42725.570340208330000000
    Time = 42725.570340208330000000
    TabOrder = 7
    OnExit = DateTimePicker1Exit
  end
  object DS_Bank_Rashod: TDataSource
    DataSet = IB_Bank_Rashod
    Left = 632
    Top = 224
  end
  object IB_Bank_Rashod: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from bank_rashod'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into bank_rashod'
      
        '  (ID, DATE_BANK, SUMMA, ID_CONTRAGENT, ID_SOTRUDNIK, ID_STATYA_' +
        'RASHODA, '
      '   DESCRIPTION)'
      'values'
      
        '  (:ID, :DATE_BANK, :SUMMA, :ID_CONTRAGENT, :ID_SOTRUDNIK, :ID_S' +
        'TATYA_RASHODA, '
      '   :DESCRIPTION)')
    RefreshSQL.Strings = (
      'Select *'
      'from bank_rashod '
      'where'
      '  ID = :ID')
    SelectSQL.Strings = (
      'select * from bank_rashod'
      'where id=:id')
    ModifySQL.Strings = (
      'update bank_rashod'
      'set'
      '  ID = :ID,'
      '  DATE_BANK = :DATE_BANK,'
      '  SUMMA = :SUMMA,'
      '  ID_CONTRAGENT = :ID_CONTRAGENT,'
      '  ID_SOTRUDNIK = :ID_SOTRUDNIK,'
      '  ID_STATYA_RASHODA = :ID_STATYA_RASHODA,'
      '  DESCRIPTION = :DESCRIPTION'
      'where'
      '  ID = :OLD_ID')
    Left = 632
    Top = 176
    object IB_Bank_RashodID: TIntegerField
      FieldName = 'ID'
      Origin = 'BANK_PRIHOD.ID'
      Required = True
    end
    object IB_Bank_RashodDATE_BANK: TDateField
      FieldName = 'DATE_BANK'
      Origin = 'BANK_PRIHOD.DATE_BANK'
      Required = True
    end
    object IB_Bank_RashodSUMMA: TIBBCDField
      FieldName = 'SUMMA'
      Origin = 'BANK_PRIHOD.SUMMA'
      Required = True
      Precision = 18
      Size = 2
    end
    object IB_Bank_RashodID_CONTRAGENT: TIntegerField
      FieldName = 'ID_CONTRAGENT'
      Origin = 'BANK_PRIHOD.ID_CONTRAGENT'
    end
    object IB_Bank_RashodID_SOTRUDNIK: TIntegerField
      FieldName = 'ID_SOTRUDNIK'
      Origin = 'BANK_PRIHOD.ID_SOTRUDNIK'
    end
    object IB_Bank_RashodCONTRAGENT_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'CONTRAGENT_NAME'
      LookupDataSet = DM_Mebeli.IB_Contragenty_1
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_CONTRAGENT'
      Size = 200
      Lookup = True
    end
    object IB_Bank_RashodSOTRUDNIK_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'SOTRUDNIK_NAME'
      LookupDataSet = DM_Mebeli.IB_Sotrudniki
      LookupKeyFields = 'ID'
      LookupResultField = 'FIO'
      KeyFields = 'ID_SOTRUDNIK'
      Size = 200
      Lookup = True
    end
    object IB_Bank_RashodID_STATYA_RASHODA: TIntegerField
      FieldName = 'ID_STATYA_RASHODA'
      Origin = 'BANK_RASHOD.ID_STATYA_RASHODA'
      Required = True
    end
    object IB_Bank_RashodSTATYA_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'STATYA_NAME'
      LookupDataSet = DM_Mebeli.IB_Statyi_Rashoda
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'ID_STATYA_RASHODA'
      Size = 200
      Lookup = True
    end
    object IB_Bank_RashodDESCRIPTION: TIBStringField
      FieldName = 'DESCRIPTION'
      Origin = 'BANK_RASHOD.DESCRIPTION'
      Size = 200
    end
  end
end
