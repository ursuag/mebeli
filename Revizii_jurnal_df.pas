unit Revizii_jurnal_df;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, IBCustomDataSet, StdCtrls, ExtCtrls, Grids, DBGrids, DateUtils;

type
  TF_Revizii_jurnal = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    IB_Revizia_0: TIBDataSet;
    DS_Revizia_0: TDataSource;
    DS_Revizia_materialy: TDataSource;
    IB_Revizia_materialy: TIBDataSet;
    MainMenu1: TMainMenu;
    N_Period_of_view: TMenuItem;
    N1: TMenuItem;
    N_Insert_main: TMenuItem;
    N_Edit_main: TMenuItem;
    N4: TMenuItem;
    N_Sign_main: TMenuItem;
    N6: TMenuItem;
    N_Delete_main: TMenuItem;
    N_Unsign_main: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N_Period_of_viewClick(Sender: TObject);
    procedure N_Insert_mainClick(Sender: TObject);
    procedure N_Edit_mainClick(Sender: TObject);
    procedure N_Sign_mainClick(Sender: TObject);
    procedure N_Unsign_mainClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_akt_revizii: integer;
  end;

var
  F_Revizii_jurnal: TF_Revizii_jurnal;
      period_start: TDate;
implementation

uses main_f, mebeli_dm, Revizia_edit_f;

{$R *.dfm}

procedure reopen_tables;
begin
  F_Revizii_jurnal.IB_Revizia_0.Open;
  F_Revizii_jurnal.IB_Revizia_materialy.Open;
  IF F_Revizii_jurnal.id_akt_revizii=0 Then
    F_Revizii_jurnal.IB_Revizia_0.Last
  ELSE
    F_Revizii_jurnal.IB_Revizia_0.Locate('id',F_Revizii_jurnal.id_akt_revizii,[]);
end;//proc


procedure TF_Revizii_jurnal.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Revizii_jurnal);
end;

procedure TF_Revizii_jurnal.FormActivate(Sender: TObject);
begin
  IB_Revizia_0.Close;
  period_start:=IncDay(Date,-60);
  IB_Revizia_0.ParamByName('date_start').Value:=DateToStr(period_start);
  id_akt_revizii:=0;
  reopen_tables;
end;

procedure TF_Revizii_jurnal.N_Period_of_viewClick(Sender: TObject);
begin
  period_start:=StrToDate( InputBox('Начало периода просмотра','Введите дату', DateToStr(IncDay(Date,-60))) );
  id_akt_revizii:=IB_Revizia_0.FieldByName('ID').AsInteger;
  IB_Revizia_0.Close;
  IB_Revizia_0.ParamByName('date_start').Value:=DateToStr(period_start);
  reopen_tables;
end;

procedure TF_Revizii_jurnal.N_Insert_mainClick(Sender: TObject);
begin
  id_akt_revizii:=IB_Revizia_0.fieldByname('id').AsInteger;
  operation:='INSERT';
  F_Revizia_edit.ShowModal;
  reopen_tables;
end;

procedure TF_Revizii_jurnal.N_Edit_mainClick(Sender: TObject);
var ib_temp: TIBDataSet;
begin
  id_akt_revizii:=IB_Revizia_0.fieldByname('id').AsInteger;

  ib_temp:=TIBDataSet.Create(nil);
  ib_temp.Database:=DM_Mebeli.DB_Mebeli;
  ib_temp.SelectSQL.Add('select * from CHECK_IS_SIGNED(:in_table_name, :table_id)');
  ib_temp.ParamByName('in_table_name').Value:='REVIZIA_0';
  ib_temp.ParamByName('table_id').value:=id_akt_revizii;
  ib_temp.Open;
  if ib_temp.FieldByname('is_signed').AsInteger+ib_temp.FieldByname('is_partially_signed').AsInteger=1 then
    begin
      ShowMessage('Ревизия подписана. Перед изменением удалите подписи!');
      ib_temp.Free;
      exit;
    end;
  ib_temp.Free;

  operation:='EDIT';
  F_Revizia_edit.ShowModal;
  reopen_tables;
end;

procedure TF_Revizii_jurnal.N_Sign_mainClick(Sender: TObject);
var ib_sign: TIBDataSet;
begin
  if IB_Revizia_0.FieldByName('id').IsNull then exit;
  id_akt_revizii:=IB_Revizia_0.FieldByName('id').AsInteger;
  ib_sign:=TIBDataSet.Create(nil);
  ib_sign.Database:=DM_Mebeli.DB_Mebeli;
  ib_sign.SelectSQL.Add('insert into tables_signatures (table_id, user_id, table_name_id)');
  ib_sign.SelectSQL.Add('values(:table_id, (select id from users_db where sys_username=current_user), (select id from tables_db where table_name=:table_name))');
  ib_sign.ParamByName('table_id').value:=id_akt_revizii;
  ib_sign.ParamByName('table_name').value:='REVIZIA_0';
  ib_sign.ExecSQL;
  ib_sign.Close;
  ib_sign.Free;
  DM_Mebeli.IBTransaction1.Commit;
  reopen_tables;
end;

procedure TF_Revizii_jurnal.N_Unsign_mainClick(Sender: TObject);
var ib_sign: TIBDataSet;
begin
  if IB_Revizia_0.FieldByName('id').IsNull then exit;
  id_akt_revizii:=IB_Revizia_0.FieldByName('id').AsInteger;
  ib_sign:=TIBDataSet.Create(nil);
  ib_sign.Database:=DM_Mebeli.DB_Mebeli;
  ib_sign.SelectSQL.Add('delete from tables_signatures where (table_id= :table_id) and ');
  ib_sign.SelectSQL.Add('(table_name_id=(select id from tables_db where table_name=:table_name))');
  ib_sign.ParamByName('table_id').value:=id_akt_revizii;
  ib_sign.ParamByName('table_name').value:='REVIZIA_0';
  ib_sign.ExecSQL;
  ib_sign.Close;
  ib_sign.Free;
  DM_Mebeli.IBTransaction1.Commit;
  reopen_tables;
end;

end.
