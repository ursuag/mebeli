unit Bank_Jurnal_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, DB, IBCustomDataSet, Grids, DBGrids, DateUtils, IBQuery;

type
  TF_Bank_Jurnal = class(TForm)
    Panel1: TPanel;
    B_Exit: TButton;
    B_Refresh: TButton;
    MainMenu1: TMainMenu;
    N_Period_of_view: TMenuItem;
    DBGrid1: TDBGrid;
    IB_Bank_Jurnal: TIBDataSet;
    DS_Bank_Jurnal: TDataSource;
    PopupMenu1: TPopupMenu;
    N_Prihod: TMenuItem;
    N_Rashod: TMenuItem;
    N_Edit: TMenuItem;
    N1: TMenuItem;
    N_Delete: TMenuItem;
    N2: TMenuItem;
    B_Bank_prihod: TMenuItem;
    N_Bank_rashod: TMenuItem;
    N3: TMenuItem;
    N_Edit_mainmenu: TMenuItem;
    N5: TMenuItem;
    N_Delete_Mainmenu: TMenuItem;
    N7: TMenuItem;
    IB_Bank_JurnalIS_PRIHOD: TIntegerField;
    IB_Bank_JurnalID_DOC: TIntegerField;
    IB_Bank_JurnalDATE_DOC: TDateField;
    IB_Bank_JurnalSUMMA_PRIHOD: TIBBCDField;
    IB_Bank_JurnalSUMMA_RASHOD: TIBBCDField;
    IB_Bank_JurnalCONTRAGENT_NAME: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure B_Bank_prihodClick(Sender: TObject);
    procedure N_PrihodClick(Sender: TObject);
    procedure N_Edit_mainmenuClick(Sender: TObject);
    procedure N_Bank_rashodClick(Sender: TObject);
    procedure N_EditClick(Sender: TObject);
    procedure N_RashodClick(Sender: TObject);
    procedure N_Delete_MainmenuClick(Sender: TObject);
    procedure N_DeleteClick(Sender: TObject);
    procedure N_Period_of_viewClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Bank_Jurnal: TF_Bank_Jurnal;
   period_start: TDate;
     id_akt: integer;
    id_bank_prihod: integer;
    id_bank_rashod: integer;
implementation

uses mebeli_dm, main_f, bank_prihod_f, Bank_rashod_f;

{$R *.dfm}
procedure reopen_tables;
begin
  F_Bank_Jurnal.IB_Bank_Jurnal.Close;
  F_Bank_Jurnal.IB_Bank_Jurnal.ParamByName('date_start').Value:=DateToStr(period_start);
  F_Bank_Jurnal.IB_Bank_Jurnal.Open;
  F_Bank_Jurnal.IB_Bank_Jurnal.Locate('id_doc',id_akt,[]);
  id_bank_rashod:=0;
  id_bank_prihod:=0;
end;

procedure TF_Bank_Jurnal.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Bank_Jurnal);
end;

procedure TF_Bank_Jurnal.FormActivate(Sender: TObject);
begin
  period_start:=IncDay(Date,-360);
  reopen_tables;
end;

procedure TF_Bank_Jurnal.B_Bank_prihodClick(Sender: TObject);
begin
  id_akt:=IB_Bank_Jurnal.FieldByName('id_doc').AsInteger;
  operation:='INSERT';
  F_Bank_prihod.ShowModal;
  reopen_tables;
end;

procedure TF_Bank_Jurnal.N_PrihodClick(Sender: TObject);
begin
  F_Bank_Jurnal.B_Bank_prihodClick(Sender); 
end;

procedure TF_Bank_Jurnal.N_Edit_mainmenuClick(Sender: TObject);
begin
  id_akt:=IB_Bank_Jurnal.FieldByName('id_doc').AsInteger;
  operation:='EDIT';
  if IB_Bank_Jurnal.FieldByname('is_prihod').AsInteger=1 then
      begin
        id_bank_prihod:=IB_Bank_Jurnal.FieldByName('id_doc').AsInteger;
        F_Bank_prihod.ShowModal
      end
  else
    begin
      id_bank_rashod:=IB_Bank_Jurnal.FieldByName('id_doc').AsInteger;
      F_Bank_rashod.ShowModal;
    end;
  reopen_tables;
end;

procedure TF_Bank_Jurnal.N_Bank_rashodClick(Sender: TObject);
begin
  id_akt:=IB_Bank_Jurnal.FieldByName('id_doc').AsInteger;
  operation:='INSERT';
  F_Bank_rashod.ShowModal;
  reopen_tables;
end;

procedure TF_Bank_Jurnal.N_EditClick(Sender: TObject);
begin
  F_Bank_Jurnal.N_Edit_mainmenuClick(Sender);
end;

procedure TF_Bank_Jurnal.N_RashodClick(Sender: TObject);
begin
  F_Bank_Jurnal.N_Bank_rashodClick(Sender);
end;

procedure TF_Bank_Jurnal.N_Delete_MainmenuClick(Sender: TObject);
var sql_delete: TIBQuery;
begin
  SQL_delete:=TIBQuery.Create(nil);
  SQL_delete.Database:=F_Main.IBQuery1.Database;

  IF MessageDlg('Вы уверены, что хотите удалить?',mtWarning,[mbOk,mbNo],0)=mrOk Then
    begin
      if not IB_Bank_Jurnal.FieldByName('summa_prihod').IsNull then
        begin
          SQL_delete.SQL.Add('delete from bank_prihod where id='+IB_Bank_Jurnal.FieldByname('id_doc').AsString);
          SQL_delete.ExecSQL;
        end;
      if not IB_Bank_Jurnal.FieldByName('summa_rashod').IsNull then
        begin
          SQL_delete.SQL.Add('delete from bank_rashod where id='+IB_Bank_Jurnal.FieldByname('id_doc').AsString);
          SQL_delete.ExecSQL;
        end;
      if DM_Mebeli.IBTransaction1.Active then
        DM_Mebeli.IBTransaction1.Commit;
      Reopen_tables;
    end;//IF
  SQL_delete.Free;
end;

procedure TF_Bank_Jurnal.N_DeleteClick(Sender: TObject);
begin
  F_Bank_Jurnal.N_Delete_MainmenuClick(Sender);
end;

procedure TF_Bank_Jurnal.N_Period_of_viewClick(Sender: TObject);
begin
  period_start:=StrToDate( InputBox('Начало периода просмотра','Введите дату', DateToStr(IncDay(Date,-60))) );
  id_akt:=IB_Bank_Jurnal.FieldByName('ID_DOC').AsInteger;
  reopen_tables;
end;

procedure TF_Bank_Jurnal.DBGrid1DblClick(Sender: TObject);
begin
  F_Bank_Jurnal.N_Edit_mainmenuClick(Sender);   
end;

end.


