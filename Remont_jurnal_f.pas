unit Remont_jurnal_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, IBCustomDataSet, Grids, DBGrids, StdCtrls, ExtCtrls, DateUtils, IBQuery;

type
  TF_Remont_jurnal = class(TForm)
    Panel1: TPanel;
    B_Exit: TButton;
    B_Refresh: TButton;
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    ND: TMenuItem;
    N_Insert_PopUp: TMenuItem;
    N_Edit_PopUp: TMenuItem;
    N5: TMenuItem;
    N_Delete_Mainmenu: TMenuItem;
    N_Period_of_view: TMenuItem;
    IB_Remont_Jurnal: TIBDataSet;
    DS_Remont_Jurnal: TDataSource;
    PopupMenu1: TPopupMenu;
    N_Insert: TMenuItem;
    N_Edit: TMenuItem;
    N1: TMenuItem;
    N_Delete: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N_Insert_PopUpClick(Sender: TObject);
    procedure N_Delete_MainmenuClick(Sender: TObject);
    procedure N_InsertClick(Sender: TObject);
    procedure N_EditClick(Sender: TObject);
    procedure N_Edit_PopUpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_akt: integer;
  end;

var
  F_Remont_jurnal: TF_Remont_jurnal;
   period_start: TDate;

implementation

uses mebeli_dm, main_f, Remont_edit_f;

{$R *.dfm}
procedure reopen_tables;
begin
  F_Remont_Jurnal.IB_Remont_Jurnal.Close;
  F_Remont_Jurnal.IB_Remont_Jurnal.ParamByName('date_start').Value:=DateToStr(period_start);
  F_Remont_Jurnal.IB_Remont_Jurnal.Open;
  if not F_Remont_Jurnal.IB_Remont_Jurnal.Locate('id_doc',F_Remont_jurnal.id_akt,[]) then
    F_Remont_Jurnal.IB_Remont_Jurnal.Last;
end;

procedure TF_Remont_jurnal.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Remont_jurnal);
end;

procedure TF_Remont_jurnal.FormActivate(Sender: TObject);
begin
  period_start:=IncDay(Date,-360);
  reopen_tables;
end;

procedure TF_Remont_jurnal.N_Insert_PopUpClick(Sender: TObject);
begin
  N_InsertClick(Sender);
end;

procedure TF_Remont_jurnal.N_Delete_MainmenuClick(Sender: TObject);
var sql_delete: TIBQuery;
begin
  SQL_delete:=TIBQuery.Create(nil);
  SQL_delete.Database:=F_Main.IBQuery1.Database;

  IF MessageDlg('Вы уверены, что хотите удалить?',mtWarning,[mbOk,mbNo],0)=mrOk Then
    begin
      SQL_delete.SQL.Add('delete from remont_0 where id='+IB_Remont_Jurnal.FieldByname('id_doc').AsString);
      SQL_delete.ExecSQL;
      if DM_Mebeli.IBTransaction1.Active then
      DM_Mebeli.IBTransaction1.Commit;
      Reopen_tables;
    end;//IF
  SQL_delete.Free;
end;

procedure TF_Remont_jurnal.N_InsertClick(Sender: TObject);
begin
  id_akt:=IB_Remont_Jurnal.FieldByName('id_doc').AsInteger;
  operation:='INSERT';
  F_Remont_edit.ShowModal;
  reopen_tables;
end;

procedure TF_Remont_jurnal.N_EditClick(Sender: TObject);
begin
  IF IB_Remont_Jurnal.FieldByName('id_doc').IsNull Then
    F_Remont_jurnal.N_InsertClick(Sender);
  id_akt:=IB_Remont_Jurnal.FieldByName('id_doc').AsInteger;
  operation:='EDIT';
  F_Remont_edit.ShowModal;
  reopen_tables;
end;

procedure TF_Remont_jurnal.N_Edit_PopUpClick(Sender: TObject);
begin
  N_EditClick(Sender);
end;

end.
