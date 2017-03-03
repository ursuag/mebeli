unit Prodaja_jurnal_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, IBCustomDataSet, DateUtils,
  Menus;

type
  TF_Prodaja_jurnal = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
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
    procedure FormActivate(Sender: TObject);
    procedure N_Period_of_viewClick(Sender: TObject);
    procedure B_EditClick(Sender: TObject);
    procedure B_InsertClick(Sender: TObject);
    procedure B_DeleteClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  F_Prodaja_jurnal.IB_Prodaja_0.Open;
  F_Prodaja_jurnal.IB_Prodaja_1.Open;
  IF id_akt_prodaja=0 Then
    F_Prodaja_jurnal.IB_Prodaja_0.Last
  ELSE
    F_Prodaja_jurnal.IB_Prodaja_0.Locate('nomer_akt',id_akt_prodaja,[]);
end;//proc

procedure TF_Prodaja_jurnal.FormActivate(Sender: TObject);
begin
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
  F_Print_Forms.IBQuery1.SQL.Add('select prgp0.id as nomer, prgp0.DATE_PRO as date_akt, c.name as contragent_name, gpg.name as grupa_name, gp0.name as tovar_name, '+Chr(39)+'шт.'+Chr(39)+' as ed_izm, prgp1.KOL_VO as kol_vo');
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

end.
