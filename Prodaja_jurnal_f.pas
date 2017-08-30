unit Prodaja_jurnal_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, IBCustomDataSet, DateUtils,
  Menus;

type
  TF_Prodaja_jurnal = class(TForm)
    DBGrid1: TDBGrid;
    DBG_Gotovprod: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Insert: TButton;
    B_Edit: TButton;
    B_Delete: TButton;
    IB_Prodaja_0: TIBDataSet;
    DS_Prodaja_0: TDataSource;
    DS_Prodaja_1: TDataSource;
    IB_Prodaja_1: TIBDataSet;
    MainMenu1: TMainMenu;
    N_Period_of_view: TMenuItem;
    N1: TMenuItem;
    IB_Prodaja_1_sebest: TIBDataSet;
    DS_Prodaja_1_sebest: TDataSource;
    DBG_Sebest: TDBGrid;
    N_Podrobno: TMenuItem;
    N2: TMenuItem;
    N_Sign: TMenuItem;
    N_Unsign: TMenuItem;
    N_Export_prodaja: TMenuItem;
    IB_Prodaja_0ID: TIntegerField;
    IB_Prodaja_0NOMER_AKT: TIntegerField;
    IB_Prodaja_0DATE_AKT: TDateField;
    IB_Prodaja_0PRIMECHANIE: TIBStringField;
    IB_Prodaja_0CONTRAGENT_NAME: TIBStringField;
    IB_Prodaja_0SIGNED: TIBStringField;
    IB_Prodaja_0SUMMA: TIBBCDField;
    IB_Prodaja_1GRUPA_NAME: TIBStringField;
    IB_Prodaja_1ARTICLE: TIntegerField;
    IB_Prodaja_1GOTOVPROD_NAME: TIBStringField;
    IB_Prodaja_1KOL_VO: TIntegerField;
    IB_Prodaja_1ID_ZAKAZ: TIntegerField;
    IB_Prodaja_1ID: TIntegerField;
    IB_Prodaja_1SUMMA: TIBBCDField;
    procedure FormActivate(Sender: TObject);
    procedure N_Period_of_viewClick(Sender: TObject);
    procedure B_EditClick(Sender: TObject);
    procedure B_InsertClick(Sender: TObject);
    procedure B_DeleteClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N_PodrobnoClick(Sender: TObject);
    procedure N_SignClick(Sender: TObject);
    procedure N_UnsignClick(Sender: TObject);
    procedure N_Export_prodajaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   F_Prodaja_jurnal: TF_Prodaja_jurnal;
   period_start: TDate;
 id_akt_prodaja: integer;
implementation

uses main_f, mebeli_dm, Prodaja_edit_f, print_forms;

{$R *.dfm}

procedure reopen_tables;
begin
  F_Prodaja_jurnal.IB_Prodaja_0.Close;
  F_Prodaja_jurnal.IB_Prodaja_1.Close;
  F_Prodaja_jurnal.IB_Prodaja_1_sebest.Close;

  F_Prodaja_jurnal.IB_Prodaja_0.Open;
  F_Prodaja_jurnal.IB_Prodaja_1.Open;
  F_Prodaja_jurnal.IB_Prodaja_1_sebest.Open;
  IF id_akt_prodaja=0 Then
    F_Prodaja_jurnal.IB_Prodaja_0.Last
  ELSE
    F_Prodaja_jurnal.IB_Prodaja_0.Locate('id',id_akt_prodaja,[]);
end;//proc

procedure TF_Prodaja_jurnal.FormActivate(Sender: TObject);
begin
  if role_name='DEPOZITAR' then
    DBG_Gotovprod.Columns[4].Visible:=false;
  IB_Prodaja_0.Close;
  period_start:=IncDay(Date,-60);
  IB_Prodaja_0.ParamByName('date_start').Value:=DateToStr(period_start);
  id_akt_prodaja:=0;
  reopen_tables;
end;//proc

procedure TF_Prodaja_jurnal.N_Period_of_viewClick(Sender: TObject);
begin
  period_start:=StrToDate( InputBox('Начало периода просмотра','Введите дату', DateToStr(IncDay(Date,-60))) );
  id_akt_prodaja:=IB_Prodaja_0.FieldByName('NOMER_AKT').AsInteger;
  IB_Prodaja_0.Close;
  IB_Prodaja_0.ParamByName('date_start').Value:=DateToStr(period_start);
  reopen_tables;
end;//proc

procedure TF_Prodaja_jurnal.B_EditClick(Sender: TObject);
begin
  IF IB_Prodaja_0.FieldByName('nomer_akt').IsNull Then exit;
  id_akt_prodaja:=IB_Prodaja_0.FieldByName('NOMER_AKT').AsInteger;
  operation:='EDIT';
  F_Prodaja_edit.ShowModal;
  reopen_tables;
end;//proc

procedure TF_Prodaja_jurnal.B_InsertClick(Sender: TObject);
begin
  operation:='INSERT';
  F_Prodaja_edit.ShowModal;
  reopen_tables;
end;//proc

procedure TF_Prodaja_jurnal.B_DeleteClick(Sender: TObject);
begin
  IF MessageDlg('Вы уверены, что хотите удалить?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       IB_Prodaja_0.Prior;
       id_akt_prodaja:=IB_Prodaja_0.FieldByName('NOMER_AKT').AsInteger;
       IB_Prodaja_0.Next;
       IB_Prodaja_0.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//IF
end;

procedure TF_Prodaja_jurnal.N1Click(Sender: TObject);
begin
  F_Print_Forms.IBQuery1.SQL.Clear;
  F_Print_Forms.IBQuery1.SQL.Add('select prgp0.id as nomer, prgp0.DATE_PRO as date_akt, c.name as contragent_name, gpg.name as grupa_name, gp0.article||'+Chr(39)+'_'+Chr(39)+'||gp0.name as tovar_name, '+Chr(39)+'шт.'+Chr(39)+' as ed_izm, prgp1.KOL_VO as kol_vo');
  F_Print_Forms.IBQuery1.SQL.Add('from PRODAJA_GOTOVPROD_0 as prgp0, PRODAJA_GOTOVPROD_1 as prgp1, gotov_prod_grupa as gpg, gotov_prod_0 as gp0, contragenty_1 as c');
  F_Print_Forms.IBQuery1.SQL.Add('where (prgp0.id=:idakt) and (prgp0.id=prgp1.id_parent) and (prgp1.ID_GOTOV_PROD=gp0.id) and (gp0.id_grupa=gpg.id) and (c.id=prgp0.id_contragent)');
  F_Print_Forms.IBQuery1.SQL.Add('order by 3,4');
  F_Print_Forms.IBQuery1.ParamByName('idakt').Value:=IB_prodaja_0.FieldByName('NOMER_AKT').AsInteger;
  F_Print_Forms.IBQuery1.Open;
  F_Print_Forms.QRL_Prodaja_primechanie.Caption:=IB_prodaja_0.FieldByName('PRIMECHANIE').AsString;
  F_PRint_Forms.QR_Prodaja_nakladnaya.PreviewModal;
end;//proc

procedure TF_Prodaja_jurnal.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Prodaja_jurnal.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Prodaja_jurnal);
end;

procedure TF_Prodaja_jurnal.N_PodrobnoClick(Sender: TObject);
begin
  if role_name='DEPOZITAR' then exit;
  if DBG_Sebest.Visible=false then
    begin
      DBG_Sebest.Visible:=true;
      DBG_Gotovprod.Height:=189;
    end
  else
    begin
      DBG_Sebest.Visible:=false;
      DBG_Gotovprod.Height:=333;
    end
end;

procedure TF_Prodaja_jurnal.N_SignClick(Sender: TObject);
var ib_sign: TIBDataSet;
begin
  id_akt_prodaja:=IB_Prodaja_0.FieldByName('id').AsInteger;
  ib_sign:=TIBDataSet.Create(nil);
  ib_sign.Database:=DM_Mebeli.DB_Mebeli;
  ib_sign.SelectSQL.Add('insert into tables_signatures (table_id, user_id, table_name_id)');
  ib_sign.SelectSQL.Add('values(:table_id, (select id from users_db where sys_username=current_user), (select id from tables_db where table_name=:table_name))');
  ib_sign.ParamByName('table_id').value:=IB_Prodaja_0.FieldByName('id').AsInteger;
  ib_sign.ParamByName('table_name').value:='PRODAJA_GOTOVPROD_0';
  ib_sign.ExecSQL;

  ib_sign.SelectSQL.Clear;
  ib_sign.SelectSQL.Add('update prodaja_gotovprod_1 set kol_vo=kol_vo*1 where id_parent='+IB_Prodaja_0.FieldByName('id').AsString);
  ib_sign.ExecSQL;
  ib_sign.Free;
  DM_Mebeli.IBTransaction1.Commit;
  reopen_tables;
end;

procedure TF_Prodaja_jurnal.N_UnsignClick(Sender: TObject);
var ib_sign: TIBDataSet;
begin
  id_akt_prodaja:=IB_Prodaja_0.FieldByName('id').AsInteger;
  ib_sign:=TIBDataSet.Create(nil);
  ib_sign.Database:=DM_Mebeli.DB_Mebeli;
  ib_sign.SelectSQL.Add('delete from tables_signatures where (table_id= :table_id) and ');
  ib_sign.SelectSQL.Add('(table_name_id=(select id from tables_db where table_name=:table_name))');
  ib_sign.ParamByName('table_id').value:=IB_Prodaja_0.FieldByName('id').AsInteger;
  ib_sign.ParamByName('table_name').value:='PRODAJA_GOTOVPROD_0';
  ib_sign.ExecSQL;

  ib_sign.SelectSQL.Clear;
  ib_sign.SelectSQL.Add('delete from prodaja_gotovprod_1_sebest where id in (');
  ib_sign.SelectSQL.Add('select pr1s.id');
  ib_sign.SelectSQL.Add('from prodaja_gotovprod_1_sebest pr1s, prodaja_gotovprod_1 pr1, prodaja_gotovprod_0 pr0');
  ib_sign.SelectSQL.Add('where (pr1s.id_parent=pr1.id) and (pr1.id_parent=pr0.id) and (pr0.id=:id_doc))');
  ib_sign.ParamByName('id_doc').value:=IB_Prodaja_0.FieldByName('id').AsInteger;
  ib_sign.ExecSQL;

  ib_sign.Close;
  ib_sign.Free;
  DM_Mebeli.IBTransaction1.Commit;
  reopen_tables;
end;

procedure TF_Prodaja_jurnal.N_Export_prodajaClick(Sender: TObject);
var
  sql_temp: TIBDataSet;
  f: textfile;
  s: string;
 filename: string;
 SaveDialog1: TSaveDialog;
begin
  sql_temp:=TIBDataSet.Create(nil);
  sql_temp.Database:=DM_Mebeli.IB_Sklad.Database;
  sql_temp.SelectSQL.Add('select is_signed from CHECK_IS_SIGNED(:tablename,:id_doc)');
  sql_temp.ParamByName('tablename').Value:='PRODAJA_GOTOVPROD_0';
  sql_temp.ParamByName('id_doc').Value:=IB_Prodaja_0.FieldByName('NOMER_AKT').AsInteger;
  sql_temp.Open;
  if sql_temp.FieldByName('is_signed').AsInteger=0 then
    begin
      sql_temp.Free;
      ShowMessage('Документ не подписан');
      exit;
    end;
  SaveDialog1:=TSaveDialog.Create(nil);
  SaveDialog1.Filter:='Text files  |*.txt';
  SaveDialog1.DefaultExt:='txt';
  SaveDialog1.Options := [ofOverwritePrompt];
  SaveDialog1.FileName:='export_'+FormatDateTime('yyyymmdd', IB_Prodaja_0.FieldByName('DATE_AKT').AsDateTime)+'_'+IB_Prodaja_0.FieldByName('NOMER_AKT').AsString;
  if not SaveDialog1.Execute then
    begin
      SaveDialog1.Free;
      sql_temp.Free;
      exit;
    end;

  filename:=SaveDialog1.FileName;
  SaveDialog1.Free;

  AssignFile(f, filename);
  Rewrite(f);
  s:=IB_Prodaja_0.FieldByName('NOMER_AKT').AsString+','+IB_Prodaja_0.FieldByName('CONTRAGENT_NAME').AsString+','+codfiscal_mebeli+',,,'+FormatDateTime('yyyymmdd', IB_Prodaja_0.FieldByName('DATE_AKT').AsDateTime);
  WriteLn(f,s);
  sql_temp.Close;
  sql_temp.SelectSQL.Clear;
  sql_temp.SelectSQL.Add('select (select article from gotov_prod_0 where id=id_gotov_prod) article, sum(kol_vo) kol_vo, price*sum(kol_vo) summa');
  sql_temp.SelectSQL.Add('from prodaja_gotovprod_1');
  sql_temp.SelectSQL.Add('where id_parent=:id_prodaja');
  sql_temp.SelectSQL.Add('group by id_gotov_prod, price');
  sql_temp.SelectSQL.Add('order by article');
  sql_temp.ParamByName('id_prodaja').Value:=IB_Prodaja_0.FieldByName('NOMER_AKT').AsInteger;
  sql_temp.Open;
  while not sql_temp.Eof do
    begin
      s:=sql_temp.FieldByname('article').AsString+','+sql_temp.FieldByname('kol_vo').AsString+','+sql_temp.FieldByname('summa').AsString+',buc,NULL,NULL';
      WriteLn(f,s);
      sql_temp.Next;
    end;

  CloseFile(f);
  sql_temp.Free;
  ShowMessage('Данные выгружены');
end;

end.
