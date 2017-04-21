unit Ostatok_detali_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DateUtils, ComObj, DB, IBCustomDataSet, StdCtrls, ExtCtrls,
  Grids, DBGrids, Menus, IBQuery;

type
  TF_Ostatok_detali = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Insert: TButton;
    B_Edit: TButton;
    B_Delete: TButton;
    IB_Prihod_detali_1_F: TIBDataSet;
    DS_Prihod_detali_1_F: TDataSource;
    DS_Prihod_detali_0_F: TDataSource;
    IB_Prihod_detali_0_F: TIBDataSet;
    OpenDialog1: TOpenDialog;
    MainMenu1: TMainMenu;
    N_Period_of_view: TMenuItem;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure B_DeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Ostatok_detali: TF_Ostatok_detali;
    id_akt: integer;
implementation

uses mebeli_dm, main_f, Ostatok_listy_edit_f;

{$R *.dfm}

procedure Reopen_tables;
begin
  With F_Ostatok_detali Do
    begin
      IB_prihod_detali_0_F.Open;
      IB_prihod_detali_1_F.Open;
      IF IB_prihod_detali_0_F.Locate('ID',id_akt,[])=False Then
        IB_prihod_detali_0_F.last;
    end;//With
end;//proc


procedure TF_Ostatok_detali.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Ostatok_detali);
end;

procedure TF_Ostatok_detali.FormActivate(Sender: TObject);
begin
  id_akt:=0;
  reopen_tables;
end;

procedure TF_Ostatok_detali.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IB_prihod_detali_0_F.Close;
  IB_prihod_detali_1_F.Close;
end;

procedure TF_Ostatok_detali.N1Click(Sender: TObject);
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
  FIB_Query.SelectSQL.Add('insert into prihod_detali_1 (id_parent, id_pilomat_detali, kol_vo, summa)');
  FIB_Query.SelectSQL.Add('values (:id_parent, :id_detali, :kol_vo, :summa)');

  FIB_Listy.SelectSQL.Clear;
  FIB_Listy.SelectSQL.Add('select id from pilomat_detali where id= :id_detali');

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
      FIB_Query.ParamByName('id_detali').Value:=s;
      s:=Excel.Cells[j, 2];
      FIB_Query.ParamByName('kol_vo').Value:=StrToInt(s);
      s:=Excel.Cells[j, 3];
      FIB_Query.ParamByName('summa').Value:=StrToFloat(s);
      s:=Excel.Cells[j, 4];
      FIB_Query.ParamByName('id_parent').Value:=s;

      FIB_Listy.ParamByname('id_detali').Value:=FIB_Query.ParamByName('id_detali').AsInteger;
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

procedure TF_Ostatok_detali.B_DeleteClick(Sender: TObject);
var sql_delete: TIBQuery;
begin
  IF MessageDlg('Вы уверены, что хотите удалить?',mtWarning,[mbOk,mbNo],0)=mrOk Then
    begin
      sql_delete:=TIBQuery.Create(nil);
      sql_delete.Database:=F_Main.IBQuery1.Database;
      sql_delete.SQL.Add('delete from prihod_detali_0 where id='+IB_Prihod_detali_0_F.FieldByName('ID').AsString);
      IB_Prihod_detali_0_F.Prior;
      id_akt:=IB_Prihod_detali_0_F.FieldByName('ID').AsInteger;
      sql_delete.ExecSQL;
      sql_delete.Free;
      DM_Mebeli.IBTransaction1.Commit;
      Reopen_tables;
     end;//IF
end;//proc

end.
