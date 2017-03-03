object F_Revizii_jurnal: TF_Revizii_jurnal
  Left = 0
  Top = 67
  AutoScroll = False
  Caption = #1046#1091#1088#1085#1072#1083' '#1056#1077#1074#1080#1079#1080#1081
  ClientHeight = 682
  ClientWidth = 1184
  Color = clBtnFace
  ParentFont = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  PrintScale = poNone
  Scaled = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1177
    Height = 233
    DataSource = DS_Revizia_0
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
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
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1076#1086#1082
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_DOC'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 205
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SKLAD_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1057#1082#1083#1072#1076
        Width = 326
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Alignment = taCenter
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Width = 498
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 238
    Width = 1177
    Height = 371
    DataSource = DS_Revizia_materialy
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
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
  object Panel1: TPanel
    Left = 0
    Top = 622
    Width = 1169
    Height = 43
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object B_Exit: TButton
      Left = 1083
      Top = 9
      Width = 74
      Height = 25
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 0
    end
  end
  object IB_Revizia_0: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from revizia_0'
      'where'
      '  ID = :OLD_ID')
    SelectSQL.Strings = (
      
        'select r0.id id, r0.date_doc date_doc, r0.description descriptio' +
        'n, s.name sklad_name'
      'from revizia_0 r0, sklad s'
      'where (r0.id_sklad=s.id) and (r0.date_doc>= :date_start)'
      'order by r0.date_doc, r0.id')
    ModifySQL.Strings = (
      '')
    Left = 40
    Top = 64
  end
  object DS_Revizia_0: TDataSource
    AutoEdit = False
    DataSet = IB_Revizia_0
    Left = 80
    Top = 64
  end
  object DS_Revizia_materialy: TDataSource
    AutoEdit = False
    DataSet = IB_Revizia_materialy
    Left = 88
    Top = 392
  end
  object IB_Revizia_materialy: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'select 1 num_order, f.article articul, fg.name grupa_name, f.nam' +
        'e name,  rf.kolvo_programa, rf.kolvo_revizia, (rf.kolvo_programa' +
        '-rf.kolvo_revizia) raznitsa'
      'from revizia_furnitura rf, furnitura f, furnitura_grupa fg'
      
        'where (rf.id_parent=:id) and (f.id=rf.id_furnitura) and (f.id_pa' +
        'rent=fg.id)'
      ''
      'union all'
      ''
      
        'select 2 num_order, pl.id articul, pg.name grupa_name, pl.name n' +
        'ame,  rl.kolvo_programa, rl.kolvo_revizia, (rl.kolvo_programa-rl' +
        '.kolvo_revizia) raznitsa'
      'from revizia_listy rl, pilomat_listy pl, pilomat_grupa pg'
      
        'where (rl.id_parent=:id) and (pl.id=rl.id_listy) and (pl.id_grup' +
        'a=pg.id)'
      ''
      'union all'
      ''
      
        'select 3 num_order, pd.id articul, pg.name grupa_name, pd.name n' +
        'ame,  rd.kolvo_programa, rd.kolvo_revizia, (rd.kolvo_programa-rd' +
        '.kolvo_revizia) raznitsa'
      'from revizia_detali rd, pilomat_detali pd, pilomat_grupa pg'
      
        'where (rd.id_parent=:id) and (pd.id=rd.id_detali) and (pd.id_gru' +
        'pa=pg.id)'
      ''
      'order by 1,3,4')
    DataSource = DS_Revizia_0
    Left = 48
    Top = 392
  end
  object MainMenu1: TMainMenu
    Left = 216
    Top = 112
    object N1: TMenuItem
      Caption = #1056#1077#1074#1080#1079#1080#1080
      object N_Insert_main: TMenuItem
        Caption = #1053#1086#1074#1072#1103' '#1088#1077#1074#1080#1079#1080#1103
        OnClick = N_Insert_mainClick
      end
      object N_Edit_main: TMenuItem
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1088#1077#1074#1080#1079#1080#1102
        OnClick = N_Edit_mainClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object N_Sign_main: TMenuItem
        Caption = #1055#1086#1076#1087#1080#1089#1072#1090#1100' '#1088#1077#1074#1080#1079#1080#1102
        OnClick = N_Sign_mainClick
      end
      object N_Unsign_main: TMenuItem
        Caption = #1057#1085#1103#1090#1100' '#1087#1086#1076#1087#1080#1089#1080
        OnClick = N_Unsign_mainClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object N_Delete_main: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1077#1074#1080#1079#1080#1102
      end
    end
    object N_Period_of_view: TMenuItem
      Caption = #1055#1077#1088#1080#1086#1076' '#1087#1088#1086#1089#1084#1086#1090#1088#1072
      OnClick = N_Period_of_viewClick
    end
  end
end
