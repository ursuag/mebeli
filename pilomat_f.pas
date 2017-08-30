unit pilomat_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGrids, StdCtrls, ExtCtrls, DB, IBCustomDataSet,
  DBCtrls, ComObj;

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
    E_Grupa_Search: TEdit;
    E_Detali_Search: TEdit;
    E_Listy_Search: TEdit;
    N1: TMenuItem;
    N_Import_listy: TMenuItem;
    N_Import_detali: TMenuItem;
    OpenDialog1: TOpenDialog;
    N2: TMenuItem;
    N_Import_grupa_name: TMenuItem;
    PM_Add_detali_in_list: TPopupMenu;
    N_Add_detali_to_List: TMenuItem;
    N3: TMenuItem;
    N_Add_grupa_to_List: TMenuItem;
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
    procedure E_Grupa_SearchEnter(Sender: TObject);
    procedure E_Grupa_SearchExit(Sender: TObject);
    procedure E_Grupa_SearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_Listy_SearchEnter(Sender: TObject);
    procedure E_Listy_SearchExit(Sender: TObject);
    procedure E_Listy_SearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_Detali_SearchEnter(Sender: TObject);
    procedure E_Detali_SearchExit(Sender: TObject);
    procedure E_Detali_SearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N_Import_listyClick(Sender: TObject);
    procedure N_Import_detaliClick(Sender: TObject);
    procedure N_Import_grupa_nameClick(Sender: TObject);
    procedure N_Add_detali_to_ListClick(Sender: TObject);
    procedure PM_Add_detali_in_listPopup(Sender: TObject);
    procedure N_Add_grupa_to_ListClick(Sender: TObject);
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
procedure detali_add_to_list;
var detali_select: TIBDataSet;
begin
  detali_select:=TIBDataSet.Create(nil);
  detali_select.Database:=DM_Mebeli.IB_Sklad.Database;
  detali_select.SelectSQL.Add('update or insert into DETALI_LIST_FOR_REPORT (id_detali) values (:id_detali) matching (id_detali)');
  detali_select.ParamByName('id_detali').Value:=F_Pilomat.IB_Pilomat_detali_F.FieldByName('id').AsInteger;
  try
    detali_select.ExecSQL;
  finally
    detali_select.Free;
  end;
end;

procedure grupa_add_to_list;
var detali_select: TIBDataSet;
begin
  detali_select:=TIBDataSet.Create(nil);
  detali_select.Database:=DM_Mebeli.IB_Sklad.Database;
  detali_select.SelectSQL.Add('merge into DETALI_LIST_FOR_REPORT detl');
  detali_select.SelectSQL.Add('using (select id from pilomat_detali where id_grupa=:id_grupa) pd');
  detali_select.SelectSQL.Add('on detl.id_detali = pd.id');
  detali_select.SelectSQL.Add('when matched then');
  detali_select.SelectSQL.Add('update set detl.id_detali = pd.id');
  detali_select.SelectSQL.Add('when not matched then insert (id_detali) values (pd.id)');
  detali_select.ParamByName('id_grupa').Value:=F_Pilomat.IB_Pilomat_grupa_F.FieldByName('id').AsInteger;
  try
    detali_select.ExecSQL;
  finally
    detali_select.Free;
  end;
end;

procedure Reopen_Tables;
begin
  DM_Mebeli.IB_Pilomat_grupa.Close;
  DM_Mebeli.IB_Pilomat_listy.Close;
  DM_Mebeli.IB_Pilomat_detali.Close;
  F_Pilomat.IB_Pilomat_grupa_F.Close;
  F_Pilomat.IB_Pilomat_listy_F.Close;
  F_Pilomat.IB_Pilomat_detali_F.Close;

  if F_Pilomat.E_Grupa_Search.Text='Отфильтровать группу' then
    begin
      DM_Mebeli.IB_Pilomat_grupa.ParamByname('grupa_name').Value:='%%';
      F_Pilomat.IB_Pilomat_grupa_F.ParamByname('grupa_name').Value:='%%'
    end
  else
    begin
      DM_Mebeli.IB_Pilomat_grupa.ParamByname('grupa_name').Value:='%'+F_Pilomat.E_Grupa_Search.Text+'%';
      F_Pilomat.IB_Pilomat_grupa_F.ParamByname('grupa_name').Value:='%'+F_Pilomat.E_Grupa_Search.Text+'%';
    end;

  if F_Pilomat.E_Listy_Search.Text='Отфильтровать листы' then
    begin
      DM_Mebeli.IB_Pilomat_listy.ParamByname('listy_name').Value:='%%';
      F_Pilomat.IB_Pilomat_listy_F.ParamByname('listy_name').Value:='%%'
    end
  else
    begin
      DM_Mebeli.IB_Pilomat_listy.ParamByname('listy_name').Value:='%'+F_Pilomat.E_listy_Search.Text+'%';
      F_Pilomat.IB_Pilomat_listy_F.ParamByname('listy_name').Value:='%'+F_Pilomat.E_listy_Search.Text+'%';
    end;

  if F_Pilomat.E_Detali_Search.Text='Отфильтровать детали' then
    begin
      DM_Mebeli.IB_Pilomat_Detali.ParamByname('detali_name').Value:='%%';
      F_Pilomat.IB_Pilomat_Detali_F.ParamByname('detali_name').Value:='%%'
    end
  else
    begin
      DM_Mebeli.IB_Pilomat_Detali.ParamByname('detali_name').Value:='%'+F_Pilomat.E_Detali_Search.Text+'%';
      F_Pilomat.IB_Pilomat_Detali_F.ParamByname('detali_name').Value:='%'+F_Pilomat.E_detali_Search.Text+'%';
    end;

  DM_Mebeli.IB_Pilomat_grupa.Open;
  DM_Mebeli.IB_Pilomat_listy.Open;
  DM_Mebeli.IB_Pilomat_detali.Open;
  DM_Mebeli.IB_Pilomat_grupa.Locate('ID',F_Pilomat.id_group,[]);
  DM_Mebeli.IB_Pilomat_listy.Locate('ID',F_Pilomat.id_listy,[]);
  DM_Mebeli.IB_Pilomat_detali.Locate('ID',F_Pilomat.id_detali,[]);
  F_Pilomat.IB_Pilomat_grupa_F.Open;
  F_Pilomat.IB_Pilomat_listy_F.Open;
  F_Pilomat.IB_Pilomat_detali_F.Open;
  if pos('SELECT',operation)>0 then
    begin
      F_Pilomat.IB_Pilomat_grupa_F.Locate('ID',F_Pilomat.id_group,[]);
      F_Pilomat.IB_Pilomat_listy_F.Locate('ID',F_Pilomat.id_listy,[]);
      F_Pilomat.IB_Pilomat_detali_F.Locate('ID',F_Pilomat.id_detali,[]);
    end;
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
  DM_Mebeli.IB_Pilomat_listy.SelectSQL[1]:='where (id_grupa=:ID) and (Upper(name) like Upper(:listy_name))';
  DM_Mebeli.IB_Pilomat_detali.SelectSQL[1]:='where (id_grupa=:ID) and (Upper(name) like Upper(:detali_name))';

  IF operation='SELECT_STOCKS' Then
    begin
      DBG_Grupa.DataSource:=DS_Pilomat_grupa_F;
      DBG_Listy.DataSource:=DS_Pilomat_Listy_F;
      DBG_Detali.DataSource:=DS_Pilomat_Detali_F;

      IB_Pilomat_grupa_F.SelectSQL.Clear;
      IB_Pilomat_grupa_F.SelectSQL.Add('select pg.id, pg.article article, pg.name from pilomat_grupa pg');
      IB_Pilomat_grupa_F.SelectSQL.Add('where (exists (select list_id from GET_LISTY_ESTI_OSTATOK(pg.id)))');
      IB_Pilomat_grupa_F.SelectSQL.Add('and (Upper(name) like upper(:grupa_name)) order by pg.name');

      IB_Pilomat_listy_F.SelectSQL.Clear;
      IB_Pilomat_listy_F.SelectSQL.Add('select list_id id, list_name name, list_ostatok');
      IB_Pilomat_listy_F.SelectSQL.Add('from GET_LISTY_ESTI_OSTATOK(:id) where upper(list_name) like upper(:listy_name)');
      IB_Pilomat_listy_F.SelectSQL.Add('order by list_name');

      IB_Pilomat_grupa_F.ParamByname('grupa_name').Value:='%%';
      IB_Pilomat_listy_F.ParamByname('listy_name').Value:='%%';
      IB_Pilomat_detali_F.ParamByname('detali_name').Value:='%%';

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
    IF (operation='SELECT') or (operation='SELECT_FOR_LIST') Then
      begin
        DBG_Grupa.DataSource:=DS_Pilomat_grupa_F;
        DBG_Listy.DataSource:=DS_Pilomat_Listy_F;
        DBG_Detali.DataSource:=DS_Pilomat_Detali_F;

        IB_Pilomat_grupa_F.SelectSQL.Clear;
        IB_Pilomat_grupa_F.SelectSQL.Add('select * from pilomat_grupa where Upper(name) like upper(:grupa_name) order by name');
        IB_Pilomat_grupa_F.ParamByName('grupa_name').Value:='%%';
        IB_Pilomat_listy_F.SelectSQL.Clear;
        IB_Pilomat_listy_F.SelectSQL.Add('select * from pilomat_listy where (id_grupa=:id) and (upper(name) like upper(:listy_name)) order by name');
        IB_Pilomat_grupa_F.ParamByname('grupa_name').Value:='%%';
        IB_Pilomat_listy_F.ParamByname('listy_name').Value:='%%';
        IB_Pilomat_detali_F.ParamByname('detali_name').Value:='%%';

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
          DM_Mebeli.IB_Pilomat_grupa.ParamByName('grupa_name').Value:='%%';
          DM_Mebeli.IB_Pilomat_listy.ParamByName('listy_name').Value:='%%';
          DM_Mebeli.IB_Pilomat_detali.ParamByName('detali_name').Value:='%%';
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
  IF MessageDlg('Вы уверены, что хотите удалить группу?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       DM_Mebeli.IB_Pilomat_grupa.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;
end;//proc

procedure TF_Pilomat.N_Delete_listyClick(Sender: TObject);
begin
  IF MessageDlg('Вы уверены, что хотите удалить лист?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     DM_Mebeli.IB_Pilomat_listy.Delete;
end;//proc

procedure TF_Pilomat.N_Delete_detaliClick(Sender: TObject);
begin
  id_group:=DM_Mebeli.IB_Pilomat_grupa.FieldByName('ID').AsInteger;
  id_listy:=DM_Mebeli.IB_Pilomat_listy.FieldByName('ID').AsInteger;
  id_detali:=DM_Mebeli.IB_Pilomat_detali.FieldByName('ID').AsInteger;
  IF MessageDlg('Вы уверены, что хотите удалить деталь?',mtWarning,[mbOk,mbNo],0)=mrOk Then
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
  IF (operation='SELECT') or (operation='SELECT_STOCKS') Then
    B_SelectClick(Sender);
  if operation='' then
    N_edit_listyClick(Sender);
end;//proc

procedure TF_Pilomat.DBG_DetaliDblClick(Sender: TObject);
begin
  if operation='SELECT_FOR_LIST' Then
    detali_add_to_list;
  if (operation='SELECT') or (operation='SELECT_STOCKS') then
    B_SelectClick(Sender);
  if operation='' then
    N_edit_detaliClick(Sender);
end;//proc

procedure TF_Pilomat.DBG_ListyKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key=45 Then
    N_Insert_listyClick(sender);
  IF (Key=79) and (Shift=[ssCtrl]) Then //79 = Key 'O'
    N_edit_listyClick(Sender);
  IF (Key=13) and (operation='SELECT') Then
    B_SelectClick(Sender);
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
  IF  (key=13) and (operation='SELECT') Then
    B_SelectClick(Sender);
end;//proc

procedure TF_Pilomat.B_SelectClick(Sender: TObject);
begin
  id_detali:=IB_Pilomat_detali_F.FieldByName('ID').AsInteger;
  id_listy:=IB_Pilomat_listy_F.FieldByName('id').AsInteger;
  id_group:=IB_Pilomat_grupa_F.FieldByName('ID').AsInteger;
  ModalResult:=mrOk;
end;//proc

procedure TF_Pilomat.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Pilomat);
end;

procedure TF_Pilomat.E_Grupa_SearchEnter(Sender: TObject);
begin
  if E_Grupa_Search.Text='Отфильтровать группу' then
    E_Grupa_Search.Text:='';
end;

procedure TF_Pilomat.E_Grupa_SearchExit(Sender: TObject);
begin
  if E_Grupa_Search.Text='' then
    E_Grupa_Search.Text:='Отфильтровать группу';
end;

procedure TF_Pilomat.E_Grupa_SearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    begin
      if E_Grupa_Search.text='' then
        begin
          DM_Mebeli.IB_Pilomat_grupa.ParamByName('grupa_name').Value:='%%';
          IB_Pilomat_grupa_F.ParamByName('grupa_name').Value:='%%';
        end
      else
        begin
          DM_Mebeli.IB_Pilomat_grupa.ParamByName('grupa_name').Value:='%'+E_Grupa_Search.text+'%';
          IB_Pilomat_grupa_F.ParamByName('grupa_name').Value:='%'+E_Grupa_Search.text+'%';
          DM_Mebeli.IB_Pilomat_listy.ParamByName('listy_name').Value:='%%';
          DM_Mebeli.IB_Pilomat_detali.ParamByName('detali_name').Value:='%%';
        end;
      reopen_tables;
    end;

  if key=27 then
    begin
      DM_Mebeli.IB_Pilomat_grupa.ParamByName('grupa_name').Value:='%%';
      IB_Pilomat_grupa_F.ParamByName('grupa_name').Value:='%%';
      E_Grupa_Search.text:='';
      reopen_tables;
    end
end;

procedure TF_Pilomat.E_Listy_SearchEnter(Sender: TObject);
begin
  if E_Listy_Search.Text='Отфильтровать листы' then
    E_Listy_Search.Text:='';
end;

procedure TF_Pilomat.E_Listy_SearchExit(Sender: TObject);
begin
  if E_Listy_Search.Text='' then
    E_Listy_Search.Text:='Отфильтровать листы';
end;

procedure TF_Pilomat.E_Listy_SearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    begin
      if E_Listy_Search.text='' then
        begin
          DM_Mebeli.IB_Pilomat_listy.ParamByName('listy_name').Value:='%%';
          IB_Pilomat_listy_F.ParamByName('listy_name').Value:='%%';
        end
      else
        begin
          DM_Mebeli.IB_Pilomat_listy.ParamByName('listy_name').Value:='%'+E_Listy_Search.text+'%';
          IB_Pilomat_listy_F.ParamByName('listy_name').Value:='%'+E_Listy_Search.text+'%';
        end;
      reopen_tables;
    end;

  if key=27 then
    begin
      DM_Mebeli.IB_Pilomat_listy.ParamByName('listy_name').Value:='%%';
      IB_Pilomat_listy_F.ParamByName('listy_name').Value:='%%';
      E_Listy_Search.text:='';
      reopen_tables;
    end
end;

procedure TF_Pilomat.E_Detali_SearchEnter(Sender: TObject);
begin
  if E_Detali_Search.Text='Отфильтровать детали' then
    E_Detali_Search.Text:='';
end;

procedure TF_Pilomat.E_Detali_SearchExit(Sender: TObject);
begin
  if E_Detali_Search.Text='' then
    E_Detali_Search.Text:='Отфильтровать детали';
end;

procedure TF_Pilomat.E_Detali_SearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    begin
      if E_Detali_Search.text='' then
        begin
          DM_Mebeli.IB_Pilomat_detali.ParamByName('detali_name').Value:='%%';
          IB_Pilomat_detali_F.ParamByName('detali_name').Value:='%%';
        end
      else
        begin
          DM_Mebeli.IB_Pilomat_detali.ParamByName('detali_name').Value:='%'+E_Detali_Search.text+'%';
          IB_Pilomat_detali_F.ParamByName('detali_name').Value:='%'+E_Detali_Search.text+'%';
        end;
      reopen_tables;
    end;

  if key=27 then
    begin
      DM_Mebeli.IB_Pilomat_detali.ParamByName('detali_name').Value:='%%';
      IB_Pilomat_detali_F.ParamByName('detali_name').Value:='%%';
      E_detali_Search.text:='';
      reopen_tables;
    end
end;

procedure TF_Pilomat.N_Import_listyClick(Sender: TObject);
var
         s: string;
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
  FIB_Query.SelectSQL.Add('insert into pilomat_listy (id, id_grupa, razmer_x, razmer_y, name, islist)');
  FIB_Query.SelectSQL.Add('values (:id, :id_grupa, :razmer_x, :razmer_y, :name, :islist)');

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
      FIB_Query.ParamByName('id').Value:=s;
      s:=Excel.Cells[j, 2];
      FIB_Query.ParamByName('id_grupa').Value:=s;
      s:=Excel.Cells[j, 3];
      FIB_Query.ParamByName('name').Value:=s;
      s:=Excel.Cells[j, 4];
      FIB_Query.ParamByName('razmer_x').Value:=StrToInt(s);
      s:=Excel.Cells[j, 5];
      FIB_Query.ParamByName('razmer_y').Value:=StrToInt(s);
      s:=Excel.Cells[j, 6];
      FIB_Query.ParamByName('islist').Value:=StrToInt(s);


      FIB_Listy.ParamByname('id_listy').Value:=FIB_Query.ParamByName('id').AsInteger;
      FIB_Listy.Open;
      if FIB_Listy.FieldByname('id').IsNull then
         FIB_Query.ExecSQL;
  
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

procedure TF_Pilomat.N_Import_detaliClick(Sender: TObject);
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
  FIB_Query.SelectSQL.Add('insert into pilomat_detali (id, id_grupa, razmer_x, razmer_y, name)');
  FIB_Query.SelectSQL.Add('values (:id, :id_grupa, :razmer_x, :razmer_y, :name)');

  FIB_Listy.SelectSQL.Clear;
  FIB_Listy.SelectSQL.Add('select id from pilomat_detali where id= :id_detali');

  F_Main.IBQuery1.Close;
  F_Main.IBQuery1.SQL.Clear;
  F_Main.IBQuery1.SQL.Add('select id from pilomat_grupa where name= :grupa_name');

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
      FIB_Query.ParamByName('id').Value:=s;
      s:=Excel.Cells[j, 2];
      FIB_Query.ParamByName('id_grupa').Value:=s;
      s:=Excel.Cells[j, 3];
      FIB_Query.ParamByName('razmer_x').Value:=StrToInt(s);
      s:=Excel.Cells[j, 4];
      FIB_Query.ParamByName('razmer_y').Value:=StrToInt(s);
      s:=Excel.Cells[j, 5];
      FIB_Query.ParamByName('name').Value:=s;

      FIB_Listy.ParamByname('id_detali').Value:=FIB_Query.ParamByName('id').AsInteger;
      FIB_Listy.Open;
      if not FIB_Listy.FieldByname('id').IsNull then
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

procedure TF_Pilomat.N_Import_grupa_nameClick(Sender: TObject);
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
  FIB_Query.SelectSQL.Add('update pilomat_grupa set name=:grupa_name, manufacturer_code=:manufacturer_code where article=:article');

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
      FIB_Query.ParamByName('grupa_name').Value:=s;
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

procedure TF_Pilomat.N_Add_detali_to_ListClick(Sender: TObject);
begin
  detali_add_to_list;
end;

procedure TF_Pilomat.PM_Add_detali_in_listPopup(Sender: TObject);
begin
  PM_Add_detali_in_list.Items[0].Enabled:=true;
  PM_Add_detali_in_list.Items[2].Enabled:=true;
  if F_Pilomat.ActiveControl=DBG_Grupa then
    PM_Add_detali_in_list.Items[0].Enabled:=false;
  if F_Pilomat.ActiveControl=DBG_Detali then
    PM_Add_detali_in_list.Items[2].Enabled:=false;
end;

procedure TF_Pilomat.N_Add_grupa_to_ListClick(Sender: TObject);
begin
  grupa_add_to_list;
end;

end.
