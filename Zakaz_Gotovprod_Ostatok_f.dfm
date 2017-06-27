object F_Zakaz_Gotovprod_Ostatok: TF_Zakaz_Gotovprod_Ostatok
  Left = 54
  Top = 64
  AutoScroll = False
  Caption = #1054#1089#1090#1072#1090#1086#1082' '#1075#1086#1090#1086#1074#1086#1081' '#1087#1088#1086#1076#1091#1082#1094#1080#1080' ('#1087#1086' '#1047#1072#1082#1072#1079#1072#1084')'
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1177
    Height = 617
    DataSource = DS_ZAKAZ_GOTOVPROD_OSTATOK
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnDblClick = DBGrid1DblClick
    OnKeyUp = DBGrid1KeyUp
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_ZAKAZ'
        Title.Alignment = taCenter
        Title.Caption = #1047#1072#1082#1072#1079
        Width = 128
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GRUPA_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1056#1059#1055#1055#1040
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GOTOVPROD_NAME'
        Title.Alignment = taCenter
        Title.Caption = #1043#1054#1058#1054#1042#1040#1071' '#1055#1056#1054#1044#1059#1050#1062#1048#1071
        Width = 315
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'OSTATOK'
        Title.Alignment = taCenter
        Title.Caption = #1054#1057#1058#1040#1058#1054#1050
        Width = 166
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 1
    Top = 626
    Width = 1177
    Height = 57
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object B_Select: TButton
      Left = 1072
      Top = 12
      Width = 97
      Height = 33
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ModalResult = 1
      TabOrder = 0
      OnClick = B_SelectClick
    end
    object B_Close: TButton
      Left = 968
      Top = 12
      Width = 97
      Height = 33
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 1
      OnClick = B_CloseClick
    end
  end
  object IB_ZAKAZ_GOTOVPROD_OSTATOK: TIBDataSet
    Database = DM_Mebeli.DB_Mebeli
    Transaction = DM_Mebeli.IBTransaction1
    ForcedRefresh = True
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = False
    RefreshSQL.Strings = (
      'Select *'
      'from GET_ZAKAZ_GOTOVPROD_OSTATOK (null,null)'
      'where'
      '  ID_ZAKAZ = :ID_ZAKAZ')
    SelectSQL.Strings = (
      
        'select gp_ost.id_zakaz id_zakaz, gp.article, gpg.name grupa_name' +
        ', gp.name gotovprod_name, gp_ost.id_gotovprod id_gotovprod, gp_o' +
        'st.ostatok ostatok'
      'from'
      
        '(select id_zakaz, id_gotovprod, sum(ostatok) ostatok from GET_ZA' +
        'KAZ_GOTOVPROD_OSTATOK(null, null)'
      'group by id_zakaz, id_gotovprod) gp_ost,'
      'gotov_prod_grupa gpg, gotov_prod_0 gp'
      'where (gpg.id=gp.id_grupa) and (gp.id=gp_ost.id_gotovprod)'
      'order by gp_ost.id_zakaz, gpg.name, gp.name')
    GeneratorField.Field = 'ID'
    GeneratorField.Generator = 'GEN_GOTOV_PROD_GRUPA_ID'
    Left = 520
    Top = 168
  end
  object DS_ZAKAZ_GOTOVPROD_OSTATOK: TDataSource
    AutoEdit = False
    DataSet = IB_ZAKAZ_GOTOVPROD_OSTATOK
    Left = 584
    Top = 168
  end
end
