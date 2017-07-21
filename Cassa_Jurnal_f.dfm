object F_Cassa_Jurnal: TF_Cassa_Jurnal
  Left = 0
  Top = 71
  AutoScroll = False
  Caption = #1046#1091#1088#1085#1072#1083' '#1086#1087#1077#1088#1072#1094#1080#1081' '#1087#1086' '#1082#1072#1089#1089#1077
  ClientHeight = 682
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Panel1: TPanel
    Left = 1
    Top = 624
    Width = 1176
    Height = 57
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object B_Exit: TButton
      Left = 1072
      Top = 12
      Width = 97
      Height = 33
      Cancel = True
      Caption = '&'#1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 0
    end
    object B_Refresh: TButton
      Left = 16
      Top = 12
      Width = 97
      Height = 33
      Caption = '&'#1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 1
      TabStop = False
    end
  end
  object DBGrid1: TDBGrid
    Left = 1
    Top = 0
    Width = 1176
    Height = 617
    DataSource = DS_Cassa_Jurnal
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_DOC'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1076#1086#1082
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_DOC'
        Title.Alignment = taCenter
        Title.Caption = #1044#1040#1058#1040
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA_PRIHOD'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1080#1093#1086#1076', '#1083#1077#1081
        Width = 182
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMMA_RASHOD'
        Title.Alignment = taCenter
        Title.Caption = #1056#1072#1089#1093#1086#1076', '#1083#1077#1081
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRAGENT_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1054#1090' '#1082#1086#1075#1086' / '#1050#1086#1084#1091
        Width = 320
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 216
    Top = 112
    object N2: TMenuItem
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      object B_Cassa_prihod: TMenuItem
        Caption = #1053#1086#1074#1099#1081' '#1087#1088#1080#1093#1086#1076' '#1087#1086' '#1082#1072#1089#1089#1077
        OnClick = B_Cassa_prihodClick
      end
      object N_Cassa_rashod: TMenuItem
        Caption = #1053#1086#1074#1099#1081' '#1088#1072#1089#1093#1086#1076' '#1087#1086' '#1082#1072#1089#1089#1077
        OnClick = N_Cassa_rashodClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object N_Edit_mainmenu: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        OnClick = N_Edit_mainmenuClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object N_Delete_Mainmenu: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100
        OnClick = N_Delete_MainmenuClick
      end
    end
    object N_Period_of_view: TMenuItem
      Caption = #1055#1077#1088#1080#1086#1076' '#1087#1088#1086#1089#1084#1086#1090#1088#1072
    end
  end
  object IB_Cassa_Jurnal: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from ('
      
        'select 1 is_prihod, cp.id id_doc, cp.date_cas date_doc, cp.summa' +
        ' summa_prihod, null summa_rashod,'
      
        'coalesce((select name from contragenty_1 where id=cp.id_contrage' +
        'nt),'#39#39') ||'
      
        'coalesce((select fio from sotrudniki where id=cp.id_sotrudnik),'#39 +
        #39') contragent_name'
      'from cassa_prihod cp'
      'where cp.date_cas>=:date_start'
      ''
      'union all'
      ''
      
        'select 0 is_prihod, cr.id id_doc, cr.date_cas date_doc, null sum' +
        'ma_prihod, cr.summa summa_rashod,'
      
        'coalesce((select name from contragenty_1 where id=cr.id_contrage' +
        'nt),'#39#39') ||'
      
        'coalesce((select fio from sotrudniki where id=cr.id_sotrudnik),'#39 +
        #39') contragent_name'
      'from cassa_rashod cr'
      'where cr.date_cas>=:date_start'
      ') order by date_doc')
    Left = 432
    Top = 128
    object IB_Cassa_JurnalIS_PRIHOD: TIntegerField
      FieldName = 'IS_PRIHOD'
      Required = True
    end
    object IB_Cassa_JurnalID_DOC: TIntegerField
      FieldName = 'ID_DOC'
      Required = True
    end
    object IB_Cassa_JurnalDATE_DOC: TDateField
      FieldName = 'DATE_DOC'
      Required = True
    end
    object IB_Cassa_JurnalSUMMA_PRIHOD: TIBBCDField
      FieldName = 'SUMMA_PRIHOD'
      DisplayFormat = '### ##0.00'
      Precision = 18
      Size = 2
    end
    object IB_Cassa_JurnalSUMMA_RASHOD: TIBBCDField
      FieldName = 'SUMMA_RASHOD'
      DisplayFormat = '### ##0.00'
      Precision = 18
      Size = 2
    end
    object IB_Cassa_JurnalCONTRAGENT_NAME: TIBStringField
      FieldName = 'CONTRAGENT_NAME'
      Size = 100
    end
  end
  object DS_Cassa_Jurnal: TDataSource
    AutoEdit = False
    DataSet = IB_Cassa_Jurnal
    Left = 432
    Top = 176
  end
  object PopupMenu1: TPopupMenu
    Left = 728
    Top = 176
    object N_Prihod: TMenuItem
      Caption = #1053#1086#1074#1099#1081' '#1087#1088#1080#1093#1086#1076' '#1087#1086' '#1082#1072#1089#1089#1077
      OnClick = N_PrihodClick
    end
    object N_Rashod: TMenuItem
      Caption = #1053#1086#1074#1099#1081' '#1088#1072#1089#1093#1086#1076' '#1087#1086' '#1082#1072#1089#1089#1077
      OnClick = N_RashodClick
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N_Edit: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnClick = N_EditClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N_Delete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = N_DeleteClick
    end
  end
end
