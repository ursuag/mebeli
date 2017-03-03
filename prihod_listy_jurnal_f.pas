unit prihod_listy_jurnal_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Menus, DateUtils, DB,
  IBCustomDataSet;

type
  TF_Prihod_listy_jurnal = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Insert: TButton;
    B_Edit: TButton;
    B_Delete: TButton;
    MainMenu1: TMainMenu;
    N_Period_of_view: TMenuItem;
    F_DS_Prihod_listy_0: TDataSource;
    F_IB_Prihod_listy_0: TIBDataSet;
    F_DS_Prihod_listy_1: TDataSource;
    F_IB_Prihod_listy_1: TIBDataSet;
    F_IB_Prihod_listy_0ID: TIntegerField;
    F_IB_Prihod_listy_0DATE_P: TDateField;
    F_IB_Prihod_listy_0PRIMECHANIE: TIBStringField;
    F_IB_Prihod_listy_0SKLAD_NAME: TIBStringField;
    F_IB_Prihod_listy_0ID_AKT_RASPIL: TIntegerField;
    F_IB_Prihod_listy_0CONTRAGENT_NAME: TIBStringField;
    F_IB_Prihod_listy_0NOMER_TTN: TIBStringField;
    F_IB_Prihod_listy_0SUMMA: TIBBCDField;
    F_IB_Prihod_listy_1ID: TIntegerField;
    F_IB_Prihod_listy_1ID_LISTY: TIntegerField;
    F_IB_Prihod_listy_1LISTY_NAME: TIBStringField;
    F_IB_Prihod_listy_1GRUPA_NAME: TIBStringField;
    F_IB_Prihod_listy_1KOL_VO: TIntegerField;
    F_IB_Prihod_listy_1SUMMA: TIBBCDField;
    procedure FormActivate(Sender: TObject);
    procedure B_InsertClick(Sender: TObject);
    procedure B_EditClick(Sender: TObject);
    procedure B_DeleteClick(Sender: TObject);
    procedure N_Period_of_viewClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Prihod_listy_jurnal: TF_Prihod_listy_jurnal;
  id_akt: integer;
implementation

uses main_f, mebeli_dm, prihod_listy_edit_f;

{$R *.dfm}
procedure Reopen_tables;
begin
  DM_Mebeli.IB_Prihod_listy_0.Close;
  DM_Mebeli.IB_Prihod_listy_1.Close;
  With F_Prihod_listy_jurnal Do
    begin
      F_IB_prihod_listy_0.ParamByName('date_start').Value:=DateToStr(select_date_start);
      F_IB_prihod_listy_0.Open;
      F_IB_prihod_listy_1.Open;
      IF F_IB_prihod_listy_0.Locate('ID',id_akt,[])=False Then
        F_IB_prihod_listy_0.last;
    end;//With
end;//proc

procedure TF_Prihod_listy_jurnal.FormActivate(Sender: TObject);
begin
  id_akt:=0;
  F_IB_prihod_listy_0.Close;
  F_IB_prihod_listy_0.ParamByName('date_start').Value:=DateToStr(select_date_start);
  Reopen_tables;
end;//proc

procedure TF_Prihod_listy_jurnal.B_InsertClick(Sender: TObject);
begin
  id_akt:=F_IB_Prihod_listy_0.fieldByName('id').AsInteger;
  operation:='INSERT';
  DM_Mebeli.IB_Prihod_listy_0.Close;
  if not F_IB_Prihod_listy_0.fieldByName('id').IsNull then
    DM_Mebeli.IB_Prihod_listy_0.SelectSQL[1]:='where id='+F_IB_Prihod_listy_0.fieldByName('id').AsString;
  DM_Mebeli.IB_Prihod_listy_0.Open;
  DM_Mebeli.IB_Prihod_listy_1.Open;
  F_Prihod_listy_edit.ShowModal;
//  DM_Mebeli.IB_Prihod_listy_0.SelectSQL[1]:='';
  Reopen_tables;
end;//proc

procedure TF_Prihod_listy_jurnal.B_EditClick(Sender: TObject);
begin
  IF not F_IB_Prihod_listy_0.FieldByName('id_akt_raspil').IsNull Then
    begin
      ShowMessage('Приход сформирован Актом распила, вручную изменять нельзя!');
      exit;
    end;
  id_akt:=F_IB_Prihod_listy_0.fieldByName('id').AsInteger;
  operation:='EDIT';
  DM_Mebeli.IB_Prihod_listy_0.ParamByName('id').Value:=id_akt;
  DM_Mebeli.IB_Prihod_listy_0.Open;
  DM_Mebeli.IB_Prihod_listy_1.Open;
  F_Prihod_listy_edit.ShowModal;
  Reopen_tables;
end;

procedure TF_Prihod_listy_jurnal.B_DeleteClick(Sender: TObject);
begin
  IF MessageDlg('Вы уверены, что хотите удалить?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       F_IB_Prihod_listy_0.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//IF
end;//proc

procedure TF_Prihod_listy_jurnal.N_Period_of_viewClick(Sender: TObject);
begin
  select_date_start:=StrToDate( InputBox('Начало периода просмотра','Введите дату', DateToStr(IncDay(Date,-60))) );
  id_akt:=F_IB_Prihod_listy_0.FieldByName('ID').AsInteger;
  F_IB_Prihod_listy_0.Close;
  F_IB_Prihod_listy_0.ParamByName('date_start').Value:=DateToStr(select_date_start);
  reopen_tables;
end;

procedure TF_Prihod_listy_jurnal.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Prihod_listy_jurnal.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Prihod_listy_jurnal);
end;

end.
