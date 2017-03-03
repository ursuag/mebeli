unit Statyi_Rashoda_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, Grids, DBGrids, DB, IBCustomDataSet;

type
  TF_Statyi_Rashoda = class(TForm)
    DS_Statyi_Rashoda_0: TDataSource;
    IB_Statyi_Rashoda_0: TIBDataSet;
    DBGrid_Grupa: TDBGrid;
    DBGrid_Gotprod: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Select: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N_Grupa_Insert: TMenuItem;
    N_Grupa_Edit: TMenuItem;
    N_Grupa_Delete: TMenuItem;
    N2: TMenuItem;
    N_Statya_Insert: TMenuItem;
    N_Statya_Edit: TMenuItem;
    N_Statya_Delete: TMenuItem;
    DS_Statyi_Rashoda_1: TDataSource;
    IB_Statyi_Rashoda_1: TIBDataSet;
    procedure FormActivate(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N_Statya_InsertClick(Sender: TObject);
    procedure N_Statya_EditClick(Sender: TObject);
    procedure N_Grupa_InsertClick(Sender: TObject);
    procedure N_Grupa_EditClick(Sender: TObject);
    procedure N_Grupa_DeleteClick(Sender: TObject);
    procedure N_Statya_DeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid_GotprodDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_statya_rashoda: integer;
    id_grupa: integer;
  end;

var
  F_Statyi_Rashoda: TF_Statyi_Rashoda;

implementation

uses mebeli_dm, main_f, Statyi_Rashoda_edit_f;

{$R *.dfm}

procedure reopen_tables;
begin
  F_Statyi_Rashoda.IB_Statyi_Rashoda_0.Close;
  F_Statyi_Rashoda.IB_Statyi_Rashoda_1.Close;

  F_Statyi_Rashoda.IB_Statyi_Rashoda_0.Open;
  F_Statyi_Rashoda.IB_Statyi_Rashoda_1.Open;
  F_Statyi_Rashoda.IB_Statyi_Rashoda_0.Locate('id',F_Statyi_Rashoda.id_grupa,[]);
  F_Statyi_Rashoda.IB_Statyi_Rashoda_1.Locate('id',F_Statyi_Rashoda.id_statya_rashoda,[]);
end;

procedure TF_Statyi_Rashoda.FormActivate(Sender: TObject);
begin
  IB_Statyi_Rashoda_0.Open;
  IB_Statyi_Rashoda_1.Open;
end;

procedure TF_Statyi_Rashoda.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Statyi_Rashoda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IB_Statyi_Rashoda_0.Close;
  IB_Statyi_Rashoda_1.Close;
end;

procedure TF_Statyi_Rashoda.N_Statya_InsertClick(Sender: TObject);
begin
  operation:='INSERT_STATYA';
  id_grupa:=IB_Statyi_Rashoda_0.FieldByname('id').AsInteger;
  F_Statyi_Rashoda_edit.ShowModal;
  reopen_tables;
end;

procedure TF_Statyi_Rashoda.N_Statya_EditClick(Sender: TObject);
begin
  operation:='EDIT';
  id_statya_rashoda:=IB_Statyi_Rashoda_1.FieldByname('id').AsInteger;
  id_grupa:=IB_Statyi_Rashoda_0.FieldByname('id').AsInteger;
  F_Statyi_Rashoda_edit.ShowModal;
  reopen_tables;
end;

procedure TF_Statyi_Rashoda.N_Grupa_InsertClick(Sender: TObject);
begin
  operation:='INSERT_GRUPA';
  id_statya_rashoda:=IB_Statyi_Rashoda_0.FieldByname('id').AsInteger;
  id_grupa:=IB_Statyi_Rashoda_0.FieldByname('id').AsInteger;
  F_Statyi_Rashoda_edit.ShowModal;
  reopen_tables;
end;

procedure TF_Statyi_Rashoda.N_Grupa_EditClick(Sender: TObject);
begin
  operation:='EDIT';
  id_statya_rashoda:=IB_Statyi_Rashoda_0.FieldByname('id').AsInteger;
  id_grupa:=IB_Statyi_Rashoda_0.FieldByname('id').AsInteger;
  F_Statyi_Rashoda_edit.ShowModal;
  reopen_tables;
end;

procedure TF_Statyi_Rashoda.N_Grupa_DeleteClick(Sender: TObject);
begin
  IF MessageDlg('Вы уверены, что хотите удалить?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       IB_Statyi_Rashoda_0.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//IF
end;

procedure TF_Statyi_Rashoda.N_Statya_DeleteClick(Sender: TObject);
begin
  IF MessageDlg('Вы уверены, что хотите удалить?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       id_grupa:=IB_Statyi_Rashoda_0.FieldByname('id').AsInteger;
       IB_Statyi_Rashoda_1.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//IF
end;

procedure TF_Statyi_Rashoda.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Statyi_Rashoda);
end;

procedure TF_Statyi_Rashoda.DBGrid_GotprodDblClick(Sender: TObject);
begin
  F_Statyi_Rashoda.N_Statya_EditClick(Sender); 
end;

end.
