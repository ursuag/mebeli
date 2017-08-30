unit spisanie_jurnal_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Menus, DB, IBCustomDataSet, DateUtils;

type
  TF_Spisanie_jurnal = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Insert: TButton;
    B_Edit: TButton;
    B_Delete: TButton;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    MainMenu1: TMainMenu;
    N_Period_of_view: TMenuItem;
    N_Print: TMenuItem;
    IB_Pilomat_detali: TIBDataSet;
    N_Print_akt: TMenuItem;
    N_Print_jurnal: TMenuItem;
    procedure B_InsertClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure B_DeleteClick(Sender: TObject);
    procedure B_EditClick(Sender: TObject);
    procedure N_Print_aktClick(Sender: TObject);
    procedure N_Print_jurnalClick(Sender: TObject);
    procedure N_Period_of_viewClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Spisanie_jurnal: TF_Spisanie_jurnal;
             id_akt: integer;
             period_start: TDate;
implementation

{$R *.dfm}
uses main_f, mebeli_dm, Peremeschenie_edit_f, spisanie_edit_f, print_forms,
  Spisanie_jurnal_print_f;

procedure Reopen_tables;
begin
  With DM_Mebeli Do
    begin
      IB_spisanie_0.Close;
      IB_spisanie_listy.Close;
      IB_spisanie_detali.Close;
      IB_spisanie_furnitura.Close;
      IB_Sklad.Open;
      IB_Furnitura.Open;
      IB_Pilomat_Detali.Open;
      IB_Pilomat_listy.Open;
      DM_Mebeli.IB_Spisanie_0.ParamByName('date_start').Value:=DateToStr(period_start);
      IB_spisanie_0.Open;
      IB_spisanie_listy.Open;
      IB_spisanie_detali.Open;
      IB_spisanie_furnitura.Open;
      IF id_akt=0 Then
        IB_spisanie_0.Last
      Else
        IB_spisanie_0.Locate('ID',id_akt,[]);
    end;//With
end;//proc

procedure TF_Spisanie_jurnal.FormActivate(Sender: TObject);
begin
  id_akt:=0;
  DM_Mebeli.IB_Pilomat_listy.Close;
  DM_Mebeli.IB_Pilomat_detali.Close;
  DM_Mebeli.IB_Pilomat_listy.SelectSQL[1]:='';
  DM_Mebeli.IB_Pilomat_detali.SelectSQL[1]:='';
  period_start:=IncDay(Date,-360);
  Reopen_tables;
end;//proc

procedure TF_Spisanie_jurnal.B_InsertClick(Sender: TObject);
begin
  operation:='INSERT';
  F_Spisanie_edit.ShowModal;
  Reopen_tables;
end;//proc

procedure TF_Spisanie_jurnal.B_EditClick(Sender: TObject);
begin
  operation:='EDIT';
  F_Spisanie_edit.ShowModal;
  Reopen_tables;
end;//proc

procedure TF_Spisanie_jurnal.B_DeleteClick(Sender: TObject);
begin
  IF MessageDlg('Вы уверены, что хотите удалить акт №?'+DM_Mebeli.IB_Spisanie_0.FieldByName('ID').AsString,mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       DM_Mebeli.IB_Spisanie_0.Prior;
       id_akt:=DM_Mebeli.IB_Spisanie_0.FieldByName('ID').AsInteger;
       DM_Mebeli.IB_Spisanie_0.Next;
       DM_Mebeli.IB_Spisanie_0.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//IF
end;//proc

procedure TF_Spisanie_jurnal.N_Print_aktClick(Sender: TObject);
begin
  F_Print_Forms.IBQuery1.SQL.Clear;
  F_Print_Forms.IBQuery1.SQL.Add('select '+Chr(39)+'Листы'+Chr(39)+' as vid_tovara, spis0.id as nomer, spis0.DATE_SPIS as date_akt, (select name from sklad where id=spis0.ID_SKLAD) as sklad_otkuda, pg.name as grupa_name, pl.name as tovar_name, '+Chr(39)+'шт.'+Chr(39)+' as ed_izm, spisl.KOL_VO as kol_vo');
  F_Print_Forms.IBQuery1.SQL.Add('from spisanie_0 as spis0, spisanie_LISTY as spisl, pilomat_grupa as pg, pilomat_listy as pl');
  F_Print_Forms.IBQuery1.SQL.Add('where (spis0.id=:idakt) and (spis0.id=spisl.id_parent) and (spisl.ID_PILOMAT_LISTY=pl.id) and (pl.id_grupa=pg.id)');

  F_Print_Forms.IBQuery1.SQL.Add('union all');

  F_Print_Forms.IBQuery1.SQL.Add('select '+Chr(39)+'Детали'+Chr(39)+' as vid_tovara, spis0.id as nomer, spis0.DATE_SPIS as date_akt, (select name from sklad where id=spis0.ID_SKLAD) as sklad_otkuda, pg.name as grupa_name, pd.name as tovar_name, '+Chr(39)+'шт.'+Chr(39)+' as ed_izm, spisd.KOL_VO as kol_vo');
  F_Print_Forms.IBQuery1.SQL.Add('from spisanie_0 as spis0, spisanie_detali as spisd, pilomat_grupa as pg, pilomat_detali as pd');
  F_Print_Forms.IBQuery1.SQL.Add('where (spis0.id=:idakt) and (spis0.id=spisd.id_parent) and (spisd.ID_PILOMAT_DETALI=pd.id) and (pd.id_grupa=pg.id)');

  F_Print_Forms.IBQuery1.SQL.Add('union all');

  F_Print_Forms.IBQuery1.SQL.Add('select '+Chr(39)+'Комплектующие'+Chr(39)+' as vid_tovara, spis0.id as nomer, spis0.DATE_SPIS as date_akt, (select name from sklad where id=spis0.ID_SKLAD) as sklad_otkuda, fg.name as grupa_name, f.name as tovar_name, f.ed_izm as ed_izm, spisf.KOL_VO as kol_vo');
  F_Print_Forms.IBQuery1.SQL.Add('from spisanie_0 as spis0, spisanie_furnitura as spisf, furnitura_grupa as fg, furnitura as f');
  F_Print_Forms.IBQuery1.SQL.Add('where (spis0.id=:idakt) and (spis0.id=spisf.id_parent) and (spisf.ID_FURNITURA=f.id) and (f.id_parent=fg.id)');

  F_Print_Forms.IBQuery1.SQL.Add('order by 4,5');
  F_Print_Forms.IBQuery1.ParamByName('idakt').Value:=DM_Mebeli.IB_Spisanie_0.FieldByName('ID').AsInteger;
  F_Print_Forms.IBQuery1.Open;
  F_Print_Forms.QRL_Spisanie_primechanie.Caption:=DM_Mebeli.IB_Spisanie_0.FieldByName('PRIMECHANIE').AsString;
  F_PRint_Forms.QR_Akt_Spisania.PreviewModal;
end;//

procedure TF_Spisanie_jurnal.N_Print_jurnalClick(Sender: TObject);
begin
  F_Spisanie_jurnal_print.ShowModal;
end;//

procedure TF_Spisanie_jurnal.N_Period_of_viewClick(Sender: TObject);
begin
  period_start:=StrToDate( InputBox('Начало периода просмотра','Введите дату', DateToStr(IncDay(Date,-60))) );
  id_akt:=DM_Mebeli.IB_Spisanie_0.FieldByName('ID').AsInteger;
  DM_Mebeli.IB_Spisanie_0.Close;
  DM_Mebeli.IB_Spisanie_0.ParamByName('date_start').Value:=DateToStr(period_start);
  DM_Mebeli.IB_Spisanie_0.Open;
end;

procedure TF_Spisanie_jurnal.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Spisanie_jurnal.FormCreate(Sender: TObject);
begin
    F_Main.AdjustResolution(F_Spisanie_jurnal);
end;

end.
