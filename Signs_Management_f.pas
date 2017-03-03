unit Signs_Management_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, IBCustomDataSet;

type
  TF_Signs_Management = class(TForm)
    Panel1: TPanel;
    B_Exit: TButton;
    IB_Tables_DB: TIBDataSet;
    DS_Tables_DB: TDataSource;
    DBG_Listy: TDBGrid;
    DBGrid1: TDBGrid;
    IB_UsersDB: TIBDataSet;
    DS_UsersDB: TDataSource;
    IB_USER_SIGN_RIGHTS: TIBDataSet;
    DS_USER_SIGN_RIGHTS: TDataSource;
    IB_USER_SIGN_RIGHTSID: TIntegerField;
    IB_USER_SIGN_RIGHTSID_USER: TIntegerField;
    IB_USER_SIGN_RIGHTSTABLE_ID: TIntegerField;
    IB_USER_SIGN_RIGHTSUSER_NAME: TStringField;
    procedure B_ExitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure IB_USER_SIGN_RIGHTSNewRecord(DataSet: TDataSet);
    procedure DBGrid1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Signs_Management: TF_Signs_Management;

implementation

uses main_f, mebeli_dm;

{$R *.dfm}

procedure TF_Signs_Management.B_ExitClick(Sender: TObject);
begin
  Close;
  IF DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Commit;
end;

procedure TF_Signs_Management.FormActivate(Sender: TObject);
begin
  IB_Tables_DB.Open;
  IB_USER_SIGN_RIGHTS.Open;
end;

procedure TF_Signs_Management.IB_USER_SIGN_RIGHTSNewRecord(
  DataSet: TDataSet);
begin
  IB_USER_SIGN_RIGHTS.FieldByName('table_id').Value:=IB_Tables_DB.FieldByname('id').AsInteger;
end;

procedure TF_Signs_Management.DBGrid1Exit(Sender: TObject);
begin
  if (IB_USER_SIGN_RIGHTS.State=dsInsert) or (IB_USER_SIGN_RIGHTS.State=dsEdit) then
    IB_USER_SIGN_RIGHTS.post;
end;

end.
