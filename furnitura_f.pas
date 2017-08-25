unit furnitura_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Menus, DB, IBCustomDataSet,
  DBCtrls, ComObj;

type
  TF_Furnitura = class(TForm)
    DBG_Furnitura: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    DBG_Grupa: TDBGrid;
    MainMenu1: TMainMenu;
    N_Insert: TMenuItem;
    N_Edit: TMenuItem;
    N_Delete: TMenuItem;
    N_Insert_grupa: TMenuItem;
    N_Insert_furnitura: TMenuItem;
    N_Edit_grupa: TMenuItem;
    N_Edit_furnitura: TMenuItem;
    N_Delete_grupa: TMenuItem;
    N_Delete_furnitura: TMenuItem;
    N_Close: TMenuItem;
    B_Select: TButton;
    E_Grupa_Filter: TEdit;
    E_Furnitura_Filter: TEdit;
    N1: TMenuItem;
    N_Import_new: TMenuItem;
    N_Import_names: TMenuItem;
    PM_DBG_Furnitura: TPopupMenu;
    N2: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure N_CloseClick(Sender: TObject);
    procedure N_Insert_grupaClick(Sender: TObject);
    procedure N_Edit_grupaClick(Sender: TObject);
    procedure N_Insert_furnituraClick(Sender: TObject);
    procedure N_Edit_furnituraClick(Sender: TObject);
    procedure N_Delete_grupaClick(Sender: TObject);
    procedure N_Delete_furnituraClick(Sender: TObject);
    procedure DBG_FurnituraDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_SelectClick(Sender: TObject);
    procedure DBG_GrupaDblClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure E_Grupa_FilterEnter(Sender: TObject);
    procedure E_Grupa_FilterExit(Sender: TObject);
    procedure E_Furnitura_FilterEnter(Sender: TObject);
    procedure E_Furnitura_FilterExit(Sender: TObject);
    procedure E_Grupa_FilterKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_Furnitura_FilterKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBG_FurnituraKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N_Import_namesClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  id_furnitura_grupa: integer;
  end;

var
   F_Furnitura: TF_Furnitura;
implementation

uses mebeli_dm, furnitura_edit_f, main_f, furnitura_grupa_vidrabot_f,
  reports_f, prihod_furnitura_edit_f, Peremeschenie_jurnal_print_f,
  Spisanie_jurnal_print_f, Peremeschenie_edit_f;

{$R *.dfm}

procedure furnitura_add_to_list;
var furn_select: TIBDataSet;
begin
  furn_select:=TIBDataSet.Create(nil);
  furn_select.Database:=DM_Mebeli.IB_Sklad.Database;
  furn_select.SelectSQL.Add('update or insert into FURNITURA_LIST_FOR_REPORT (id_furnitura) values (:id_furnitura) matching (id_furnitura)');
  furn_select.ParamByName('id_furnitura').Value:=DM_Mebeli.IB_Furnitura.FieldByName('id').AsInteger;
  try
    furn_select.ExecSQL;
  finally
    furn_select.Free;
  end;
end;

procedure Reopen_tables;
begin
  DM_Mebeli.IB_Furnitura_grupa.Close;
  DM_Mebeli.IB_Furnitura.Close;
  DM_Mebeli.IB_Furnitura_grupa.Open;
  DM_Mebeli.IB_Furnitura.Open;
  DM_Mebeli.IB_Furnitura_grupa.Locate('ID',F_Furnitura.id_furnitura_grupa,[]);
  DM_Mebeli.IB_Furnitura.Locate('ID',id_furnitura,[]);
end;//proc

procedure TF_Furnitura.FormActivate(Sender: TObject);
begin
  DM_Mebeli.IB_Furnitura.Close;
  DM_Mebeli.IB_Furnitura.SelectSQL[1]:='where id_parent=:id';
  Reopen_tables;
  IF operation='SELECT' Then
    B_Select.Visible:=true
  ELSE
    B_Select.Visible:=false;
  E_Grupa_Filter.SetFocus;
end;//proc

procedure TF_Furnitura.N_CloseClick(Sender: TObject);
begin
  Close;
end;//proc

procedure TF_Furnitura.N_Insert_grupaClick(Sender: TObject);
begin
  id_furnitura_grupa:=DM_Mebeli.IB_Furnitura_grupa.FieldByname('ID').AsInteger;
  id_furnitura:=DM_Mebeli.IB_Furnitura.FieldByname('ID').AsInteger;
  operation:='INSERT';
  F_Furnitura_grupa_vidrabot.ShowModal;
  Reopen_tables;
end;//proc

procedure TF_Furnitura.N_Edit_grupaClick(Sender: TObject);
begin
  id_furnitura_grupa:=DM_Mebeli.IB_Furnitura_grupa.FieldByname('ID').AsInteger;
  id_furnitura:=DM_Mebeli.IB_Furnitura.FieldByname('ID').AsInteger;
  operation:='EDIT';
  F_Furnitura_grupa_vidrabot.ShowModal;
  Reopen_tables;
end;//proc

procedure TF_Furnitura.N_Insert_furnituraClick(Sender: TObject);
begin
  operation:='INSERT';
  id_furnitura_grupa:=DM_Mebeli.IB_Furnitura_grupa.FieldByname('ID').AsInteger;
  id_furnitura:=DM_Mebeli.IB_Furnitura.FieldByname('ID').AsInteger;
  F_Furnitura_edit.ShowModal;
  Reopen_tables;
end;//proc


procedure TF_Furnitura.N_Edit_furnituraClick(Sender: TObject);
begin
  operation:='EDIT';
  id_furnitura_grupa:=DM_Mebeli.IB_Furnitura_grupa.FieldByname('ID').AsInteger;
  id_furnitura:=DM_Mebeli.IB_Furnitura.FieldByname('ID').AsInteger;
  F_Furnitura_edit.Tag:=id_furnitura;
  F_Furnitura_edit.ShowModal;
  Reopen_tables;
end;//proc

procedure TF_Furnitura.N_Delete_grupaClick(Sender: TObject);
begin
  IF MessageDlg('Вы уверены, что хотите удалить ВСЮ ГРУППУ?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       DM_Mebeli.IB_Furnitura_grupa.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//if
end;//proc

procedure TF_Furnitura.N_Delete_furnituraClick(Sender: TObject);
begin
  IF MessageDlg('Вы уверены, что хотите удалить запись?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       DM_Mebeli.IB_Furnitura.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//if
end;//proc

procedure TF_Furnitura.DBG_FurnituraDblClick(Sender: TObject);
begin
  IF operation='SELECT' Then
    B_SelectClick(Sender);

  IF operation='SELECT_FOR_LIST' Then
    furnitura_add_to_list;

  if operation='' then
    N_Edit_furnituraClick(Sender);
end;//proc

procedure TF_Furnitura.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM_Mebeli.IB_Furnitura.Close;
  DM_Mebeli.IB_Furnitura.SelectSQL[1]:='';
end;//proc

procedure TF_Furnitura.B_SelectClick(Sender: TObject);
begin
  id_furnitura:=DM_Mebeli.IB_Furnitura.FieldByName('ID').AsInteger;
  id_furnitura_grupa:=DM_Mebeli.IB_Furnitura_grupa.FieldByName('ID').AsInteger;

  F_Peremeschenie_jurnal_print.id_furnitura:=DM_Mebeli.IB_Furnitura.FieldByName('ID').AsInteger;
  F_Peremeschenie_jurnal_print.id_furnitura_grupa:=DM_Mebeli.IB_Furnitura_grupa.FieldByName('ID').AsInteger;
  F_Peremeschenie_jurnal_print.E_Furnitura.Text:=DM_Mebeli.IB_Furnitura_grupa.FieldByName('NAME').AsString+'\'+DM_Mebeli.IB_Furnitura.FieldByName('NAME').AsString;

  F_Spisanie_jurnal_print.id_furnitura:=DM_Mebeli.IB_Furnitura.FieldByName('ID').AsInteger;
  F_Spisanie_jurnal_print.id_furnitura_grupa:=DM_Mebeli.IB_Furnitura_grupa.FieldByName('ID').AsInteger;
  F_Spisanie_jurnal_print.E_Furnitura.Text:=DM_Mebeli.IB_Furnitura_grupa.FieldByName('NAME').AsString+'\'+DM_Mebeli.IB_Furnitura.FieldByName('NAME').AsString;

  F_Peremeschenie_edit.id_furnitura:=DM_Mebeli.IB_Furnitura.FieldByName('ID').AsInteger;

  ModalResult:=mrOk;
end;//proc

procedure TF_Furnitura.DBG_GrupaDblClick(Sender: TObject);
begin
  IF operation<>'SELECT' Then
    N_Edit_grupaClick(Sender);
end;//proc

procedure TF_Furnitura.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Furnitura.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Furnitura);
end;

procedure TF_Furnitura.E_Grupa_FilterEnter(Sender: TObject);
begin
  E_Grupa_filter.Text:='';
end;

procedure TF_Furnitura.E_Grupa_FilterExit(Sender: TObject);
begin
  E_Grupa_filter.Text:='Ведите текст для поиска по группе';
end;

procedure TF_Furnitura.E_Furnitura_FilterEnter(Sender: TObject);
begin
  E_Furnitura_filter.Text:='';
end;

procedure TF_Furnitura.E_Furnitura_FilterExit(Sender: TObject);
begin
  E_Furnitura_filter.Text:='Ведите текст для поиска материала';
end;

procedure TF_Furnitura.E_Grupa_FilterKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Length(E_Grupa_Filter.Text)>2 then
    DM_Mebeli.IB_Furnitura_grupa.Locate('name',E_Grupa_Filter.Text,[loCaseInsensitive, loPartialKey]);
end;

procedure TF_Furnitura.E_Furnitura_FilterKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Length(E_Furnitura_Filter.Text)>2 then
    DM_Mebeli.IB_Furnitura.Locate('name',E_Furnitura_Filter.Text,[loCaseInsensitive, loPartialKey]);
end;

procedure TF_Furnitura.DBG_FurnituraKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    DBG_FurnituraDblClick(sender);
end;

procedure TF_Furnitura.N_Import_namesClick(Sender: TObject);
var
        s : string;
     Excel: Variant;
         j: Integer;
 FIB_Query: TIBDataSet;
OpenDialog1: TOpenDialog;
begin
  OpenDialog1:=TOpenDialog.Create(nil);
  OpenDialog1.Filter:='Excel files  |*.XLS;*.XLSX';

  FIB_Query:=TIBDataSet.Create(nil);
  FIB_Query.Database:=DM_Mebeli.DB_Mebeli;

  FIB_Query.SelectSQL.Clear;
  FIB_Query.SelectSQL.Add('update furnitura set name=:furnitura_name, manufacturer_code=:manufacturer_code where article=:article');

  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Rollback;
  DM_Mebeli.IBTransaction1.StartTransaction;
  Excel:=CreateOleObject('Excel.Application');
  if not OpenDialog1.Execute then
    begin
      FIB_Query.Close;
      FIB_Query.Free;
      OpenDialog1.Free;
      exit;
    end;
  Excel.Application.WorkBooks.Open(OpenDialog1.FileName,0,true);
  j:=2;
  while Excel.Cells[j, 1].Text<>'' do
    begin
      s:=Excel.Cells[j, 1];
      FIB_Query.ParamByName('article').Value:=StrToInt(s);
      s:=Excel.Cells[j, 2];
      FIB_Query.ParamByName('furnitura_name').Value:=s;
      s:=Excel.Cells[j, 3];
      FIB_Query.ParamByName('manufacturer_code').Value:=s;
      FIB_Query.ExecSQL;
      Application.ProcessMessages;
      Inc(j);
    end;

  DM_Mebeli.IBTransaction1.Commit;
  FIB_Query.Close;
  FIB_Query.Free;
  Excel.Quit;
  Excel:=Unassigned;
  reopen_tables;
  ShowMessage('Imported '+IntToStr(j)+' rows');
end;

procedure TF_Furnitura.N2Click(Sender: TObject);
begin
  furnitura_add_to_list;
end;

end.
