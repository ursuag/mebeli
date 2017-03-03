unit Peremeschenie_jurnal_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, IBCustomDataSet, DB, Menus, DateUtils, IBQuery;

type
  TF_Peremeschenie_jurnal = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Insert: TButton;
    B_Edit: TButton;
    B_Delete: TButton;
    IB_Peremeschenie_1: TIBDataSet;
    DS_Peremeschenie_1: TDataSource;
    MainMenu1: TMainMenu;
    N_Period_of_view: TMenuItem;
    N_Print: TMenuItem;
    DBGrid2: TDBGrid;
    IB_Peremeschenie_0: TIBDataSet;
    DS_Peremeschenie_0: TDataSource;
    N_Print_akt: TMenuItem;
    N_Print_jurnal: TMenuItem;
    IB_Podrobno: TIBDataSet;
    DS_Podrobno: TDataSource;
    P_Podrobno: TPanel;
    B_Podrobno_Close: TButton;
    DBG_Podrodno: TDBGrid;
    N_Podrobno: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure B_InsertClick(Sender: TObject);
    procedure B_EditClick(Sender: TObject);
    procedure B_DeleteClick(Sender: TObject);
    procedure N_PrintClick(Sender: TObject);
    procedure N_Period_of_viewClick(Sender: TObject);
    procedure N_Print_aktClick(Sender: TObject);
    procedure N_Print_jurnalClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure B_Podrobno_CloseClick(Sender: TObject);
    procedure N_PodrobnoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Peremeschenie_jurnal: TF_Peremeschenie_jurnal;
  id_akt: integer;
period_start: TDate;

implementation

uses main_f, mebeli_dm, Peremeschenie_edit_f, print_forms,
  Peremeschenie_jurnal_print_f;

{$R *.dfm}

procedure Reopen_tables;
begin
  With DM_Mebeli Do
    begin
      F_Peremeschenie_jurnal.IB_peremeschenie_0.Close;
      F_Peremeschenie_jurnal.IB_peremeschenie_1.Close;
      F_Peremeschenie_jurnal.IB_peremeschenie_0.Open;
      F_Peremeschenie_jurnal.IB_peremeschenie_1.Open;
      IF id_akt=0 Then
        F_Peremeschenie_jurnal.IB_peremeschenie_0.Last
      Else
        F_Peremeschenie_jurnal.IB_peremeschenie_0.Locate('ID',id_akt,[]);
    end;//With
end;//proc

procedure TF_Peremeschenie_jurnal.FormActivate(Sender: TObject);
begin
  id_akt:=0;
  period_start:=IncDay(Date,-360);
  IB_Peremeschenie_0.ParamByName('date_start').Value:=DateToStr(period_start);
  Reopen_tables;
end;//proc

procedure TF_Peremeschenie_jurnal.B_InsertClick(Sender: TObject);
begin
  operation:='INSERT';
  id_akt:=F_Peremeschenie_jurnal.IB_Peremeschenie_0.FieldByname('id').asInteger;
  With DM_Mebeli Do
    begin
      IB_Sklad.Open;
      IB_Furnitura.Open;
      IB_Pilomat_Detali.Open;
      IB_Pilomat_listy.Open;
      IB_peremeschenie_0.Open;
      IB_peremeschenie_listy.Open;
      IB_peremeschenie_detali.Open;
      IB_peremeschenie_furnitura.Open;
    end;//With

  F_Peremeschenie_edit.ShowModal;
  Reopen_tables;
end;//proc

procedure TF_Peremeschenie_jurnal.B_EditClick(Sender: TObject);
begin
  operation:='EDIT';
  id_akt:=F_Peremeschenie_jurnal.IB_Peremeschenie_0.FieldByname('id').asInteger;
  With DM_Mebeli Do
    begin
      IB_Sklad.Open;
      IB_Furnitura.Open;
      IB_Pilomat_Detali.Open;
      IB_Pilomat_listy.Open;
      IB_peremeschenie_0.Open;
      IB_peremeschenie_listy.Open;
      IB_peremeschenie_detali.Open;
      IB_peremeschenie_furnitura.Open;
    end;//With

  DM_Mebeli.IB_peremeschenie_0.Locate('ID',id_akt,[]);
  F_Peremeschenie_edit.ShowModal;
  Reopen_tables;
end;//proc

procedure TF_Peremeschenie_jurnal.B_DeleteClick(Sender: TObject);
var sql_delete: TIBQuery;
begin
  IF MessageDlg('Вы уверены, что хотите удалить акт №?'+IB_Peremeschenie_0.FieldByName('ID').AsString,mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       sql_delete:=TIBQuery.Create(nil);
       sql_delete.Database:=F_Main.IBQuery1.Database;
       sql_delete.SQL.Add('delete from peremeschenie_0 where id='+IB_Peremeschenie_0.FieldByName('ID').AsString);
       IB_Peremeschenie_0.Prior;
       id_akt:=IB_Peremeschenie_0.FieldByName('ID').AsInteger;
       sql_delete.ExecSQL;
       sql_delete.Free;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//IF
end;//proc

procedure TF_Peremeschenie_jurnal.N_PrintClick(Sender: TObject);
begin
end;//proc

procedure TF_Peremeschenie_jurnal.N_Period_of_viewClick(Sender: TObject);
begin
  period_start:=StrToDate( InputBox('Начало периода просмотра','Введите дату', DateToStr(IncDay(Date,-60))) );
  id_akt:=IB_Peremeschenie_0.FieldByName('ID').AsInteger;
  IB_Peremeschenie_0.Close;
  IB_Peremeschenie_0.ParamByName('date_start').Value:=DateToStr(period_start);
  IB_Peremeschenie_0.Open;
end;

procedure TF_Peremeschenie_jurnal.N_Print_aktClick(Sender: TObject);
begin
  F_Print_Forms.IBQuery1.SQL.Clear;
  F_Print_Forms.IBQuery1.SQL.Add('select perem0.id as nomer, perem0.DATE_PER as date_akt, (select name from sklad where id=perem0.ID_SKLAD_OTKUDA) as sklad_otkuda, (select name from sklad where id=perem0.ID_SKLAD_KUDA) as sklad_kuda, pg.name as grupa_name, pl.name as tovar_name,'+Chr(39)+'шт.' +Chr(39)+' as ed_izm, pereml.KOL_VO as kol_vo');
  F_Print_Forms.IBQuery1.SQL.Add('from PEREMESCHENIE_0 as perem0, PEREMESCHENIE_LISTY as pereml, pilomat_grupa as pg, pilomat_listy as pl');
  F_Print_Forms.IBQuery1.SQL.Add('where (perem0.id=:idakt) and (perem0.id=pereml.id_parent) and (pereml.ID_PILOMAT_LISTY=pl.id) and (pl.id_grupa=pg.id)');

  F_Print_Forms.IBQuery1.SQL.Add('union all');

  F_Print_Forms.IBQuery1.SQL.Add('select perem0.id as nomer, perem0.DATE_PER as date_akt, (select name from sklad where id=perem0.ID_SKLAD_OTKUDA) as sklad_otkuda, (select name from sklad where id=perem0.ID_SKLAD_KUDA) as sklad_kuda, pg.name as grupa_name, pd.name as tovar_name, '+Chr(39)+'шт.' +Chr(39)+' as ed_izm, peremd.KOL_VO as kol_vo');
  F_Print_Forms.IBQuery1.SQL.Add('from PEREMESCHENIE_0 as perem0, PEREMESCHENIE_DETALI as peremd, pilomat_grupa as pg, pilomat_detali as pd');
  F_Print_Forms.IBQuery1.SQL.Add('where (perem0.id=:idakt) and (perem0.id=peremd.id_parent) and (peremd.ID_PILOMAT_DETALI=pd.id) and (pd.id_grupa=pg.id)');

  F_Print_Forms.IBQuery1.SQL.Add('union all');

  F_Print_Forms.IBQuery1.SQL.Add('select perem0.id as nomer, perem0.DATE_PER as date_akt, (select name from sklad where id=perem0.ID_SKLAD_OTKUDA) as sklad_otkuda, (select name from sklad where id=perem0.ID_SKLAD_KUDA) as sklad_kuda, fg.name as grupa_name, ');
  F_Print_Forms.IBQuery1.SQL.Add('f.name as tovar_name, f.ed_izm as ed_izm, peremf.KOL_VO as kol_vo');
  F_Print_Forms.IBQuery1.SQL.Add('from PEREMESCHENIE_0 as perem0, PEREMESCHENIE_furnitura as peremf, furnitura_grupa as fg, furnitura as f');
  F_Print_Forms.IBQuery1.SQL.Add('where (perem0.id=:idakt) and (perem0.id=peremf.id_parent) and (peremf.ID_FURNITURA  =f.id) and (f.id_parent=fg.id)');
  F_Print_Forms.IBQuery1.SQL.Add('order by 5,6');
  F_Print_Forms.IBQuery1.ParamByName('idakt').value:=IB_Peremeschenie_0.FieldByName('id').AsInteger;
  F_Print_Forms.IBQuery1.Open;
  F_PRint_Forms.QRL_Peremeschenie_primechanie.Caption:=IB_Peremeschenie_0.FieldByName('PRIMECHANIE').AsString;
  F_PRint_Forms.QR_Peremeschenie.PreviewModal;
end;//

procedure TF_Peremeschenie_jurnal.N_Print_jurnalClick(Sender: TObject);
begin
  F_Peremeschenie_jurnal_print.ShowModal;
end;//

procedure TF_Peremeschenie_jurnal.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Peremeschenie_jurnal.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Peremeschenie_jurnal);
end;

procedure TF_Peremeschenie_jurnal.B_Podrobno_CloseClick(Sender: TObject);
begin
  P_Podrobno.Visible:=false;
  IB_Podrobno.Close;
end;

procedure TF_Peremeschenie_jurnal.N_PodrobnoClick(Sender: TObject);
begin
  if P_Podrobno.Visible then
    begin
      IB_Podrobno.Close;
      P_Podrobno.Visible:=false;
    end
  else
    begin
      IB_Podrobno.Open;
      P_Podrobno.Visible:=true;
    end;
end;

procedure TF_Peremeschenie_jurnal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IB_peremeschenie_0.Close;
  IB_peremeschenie_1.Close;
  IB_Podrobno.Close;
end;

end.
