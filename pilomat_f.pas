unit pilomat_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, StdCtrls, ExtCtrls, DB, IBCustomDataSet;

type
  TF_Pilomat = class(TForm)
    MainMenu1: TMainMenu;
    DBG_Grupa: TDBGrid;
    N_Insert: TMenuItem;
    N_Insert_grupa: TMenuItem;
    N_Insert_listy: TMenuItem;
    N_Insert_detali: TMenuItem;
    N_Edit: TMenuItem;
    N_edit_grupa: TMenuItem;
    N_edit_listy: TMenuItem;
    N_edit_detali: TMenuItem;
    N_Delete: TMenuItem;
    N_Delete_grupa: TMenuItem;
    N_Delete_listy: TMenuItem;
    N_Delete_detali: TMenuItem;
    DBG_Listy: TDBGrid;
    DBG_Detali: TDBGrid;
    N_Exit: TMenuItem;
    Panel1: TPanel;
    B_Exit: TButton;
    P_Select: TPanel;
    B_Cancel_select: TButton;
    B_Select: TButton;
    IB_Pilomat_grupa_F: TIBDataSet;
    IB_Pilomat_listy_F: TIBDataSet;
    DS_Pilomat_listy_F: TDataSource;
    IB_Pilomat_Detali_F: TIBDataSet;
    DS_Pilomat_Detali_F: TDataSource;
    DS_Pilomat_grupa_F: TDataSource;
    procedure N_Insert_grupaClick(Sender: TObject);
    procedure N_edit_grupaClick(Sender: TObject);
    procedure N_Insert_listyClick(Sender: TObject);
    procedure N_edit_listyClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N_ExitClick(Sender: TObject);
    procedure N_Insert_detaliClick(Sender: TObject);
    procedure N_edit_detaliClick(Sender: TObject);
    procedure N_Delete_grupaClick(Sender: TObject);
    procedure N_Delete_listyClick(Sender: TObject);
    procedure N_Delete_detaliClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBG_GrupaDblClick(Sender: TObject);
    procedure DBG_ListyDblClick(Sender: TObject);
    procedure DBG_DetaliDblClick(Sender: TObject);
    procedure DBG_ListyKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure DBG_GrupaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBG_DetaliKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure B_SelectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_detali: integer;
     id_listy: integer;
     id_group: integer;
  end;

const
  Key_O=79;

var
  F_Pilomat: TF_Pilomat;
implementation

uses mebeli_dm, pilomat_grupa_f, main_f, pilomat_listy_f,
  pilomat_detali_f, reports_f, Peremeschenie_jurnal_print_f,
  Spisanie_jurnal_print_f;

{$R *.dfm}
Procedure Reopen_Tables;

begin
  DM_Mebeli.IB_Pilomat_grupa.Close;
  DM_Mebeli.IB_Pilomat_listy.Close;
  DM_Mebeli.IB_Pilomat_detali.Close;

  DM_Mebeli.IB_Pilomat_grupa.Open;
  DM_Mebeli.IB_Pilomat_listy.Open;
  DM_Mebeli.IB_Pilomat_detali.Open;
  DM_Mebeli.IB_Pilomat_grupa.Locate('ID',F_Pilomat.id_group,[]);
  DM_Mebeli.IB_Pilomat_listy.Locate('ID',F_Pilomat.id_listy,[]);
  DM_Mebeli.IB_Pilomat_detali.Locate('ID',F_Pilomat.id_detali,[]);
end;//proc

procedure TF_Pilomat.N_Insert_grupaClick(Sender: TObject);
begin
  operation:='INSERT';
  id_group:=DM_Mebeli.IB_Pilomat_grupa.FieldByName('ID').AsInteger;
  id_listy:=DM_Mebeli.IB_Pilomat_listy.FieldByName('ID').AsInteger;
  id_detali:=DM_Mebeli.IB_Pilomat_detali.FieldByName('ID').AsInteger;
  F_Pilomat_grupa.ShowModal;
  Reopen_Tables;
end;//proc

procedure TF_Pilomat.N_edit_grupaClick(Sender: TObject);
begin
  operation:='EDIT';
  id_group:=DM_Mebeli.IB_Pilomat_grupa.FieldByName('ID').AsInteger;
  id_listy:=DM_Mebeli.IB_Pilomat_listy.FieldByName('ID').AsInteger;
  id_detali:=DM_Mebeli.IB_Pilomat_detali.FieldByName('ID').AsInteger;
  F_Pilomat_grupa.ShowModal;
  Reopen_Tables;
end;//proc

procedure TF_Pilomat.N_Insert_listyClick(Sender: TObject);
begin
  operation:='INSERT';
  id_group:=DM_Mebeli.IB_Pilomat_grupa.FieldByName('ID').AsInteger;
  id_listy:=DM_Mebeli.IB_Pilomat_listy.FieldByName('ID').AsInteger;
  id_detali:=DM_Mebeli.IB_Pilomat_detali.FieldByName('ID').AsInteger;
  F_Pilomat_listy.ShowModal;
  Reopen_Tables;
end;//proc

procedure TF_Pilomat.N_edit_listyClick(Sender: TObject);
begin
  operation:='EDIT';
  id_group:=DM_Mebeli.IB_Pilomat_grupa.FieldByName('ID').AsInteger;
  id_listy:=DM_Mebeli.IB_Pilomat_listy.FieldByName('ID').AsInteger;
  id_detali:=DM_Mebeli.IB_Pilomat_detali.FieldByName('ID').AsInteger;
  F_Pilomat_listy.ShowModal;
  Reopen_Tables;
end;//proc

procedure TF_Pilomat.FormActivate(Sender: TObject);
var i: byte;
begin
  DM_Mebeli.IB_Pilomat_detali.Close;
  DM_Mebeli.IB_Pilomat_listy.Close;
  DM_Mebeli.IB_Pilomat_detali.SelectSQL[1]:='where id_grupa=:ID';
  DM_Mebeli.IB_Pilomat_listy.SelectSQL[1]:='where id_grupa=:ID';
  IF operation='SELECT_STOCKS' Then
    begin
      DBG_Grupa.DataSource:=DS_Pilomat_grupa_F;
      DBG_Listy.DataSource:=DS_Pilomat_Listy_F;
      DBG_Detali.DataSource:=DS_Pilomat_Detali_F;

      IB_Pilomat_grupa_F.SelectSQL.Clear;
      IB_Pilomat_grupa_F.SelectSQL.Add('select pg.id, pg.name from pilomat_grupa pg');
      IB_Pilomat_grupa_F.SelectSQL.Add('where exists (select list_id from GET_LISTY_ESTI_OSTATOK(pg.id))');
      IB_Pilomat_grupa_F.SelectSQL.Add('order by pg.name');

      IB_Pilomat_listy_F.SelectSQL.Clear;
      IB_Pilomat_listy_F.SelectSQL.Add('select list_id id, list_name name, list_ostatok');
      IB_Pilomat_listy_F.SelectSQL.Add('from GET_LISTY_ESTI_OSTATOK(:id)');
      IB_Pilomat_listy_F.SelectSQL.Add('order by list_name');

      Reopen_Tables;
      IB_Pilomat_Listy_F.Open;
      IB_Pilomat_Detali_F.Open;
      IB_Pilomat_grupa_F.Open;
      P_Select.Visible:=TRUE;
      Panel1.Visible:=False;
      for I := 0 to Mainmenu1.Items.Count-1 do
        Mainmenu1.Items.Items[I].Visible := False;
      DM_Mebeli.IB_Pilomat_grupa.Locate('ID',id_group,[]);
      DM_Mebeli.IB_Pilomat_detali.Locate('ID',id_detali,[]);
    end//IF 'SELECT'
  ELSE
    IF operation='SELECT' Then
      begin
        DBG_Grupa.DataSource:=DS_Pilomat_grupa_F;
        DBG_Listy.DataSource:=DS_Pilomat_Listy_F;
        DBG_Detali.DataSource:=DS_Pilomat_Detali_F;

        IB_Pilomat_grupa_F.SelectSQL.Clear;
        IB_Pilomat_grupa_F.SelectSQL.Add('select * from pilomat_grupa order by name');
        IB_Pilomat_listy_F.SelectSQL.Clear;
        IB_Pilomat_listy_F.SelectSQL.Add('select * from pilomat_listy where id_grupa= :id order by name');

        Reopen_Tables;
        IB_Pilomat_Listy_F.Open;
        IB_Pilomat_Detali_F.Open;
        IB_Pilomat_grupa_F.Open;
        P_Select.Visible:=TRUE;
        Panel1.Visible:=False;
        for I := 0 to Mainmenu1.Items.Count-1 do
          Mainmenu1.Items.Items[I].Visible := False;
        DM_Mebeli.IB_Pilomat_grupa.Locate('ID',id_group,[]);
        DM_Mebeli.IB_Pilomat_detali.Locate('ID',id_detali,[]);
      end//IF 'SELECT'
      ELSE
        begin
          DBG_Grupa.DataSource:=DM_Mebeli.DS_Pilomat_grupa;
          DBG_Listy.DataSource:=DM_Mebeli.DS_Pilomat_listy;
          DBG_Detali.DataSource:=DM_Mebeli.DS_Pilomat_detali;
          Reopen_Tables;
          id_group:=0;
          id_listy:=0;
          id_detali:=0;
          P_Select.Visible:=False;
          Panel1.Visible:=True;
          for I := 0 to Mainmenu1.Items.Count-1 do
            Mainmenu1.Items.Items[I].Visible := True;
        end;//ELSE IF 'SELECT'
end;//proc

procedure TF_Pilomat.N_ExitClick(Sender: TObject);
begin
  Close;
end;//proc

procedure TF_Pilomat.N_Insert_detaliClick(Sender: TObject);
begin
  operation:='INSERT';
  id_group:=DM_Mebeli.IB_Pilomat_grupa.FieldByName('ID').AsInteger;
  id_listy:=DM_Mebeli.IB_Pilomat_listy.FieldByName('ID').AsInteger;
  id_detali:=DM_Mebeli.IB_Pilomat_detali.FieldByName('ID').AsInteger;
  F_Pilomat_detali.ShowModal;
  Reopen_Tables;
end;//proc

procedure TF_Pilomat.N_edit_detaliClick(Sender: TObject);
begin
  operation:='EDIT';
  id_group:=DM_Mebeli.IB_Pilomat_grupa.FieldByName('ID').AsInteger;
  id_listy:=DM_Mebeli.IB_Pilomat_listy.FieldByName('ID').AsInteger;
  id_detali:=DM_Mebeli.IB_Pilomat_detali.FieldByName('ID').AsInteger;
  F_Pilomat_detali.ShowModal;
  Reopen_Tables;
end;//proc

procedure TF_Pilomat.N_Delete_grupaClick(Sender: TObject);
begin
  IF MessageDlg('¬ы уверены, что хотите удалить группу?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       DM_Mebeli.IB_Pilomat_grupa.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;
end;//proc

procedure TF_Pilomat.N_Delete_listyClick(Sender: TObject);
begin
  IF MessageDlg('¬ы уверены, что хотите удалить лист?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     DM_Mebeli.IB_Pilomat_listy.Delete;
end;//proc

procedure TF_Pilomat.N_Delete_detaliClick(Sender: TObject);
begin
  id_group:=DM_Mebeli.IB_Pilomat_grupa.FieldByName('ID').AsInteger;
  id_listy:=DM_Mebeli.IB_Pilomat_listy.FieldByName('ID').AsInteger;
  id_detali:=DM_Mebeli.IB_Pilomat_detali.FieldByName('ID').AsInteger;
  IF MessageDlg('¬ы уверены, что хотите удалить деталь?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       DM_Mebeli.IB_Pilomat_detali.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       reopen_tables
     end;
end;//proc

procedure TF_Pilomat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM_Mebeli.IB_Pilomat_detali.Close;
  DM_Mebeli.IB_Pilomat_listy.Close;
  DM_Mebeli.IB_Pilomat_detali.SelectSQL[1] :='';
  DM_Mebeli.IB_Pilomat_listy.SelectSQL[1]:='';
  IB_Pilomat_Listy_F.Close;
  IB_Pilomat_Detali_F.Close;
  IB_Pilomat_grupa_F.Close;
end;//proc

procedure TF_Pilomat.DBG_GrupaDblClick(Sender: TObject);
begin
  IF operation<>'SELECT' Then
    N_edit_grupaClick(Sender);
end;//proc

procedure TF_Pilomat.DBG_ListyDblClick(Sender: TObject);
begin
  IF Pos('SELECT',operation)>0 Then
    B_SelectClick(Sender)
  ELSE
    N_edit_listyClick(Sender);
end;//proc

procedure TF_Pilomat.DBG_DetaliDblClick(Sender: TObject);
begin
  IF Pos('SELECT',operation)>0 Then
    B_SelectClick(Sender)
  ELSE
    N_edit_detaliClick(Sender);
end;//proc

procedure TF_Pilomat.DBG_ListyKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key=45 Then
    N_Insert_listyClick(sender);
  IF (Key=79) and (Shift=[ssCtrl]) Then //79 = Key 'O'
    N_edit_listyClick(Sender);
end;//proc

procedure TF_Pilomat.N1Click(Sender: TObject);
begin
  ShowMessage('Insert - добавить запись в текущую таблицу'+Chr(13)+'Ctrl+O - редактировать запись текущей таблицы');
end;//proc

procedure TF_Pilomat.DBG_GrupaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key=45 Then
    N_Insert_grupaClick(sender);
  IF (Key=KEY_O) and (Shift=[ssCtrl]) Then
    N_edit_grupaClick(Sender);
end;//proc

procedure TF_Pilomat.DBG_DetaliKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key=45 Then
    N_Insert_detaliClick(sender);
  IF (Key=KEY_O) and (Shift=[ssCtrl]) Then
    N_edit_detaliClick(Sender);
end;//proc

procedure TF_Pilomat.B_SelectClick(Sender: TObject);
begin
  id_detali:=IB_Pilomat_detali_F.FieldByName('ID').AsInteger;
  id_listy:=IB_Pilomat_listy_F.FieldByName('id').AsInteger;
  id_group:=IB_Pilomat_grupa_F.FieldByName('ID').AsInteger;
//  DM_Mebeli.IB_Pilomat_listy.Locate('ID',id_listy,[]);
  ModalResult:=mrOk;
end;//proc

procedure TF_Pilomat.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Pilomat);
end;

end.
