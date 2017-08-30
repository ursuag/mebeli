object F_Remont_jurnal: TF_Remont_jurnal
  Left = 0
  Top = 132
  AutoScroll = False
  Caption = #1046#1091#1088#1085#1072#1083' "'#1040#1082#1090#1099' '#1088#1077#1084#1086#1085#1090#1072'"'
  ClientHeight = 670
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
    Height = 297
    DataSource = DS_Remont_Jurnal
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
        FieldName = 'SUMMA_PRODAJA'
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072', '#1083#1077#1081
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRAGENT_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1084#1091
        Width = 299
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GOTOVPROD_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1048#1079#1076#1077#1083#1080#1077
        Width = 221
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 217
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 304
    Width = 1176
    Height = 297
    DataSource = DS_Remont_rashod
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = RUSSIAN_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'TIP_MATERIALA'
        Title.Alignment = taCenter
        Title.Caption = #1058#1048#1055
        Width = 172
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ARTICLE'
        Title.Alignment = taCenter
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1088#1091#1087#1087#1072
        Width = 309
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MATERIAL_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOL_VO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ED_IZM'
        Title.Alignment = taCenter
        Title.Caption = #1045#1076'.'#1080#1084#1079'.'
        Width = 122
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 216
    Top = 112
    object ND: TMenuItem
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      object N_Insert_PopUp: TMenuItem
        Caption = #1053#1086#1074#1099#1081' '#1088#1077#1084#1086#1085#1090
        OnClick = N_Insert_PopUpClick
      end
      object N_Edit_PopUp: TMenuItem
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        OnClick = N_Edit_PopUpClick
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
  object IB_Remont_Jurnal: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select r0.id id_doc, r0.date_rem date_doc, (select name from con' +
        'tragenty_1 where id=r0.id_contragent) contragent_name, gp0.name ' +
        'gotovprod_name, r0.description description, r0.summa_prodaja'
      'from remont_0 r0, gotov_prod_0 gp0'
      'where (r0.id_gotov_prod=gp0.id) and (r0.date_rem>=:date_start)'
      'order by r0.date_rem, r0.id')
    Left = 432
    Top = 128
  end
  object DS_Remont_Jurnal: TDataSource
    AutoEdit = False
    DataSet = IB_Remont_Jurnal
    Left = 472
    Top = 128
  end
  object PopupMenu1: TPopupMenu
    Left = 728
    Top = 176
    object N_Insert: TMenuItem
      Caption = #1053#1086#1074#1099#1081' '#1088#1077#1084#1086#1085#1090
      OnClick = N_InsertClick
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
    end
  end
  object IB_Remont_rashod: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select '#39#1084#1072#1090#1077#1088#1080#1072#1083#1099#39' tip_materiala, f.article article, fg.name gru' +
        'pa_name, f.name material_name, rf.kol_vo kol_vo, f.ed_izm'
      'from rashod_furnitura rf, furnitura_grupa fg, furnitura f'
      
        'where (fg.id=f.id_parent) and (f.id=rf.id_furnitura) and (id_rem' +
        'ont=:ID_DOC)'
      ''
      'union all'
      ''
      'select '#39#1076#1077#1090#1072#1083#1080#39', pd.id, pg.name, pd.name, rd.kol_vo, '#39#1096#1090#39
      'from rashod_detali rd, pilomat_grupa pg, pilomat_detali pd'
      
        'where (pg.id=pd.id_grupa) and (pd.id=rd.id_pilomat_detali) and (' +
        'id_remont=:ID_DOC)'
      ''
      'order by 1,3,4')
    DataSource = DS_Remont_Jurnal
    Left = 112
    Top = 448
  end
  object DS_Remont_rashod: TDataSource
    AutoEdit = False
    DataSet = IB_Remont_rashod
    Left = 152
    Top = 448
  end
end
