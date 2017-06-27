unit Ostatok_furnitura_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, Menus, StdCtrls, ExtCtrls, Grids, DBGrids, ComObj;

type
  TF_Ostatok_furnitura = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Insert: TButton;
    B_Edit: TButton;
    B_Delete: TButton;
    MainMenu1: TMainMenu;
    N_Period_of_view: TMenuItem;
    IB_Prihod_furnitura_1_F: TIBDataSet;
    IB_Prihod_furnitura_1_FGRUPA_NAME: TIBStringField;
    IB_Prihod_furnitura_1_FFURNITURA_NAME: TIBStringField;
    IB_Prihod_furnitura_1_FID_FURNITURA: TIntegerField;
    IB_Prihod_furnitura_1_FKOL_VO: TIBBCDField;
    IB_Prihod_furnitura_1_FED_IZM: TIBStringField;
    IB_Prihod_furnitura_1_FSUMMA: TIBBCDField;
    DS_Prihod_furnitura_1_F: TDataSource;
    IB_Prihod_furnitura_0_F: TIBDataSet;
    DS_Prihod_furnitura_0_F: TDataSource;
    N1: TMenuItem;
    N_Insert_main: TMenuItem;
    N_Edit_main: TMenuItem;
    N4: TMenuItem;
    N_Delete_main: TMenuItem;
    N2: TMenuItem;
    OpenDialog1: TOpenDialog;
    N3: TMenuItem;
    N5: TMenuItem;
    IB_Prihod_furnitura_1_FPRICE: TIBBCDField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N_Insert_mainClick(Sender: TObject);
    procedure N_Edit_mainClick(Sender: TObject);
    procedure B_InsertClick(Sender: TObject);
    procedure B_EditClick(Sender: TObject);
    procedure N_Delete_mainClick(Sender: TObject);
    procedure B_DeleteClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_akt: integer;
  end;

var
  F_Ostatok_furnitura: TF_Ostatok_furnitura;

implementation

uses main_f, mebeli_dm, Ostatok_furnitura_edit_f;

{$R *.dfm}

procedure reopen_tables;
begin
  F_Ostatok_furnitura.IB_Prihod_furnitura_0_F.Close;
  F_Ostatok_furnitura.IB_Prihod_furnitura_1_F.Close;
  F_Ostatok_furnitura.IB_Prihod_furnitura_0_F.Open;
  F_Ostatok_furnitura.IB_Prihod_furnitura_1_F.Open;
  F_Ostatok_furnitura.IB_Prihod_furnitura_0_F.Locate('id',F_Ostatok_furnitura.id_akt,[]);
end;

procedure TF_Ostatok_furnitura.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Ostatok_furnitura);
end;

procedure TF_Ostatok_furnitura.FormActivate(Sender: TObject);
begin
  reopen_tables;
end;

procedure TF_Ostatok_furnitura.N_Insert_mainClick(Sender: TObject);
begin
  id_akt:=IB_Prihod_furnitura_0_F.FieldByname('id').AsInteger;
  operation:='INSERT';
  F_Ostatok_furnitura_edit.ShowModal;
  reopen_tables;
end;

procedure TF_Ostatok_furnitura.N_Edit_mainClick(Sender: TObject);
begin
  if IB_Prihod_furnitura_0_F.FieldByname('id').IsNull then
    exit;
  id_akt:=IB_Prihod_furnitura_0_F.FieldByname('id').AsInteger;
  operation:='EDIT';
  F_Ostatok_furnitura_edit.ShowModal;
  reopen_tables;
end;

procedure TF_Ostatok_furnitura.B_InsertClick(Sender: TObject);
begin
  N_Insert_mainClick(Sender);
end;

procedure TF_Ostatok_furnitura.B_EditClick(Sender: TObject);
begin
  N_Edit_mainClick(Sender); 
end;

procedure TF_Ostatok_furnitura.N_Delete_mainClick(Sender: TObject);
var
  id_for_delete: integer;
        ib_temp: TIBDataSet;
begin
  IF MessageDlg('Вы уверены, что хотите удалить?',mtWarning,[mbOk,mbNo],0)=mrOk Then
    begin
      id_for_delete:=IB_Prihod_furnitura_0_F.FieldByName('ID').AsInteger;
      IB_Prihod_furnitura_0_F.Prior;
      id_akt:=IB_Prihod_furnitura_0_F.FieldByName('ID').AsInteger;
      ib_temp:=TIBDataSet.Create(nil);
      ib_temp.Database:=DM_Mebeli.DB_Mebeli;
      ib_temp.SelectSQL.Add('delete from prihod_furnitura_0 where id='+IntToStr(id_for_delete));
      ib_temp.ExecSQL;
      ib_temp.free;
      DM_Mebeli.IBTransaction1.Commit;
      Reopen_tables;
     end;//IF
end;//proc

procedure TF_Ostatok_furnitura.B_DeleteClick(Sender: TObject);
begin
  N_Delete_mainClick(Sender);
end;

procedure TF_Ostatok_furnitura.N3Click(Sender: TObject);
var
        s : string;
     Excel: Variant;
         j: Integer;
 FIB_Query: TIBDataSet;
begin
  FIB_Query:=TIBDataSet.Create(nil);
  FIB_Query.Database:=DM_Mebeli.DB_Mebeli;
  FIB_Query.SelectSQL.Clear;
  FIB_Query.SelectSQL.Add('insert into prihod_furnitura_1 (id_parent, id_furnitura, kol_vo, summa)');
  FIB_Query.SelectSQL.Add('values (:id_parent, :id_furnitura, :kol_vo, :summa)');

  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Rollback;
  DM_Mebeli.IBTransaction1.StartTransaction;
  Excel:=CreateOleObject('Excel.Application');
  OpenDialog1.Filter:='Excel files  |*.XLS;*.XLSX';
  if not OpenDialog1.Execute then exit;
  Excel.Application.WorkBooks.Open(OpenDialog1.FileName,0,true);
  j:=2;
  while Excel.Cells[j, 1].Text<>'' do
    begin
      s:=Excel.Cells[j, 1];
      FIB_Query.ParamByName('id_furnitura').Value:=s;
      s:=Excel.Cells[j, 2];
      FIB_Query.ParamByName('kol_vo').Value:=StrToFloat(s);
      s:=Excel.Cells[j, 3];
      FIB_Query.ParamByName('summa').Value:=s;
      s:=Excel.Cells[j, 4];
      FIB_Query.ParamByName('id_parent').Value:=s;
      FIB_Query.ExecSQL;
      Application.ProcessMessages;
      Inc(j);
    end;

  ShowMessage('Imported '+IntToStr(j)+' rows');
  DM_Mebeli.IBTransaction1.Commit;

  Excel.Quit;
  Excel:=Unassigned;
  reopen_tables;
end;

procedure TF_Ostatok_furnitura.N5Click(Sender: TObject);
var
        s : string;
     Excel: Variant;
         j: Integer;
 FIB_Query: TIBDataSet;
begin
  FIB_Query:=TIBDataSet.Create(nil);
  FIB_Query.Database:=DM_Mebeli.DB_Mebeli;
  FIB_Query.SelectSQL.Clear;
  FIB_Query.SelectSQL.Add('update prihod_furnitura_1');
  FIB_Query.SelectSQL.Add('set summa= :price*kol_vo where (id_furnitura= :id_furnitura) and (id_parent>12)');

  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Rollback;
  DM_Mebeli.IBTransaction1.StartTransaction;
  Excel:=CreateOleObject('Excel.Application');
  OpenDialog1.Filter:='Excel files  |*.XLS;*.XLSX';
  if not OpenDialog1.Execute then exit;
  Excel.Application.WorkBooks.Open(OpenDialog1.FileName,0,true);
  j:=2;
  while Excel.Cells[j, 1].Text<>'' do
    begin
      s:=Excel.Cells[j, 1];
      FIB_Query.ParamByName('id_furnitura').Value:=s;
      s:=Excel.Cells[j, 2];
      FIB_Query.ParamByName('price').Value:=StrToFloat(s);
      FIB_Query.ExecSQL;
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
