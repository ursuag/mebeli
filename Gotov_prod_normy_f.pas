unit Gotov_prod_normy_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, IBCustomDataSet, Grids, DBGrids,
  ExtCtrls, Menus, Buttons, Jpeg, DBTables, ExtDlgs, IB;

type
  TF_Gotov_prod_normy = class(TForm)
    Panel1: TPanel;
    B_Cancel: TButton;
    DBGrid3: TDBGrid;
    DBGR_FURNITURA: TDBGrid;
    DBGR_DETALI: TDBGrid;
    IB_Gotov_prod_1: TIBDataSet;
    IB_Gotov_prod_1ID: TIntegerField;
    IB_Gotov_prod_1DETALI_GRUPA: TIBStringField;
    IB_Gotov_prod_1DETALI_NAME: TIBStringField;
    IB_Gotov_prod_1KOL_VO: TIntegerField;
    IB_Gotov_prod_1ID_DETALI: TIntegerField;
    DS_Gotov_prod_1: TDataSource;
    IB_Gotov_prod_2: TIBDataSet;
    IB_Gotov_prod_2ID: TIntegerField;
    IB_Gotov_prod_2ID_FURNITURA: TIntegerField;
    IB_Gotov_prod_2FURNITURA_GRUPA: TIBStringField;
    IB_Gotov_prod_2FURNITURA_NAME: TIBStringField;
    IB_Gotov_prod_2KOL_VO: TIBBCDField;
    IB_Gotov_prod_2ED_IZM: TIBStringField;
    DS_Gotov_Prod_2: TDataSource;
    DBGrid1: TDBGrid;
    IB_Gotovprod_normy: TIBDataSet;
    DS_Gotovprod_normy: TDataSource;
    IB_Gotov_prod_vidrabot: TIBDataSet;
    DS_Gotov_prod_vidrabot: TDataSource;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N_Insert: TMenuItem;
    N_Copy: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N_Edit: TMenuItem;
    IB_Gotov_prod_vidrabotID: TIntegerField;
    IB_Gotov_prod_vidrabotNAME: TIBStringField;
    Label3: TLabel;
    DBL_Grupa: TDBLookupComboBox;
    Label1: TLabel;
    DBE_NAME: TDBEdit;
    Label4: TLabel;
    B_Save: TButton;
    Label5: TLabel;
    DBE_VES: TDBEdit;
    DBGrid2: TDBGrid;
    IB_GOTOV_PROD_CATEGORIES_NORMY: TIBDataSet;
    DS_GOTOV_PROD_CATEGORIES_NORMY: TDataSource;
    DS_Gotov_prod_0_E: TDataSource;
    IB_Gotov_prod_0_E: TIBDataSet;
    IB_Gotov_prod_0_EID: TIntegerField;
    IB_Gotov_prod_0_ENAME: TIBStringField;
    IB_Gotov_prod_0_EID_GRUPA: TIntegerField;
    IB_Gotov_prod_0_EID_CATEGORY: TIntegerField;
    IB_Gotov_prod_0_ECATEGORY_NAME: TStringField;
    IB_Gotov_prod_0_EGRUPA_NAME: TStringField;
    IB_Gotov_prod_0_EVES: TIBBCDField;
    N2: TMenuItem;
    N_Sign_Norma: TMenuItem;
    N_UnSign_Norma: TMenuItem;
    N6: TMenuItem;
    N_Who_Signed: TMenuItem;
    N_Signs_Log: TMenuItem;
    Label2: TLabel;
    IB_Gotov_prod_0_EID_LINKED_GOTOVPROD: TIntegerField;
    IB_Gotov_prod_0_ELINKED_GOTOVPROD: TStringField;
    DBL_Linked_gotovprod: TDBLookupComboBox;
    B_Linked_clear: TSpeedButton;
    IB_Gotov_prod_vidrabotCATEGORY_NAME: TIBStringField;
    IB_Gotov_prod_0_EARTICLE: TIntegerField;
    DBE_Article: TDBEdit;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    N7: TMenuItem;
    N_Load_image: TMenuItem;
    N_Delete_image: TMenuItem;
    M_Image: TPopupMenu;
    N_Load_image_popup: TMenuItem;
    N_Delete_image_popup: TMenuItem;
    IB_Image: TIBDataSet;
    DS_Image: TDataSource;
    dlgOpenPicture: TOpenPictureDialog;
    Panel2: TPanel;
    Gotovprod_image: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N_EditClick(Sender: TObject);
    procedure N_DeleteClick(Sender: TObject);
    procedure N_CopyClick(Sender: TObject);
    procedure B_SaveClick(Sender: TObject);
    procedure B_CancelClick(Sender: TObject);
    procedure DBE_NAMEExit(Sender: TObject);
    procedure N_InsertClick(Sender: TObject);
    procedure N_UnSign_NormaClick(Sender: TObject);
    procedure N_Sign_NormaClick(Sender: TObject);
    procedure N_Who_SignedClick(Sender: TObject);
    procedure N_Signs_LogClick(Sender: TObject);
    procedure B_Linked_clearClick(Sender: TObject);
    procedure IB_Gotov_prod_0_EBeforePost(DataSet: TDataSet);
    procedure MainMenu1Change(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure N_Load_imageClick(Sender: TObject);
    procedure N_Load_image_popupClick(Sender: TObject);
    procedure N_Delete_imageClick(Sender: TObject);
    procedure N_Delete_image_popupClick(Sender: TObject);
    procedure IB_ImageNewRecord(DataSet: TDataSet);
    procedure Image_fromDB;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  F_Gotov_prod_normy: TF_Gotov_prod_normy;
            id_norma: integer;
implementation

uses main_f, mebeli_dm, gotov_prod_f, gotov_prod_edit_f;

{$R *.dfm}

procedure reopen_tables;
begin
  F_Gotov_prod_normy.IB_Gotovprod_normy.ParamByName('id_gotov_prod').Value:=F_Gotov_prod.GotovProd_ID;
  F_Gotov_prod_normy.IB_Gotovprod_normy.Close;
  F_Gotov_prod_normy.IB_Gotov_prod_1.Close;
  F_Gotov_prod_normy.IB_Gotov_prod_2.Close;
  F_Gotov_prod_normy.IB_Gotov_prod_vidrabot.Close;
  F_Gotov_prod_normy.IB_GOTOV_PROD_CATEGORIES_NORMY.Close;

  F_Gotov_prod_normy.IB_Gotov_prod_0_E.ParamByname('id_gotov_prod').Value:=F_Gotov_prod.GotovProd_ID;
  F_Gotov_prod_normy.IB_Gotov_prod_0_E.Open;
  F_Gotov_prod_normy.IB_Gotovprod_normy.Open;
  F_Gotov_prod_normy.IB_Gotov_prod_1.Open;
  F_Gotov_prod_normy.IB_Gotov_prod_2.Open;
  F_Gotov_prod_normy.IB_Gotov_prod_vidrabot.Open;
  F_Gotov_prod_normy.IB_GOTOV_PROD_CATEGORIES_NORMY.Open;
  F_Gotov_prod_normy.IB_Gotovprod_normy.Locate('id',id_norma,[]);
end;

procedure TF_Gotov_prod_normy.Image_fromDB;
var
  Image : TJPEGImage;
  BLOB : TStream;
begin
  Gotovprod_image.Picture:=nil;
  IB_Image.Close;
  IB_Image.ParamByname('id_gotovprod').Value:=IB_Gotov_prod_0_E.FieldValues['id'];
  IB_Image.Open;
  if IB_Image.FieldByName('id').IsNull then
    exit;
  Image:=TJPEGImage.Create;
  blob := IB_Image.CreateBlobStream(IB_Image.FieldByName('image_jpg'), bmRead);
  Image.LoadFromStream(BLOB);
  Gotovprod_image.Picture.Bitmap.Assign(image);
  IB_Image.Close;
  Image.Free;
  Blob.Free;
end;


procedure TF_Gotov_prod_normy.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Gotov_prod_normy);
end;

procedure TF_Gotov_prod_normy.FormActivate(Sender: TObject);
begin
  IB_Gotov_prod_0_E.ParamByname('id_gotov_prod').Value:=F_Gotov_prod.GotovProd_ID;
  IB_Gotov_prod_0_E.Open;

  if operation='EDIT' then
    try
      IB_Gotov_prod_0_E.Edit;
    except
      on E: EDatabaseError do
        if Pos('Cannot modify a read-only dataset',E.Message)>1 then
          begin
            B_Save.Enabled:=false;
            MainMenu1.Items[0].Enabled:=false;
          end
    end;

  if operation='INSERT' then
    begin
      IB_Gotov_prod_0_E.Insert;
      IB_Gotov_prod_0_E.FieldByName('ID_GRUPA').Value:=DM_Mebeli.IB_Gotov_prod_grupa.FieldByName('ID').AsInteger;
      F_Gotov_prod.GotovProd_ID:=IB_Gotov_prod_0_E.FieldByName('ID').AsInteger;
    end;

  IB_Gotovprod_normy.ParamByName('id_gotov_prod').Value:=IB_Gotov_prod_0_E.FieldByName('id').AsInteger;
  reopen_tables;
  DBE_NAME.SetFocus;
  Image_fromDB;
end;

procedure TF_Gotov_prod_normy.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IB_Gotovprod_normy.Close;
  IB_Gotov_prod_0_E.Close;
  IB_Gotov_prod_1.Close;
  IB_Gotov_prod_2.Close;
  IB_Gotov_prod_vidrabot.Close;
  Gotovprod_image.Picture:=nil;
end;

procedure TF_Gotov_prod_normy.N_EditClick(Sender: TObject);
var ib_temp: TIBDataSet;
begin
  ib_temp:=TIBDataSet.Create(nil);
  ib_temp.Database:=DM_Mebeli.DB_Mebeli;
  ib_temp.SelectSQL.Add('select * from CHECK_IS_SIGNED(:in_table_name, :table_id)');
  ib_temp.ParamByName('in_table_name').Value:='GOTOVPROD_NORMY';
  ib_temp.ParamByName('table_id').value:=IB_Gotovprod_normy.FieldByName('id').AsInteger;
  ib_temp.Open;
  if ib_temp.FieldByname('is_signed').AsInteger+ib_temp.FieldByname('is_partially_signed').AsInteger=1 then
    begin
      ShowMessage('Норма подписана. Перед изменением удалите подписи!');
      ib_temp.Free;
      exit;
    end;
  ib_temp.Free;

  if (IB_Gotov_prod_0_E.State=dsInsert) or (IB_Gotov_prod_0_E.State=dsEdit) then IB_Gotov_prod_0_E.Post;
  operation:='EDIT';
  id_norma:=IB_Gotovprod_normy.FieldByName('id').AsInteger;
  F_Gotov_prod_edit.ShowModal;
  reopen_tables;
  DM_Mebeli.IB_Gotov_prod_grupa.Open;
end;

procedure TF_Gotov_prod_normy.N_DeleteClick(Sender: TObject);
var ib_temp: TIBDataSet;
begin
  ib_temp:=TIBDataSet.Create(nil);
  ib_temp.Database:=DM_Mebeli.DB_Mebeli;
  ib_temp.SelectSQL.Add('select * from CHECK_IS_SIGNED(:in_table_name, :table_id)');
  ib_temp.ParamByName('in_table_name').Value:='GOTOVPROD_NORMY';
  ib_temp.ParamByName('table_id').value:=IB_Gotovprod_normy.FieldByName('id').AsInteger;
  ib_temp.Open;
  if ib_temp.FieldByname('is_signed').AsInteger+ib_temp.FieldByname('is_partially_signed').AsInteger=1 then
    begin
      ShowMessage('Норма подписана. Перед удалением снимите подписи!');
      ib_temp.Free;
      exit;
    end;
  ib_temp.Free;

  IF MessageDlg('Вы уверены, что хотите удалить?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       IB_Gotovprod_normy.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//IF
end;

procedure TF_Gotov_prod_normy.N_CopyClick(Sender: TObject);
var ib_temp: TIBDataSet;
    id_new_norma: integer;
begin
  if (IB_Gotov_prod_0_E.State=dsInsert) or (IB_Gotov_prod_0_E.State=dsEdit) then IB_Gotov_prod_0_E.Post;
  if not DM_Mebeli.IBTransaction1.Active then DM_Mebeli.IBTransaction1.StartTransaction;

  ib_temp:=TIBDataSet.Create(nil);
  ib_temp.Database:=DM_Mebeli.DB_Mebeli;
  ib_temp.SelectSQL.Add('SELECT NEXT VALUE FOR gen_gotovprod_normy_id id FROM RDB$DATABASE');
  ib_temp.Open;
  id_new_norma:=ib_temp.FieldByname('id').AsInteger;
  ib_temp.Close;
  ib_temp.SelectSQL.Clear;
  ib_temp.SelectSQL.Add('insert into gotovprod_normy (id, date_nor, description, id_gotov_prod) values (:id, CURRENT_DATE, :description, :id_gotov_prod)');
  ib_temp.ParamByName('id').Value:=id_new_norma;
  ib_temp.ParamByName('description').Value:='Копия нормы от '+IB_Gotovprod_normy.FieldByName('date_nor').AsString;
  ib_temp.ParamByName('id_gotov_prod').Value:=IB_Gotov_prod_0_E.FieldByName('id').AsInteger;
  ib_temp.ExecSQL;

  ib_temp.SelectSQL.Clear;
  ib_temp.SelectSQL.Add('insert into gotov_prod_1 (id_detali, kol_vo, id_norma) select id_detali, kol_vo, :id_new_norma from gotov_prod_1 where id_norma=:id_old_norma');
  ib_temp.ParamByName('id_new_norma').Value:=id_new_norma;
  ib_temp.ParamByName('id_old_norma').Value:=IB_Gotovprod_normy.FieldByName('id').AsInteger;
  ib_temp.ExecSQL;

  ib_temp.SelectSQL.Clear;
  ib_temp.SelectSQL.Add('insert into gotov_prod_2 (id_furnitura, kol_vo, id_norma) select id_furnitura, kol_vo, :id_new_norma from gotov_prod_2 where id_norma=:id_old_norma');
  ib_temp.ParamByName('id_new_norma').Value:=id_new_norma;
  ib_temp.ParamByName('id_old_norma').Value:=IB_Gotovprod_normy.FieldByName('id').AsInteger;
  ib_temp.ExecSQL;

  ib_temp.SelectSQL.Clear;
  ib_temp.SelectSQL.Add('insert into gotov_prod_vidrabot (id_gotov_prod, id_vid_rabot, id_norma, id_category) select id_gotov_prod, id_vid_rabot, :id_new_norma, id_category from gotov_prod_vidrabot where id_norma=:id_old_norma');
  ib_temp.ParamByName('id_new_norma').Value:=id_new_norma;
  ib_temp.ParamByName('id_old_norma').Value:=IB_Gotovprod_normy.FieldByName('id').AsInteger;
  ib_temp.ExecSQL;

  if DM_Mebeli.IBTransaction1.Active then DM_Mebeli.IBTransaction1.Commit;
  reopen_tables;
end;

procedure TF_Gotov_prod_normy.B_SaveClick(Sender: TObject);
begin
  if (IB_Gotov_prod_0_E.State=dsEdit) or (IB_Gotov_prod_0_E.State=dsInsert) then IB_Gotov_prod_0_E.Post;
  IF DM_Mebeli.IBTransaction1.Active Then DM_Mebeli.IBTransaction1.Commit;
  F_Gotov_prod_normy.Close;
end;

procedure TF_Gotov_prod_normy.B_CancelClick(Sender: TObject);
begin
  IF DM_Mebeli.IBTransaction1.Active Then DM_Mebeli.IBTransaction1.Rollback;
  F_Gotov_prod_normy.Close;
end;

procedure TF_Gotov_prod_normy.DBE_NAMEExit(Sender: TObject);
begin
  if (IB_Gotov_prod_0_E.State=dsEdit) or (IB_Gotov_prod_0_E.State=dsInsert) then IB_Gotov_prod_0_E.Post;
end;

procedure TF_Gotov_prod_normy.N_InsertClick(Sender: TObject);
var ib_temp: TIBDataSet;
begin
  if (IB_Gotov_prod_0_E.State=dsInsert) or (IB_Gotov_prod_0_E.State=dsEdit) then IB_Gotov_prod_0_E.Post;

  if not DM_Mebeli.IBTransaction1.Active Then DM_Mebeli.IBTransaction1.StartTransaction;
  ib_temp:=TIBDataSet.Create(nil);
  ib_temp.Database:=DM_Mebeli.DB_Mebeli;
  ib_temp.SelectSQL.Add('SELECT NEXT VALUE FOR gen_gotovprod_normy_id id FROM RDB$DATABASE');
  ib_temp.Open;
  id_norma:=ib_temp.FieldByname('id').AsInteger;
  ib_temp.Close;
  ib_temp.SelectSQL.Clear;
  ib_temp.SelectSQL.Add('insert into gotovprod_normy (id, date_nor, id_gotov_prod) values (:id, current_date, :id_gotov_prod)');
  ib_temp.ParamByname('id').Value:=id_norma;
//  ib_temp.ParamByname('date_nor').Value:=Date;
  ib_temp.ParamByname('id_gotov_prod').Value:=F_Gotov_prod.GotovProd_ID;
  ib_temp.ExecSQL;
  ib_temp.Free;
  operation:='INSERT';
  IB_Gotovprod_normy.Close;
  IB_Gotovprod_normy.Open;
  IB_Gotovprod_normy.Locate('id',id_norma,[]);
  F_Gotov_prod_edit.ShowModal;
  reopen_tables;
end;

procedure TF_Gotov_prod_normy.N_UnSign_NormaClick(Sender: TObject);
var ib_sign: TIBDataSet;
begin
  if IB_Gotovprod_normy.FieldByName('id').IsNull then exit;
  id_norma:=IB_Gotovprod_normy.FieldByName('id').AsInteger;
  ib_sign:=TIBDataSet.Create(nil);
  ib_sign.Database:=DM_Mebeli.DB_Mebeli;
  ib_sign.SelectSQL.Add('delete from tables_signatures where (table_id= :table_id) and ');
  ib_sign.SelectSQL.Add('(table_name_id=(select id from tables_db where table_name=:table_name))');
  ib_sign.ParamByName('table_id').value:=IB_Gotovprod_normy.FieldByName('id').AsInteger;
  ib_sign.ParamByName('table_name').value:='GOTOVPROD_NORMY';
  ib_sign.ExecSQL;
  ib_sign.Close;
  ib_sign.Free;
  DM_Mebeli.IBTransaction1.Commit;
  reopen_tables;
end;

procedure TF_Gotov_prod_normy.N_Sign_NormaClick(Sender: TObject);
var ib_sign: TIBDataSet;
begin
  if IB_Gotovprod_normy.FieldByName('id').IsNull then exit;
  id_norma:=IB_Gotovprod_normy.FieldByName('id').AsInteger;
  ib_sign:=TIBDataSet.Create(nil);
  ib_sign.Database:=DM_Mebeli.DB_Mebeli;
  ib_sign.SelectSQL.Add('insert into tables_signatures (table_id, user_id, table_name_id)');
  ib_sign.SelectSQL.Add('values(:table_id, (select id from users_db where sys_username=current_user), (select id from tables_db where table_name=:table_name))');
  ib_sign.ParamByName('table_id').value:=IB_Gotovprod_normy.FieldByName('id').AsInteger;
  ib_sign.ParamByName('table_name').value:='GOTOVPROD_NORMY';
  ib_sign.ExecSQL;
  ib_sign.Close;
  ib_sign.Free;
  DM_Mebeli.IBTransaction1.Commit;
  reopen_tables;
end;

procedure TF_Gotov_prod_normy.N_Who_SignedClick(Sender: TObject);
var ib_current_signatures: TIBDataSet;
    memo1: TMemo;
begin
  memo1:=TMemo.Create(F_Gotov_prod_normy);
  memo1.Parent:=F_Gotov_prod_normy;

  ib_current_signatures:=TIBDataSet.Create(nil);
  ib_current_signatures.Database:=DM_Mebeli.DB_Mebeli;
  ib_current_signatures.SelectSQL.Add('select usr.name, ts.date_sign from tables_signatures ts, users_db usr');
  ib_current_signatures.SelectSQL.Add('where (ts.table_id= :table_id) and (ts.table_name_id=(select id from tables_db where table_name= :table_name))');
  ib_current_signatures.SelectSQL.Add('and (ts.user_id=usr.id) order by ts.date_sign');
  ib_current_signatures.ParamByName('table_id').Value:=IB_Gotovprod_normy.FieldByName('id').AsInteger;
  ib_current_signatures.ParamByName('table_name').value:='GOTOVPROD_NORMY';
  ib_current_signatures.Open;
  Memo1.Left:=0;
  Memo1.Top:=300;
  Memo1.Width:=600;
  Memo1.Height:=300;
  Memo1.ReadOnly:=true;
  Memo1.Font.Style:=[fsBold];
  Memo1.Lines.Add('Норма от: '+IB_Gotovprod_normy.FieldByName('date_nor').AsString);
  Memo1.Lines.Add('');

  if ib_current_signatures.FieldByName('name').IsNull then
    Memo1.Lines.Add('Норма никем не подписана');
  while not ib_current_signatures.Eof do
    begin
      Memo1.Lines.Add(ib_current_signatures.FieldByName('name').AsString+' '+ib_current_signatures.FieldByName('date_sign').AsString);
      ib_current_signatures.Next;
    end;
  ShowMessage('Закрыть');

  ib_current_signatures.Close;
  ib_current_signatures.Free;
  Memo1.Free;
end;

procedure TF_Gotov_prod_normy.N_Signs_LogClick(Sender: TObject);
var ib_signs_log: TIBDataSet;
    memo1: TMemo;
begin
  memo1:=TMemo.Create(F_Gotov_prod_normy);
  memo1.Parent:=F_Gotov_prod_normy;
  ib_signs_log:=TIBDataSet.Create(nil);
  ib_signs_log.Database:=DM_Mebeli.DB_Mebeli;

  Memo1.Left:=0;
  Memo1.Top:=300;
  Memo1.Width:=600;
  Memo1.Height:=300;
  Memo1.ReadOnly:=true;
  Memo1.Font.Style:=[fsBold];
  Memo1.Lines.Add('Журнал подписания нормы от: '+IB_Gotovprod_normy.FieldByName('date_nor').AsString);
  Memo1.Lines.Add('');

  ib_signs_log.SelectSQL.Add('select * from GET_SIGNS_LOG (:table_name, :table_id)');
  ib_signs_log.ParamByName('table_id').Value:=IB_Gotovprod_normy.FieldByName('id').AsInteger;
  ib_signs_log.ParamByName('table_name').value:='GOTOVPROD_NORMY';
  ib_signs_log.Open;
  while not ib_signs_log.Eof do
    begin
      Memo1.Lines.Add(ib_signs_log.FieldByName('user_name').AsString+', '+ib_signs_log.FieldByName('date_sign').AsString+', '+ib_signs_log.FieldByName('sign_action').AsString);
      ib_signs_log.Next;
    end;
  ShowMessage('Закрыть');
  
  ib_signs_log.Close;
  ib_signs_log.Free;
  Memo1.Free;
end;

procedure TF_Gotov_prod_normy.B_Linked_clearClick(Sender: TObject);
begin
  if IB_Gotov_prod_0_E.state<>dsEdit then
    IB_Gotov_prod_0_E.Edit;
  IB_Gotov_prod_0_E.FieldByName('id_linked_gotovprod').Value:=null;
end;

procedure TF_Gotov_prod_normy.IB_Gotov_prod_0_EBeforePost(
  DataSet: TDataSet);
begin
  if IB_Gotov_prod_0_E.FieldByName('id').AsInteger=IB_Gotov_prod_0_E.FieldByName('id_linked_gotovprod').AsInteger then
    begin
      ShowMessage('Нельзя связывать продукцию саму с собой!');
      Abort;
    end;
end;

procedure TF_Gotov_prod_normy.MainMenu1Change(Sender: TObject;
  Source: TMenuItem; Rebuild: Boolean);
begin
  if not IB_Gotov_prod_0_E.FieldByName('id_linked_gotovprod').IsNull then
    ShowMessage('Нормы берутся из связанного товара');
end;

procedure TF_Gotov_prod_normy.N_Load_imageClick(Sender: TObject);
var
  Image : TJPEGImage;
  BLOB : TStream;
  F: TFileStream;
begin
  if not dlgOpenPicture.Execute then exit;
  F:=TFileStream.Create(dlgOpenPicture.FileName, fmOpenRead);
  if F.Size>100000 then
    begin
      ShowMessage('Размер файла не должен превышать 100кб. Рекомендуемый максимальный размер 500x500px');
      F.Free;
      exit;
    end;
  F.Free;
  IB_Image.Close;
  IB_Image.ParamByname('id_gotovprod').Value:=IB_Gotov_prod_0_E.FieldValues['id'];
  IB_Image.Open;
  Image:=TJPEGImage.Create;
  if FileExists(dlgOpenPicture.FileName) then
      if IB_Image.fieldbyname('id').IsNull then
        begin
          image.LoadFromFile(dlgOpenPicture.FileName);
          IB_Image.Insert;
          IB_Image.FieldByName('image_jpg').Assign(image);
          IB_Image.Post;
          DM_Mebeli.Transaction_Images.Commit;
        end//if null
      else
        begin
          image.LoadFromFile(dlgOpenPicture.FileName);
          IB_Image.Edit;
          IB_Image.FieldByName('image_jpg').Assign(image);
          IB_Image.Post;
          DM_Mebeli.Transaction_Images.Commit;
        end;//else if null

  IB_Image.Close;
  IB_Image.ParamByname('id_gotovprod').Value:=IB_Gotov_prod_0_E.FieldValues['id'];
  IB_Image.Open;
  blob := IB_Image.CreateBlobStream(IB_Image.FieldByName('image_jpg'), bmRead);
  Image.LoadFromStream(BLOB);
  Gotovprod_image.Picture.Bitmap.Assign(image);
  Image.Free;
  Blob.Free;
end;

procedure TF_Gotov_prod_normy.N_Load_image_popupClick(Sender: TObject);
begin
  N_Load_imageClick(Sender);
end;

procedure TF_Gotov_prod_normy.N_Delete_imageClick(Sender: TObject);
begin
  IB_Image.Close;
  IB_Image.ParamByname('id_gotovprod').Value:=IB_Gotov_prod_0_E.FieldValues['id'];
  IB_Image.Open;
  IB_Image.Delete;
  image_fromDB;
end;

procedure TF_Gotov_prod_normy.N_Delete_image_popupClick(Sender: TObject);
begin
  N_Delete_imageClick(Sender);
end;

procedure TF_Gotov_prod_normy.IB_ImageNewRecord(DataSet: TDataSet);
begin
  IB_Image.FieldByname('id_gotovprod').Value:=IB_Gotov_prod_0_E.FieldValues['id'];
  if IB_Gotov_prod_0_E.FieldByname('article').IsNull then
    IB_Image.FieldByname('article').Value:=null
  else
    IB_Image.FieldByname('article').Value:=IB_Gotov_prod_0_E.FieldByname('article').AsInteger;
end;

end.

