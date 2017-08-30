unit Cassa_Jurnal_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, DB, IBCustomDataSet, Grids, DBGrids, DateUtils, IBQuery;

type
  TF_Cassa_Jurnal = class(TForm)
    Panel1: TPanel;
    B_Exit: TButton;
    B_Refresh: TButton;
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    N2: TMenuItem;
    B_Cassa_prihod: TMenuItem;
    N_Cassa_rashod: TMenuItem;
    N3: TMenuItem;
    N_Edit_mainmenu: TMenuItem;
    N5: TMenuItem;
    N_Delete_Mainmenu: TMenuItem;
    N_Period_of_view: TMenuItem;
    IB_Cassa_Jurnal: TIBDataSet;
    DS_Cassa_Jurnal: TDataSource;
    PopupMenu1: TPopupMenu;
    N_Prihod: TMenuItem;
    N_Rashod: TMenuItem;
    N7: TMenuItem;
    N_Edit: TMenuItem;
    N1: TMenuItem;
    N_Delete: TMenuItem;
    IB_Cassa_JurnalIS_PRIHOD: TIntegerField;
    IB_Cassa_JurnalID_DOC: TIntegerField;
    IB_Cassa_JurnalDATE_DOC: TDateField;
    IB_Cassa_JurnalSUMMA_PRIHOD: TIBBCDField;
    IB_Cassa_JurnalSUMMA_RASHOD: TIBBCDField;
    IB_Cassa_JurnalCONTRAGENT_NAME: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_Cassa_prihodClick(Sender: TObject);
    procedure N_Cassa_rashodClick(Sender: TObject);
    procedure N_Edit_mainmenuClick(Sender: TObject);
    procedure N_Delete_MainmenuClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N_EditClick(Sender: TObject);
    procedure N_PrihodClick(Sender: TObject);
    procedure N_RashodClick(Sender: TObject);
    procedure N_DeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Cassa_Jurnal: TF_Cassa_Jurnal;
    period_start: TDate;
     id_akt: integer;
    id_cassa_prihod: integer;
    id_cassa_rashod: integer;

implementation

uses mebeli_dm, main_f, Cassa_prihod_f, Cassa_rashod_f;

{$R *.dfm}
procedure reopen_tables;
begin
  F_Cassa_Jurnal.IB_Cassa_Jurnal.Close;
  F_Cassa_Jurnal.IB_Cassa_Jurnal.ParamByName('date_start').Value:=DateToStr(period_start);
  F_Cassa_Jurnal.IB_Cassa_Jurnal.Open;
  F_Cassa_Jurnal.IB_Cassa_Jurnal.Locate('id_doc',id_akt,[]);
  id_cassa_rashod:=0;
  id_cassa_prihod:=0;
end;


procedure TF_Cassa_Jurnal.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Cassa_Jurnal);
end;

procedure TF_Cassa_Jurnal.FormActivate(Sender: TObject);
begin
  period_start:=IncDay(Date,-360);
  reopen_tables;
end;

procedure TF_Cassa_Jurnal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IB_Cassa_Jurnal.Close;
end;

procedure TF_Cassa_Jurnal.B_Cassa_prihodClick(Sender: TObject);
begin
  id_akt:=IB_Cassa_Jurnal.FieldByName('id_doc').AsInteger;
  operation:='INSERT';
  F_Cassa_prihod.ShowModal;
  reopen_tables;
end;

procedure TF_Cassa_Jurnal.N_Cassa_rashodClick(Sender: TObject);
begin
  id_akt:=IB_Cassa_Jurnal.FieldByName('id_doc').AsInteger;
  operation:='INSERT';
  F_Cassa_rashod.ShowModal;
  reopen_tables;
end;

procedure TF_Cassa_Jurnal.N_Edit_mainmenuClick(Sender: TObject);
begin
  id_akt:=IB_Cassa_Jurnal.FieldByName('id_doc').AsInteger;
  operation:='EDIT';
  if IB_Cassa_Jurnal.FieldByname('is_prihod').AsInteger=1 then
      begin
        id_cassa_prihod:=IB_Cassa_Jurnal.FieldByName('id_doc').AsInteger;
        F_Cassa_prihod.ShowModal
      end
  else
    begin
      id_cassa_rashod:=IB_Cassa_Jurnal.FieldByName('id_doc').AsInteger;
      F_Cassa_rashod.ShowModal;
    end;
  reopen_tables;
end;

procedure TF_Cassa_Jurnal.N_Delete_MainmenuClick(Sender: TObject);
var sql_delete: TIBQuery;
begin
  SQL_delete:=TIBQuery.Create(nil);
  SQL_delete.Database:=F_Main.IBQuery1.Database;

  IF MessageDlg('Вы уверены, что хотите удалить?',mtConfirmation,[mbOk,mbNo],0)=mrOk Then
    begin
      if not IB_Cassa_Jurnal.FieldByName('summa_prihod').IsNull then
        begin
          SQL_delete.SQL.Add('delete from cassa_prihod where id='+IB_Cassa_Jurnal.FieldByname('id_doc').AsString);
          SQL_delete.ExecSQL;
        end;
      if not IB_Cassa_Jurnal.FieldByName('summa_rashod').IsNull then
        begin
          SQL_delete.SQL.Add('delete from cassa_rashod where id='+IB_Cassa_Jurnal.FieldByname('id_doc').AsString);
          SQL_delete.ExecSQL;
        end;
      if DM_Mebeli.IBTransaction1.Active then
        DM_Mebeli.IBTransaction1.Commit;
      Reopen_tables;
    end;//IF
  SQL_delete.Free;
end;

procedure TF_Cassa_Jurnal.DBGrid1DblClick(Sender: TObject);
begin
  F_Cassa_Jurnal.N_Edit_mainmenuClick(Sender);
end;

procedure TF_Cassa_Jurnal.N_EditClick(Sender: TObject);
begin
  F_Cassa_Jurnal.N_Edit_mainmenuClick(Sender);  
end;

procedure TF_Cassa_Jurnal.N_PrihodClick(Sender: TObject);
begin
  F_Cassa_Jurnal.B_Cassa_prihodClick(Sender);      
end;

procedure TF_Cassa_Jurnal.N_RashodClick(Sender: TObject);
begin
  F_Cassa_Jurnal.N_Cassa_rashodClick(Sender);
end;

procedure TF_Cassa_Jurnal.N_DeleteClick(Sender: TObject);
begin
  F_Cassa_Jurnal.N_Delete_MainmenuClick(Sender);
end;

end.
