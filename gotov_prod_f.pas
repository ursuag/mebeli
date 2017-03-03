unit gotov_prod_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  QDialogs, Grids, DBGrids, StdCtrls, ExtCtrls, Menus, DB;

type
  TF_Gotov_prod = class(TForm)
    DBGrid_Grupa: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    DBGrid_Gotprod: TDBGrid;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N_Grupa_Insert: TMenuItem;
    N_Grupa_Edit: TMenuItem;
    N_Grupa_Delete: TMenuItem;
    N_GotovProd_Insert: TMenuItem;
    N_GotovProd_Edit: TMenuItem;
    N_GotovProd_Delete: TMenuItem;
    B_Select: TButton;
    E_Grupa_Filter: TEdit;
    E_Gotovprod_Filter: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid_GrupaDblClick(Sender: TObject);
    procedure N_GotovProd_InsertClick(Sender: TObject);
    procedure N_GotovProd_DeleteClick(Sender: TObject);
    procedure N_GotovProd_EditClick(Sender: TObject);
    procedure N_Grupa_InsertClick(Sender: TObject);
    procedure N_Grupa_EditClick(Sender: TObject);
    procedure N_Grupa_DeleteClick(Sender: TObject);
    procedure DBGrid_GotprodDblClick(Sender: TObject);
    procedure B_SelectClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure E_Grupa_FilterKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_Grupa_FilterEnter(Sender: TObject);
    procedure E_Grupa_FilterExit(Sender: TObject);
    procedure E_Gotovprod_FilterEnter(Sender: TObject);
    procedure E_Gotovprod_FilterExit(Sender: TObject);
    procedure E_Gotovprod_FilterKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    GotovProd_Grupa: integer;
       GotovProd_ID: integer;
  end;

var
  F_Gotov_prod: TF_Gotov_prod;
           sql: TStrings;//временная перем для хранения SelectSQL запроса табл PILOMAT_DETALI
   id_got_prod: integer; //для установки курсора табл. в позицию, которая редактировалась
      id_grupa: integer;
        filter: string;
implementation

uses mebeli_dm, main_f, gotov_prod_edit_f, reports_f, Gotov_prod_normy_f;

{$R *.dfm}
Procedure Reopen_Tables;

begin
  DM_Mebeli.IB_Gotov_prod_grupa.Close;
  DM_Mebeli.IB_Gotov_prod_0.Close;
  DM_Mebeli.IB_Gotov_prod_1.Close;
  DM_Mebeli.IB_Gotov_prod_2.Close;

  DM_Mebeli.IB_Gotov_prod_grupa.Open;
  DM_Mebeli.IB_Gotov_prod_0.Open;

  DM_Mebeli.IB_Gotov_prod_grupa.Locate('ID',id_grupa,[]);
  DM_Mebeli.IB_Gotov_prod_0.Locate('ID',id_got_prod,[]);
end;//proc

procedure TF_Gotov_prod.FormActivate(Sender: TObject);
begin
  E_Grupa_filter.SetFocus;
  DM_Mebeli.IB_Gotov_prod_0.SelectSQL[1]:='WHERE ID_GRUPA=:ID';
  //
  Reopen_tables;
  B_Select.Visible:=false;
  IF operation='SELECT' Then
    begin
      B_Select.Visible:=true;
      DM_Mebeli.IB_Gotov_prod_grupa.Locate('ID',GotovProd_Grupa,[]);
      DM_Mebeli.IB_Gotov_prod_0.Locate('ID',GotovProd_ID,[]);
    end;//IF operation='SELECT'
end;//proc

procedure TF_Gotov_prod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM_Mebeli.IB_Gotov_prod_0.Close;
  DM_Mebeli.IB_Gotov_prod_0.SelectSQL[1]:='';
  DM_Mebeli.IB_Gotov_prod_0.Open;
end;//proc

procedure TF_Gotov_prod.DBGrid_GrupaDblClick(Sender: TObject);
begin
  N_Grupa_EditClick(Sender);
end;//proc

procedure TF_Gotov_prod.N_GotovProd_InsertClick(Sender: TObject);
begin
  id_got_prod:=DM_Mebeli.IB_Gotov_prod_0.FieldByName('ID').AsInteger;
  id_grupa:=DM_Mebeli.IB_Gotov_prod_grupa.FieldByName('ID').AsInteger;
  operation:='INSERT';
  F_Gotov_prod_normy.ShowModal;
  Reopen_tables;
end;//proc

procedure TF_Gotov_prod.N_GotovProd_DeleteClick(Sender: TObject);
begin
  IF MessageDlg('Вы уверены, что хотите удалить?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
      id_got_prod:=DM_Mebeli.IB_Gotov_prod_0.FieldByName('ID').AsInteger;
      id_grupa:=DM_Mebeli.IB_Gotov_prod_grupa.FieldByName('ID').AsInteger;
       DM_Mebeli.IB_Gotov_prod_0.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//IF
end;//proc

procedure TF_Gotov_prod.N_GotovProd_EditClick(Sender: TObject);
begin
  id_got_prod:=DM_Mebeli.IB_Gotov_prod_0.FieldByName('ID').AsInteger;
  id_grupa:=DM_Mebeli.IB_Gotov_prod_grupa.FieldByName('ID').AsInteger;
  GotovProd_ID:=DM_Mebeli.IB_Gotov_prod_0.FieldByName('ID').AsInteger;
  operation:='EDIT';
//  F_Gotov_prod_edit.ShowModal;
  F_Gotov_prod_normy.ShowModal;
  Reopen_tables;
end;//proc

procedure TF_Gotov_prod.N_Grupa_InsertClick(Sender: TObject);
var group_name: widestring;
begin
  group_name:='';
  IF InputQuery('ГРУППА','Наименование группы',group_name) Then
    begin
      id_got_prod:=DM_Mebeli.IB_Gotov_prod_0.FieldByName('ID').AsInteger;
      id_grupa:=DM_Mebeli.IB_Gotov_prod_grupa.FieldByName('ID').AsInteger;
      DM_Mebeli.IB_Gotov_prod_grupa.Insert;
      DM_Mebeli.IB_Gotov_prod_grupa.FieldByName('NAME').Value:=group_name;
      DM_Mebeli.IB_Gotov_prod_grupa.Post;
      DM_Mebeli.IBTransaction1.Commit;
      Reopen_tables;
    end;//IF
end;//proc

procedure TF_Gotov_prod.N_Grupa_EditClick(Sender: TObject);
var group_name: widestring;
begin
  group_name:=DM_Mebeli.IB_Gotov_prod_grupa.FieldByName('NAME').AsString;
  IF InputQuery('ГРУППА','Наименование группы',group_name)=true Then
    begin
      id_got_prod:=DM_Mebeli.IB_Gotov_prod_0.FieldByName('ID').AsInteger;
      id_grupa:=DM_Mebeli.IB_Gotov_prod_grupa.FieldByName('ID').AsInteger;

      DM_Mebeli.IB_Gotov_prod_grupa.Edit;
      DM_Mebeli.IB_Gotov_prod_grupa.FieldByName('NAME').Value:=group_name;
      DM_Mebeli.IB_Gotov_prod_grupa.Post;
      DM_Mebeli.IBTransaction1.Commit;
      Reopen_tables;
    end;//IF
end;//proc

procedure TF_Gotov_prod.N_Grupa_DeleteClick(Sender: TObject);
begin
  IF MessageDlg('Вы уверены, что хотите удалить группу?'+DM_Mebeli.IB_Gotov_prod_grupa.FieldByName('NAME').AsString,mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
      id_got_prod:=DM_Mebeli.IB_Gotov_prod_0.FieldByName('ID').AsInteger;
      id_grupa:=DM_Mebeli.IB_Gotov_prod_grupa.FieldByName('ID').AsInteger;
       DM_Mebeli.IB_Gotov_prod_Grupa.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//IF
end;//proc

procedure TF_Gotov_prod.DBGrid_GotprodDblClick(Sender: TObject);
begin
  IF operation='SELECT' Then
    B_SelectClick(Sender)
  ELSE
    N_GotovProd_EditClick(Sender);
end;//proc

procedure TF_Gotov_prod.B_SelectClick(Sender: TObject);
begin
  GotovProd_Grupa:=DM_Mebeli.IB_Gotov_prod_grupa.FieldByName('ID').AsInteger;
  GotovProd_ID:=DM_Mebeli.IB_Gotov_prod_0.FieldByName('ID').AsInteger;
  F_Reports.id_gotovprod:=DM_Mebeli.IB_Gotov_prod_0.FieldByName('ID').AsInteger;
  F_Reports.E_AVR_Gotovprod.Text:=DM_Mebeli.IB_Gotov_prod_grupa.FieldByName('NAME').AsString+'/'+DM_Mebeli.IB_Gotov_prod_0.FieldByName('NAME').AsString;;
  ModalResult:=mrOk;
end;//proc

procedure TF_Gotov_prod.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Gotov_prod.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Gotov_prod);
end;

procedure TF_Gotov_prod.E_Grupa_FilterKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Length(E_Grupa_Filter.Text)>2 then
    DM_Mebeli.IB_Gotov_prod_grupa.Locate('name',E_Grupa_Filter.Text,[loCaseInsensitive, loPartialKey]);
end;

procedure TF_Gotov_prod.E_Grupa_FilterEnter(Sender: TObject);
begin
  E_Grupa_filter.Text:='';
end;

procedure TF_Gotov_prod.E_Grupa_FilterExit(Sender: TObject);
begin
  E_Grupa_filter.Text:='Ведите текст для поиска по группе';
  E_Gotovprod_filter.SetFocus;
end;

procedure TF_Gotov_prod.E_Gotovprod_FilterEnter(Sender: TObject);
begin
  E_Gotovprod_filter.Text:='';
end;

procedure TF_Gotov_prod.E_Gotovprod_FilterExit(Sender: TObject);
begin
  E_Gotovprod_filter.Text:='Ведите текст для поиска шкафа';
  DBGrid_Gotprod.SetFocus;
end;

procedure TF_Gotov_prod.E_Gotovprod_FilterKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Length(E_Gotovprod_Filter.Text)>2 then
    DM_Mebeli.IB_Gotov_prod_0.Locate('name',E_Gotovprod_Filter.Text,[loCaseInsensitive, loPartialKey]);
end;

end.
