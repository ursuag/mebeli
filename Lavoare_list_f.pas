unit Lavoare_list_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, IBCustomDataSet, Menus, IBQuery, QDialogs;

type
  TF_Lavoare_list = class(TForm)
    Panel1: TPanel;
    B_Exit: TButton;
    B_Select: TButton;
    DBGrid_Grupa: TDBGrid;
    DBGrid_Gotprod: TDBGrid;
    DS_Lavoare_Grupa: TDataSource;
    IB_Lavoare_Grupa: TIBDataSet;
    DS_Lavoare_1: TDataSource;
    IB_Lavoare_1: TIBDataSet;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N_InsertGrupa_main: TMenuItem;
    N_EditGrupa_main: TMenuItem;
    N5: TMenuItem;
    N_DeleteGrupa_main: TMenuItem;
    N_InsertLavoar_main: TMenuItem;
    N_EditLavoar_main: TMenuItem;
    N9: TMenuItem;
    N_Deletelavoar_main: TMenuItem;
    N_Import: TMenuItem;
    N_Import_lavoare: TMenuItem;
    N_Import_lavoare_gotovprod: TMenuItem;
    DS_Lavoare_gotovprod: TDataSource;
    IB_Lavoare_gotovprod: TIBDataSet;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_ExitClick(Sender: TObject);
    procedure N_InsertGrupa_mainClick(Sender: TObject);
    procedure N_InsertLavoar_mainClick(Sender: TObject);
    procedure N_EditLavoar_mainClick(Sender: TObject);
    procedure N_Deletelavoar_mainClick(Sender: TObject);
    procedure N_DeleteGrupa_mainClick(Sender: TObject);
    procedure N_Import_lavoareClick(Sender: TObject);
    procedure N_Import_lavoare_gotovprodClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_lavoar: integer;
    id_lavoar_grupa: integer;
  end;

var
  F_Lavoare_list: TF_Lavoare_list;

implementation

uses main_f, mebeli_dm, Lavoare_edit_f;

{$R *.dfm}

procedure reopen_tables;
begin
  F_Lavoare_list.IB_Lavoare_Grupa.Close;
  F_Lavoare_list.IB_Lavoare_1.Close;
  F_Lavoare_list.IB_Lavoare_gotovprod.Close;
  F_Lavoare_list.IB_Lavoare_Grupa.Open;
  F_Lavoare_list.IB_Lavoare_Grupa.Locate('id',F_Lavoare_list.id_lavoar_grupa,[]);
  F_Lavoare_list.IB_Lavoare_1.Open;
  F_Lavoare_list.IB_Lavoare_1.Locate('id',F_Lavoare_list.id_lavoar,[]);
  F_Lavoare_list.IB_Lavoare_gotovprod.Open;
end;


procedure TF_Lavoare_list.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Lavoare_list);
end;

procedure TF_Lavoare_list.FormActivate(Sender: TObject);
begin
  reopen_tables;
  if operation='SELECT' then
    B_Select.Visible:=true
  else
    B_Select.Visible:=false;
end;

procedure TF_Lavoare_list.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Commit;
  F_Lavoare_list.IB_Lavoare_Grupa.Close;
  F_Lavoare_list.IB_Lavoare_1.Close;
end;

procedure TF_Lavoare_list.B_ExitClick(Sender: TObject);
begin
  F_Lavoare_list.Close;
end;

procedure TF_Lavoare_list.N_InsertGrupa_mainClick(Sender: TObject);
var group_name: widestring;
    sql_insert: TIBQuery;
begin
  group_name:='';
  IF InputQuery('ГРУППА','Наименование группы',group_name) Then
    begin
      SQL_insert:=TIBQuery.Create(nil);
      SQL_insert.Database:=F_Main.IBQuery1.Database;
      SQL_insert.SQL.Add('insert into lavoare_grupa (name) values( :name)');
      SQL_insert.ParamByname('name').Value:=group_name;
      SQL_insert.ExecSQL;
      id_lavoar_grupa:=IB_Lavoare_grupa.FieldByName('ID').AsInteger;
      id_lavoar:=IB_Lavoare_1.FieldByName('ID').AsInteger;
      SQL_Insert.Free;
      DM_Mebeli.IBTransaction1.Commit;
      Reopen_tables;
    end;//IF
end;//proc

procedure TF_Lavoare_list.N_InsertLavoar_mainClick(Sender: TObject);
begin
  id_lavoar_grupa:=IB_Lavoare_grupa.FieldByName('ID').AsInteger;
  id_lavoar:=IB_Lavoare_1.FieldByName('ID').AsInteger;
  operation:='INSERT';
  F_Lavoare_edit.ShowModal;
  reopen_tables;
end;

procedure TF_Lavoare_list.N_EditLavoar_mainClick(Sender: TObject);
begin
  id_lavoar_grupa:=IB_Lavoare_grupa.FieldByName('ID').AsInteger;
  id_lavoar:=IB_Lavoare_1.FieldByName('ID').AsInteger;
  operation:='EDIT';
  F_Lavoare_edit.ShowModal;
  reopen_tables;
end;

procedure TF_Lavoare_list.N_Deletelavoar_mainClick(Sender: TObject);
begin
  IF MessageDlg('Вы уверены, что хотите удалить?',mtWarning,[mbOk,mbNo],0)=mrOk Then
    IB_Lavoare_1.Delete
end;

procedure TF_Lavoare_list.N_DeleteGrupa_mainClick(Sender: TObject);
begin
  IF MessageDlg('Вы уверены, что хотите удалить?',mtWarning,[mbOk,mbNo],0)=mrOk Then
    IB_Lavoare_Grupa.Delete;
end;

procedure TF_Lavoare_list.N_Import_lavoareClick(Sender: TObject);
var ib_tmp:TIBDataSet;
         f: System.Text;
         s: String;
         ts: TStringList;
 filename: string;
begin
  ts:=TStringList.Create;
  ts.Delimiter:=';';
  ib_tmp:=TIBDataSet.Create(nil);
  ib_tmp.Database:=DM_Mebeli.DB_Mebeli;
  ib_tmp.SelectSQL.Add('insert into lavoare_1 (name, id_parent, article, MANUFACTURER_CODE)');
  ib_tmp.SelectSQL.Add('values (:lavoar_name,(select id from lavoare_grupa where article= :article_grupa), :article_lavoar, :MANUFACTURER_CODE)');

  filename:='e:\lavoar.csv';
  AssignFile(f, filename);
  Reset(f);
  Readln(f,s);
  while not eof(f) do
  begin
    Readln(f,s);
    ts.DelimitedText:=s;
    ib_tmp.ParamByName('article_grupa').Value:=ts[0];
    ib_tmp.ParamByName('lavoar_name').Value:=ts[1];
    ib_tmp.ParamByName('article_lavoar').Value:=ts[2];
    ib_tmp.ParamByName('MANUFACTURER_CODE').Value:=ts[3];
    ib_tmp.ExecSQL;
  end;
  closefile (f);
  ts.Free;
  ib_tmp.Close;
  ib_tmp.Free;
  DM_Mebeli.IBTransaction1.Commit;
end;//proc

procedure TF_Lavoare_list.N_Import_lavoare_gotovprodClick(Sender: TObject);
var ib_tmp:TIBDataSet;
         f: System.Text;
         s: String;
         ts: TStringList;
 filename: string;
begin
  ts:=TStringList.Create;
  ts.Delimiter:=';';
  ib_tmp:=TIBDataSet.Create(nil);
  ib_tmp.Database:=DM_Mebeli.DB_Mebeli;
  ib_tmp.SelectSQL.Add('insert into lavoare_gotovprod (id_lavoar, id_gotovprod, description)');
  ib_tmp.SelectSQL.Add('values ((select id from lavoare_1 where article= :article_lavoar), (select id from gotov_prod_0 where article= :article_gotovprod), :article_gotovprod)');

  filename:='e:\lavoar.csv';
  AssignFile(f, filename);
  Reset(f);
  Readln(f,s);
  while not eof(f) do
  begin
    Readln(f,s);
    ts.DelimitedText:=s;
    ib_tmp.ParamByName('article_lavoar').Value:=ts[0];
    ib_tmp.ParamByName('article_gotovprod').Value:=ts[1];
    ib_tmp.ExecSQL;
  end;
  closefile (f);
  ts.Free;
  ib_tmp.Close;
  ib_tmp.Free;
  DM_Mebeli.IBTransaction1.Commit;
end;//proc

end.
