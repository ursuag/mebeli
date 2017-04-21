unit Ostatok_listy_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, Menus, StdCtrls, ExtCtrls, Grids, DBGrids, DateUtils, ComObj;

type
  TF_Ostatok_listy = class(TForm)
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
    F_IB_Prihod_listy_1ID: TIntegerField;
    F_IB_Prihod_listy_1ID_LISTY: TIntegerField;
    F_IB_Prihod_listy_1LISTY_NAME: TIBStringField;
    F_IB_Prihod_listy_1GRUPA_NAME: TIBStringField;
    F_IB_Prihod_listy_1KOL_VO: TIntegerField;
    F_IB_Prihod_listy_1SUMMA: TIBBCDField;
    N1: TMenuItem;
    OpenDialog1: TOpenDialog;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure B_InsertClick(Sender: TObject);
    procedure N_Period_of_viewClick(Sender: TObject);
    procedure B_DeleteClick(Sender: TObject);
    procedure B_EditClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Ostatok_listy: TF_Ostatok_listy;
    id_akt: integer;
implementation

uses mebeli_dm, main_f, Ostatok_listy_edit_f;

{$R *.dfm}
procedure Reopen_tables;
begin
  DM_Mebeli.IB_Prihod_listy_0.Close;
  DM_Mebeli.IB_Prihod_listy_1.Close;
  With F_Ostatok_listy Do
    begin
      F_IB_prihod_listy_0.ParamByName('date_start').Value:=DateToStr(select_date_start);
      F_IB_prihod_listy_0.Open;
      F_IB_prihod_listy_1.Open;
      IF F_IB_prihod_listy_0.Locate('ID',id_akt,[])=False Then
        F_IB_prihod_listy_0.last;
    end;//With
end;//proc

procedure TF_Ostatok_listy.FormActivate(Sender: TObject);
begin
  id_akt:=0;
  F_IB_prihod_listy_0.Close;
  F_IB_prihod_listy_0.ParamByName('date_start').Value:=DateToStr(select_date_start);
  Reopen_tables;
end;

procedure TF_Ostatok_listy.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Ostatok_listy);
end;

procedure TF_Ostatok_listy.N_Period_of_viewClick(Sender: TObject);
begin
  select_date_start:=StrToDate( InputBox('Начало периода просмотра','Введите дату', DateToStr(IncDay(Date,-60))) );
  id_akt:=F_IB_Prihod_listy_0.FieldByName('ID').AsInteger;
  F_IB_Prihod_listy_0.Close;
  F_IB_Prihod_listy_0.ParamByName('date_start').Value:=DateToStr(select_date_start);
  reopen_tables;
end;

procedure TF_Ostatok_listy.B_DeleteClick(Sender: TObject);
begin
  IF MessageDlg('Вы уверены, что хотите удалить?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       F_IB_Prihod_listy_0.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//IF
end;

procedure TF_Ostatok_listy.B_InsertClick(Sender: TObject);
begin
  id_akt:=F_IB_Prihod_listy_0.FieldByname('id').AsInteger;
  operation:='INSERT';
  F_Ostatok_listy_edit.ShowModal;
  reopen_tables;
end;

procedure TF_Ostatok_listy.B_EditClick(Sender: TObject);
begin
  id_akt:=F_IB_Prihod_listy_0.fieldByName('id').AsInteger;
  operation:='EDIT';
  F_Ostatok_listy_edit.ShowModal;
  Reopen_tables;
end;

procedure TF_Ostatok_listy.N1Click(Sender: TObject);
var
        s,s1 : string;
     Excel: Variant;
         j: Integer;
 FIB_Query: TIBDataSet;
 FIB_listy: TIBDataSet;
begin
  FIB_Query:=TIBDataSet.Create(nil);
  FIB_Query.Database:=DM_Mebeli.DB_Mebeli;
  FIB_Listy:=TIBDataSet.Create(nil);
  FIB_Listy.Database:=DM_Mebeli.DB_Mebeli;


  FIB_Query.SelectSQL.Clear;
  FIB_Query.SelectSQL.Add('insert into prihod_listy_1 (id_parent, id_listy, kol_vo, summa)');
  FIB_Query.SelectSQL.Add('values (:id_parent, :id_listy, :kol_vo, :summa)');

  FIB_Listy.SelectSQL.Clear;
  FIB_Listy.SelectSQL.Add('select id from pilomat_listy where id= :id_listy');

  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Rollback;
  DM_Mebeli.IBTransaction1.StartTransaction;
  Excel:=CreateOleObject('Excel.Application');
  OpenDialog1.Filter:='Excel files  |*.XLS;*.XLSX';
  if not OpenDialog1.Execute then exit;
  Excel.Application.WorkBooks.Open(OpenDialog1.FileName,0,true);
  j:=2;
//  Memo1.Lines.Clear;
  while Excel.Cells[j, 1].Text<>'' do
    begin
      s:=Excel.Cells[j, 1];
      FIB_Query.ParamByName('id_listy').Value:=s;
      s:=Excel.Cells[j, 2];
      FIB_Query.ParamByName('kol_vo').Value:=StrToInt(s);
      s:=Excel.Cells[j, 3];
      FIB_Query.ParamByName('summa').Value:=StrToFloat(s);
      s:=Excel.Cells[j, 4];
      FIB_Query.ParamByName('id_parent').Value:=s;

      FIB_Listy.ParamByname('id_listy').Value:=FIB_Query.ParamByName('id_listy').AsInteger;
      FIB_Listy.Open;
      if FIB_Listy.FieldByname('id').IsNull then
        begin
          s1:=Excel.Cells[j,1];
          s:=s1+'_';
          s1:=Excel.Cells[j,2];
          s:=s+'_'+s1;
          s1:=Excel.Cells[j,3];
          s:=s+'_'+s1;
//          Memo1.Lines.Add(s);
        end
      else
        begin
          FIB_Query.ExecSQL;
        end;

      FIB_Listy.Close;
      Application.ProcessMessages;
      Inc(j);
    end;

  ShowMessage('Imported '+IntToStr(j)+' rows');
  DM_Mebeli.IBTransaction1.Commit;

  Excel.Quit;
  Excel:=Unassigned;
  reopen_tables;
end;

end.
