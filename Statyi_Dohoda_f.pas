unit Statyi_Dohoda_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, IBCustomDataSet, StdCtrls, ExtCtrls, Grids, DBGrids;

type
  TF_Statyi_Dohoda = class(TForm)
    DBGrid_Grupa: TDBGrid;
    DBGrid_Gotprod: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Select: TButton;
    DS_Statyi_Dohoda_0: TDataSource;
    IB_Statyi_Dohoda_0: TIBDataSet;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N_Grupa_Insert: TMenuItem;
    N_Grupa_Edit: TMenuItem;
    N_Grupa_Delete: TMenuItem;
    N2: TMenuItem;
    N_Statya_Insert: TMenuItem;
    N_Statya_Edit: TMenuItem;
    N_Statya_Delete: TMenuItem;
    DS_Statyi_Dohoda_1: TDataSource;
    IB_Statyi_Dohoda_1: TIBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure N_Grupa_InsertClick(Sender: TObject);
    procedure N_Grupa_EditClick(Sender: TObject);
    procedure N_Grupa_DeleteClick(Sender: TObject);
    procedure N_Statya_InsertClick(Sender: TObject);
    procedure N_Statya_EditClick(Sender: TObject);
    procedure N_Statya_DeleteClick(Sender: TObject);
    procedure DBGrid_GotprodDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_statya_dohoda: integer;
    id_grupa: integer;

  end;

var
  F_Statyi_Dohoda: TF_Statyi_Dohoda;

implementation

uses main_f, statyi_Dohoda_edit_f, mebeli_dm;

{$R *.dfm}
procedure reopen_tables;
begin
  F_Statyi_Dohoda.IB_Statyi_Dohoda_0.Close;
  F_Statyi_Dohoda.IB_Statyi_Dohoda_1.Close;

  F_Statyi_Dohoda.IB_Statyi_Dohoda_0.Open;
  F_Statyi_Dohoda.IB_Statyi_Dohoda_1.Open;
  F_Statyi_Dohoda.IB_Statyi_Dohoda_0.Locate('id',F_Statyi_Dohoda.id_grupa,[]);
  F_Statyi_Dohoda.IB_Statyi_Dohoda_1.Locate('id',F_Statyi_Dohoda.id_statya_Dohoda,[]);
end;

procedure TF_Statyi_Dohoda.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Statyi_Dohoda);
end;

procedure TF_Statyi_Dohoda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IB_Statyi_Dohoda_0.Close;
  IB_Statyi_Dohoda_1.Close;
end;

procedure TF_Statyi_Dohoda.FormActivate(Sender: TObject);
begin
  reopen_tables;
end;

procedure TF_Statyi_Dohoda.N_Grupa_InsertClick(Sender: TObject);
begin
  operation:='INSERT_GRUPA';
  id_statya_dohoda:=IB_Statyi_Dohoda_0.FieldByname('id').AsInteger;
  id_grupa:=IB_Statyi_Dohoda_0.FieldByname('id').AsInteger;
  F_Statyi_Dohoda_edit.ShowModal;
  reopen_tables;
end;

procedure TF_Statyi_Dohoda.N_Grupa_EditClick(Sender: TObject);
begin
  operation:='EDIT';
  id_statya_Dohoda:=IB_Statyi_Dohoda_0.FieldByname('id').AsInteger;
  id_grupa:=IB_Statyi_Dohoda_0.FieldByname('id').AsInteger;
  F_Statyi_Dohoda_edit.ShowModal;
  reopen_tables;
end;

procedure TF_Statyi_Dohoda.N_Grupa_DeleteClick(Sender: TObject);
begin
  IF MessageDlg('�� �������, ��� ������ �������?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       IB_Statyi_Dohoda_0.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//IF
end;

procedure TF_Statyi_Dohoda.N_Statya_InsertClick(Sender: TObject);
begin
  operation:='INSERT_STATYA';
  id_grupa:=IB_Statyi_Dohoda_0.FieldByname('id').AsInteger;
  F_Statyi_Dohoda_edit.ShowModal;
  reopen_tables;
end;

procedure TF_Statyi_Dohoda.N_Statya_EditClick(Sender: TObject);
begin
  operation:='EDIT';
  id_statya_Dohoda:=IB_Statyi_Dohoda_1.FieldByname('id').AsInteger;
  id_grupa:=IB_Statyi_Dohoda_0.FieldByname('id').AsInteger;
  F_Statyi_Dohoda_edit.ShowModal;
  reopen_tables;
end;

procedure TF_Statyi_Dohoda.N_Statya_DeleteClick(Sender: TObject);
begin
  IF MessageDlg('�� �������, ��� ������ �������?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       id_grupa:=IB_Statyi_Dohoda_0.FieldByname('id').AsInteger;
       IB_Statyi_Dohoda_1.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//IF
end;

procedure TF_Statyi_Dohoda.DBGrid_GotprodDblClick(Sender: TObject);
begin
  F_Statyi_Dohoda.N_Statya_EditClick(Sender);
end;

end.
