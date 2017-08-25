unit Akt_raspil_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Mask, DBCtrls, DB, DBTables, IBQuery,
  IBCustomDataSet, Buttons, Menus;

type
  TF_Akt_raspil_edit = class(TForm)
    DBGR_LISTY: TDBGrid;
    DBGR_DETALI: TDBGrid;
    P_Buttons: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    P_Shapka: TPanel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBE_Date_R: TDBEdit;
    Label3: TLabel;
    DBGR_OSTATKI: TDBGrid;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    IB_Akt_raspil_detali: TIBDataSet;
    Label8: TLabel;
    DBE_ID_Zakaz: TDBEdit;
    B_Select_Zakaz: TSpeedButton;
    DBLookupComboBox1: TDBLookupComboBox;
    Label9: TLabel;
    Label10: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DS_Akt_raspil_detali: TDataSource;
    E_Ostatok: TEdit;
    B_Sotrudnik2_clear: TSpeedButton;
    IB_Akt_raspil_listy: TIBDataSet;
    DS_Akt_raspil_listy: TDataSource;
    DBE_OTHOD_SUMMA: TDBEdit;
    Label7: TLabel;
    Label11: TLabel;
    Button1: TButton;
    IB_Akt_raspil_listyID_PARENT: TIntegerField;
    IB_Akt_raspil_listyID_PILOMAT_LISTY: TIntegerField;
    IB_Akt_raspil_listyKOL_VO: TIntegerField;
    IB_Akt_raspil_listyID: TIntegerField;
    IB_Pilomat_Listy_F: TIBDataSet;
    IB_Pilomat_Detali_F: TIBDataSet;
    IB_Akt_raspil_detaliID_PARENT: TIntegerField;
    IB_Akt_raspil_detaliID_PILOMAT_DETALI: TIntegerField;
    IB_Akt_raspil_detaliKOL_VO: TIntegerField;
    IB_Akt_raspil_detaliID_SKLAD: TIntegerField;
    IB_Akt_raspil_detaliID: TIntegerField;
    IB_Akt_raspil_detaliGRUPA_NAME: TStringField;
    IB_Akt_raspil_detaliDETALY_NAME: TStringField;
    IB_Akt_raspil_detaliIS_REMONT: TSmallintField;
    IB_Akt_raspil_detaliREMONT_NAME: TStringField;
    PMenu_Detali: TPopupMenu;
    N_Set_Remont: TMenuItem;
    N_Clear_Remont: TMenuItem;
    IB_Akt_raspil_listyGRUPA_NAME: TStringField;
    IB_Akt_raspil_listyLISTY_NAME: TStringField;
    DBL_Detali: TDBLookupComboBox;
    DBL_Detali_Grupa: TDBLookupComboBox;
    IB_Akt_raspil_detaliID_GRUPA: TIntegerField;
    procedure FormActivate(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGR_LISTYEditButtonClick(Sender: TObject);
    procedure DBGR_LISTYKeyPress(Sender: TObject; var Key: Char);
    procedure DBGR_DETALIEditButtonClick(Sender: TObject);
    procedure DBGR_DETALIKeyPress(Sender: TObject; var Key: Char);
    procedure IB_Akt_raspil_detaliNewRecord(DataSet: TDataSet);
    procedure B_Select_ZakazClick(Sender: TObject);
    procedure P_ShapkaExit(Sender: TObject);
    procedure B_Sotrudnik2_clearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IB_Akt_raspil_detaliDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Akt_raspil_listyNewRecord(DataSet: TDataSet);
    procedure DBGR_LISTYExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGR_DETALIExit(Sender: TObject);
    procedure IB_Akt_raspil_detaliCalcFields(DataSet: TDataSet);
    procedure N_Set_RemontClick(Sender: TObject);
    procedure N_Clear_RemontClick(Sender: TObject);
    procedure DBGR_DETALIEnter(Sender: TObject);
    procedure IB_Akt_raspil_listyCalcFields(DataSet: TDataSet);
    procedure DBL_DetaliCloseUp(Sender: TObject);
    procedure DBL_Detali_GrupaCloseUp(Sender: TObject);
    procedure DBGR_DETALIDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBE_Date_RExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Akt_raspil_edit: TF_Akt_raspil_edit;
         OK_Pressed: boolean;
      ID_Akt_raspil: integer;
           is_error: boolean;//true если возникла ошибка удаления из справочника Pilomat_listy
          read_only: boolean;
implementation

uses main_f, mebeli_dm, gotov_prod_f, pilomat_f, zakaz_select_f,
  akt_raspil_jurnal_f;

{$R *.dfm}

procedure Generate_price;
var
  sql_listy_price: TIBQuery;
  sql_prihod_price: TIBQuery;
  kolvo_listy: integer;
begin
  DecimalSeparator_Old:=DecimalSeparator;
  DecimalSeparator:='.';
  sql_listy_price:=TIBQuery.Create(nil);
  sql_listy_price.Database:=F_Main.IBQuery1.Database;
  sql_listy_price.SQL.Add('delete from akt_raspil_listy_price where id_parent='+DM_Mebeli.IB_Akt_raspil.FieldByName('id').AsString);
  sql_listy_price.ExecSQL;
  sql_listy_price.SQL.Clear;
  sql_listy_price.SQL.Add('insert into akt_raspil_listy_price (id_parent, id_pilomat_listy, kol_vo, id_prihod_listy, summa, price_m2)');
  sql_listy_price.SQL.Add('values (:id_parent, :id_pilomat_listy, :kol_vo, :id_prihod_listy, :summa, :price_m2)');

  sql_prihod_price:=TIBQuery.Create(nil);
  sql_prihod_price.Database:=F_Main.IBQuery1.Database;
  sql_prihod_price.SQL.Add('select * from GET_OSTATOK_PRIHOD_LISTY(:id_listy, :id_sklad, :date_ost) where kol_vo>0');
  sql_prihod_price.ParamByName('id_sklad').Value:=sklad_listy;
  sql_prihod_price.ParamByName('date_ost').Value:=Date();

  F_Akt_raspil_edit.IB_Akt_raspil_listy.First;
  while not F_Akt_raspil_edit.IB_Akt_raspil_listy.Eof do
    begin
      kolvo_listy:=F_Akt_raspil_edit.IB_Akt_raspil_listy.FieldByName('kol_vo').AsInteger;
      sql_prihod_price.Close;
      sql_prihod_price.ParamByName('id_listy').Value:=F_Akt_raspil_edit.IB_Akt_raspil_listy.FieldByName('id_pilomat_listy').AsInteger;
      sql_prihod_price.Open;
      sql_prihod_price.First;
      while not sql_prihod_price.Eof do
        begin
          if sql_prihod_price.FieldByName('kol_vo').AsInteger>=kolvo_listy then
            begin
              sql_listy_price.ParamByname('id_parent').Value:=DM_Mebeli.IB_Akt_raspil.FieldByName('id').AsInteger;
              sql_listy_price.ParamByname('id_pilomat_listy').Value:=F_Akt_raspil_edit.IB_Akt_raspil_listy.FieldByName('id_pilomat_listy').AsInteger;
              sql_listy_price.ParamByname('kol_vo').Value:=kolvo_listy;
              sql_listy_price.ParamByname('id_prihod_listy').Value:=sql_prihod_price.FieldByName('id_prihod').AsInteger;
              sql_listy_price.ParamByname('summa').Value:=sql_prihod_price.FieldByName('price_m2').AsFloat*kolvo_listy*sql_prihod_price.FieldByName('area_m2').AsFloat;
              sql_listy_price.ParamByname('price_m2').Value:=sql_prihod_price.FieldByName('price_m2').AsFloat;
              sql_listy_price.ExecSQL;
              break;
            end//if
          else
            begin
              sql_listy_price.ParamByname('id_parent').Value:=DM_Mebeli.IB_Akt_raspil.FieldByName('id').AsInteger;
              sql_listy_price.ParamByname('id_pilomat_listy').Value:=F_Akt_raspil_edit.IB_Akt_raspil_listy.FieldByName('id_pilomat_listy').AsInteger;
              sql_listy_price.ParamByname('kol_vo').Value:=sql_prihod_price.FieldByName('kol_vo').AsInteger;
              sql_listy_price.ParamByname('id_prihod_listy').Value:=sql_prihod_price.FieldByName('id_prihod').AsInteger;
              sql_listy_price.ParamByname('summa').Value:=sql_prihod_price.FieldByName('price_m2').AsFloat*sql_prihod_price.FieldByName('kol_vo').AsInteger*sql_prihod_price.FieldByName('area_m2').AsFloat;
              sql_listy_price.ParamByname('price_m2').Value:=sql_prihod_price.FieldByName('price_m2').AsFloat;
              sql_listy_price.ExecSQL;
              kolvo_listy:=kolvo_listy-sql_prihod_price.FieldByName('kol_vo').AsInteger;
            end;//else
          sql_prihod_price.Next;
        end;
      F_Akt_raspil_edit.IB_Akt_raspil_listy.Next;
    end;//while

  DecimalSeparator:=DecimalSeparator_Old;
  sql_listy_price.Close;
  sql_listy_price.Free;
  sql_prihod_price.Close;
  sql_prihod_price.Free;
end;//

procedure Update_othod;
var     sql_othod: TIBQuery;
begin
  SQL_othod:=TIBQuery.Create(nil);
  SQL_othod.Database:=F_Main.IBQuery1.Database;
  SQL_othod.SQL.Clear;
  SQL_othod.SQL.Add('execute procedure SET_RASPIL_OTHOD(:ID_Akt_raspil)');
  SQL_othod.ParamByName('ID_Akt_raspil').Value:=ID_Akt_raspil;
  SQL_othod.ExecSQL;
  SQL_othod.Free;
end;//proc

procedure TF_Akt_raspil_edit.FormActivate(Sender: TObject);
begin
//  IB_Akt_raspil_ostatok.Open;
  DBL_Detali.Visible:=false;
  DBL_Detali_grupa.Visible:=false;

  IB_Akt_raspil_listy.Open;
  IB_Akt_raspil_detali.Open;

  B_Ok.Enabled:=true;
  DBGR_Listy.Enabled:=true;
  DBGR_Ostatki.Enabled:=true;
  DBGR_Detali.Enabled:=true;
  Read_Only:=false;
  OK_Pressed:=False;
  DBE_Date_R.ReadOnly:=False;
  IF operation='INSERT' Then
     begin
       IF not DM_Mebeli.IBTransaction1.active Then
          DM_Mebeli.IBTransaction1.StartTransaction;
       DM_Mebeli.IB_Akt_raspil.Insert;
       DM_Mebeli.IB_Akt_raspil.FieldByName('DATE_R').Value:=Date;
       DM_Mebeli.IB_Akt_raspil.FieldByName('OTHOD_PRC').Value:=0;
       DM_Mebeli.IB_Akt_raspil.Post;
       DM_Mebeli.IB_Akt_raspil.Edit;
       IF role_name='USER' Then
          DBE_Date_R.ReadOnly:=True;
     end;//IF 'INSERT'
  IF operation='EDIT' Then
    DM_Mebeli.IB_Akt_raspil.Edit;
  DBE_Id_Zakaz.SetFocus;
  ID_Akt_raspil:=DM_Mebeli.IB_Akt_raspil.FieldByName('ID').AsInteger;
  E_Ostatok.Text:=FloatToStrF((DM_Mebeli.IB_Akt_raspil.FieldByName('OSTATOK').AsInteger/1000000.000),ffNumber,9,3)+' м2';
end;//proc

procedure TF_Akt_raspil_edit.B_ExitClick(Sender: TObject);
begin
  OK_Pressed:=FALSE;
  Close;
end;//proc

procedure TF_Akt_raspil_edit.B_OkClick(Sender: TObject);
begin
  is_error:=False;
  IF DM_Mebeli.IBTransaction1.Active Then
     begin
       IF (DM_Mebeli.IB_Akt_raspil.State=dsEdit) OR (DM_Mebeli.IB_Akt_raspil.State=dsInsert) Then
          DM_Mebeli.IB_Akt_raspil.Post;
       IF (IB_Akt_raspil_listy.State=dsEdit) OR (IB_Akt_raspil_listy.State=dsInsert) Then
          IB_Akt_raspil_listy.Post;
       IF (IB_Akt_raspil_detali.State=dsEdit) OR (IB_Akt_raspil_detali.State=dsInsert) Then
          IB_Akt_raspil_detali.Post;
       Update_othod;

       DM_Mebeli.IB_Akt_raspil.Refresh;
       if DM_Mebeli.IB_Akt_raspil.FieldByName('othod_m2').AsFloat<0 then
          begin
            is_error:=true;
            ShowMessage('Площадь деталей больше площади листов! Проверьте.');
            exit;
          end;

       IF not is_error Then
        begin
          DM_Mebeli.IBTransaction1.Commit;
          OK_Pressed:=True;
          close
        end
       ELSE
        DM_Mebeli.IBTransaction1.Rollback;
     end;//IF
end;//proc

procedure TF_Akt_raspil_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var res:TModalResult;
begin
  IF read_only then
    begin
      IF DM_Mebeli.IBTransaction1.Active Then
        DM_Mebeli.IBTransaction1.Rollback;
      exit;
    end;

  IF OK_Pressed Then
    begin
//      IB_Akt_raspil_ostatok.Close;
      IB_Akt_raspil_detali.Close;
      IB_Akt_raspil_detali.Close;
      exit;
    end;
  is_error:=false;
  res:=MessageDlg('Сохранить изменения?',mtConfirmation,[mbYes,mbNo,mbCancel],0);
  IF res=mrCancel Then
     Action:=caNone;
  IF res=mrNo Then
     IF DM_Mebeli.IBTransaction1.Active Then
        DM_Mebeli.IBTransaction1.Rollback;
  IF res=mrYes Then
    begin
      ok_pressed:=true;
      B_OkClick(Sender);
    end;//IF res=mrYes
  if is_error then
    action:=caNone
  else
    begin
      IB_Akt_raspil_listy.Close;
      IB_Akt_raspil_detali.Close;
    end;
end;//proc

procedure TF_Akt_raspil_edit.DBGR_LISTYEditButtonClick(Sender: TObject);
var old_operation: string [6];
begin
  old_operation:=operation;
  operation:='SELECT_STOCKS';
  IF F_Pilomat.ShowModal=mrOk Then
    begin
      if IB_Akt_raspil_listy.State=dsBrowse then
        IB_Akt_raspil_listy.Insert;
      IB_Akt_raspil_listy.FieldByName('ID_PILOMAT_LISTY').Value:=F_Pilomat.id_listy;
//      IB_Akt_raspil_listy.Post;
    end;//IF =mrOk
  operation:=old_operation;
  DBGR_LISTY.SelectedIndex:=3;
end;//proc

procedure TF_Akt_raspil_edit.DBGR_LISTYKeyPress(Sender: TObject;
  var Key: Char);
begin
  IF Key=' ' Then
    DBGR_LISTYEditButtonClick(Sender);
end;//proc

procedure TF_Akt_raspil_edit.DBGR_DETALIEditButtonClick(Sender: TObject);
var old_operation: string [6];
begin
  old_operation:=operation;
  operation:='SELECT';
  IF F_Pilomat.ShowModal=mrOk Then
    begin
      IB_Akt_raspil_detali.Edit;
      IB_Akt_raspil_detali.FieldByName('ID_PILOMAT_DETALI').Value:=F_Pilomat.id_detali;
//      IB_Akt_raspil_detali.Post;
    end;//IF =mrOk
  operation:=old_operation;
  DBGR_Detali.SelectedIndex:=2;
end;//proc

procedure TF_Akt_raspil_edit.DBGR_DETALIKeyPress(Sender: TObject;
  var Key: Char);
begin
  IF Key=' ' Then
    DBGR_DETALIEditButtonClick(Sender);
end;//proc


procedure TF_Akt_raspil_edit.IB_Akt_raspil_detaliNewRecord(
  DataSet: TDataSet);
begin
  IB_Akt_raspil_detali.FieldByName('ID_PARENT').Value:=DM_Mebeli.IB_Akt_raspil.FieldByName('ID').AsInteger;
  IB_Akt_raspil_detali.FieldByName('ID_SKLAD').Value:=sklad_detali;
end;//proc

procedure TF_Akt_raspil_edit.B_Select_ZakazClick(Sender: TObject);
begin
  F_Zakaz_select.ShowModal;
  DM_Mebeli.IB_Akt_raspil.Edit;
  IF F_Zakaz_select.ModalResult=mrOk Then
    DM_Mebeli.IB_Akt_raspil.FieldByName('ID_ZAKAZ').Value:=id_zakaz;
end;//proc

procedure TF_Akt_raspil_edit.P_ShapkaExit(Sender: TObject);
begin
  IF DM_Mebeli.IB_Akt_raspil.FieldByName('id_zakaz').IsNull Then
    begin
      ShowMessage('Не указан Заказ!!!');
      DBE_ID_Zakaz.SetFocus;
    end;//if
end;

procedure TF_Akt_raspil_edit.B_Sotrudnik2_clearClick(Sender: TObject);
begin
  DM_Mebeli.IB_Akt_raspil.FieldByName('id_sotrudnik_2').Value:=null;
end;

procedure TF_Akt_raspil_edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Akt_raspil_edit);
  F_Akt_raspil_edit.Width:=Screen.Width;
  F_Akt_raspil_edit.Height:=Screen.Height;
end;

procedure TF_Akt_raspil_edit.IB_Akt_raspil_detaliDeleteError(
  DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  dm_mebeli.trigger_error(e.Message);
end;

procedure TF_Akt_raspil_edit.IB_Akt_raspil_listyNewRecord(
  DataSet: TDataSet);
begin
  IB_Akt_raspil_listy.FieldByName('ID_PARENT').Value:=DM_Mebeli.IB_Akt_raspil.FieldByName('ID').AsInteger;
end;

procedure TF_Akt_raspil_edit.DBGR_LISTYExit(Sender: TObject);
begin
  IF (IB_Akt_raspil_listy.State=dsEdit) OR (IB_Akt_raspil_listy.State=dsInsert) Then
    IB_Akt_raspil_listy.Post;
end;

procedure TF_Akt_raspil_edit.Button1Click(Sender: TObject);
begin
IB_Akt_raspil_listy.Refresh;
end;

procedure TF_Akt_raspil_edit.DBGR_DETALIExit(Sender: TObject);
begin
  IF (IB_Akt_raspil_detali.State=dsEdit) OR (IB_Akt_raspil_detali.State=dsInsert) Then
    IB_Akt_raspil_detali.Post;
end;

procedure TF_Akt_raspil_edit.IB_Akt_raspil_detaliCalcFields(
  DataSet: TDataSet);
var ib_tmp:TIBDataSet;
begin
  if IB_Akt_raspil_detali.FieldByname('id_pilomat_detali').isNull then
    exit;

  ib_tmp:=TIBDataSet.Create(nil);
  ib_tmp.Database:=DM_Mebeli.DB_Mebeli;

  if IB_Akt_raspil_detali.FieldByname('id_grupa').isNull then
    begin
      ib_tmp.SelectSQL.Add('select id_grupa from pilomat_detali where id= :id_detali');
      ib_tmp.ParamByName('id_detali').Value:=IB_Akt_raspil_detali.FieldByname('id_pilomat_detali').AsInteger;
      ib_tmp.Open;
      IB_Akt_raspil_detali.FieldByname('id_grupa').Value:=ib_tmp.FieldByName('id_grupa').AsInteger;
    end;

  ib_tmp.Close;
  ib_tmp.SelectSQL.Clear;
  ib_tmp.SelectSQL.Add('select name from pilomat_grupa where id=:id');
  ib_tmp.ParamByName('id').Value:=IB_Akt_raspil_detali.FieldByname('id_grupa').AsInteger;
  ib_tmp.open;
  IB_Akt_raspil_detali.FieldByname('GRUPA_NAME').Value:=ib_tmp.FieldByName('name').AsString;
  ib_tmp.Close;
  ib_tmp.SelectSQL.Clear;
  ib_tmp.SelectSQL.Add('select name from pilomat_detali where id=:id');
  ib_tmp.ParamByName('id').Value:=IB_Akt_raspil_detali.FieldByname('id_pilomat_detali').AsInteger;
  ib_tmp.open;
  IB_Akt_raspil_detali.FieldByname('DETALI_NAME').Value:=ib_tmp.FieldByName('name').AsString;
  ib_tmp.free;

  if IB_Akt_raspil_detali.FieldByname('is_remont').AsInteger=0 then
    IB_Akt_raspil_detali.FieldByname('remont_name').value:='Нет'
  else
    IB_Akt_raspil_detali.FieldByname('remont_name').value:='Да';


//  IB_Pilomat_Detali_F
end;

procedure TF_Akt_raspil_edit.N_Set_RemontClick(Sender: TObject);
begin
  IB_Akt_raspil_detali.Edit;
  IB_Akt_raspil_detali.FieldByname('is_remont').Value:=1;
  IB_Akt_raspil_detali.Post;
end;

procedure TF_Akt_raspil_edit.N_Clear_RemontClick(Sender: TObject);
begin
  IB_Akt_raspil_detali.Edit;
  IB_Akt_raspil_detali.FieldByname('is_remont').Value:=0;
  IB_Akt_raspil_detali.post;
end;

procedure TF_Akt_raspil_edit.DBGR_DETALIEnter(Sender: TObject);
var sql_listy: TIBQuery;
begin
  if (DM_Mebeli.IB_Akt_raspil.state=dsEdit) or (DM_Mebeli.IB_Akt_raspil.state=dsInsert) then
    DM_Mebeli.IB_Akt_raspil.Post;

  SQL_listy:=TIBQuery.Create(nil);
  SQL_listy.Database:=F_Main.IBQuery1.Database;
  SQL_listy.SQL.Add('select id from akt_raspil_listy where id_parent=:id_raspil');
  SQL_listy.ParamByname('id_raspil').Value:=DM_Mebeli.IB_Akt_raspil.FieldByName('id').AsInteger;
  SQL_listy.Open;
  if SQL_listy.FieldByname('id').IsNull then
    begin
      ShowMessage('Сначала добавьте в акт листы!');
      DBGR_LISTY.SetFocus;
    end;
  SQL_listy.Close;
  SQL_listy.Free;
end;

procedure TF_Akt_raspil_edit.IB_Akt_raspil_listyCalcFields(
  DataSet: TDataSet);
var sql_listy: TIBQuery;
begin
  if IB_Akt_raspil_listy.FieldByName('id_pilomat_listy').IsNull then
    exit;
  SQL_listy:=TIBQuery.Create(nil);
  SQL_listy.Database:=F_Main.IBQuery1.Database;
  SQL_listy.SQL.Add('select pg.name grupa_name, pl.name listy_name from pilomat_grupa pg, pilomat_listy pl where (pg.id=pl.id_grupa) and (pl.id=:id_listy)');
  SQL_listy.ParamByname('id_listy').Value:=IB_Akt_raspil_listy.FieldByName('id_pilomat_listy').AsInteger;
  SQL_listy.Open;
  IB_Akt_raspil_listy.FieldByName('grupa_name').Value:=SQL_listy.FieldByname('grupa_name').AsString;
  IB_Akt_raspil_listy.FieldByName('listy_name').Value:=SQL_listy.FieldByname('listy_name').AsString;
  SQL_listy.Close;
  SQL_listy.Free;
end;

procedure TF_Akt_raspil_edit.DBL_DetaliCloseUp(Sender: TObject);
begin
  IB_Akt_raspil_detali.Edit;
  IB_Akt_raspil_detali.FieldByName('id_pilomat_detali').Value:=DM_Mebeli.IB_Pilomat_detali.FieldByname('id').AsInteger;
  DBGR_Detali.SetFocus;
  DBGR_Detali.SelectedIndex:=2;
end;

procedure TF_Akt_raspil_edit.DBL_Detali_GrupaCloseUp(Sender: TObject);
begin
  IB_Akt_raspil_detali.Edit;
  IB_Akt_raspil_detali.FieldByName('id_grupa').Value:=DM_Mebeli.IB_Pilomat_grupa.FieldByname('id').AsInteger;
  DBGR_Detali.SetFocus;
  DBGR_Detali.SelectedIndex:=1;
end;

procedure TF_Akt_raspil_edit.DBGR_DETALIDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBL_Detali.DataField) then
    begin
{      IF IB_Prihod_furnitura_1.FieldByName('ID_FURNITURA_GRUPA').IsNull Then exit;
      DM_Mebeli.IB_Pilomat_detali.Close;
      IB_Furnitura.ParamByname('id_parent').Value:=IB_Prihod_furnitura_1.FieldByName('ID_FURNITURA_GRUPA').AsInteger;
      IB_Furnitura.Open;
      IB_Furnitura.Locate('id',IB_Prihod_furnitura_1.FieldByName('ID_FURNITURA').AsInteger,[]);
       with DBL_Furnitura do
      begin
        Left := Rect.Left + DBGrid1.Left + 2;
        Top := Rect.Top + DBGrid1.Top + 2;
        Width := Rect.Right - Rect.Left;
        Width := Rect.Right - Rect.Left;
        Height := Rect.Bottom - Rect.Top;
        DropDownRows:=20;
        Visible := True;
        DBL_Furnitura.SetFocus;
        DBL_Furnitura.DropDown;
      end;}
    end;
  end;

end;

procedure TF_Akt_raspil_edit.DBE_Date_RExit(Sender: TObject);
begin
  IF (DM_Mebeli.IB_Akt_raspil.FieldByName('DATE_R').Value<=DataZapretaRedakt) AND (Role_name<>'CONTSUPERIOR') AND (Role_name<>'ADMIN') Then
    ShowMessage('Дата документа меньше даты запрета редактирования');
end;

end.
