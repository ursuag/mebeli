unit Contragenty_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  QDialogs, StdCtrls, ExtCtrls, Menus, Grids, DBGrids;

type
  TF_Contragenty = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N_Grupa_Insert: TMenuItem;
    N_Grupa_Edit: TMenuItem;
    N_Grupa_Delete: TMenuItem;
    N2: TMenuItem;
    N_Contragent_Insert: TMenuItem;
    N_Contragent_edit: TMenuItem;
    N_Contragent_Delete: TMenuItem;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Select: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    procedure N_Grupa_DeleteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N_Contragent_DeleteClick(Sender: TObject);
    procedure N_Grupa_InsertClick(Sender: TObject);
    procedure N_Grupa_EditClick(Sender: TObject);
    procedure N_Contragent_InsertClick(Sender: TObject);
    procedure N_Contragent_editClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Contragenty: TF_Contragenty;
  id_grupa_contragenty: integer;
implementation

uses mebeli_dm, main_f, Contragenty_edit_f;

{$R *.dfm}
procedure Reopen_tables;
begin
  DM_Mebeli.IB_Contragenty_0.Open;
  DM_Mebeli.IB_Contragenty_1.Open;
  DM_Mebeli.IB_Contragenty_0.Locate('id',id_grupa_contragenty,[]);
  DM_Mebeli.IB_Contragenty_1.Locate('id',id_contragent,[]);
end;//proc


procedure TF_Contragenty.N_Grupa_DeleteClick(Sender: TObject);
begin
  IF MessageDlg('Вы уверены, что хотите удалить?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       DM_Mebeli.IB_Contragenty_0.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//IF
end;//proc

procedure TF_Contragenty.FormActivate(Sender: TObject);
begin
  DM_Mebeli.IB_Contragenty_1.Close;
  DM_Mebeli.IB_Contragenty_1.SelectSQL[1]:='where id_parent=:id';
  reopen_tables;
end;//proc

procedure TF_Contragenty.N_Contragent_DeleteClick(Sender: TObject);
begin
  IF MessageDlg('Вы уверены, что хотите удалить?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       DM_Mebeli.IB_Contragenty_1.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//IF
end;//proc

procedure TF_Contragenty.N_Grupa_InsertClick(Sender: TObject);
var s: WideString;
begin
  s:='';
  IF InputQuery('Новая группа','Введите наименование:',s) Then
     begin
       DM_Mebeli.IB_Contragenty_0.Insert;
       DM_Mebeli.IB_Contragenty_0.FieldByName('NAME').Value:=s;
       DM_Mebeli.IB_Contragenty_0.Post;
       DM_Mebeli.IBTransaction1.Commit;
       reopen_tables;
     end;//IF
end;//proc


procedure TF_Contragenty.N_Grupa_EditClick(Sender: TObject);
var s: Widestring;
begin
  id_grupa_contragenty:=DM_Mebeli.IB_Contragenty_0.FieldByName('id').AsInteger;
  s:=DM_Mebeli.IB_Contragenty_0.FieldByName('NAME').AsString;
  IF InputQuery('Редактирование данных','Введите наименование:',s) Then
     begin
       DM_Mebeli.IB_Contragenty_0.Edit;
       DM_Mebeli.IB_Contragenty_0.FieldByName('NAME').Value:=s;
       DM_Mebeli.IB_Contragenty_0.Post;
       DM_Mebeli.IBTransaction1.Commit;
       reopen_tables;
     end;//IF
end;//proc

procedure TF_Contragenty.N_Contragent_InsertClick(Sender: TObject);
begin
  id_grupa_contragenty:=DM_Mebeli.IB_Contragenty_0.FieldByName('id').AsInteger;
  id_contragent:=DM_Mebeli.IB_Contragenty_0.FieldByName('id').AsInteger;
  operation:='INSERT';
  F_Contragenty_edit.ShowModal;
  Reopen_tables;
end;//proc


procedure TF_Contragenty.N_Contragent_editClick(Sender: TObject);
begin
  id_grupa_contragenty:=DM_Mebeli.IB_Contragenty_0.FieldByName('id').AsInteger;
  id_contragent:=DM_Mebeli.IB_Contragenty_1.FieldByName('id').AsInteger;
  operation:='EDIT';
  F_Contragenty_edit.ShowModal;
  Reopen_tables;
end;

procedure TF_Contragenty.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Contragenty.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM_Mebeli.IB_Contragenty_1.Close;
  DM_Mebeli.IB_Contragenty_1.SelectSQL[1]:='';
end;

end.
