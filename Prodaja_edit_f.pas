unit Prodaja_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ExtCtrls, DB,
  IBCustomDataSet, StrUtils, Menus;

type
  TF_Prodaja_edit = class(TForm)
    P_Shapka: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    DBE_NOMER: TDBEdit;
    DBE_Date_pro: TDBEdit;
    DBL_Contragent: TDBLookupComboBox;
    DBE_Description: TDBEdit;
    DBG_Gotovprod: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    IB_Prodaja_0_edit: TIBDataSet;
    DS_Prodaja_0_edit: TDataSource;
    IB_Prodaja_0_editID: TIntegerField;
    IB_Prodaja_0_editDATE_PRO: TDateField;
    IB_Prodaja_0_editID_CONTRAGENT: TIntegerField;
    IB_Prodaja_0_editPRIMECHANIE: TIBStringField;
    IB_Prodaja_0_editKONTRAGENT_NAME: TStringField;
    IB_Prodaja_1_edit: TIBDataSet;
    DS_Prodaja_1_edit: TDataSource;
    IB_Prodaja_1_editID: TIntegerField;
    IB_Prodaja_1_editID_PARENT: TIntegerField;
    IB_Prodaja_1_editID_GOTOV_PROD: TIntegerField;
    IB_Prodaja_1_editKOL_VO: TIntegerField;
    IB_Prodaja_1_editID_ZAKAZ: TIntegerField;
    IB_Prodaja_1_editPRICE: TIBBCDField;
    IB_Prodaja_1_editSEBESTOIMOSTI: TIBBCDField;
    IB_Prodaja_1_editSUMMA: TFloatField;
    IB_Prodaja_1_editGRUPA_NAME: TStringField;
    IB_Prodaja_1_editGOTOVPROD_NAME: TStringField;
    IB_Prodaja_1_editARTICLE: TIntegerField;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N_Sign: TMenuItem;
    L_Signed: TLabel;
    N_UnSign: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure DBG_GotovprodEditButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IB_Prodaja_1_editNewRecord(DataSet: TDataSet);
    procedure IB_Prodaja_1_editBeforePost(DataSet: TDataSet);
    procedure IB_Prodaja_1_editPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure B_OkClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure DBG_GotovprodKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure IB_Prodaja_1_editCalcFields(DataSet: TDataSet);
    procedure N_SignClick(Sender: TObject);
    procedure N_UnSignClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Prodaja_edit: TF_Prodaja_edit;
      OK_Pressed: boolean;
       is_signed: boolean;
     is_ReadOnly: boolean;
implementation

uses main_f, mebeli_dm, Prodaja_jurnal_f, Zakaz_Gotovprod_Ostatok_f;

{$R *.dfm}

procedure TF_Prodaja_edit.FormActivate(Sender: TObject);
var
  ib_tmp:TIBDataSet;
begin
  L_Signed.Visible:=false;
  is_signed:=false;
  if role_name='DEPOZITAR' then
    begin
      is_ReadOnly:=true;
      DBG_Gotovprod.Columns[5].Visible:=false;
      DBG_Gotovprod.Columns[6].Visible:=false;
    end
  else
    is_ReadOnly:=false;

  IF operation='EDIT' Then
    begin
      IB_Prodaja_0_edit.ParamByName('id_prodaja').Value:=F_Prodaja_jurnal.IB_Prodaja_0.FieldByName('nomer_akt').AsInteger;
      IB_Prodaja_0_edit.Open;
      IB_Prodaja_1_edit.Open;
      IB_Prodaja_0_edit.Edit;

      ib_tmp:=TIBDataSet.Create(nil);
      ib_tmp.Database:=DM_Mebeli.DB_Mebeli;
      ib_tmp.SelectSQL.Add('select (is_signed+is_partially_signed) signed from CHECK_IS_SIGNED(:table_name,:id_doc)');
      ib_tmp.ParamByName('table_name').AsString:='PRODAJA_GOTOVPROD_0';
      ib_tmp.ParamByName('id_doc').AsInteger:=IB_Prodaja_0_edit.FieldByName('id').AsInteger;
      ib_tmp.Open;
      if ib_tmp.FieldByName('signed').AsInteger>0 then
        begin
          L_Signed.Visible:=true;
          is_signed:=true;
        end;
      ib_tmp.close;
      ib_tmp.Free;
    end;
  IF (operation='INSERT') Then
    begin
      IB_Prodaja_0_edit.Open;
      IB_Prodaja_1_edit.Open;
      IB_Prodaja_0_edit.Insert;
      IB_Prodaja_0_edit.FieldByName('date_pro').Value:=Date;
    end;

  if is_ReadOnly then
    begin
      DBE_Date_pro.Enabled:=false;
      DBL_Contragent.Enabled:=false;
      DBE_Description.Enabled:=false;
      DBG_Gotovprod.ReadOnly:=true;
      B_Ok.Enabled:=false;
    end;
  if is_Signed then
    begin
      DBE_Date_pro.Enabled:=false;
      DBL_Contragent.Enabled:=false;
      DBE_Description.Enabled:=false;
      DBG_Gotovprod.ReadOnly:=false;
      B_Ok.Enabled:=true;
    end;

  if (not is_ReadOnly) and (not is_Signed) then
    begin
      DBE_Date_pro.Enabled:=true;
      DBL_Contragent.Enabled:=true;
      DBE_Description.Enabled:=true;
      DBG_Gotovprod.ReadOnly:=false;
      B_Ok.Enabled:=true;
    end;

  DM_Mebeli.IB_Contragenty_1.Open;
  OK_Pressed:=False;
  IF (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    DBE_Date_pro.ReadOnly:=true;
end;//

procedure TF_Prodaja_edit.DBG_GotovprodEditButtonClick(Sender: TObject);
begin
  if is_signed or is_ReadOnly then exit;
  IF F_Zakaz_Gotovprod_Ostatok.ShowModal<>mrOk Then exit;
  IB_Prodaja_1_edit.Edit;
  IB_Prodaja_1_edit.FieldByName('id_zakaz').Value:=F_Zakaz_Gotovprod_Ostatok.IB_Zakaz_Gotovprod_Ostatok.FieldByName('id_zakaz').AsInteger;
  IB_Prodaja_1_edit.FieldByName('id_gotov_prod').Value:=F_Zakaz_Gotovprod_Ostatok.IB_Zakaz_Gotovprod_Ostatok.FieldByName('id_gotovprod').AsInteger;
  IB_Prodaja_1_edit.FieldByName('kol_vo').Value:=F_Zakaz_Gotovprod_Ostatok.IB_Zakaz_Gotovprod_Ostatok.FieldByName('ostatok').AsInteger;
  IB_Prodaja_1_edit.Post;
  F_Zakaz_Gotovprod_Ostatok.IB_ZAKAZ_GOTOVPROD_OSTATOK.Close;
end;//proc

procedure TF_Prodaja_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var res:TModalResult;
begin
  if is_ReadOnly then
    if DM_Mebeli.IBTransaction1.Active then DM_Mebeli.IBTransaction1.RollBack;

  if not DM_Mebeli.IBTransaction1.Active then exit;

  IF OK_Pressed Then
    begin
      IB_Prodaja_0_edit.Close;
      IB_Prodaja_1_edit.Close;
      F_Zakaz_Gotovprod_Ostatok.IB_ZAKAZ_GOTOVPROD_OSTATOK.Close;
      exit;
    end;
  res:=MessageDlg('—охранить изменени€?',mtConfirmation,[mbYes,mbNo,mbCancel],0);
  IF res=mrCancel Then
     begin
      Action:=caNone;
      exit;
     end;
  IF res=mrNo Then
     IF DM_Mebeli.IBTransaction1.Active Then
        DM_Mebeli.IBTransaction1.Rollback;
  IF res=mrYes Then
    begin
      ok_pressed:=true;
      IF DM_Mebeli.IBTransaction1.Active Then
         begin
            IF (IB_Prodaja_0_edit.State=dsEdit) OR (IB_Prodaja_0_edit.State=dsInsert) Then
               IB_Prodaja_0_edit.Post;
            IF (IB_Prodaja_1_edit.State=dsEdit) OR (IB_Prodaja_1_edit.State=dsInsert) Then
               IB_Prodaja_1_edit.Post;
            DM_Mebeli.IBTransaction1.Commit
         end;//IF DM_Mebeli.IBTransaction1.Active
    end;//IF res=mrYes
    IB_Prodaja_0_edit.Close;
    IB_Prodaja_1_edit.Close;
    F_Zakaz_Gotovprod_Ostatok.IB_ZAKAZ_GOTOVPROD_OSTATOK.Close;
end;//proc

procedure TF_Prodaja_edit.IB_Prodaja_1_editNewRecord(DataSet: TDataSet);
begin
  IB_Prodaja_1_edit.FieldByName('id_parent').Value:=IB_Prodaja_0_edit.FieldByName('id').AsInteger;
end;

procedure TF_Prodaja_edit.IB_Prodaja_1_editBeforePost(DataSet: TDataSet);
begin
  IF IB_Prodaja_1_edit.FieldByName('id_parent').IsNull Then
    IB_Prodaja_1_edit.FieldByName('id_parent').Value:=IB_Prodaja_0_edit.FieldByName('id').AsInteger;
end;//proc

procedure TF_Prodaja_edit.IB_Prodaja_1_editPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var errmsg: string;
begin
  IF AnsiContainsText(E.Message,'UNIQUE')=True Then
    errmsg:='Ќельз€ выбрать две одинаковые позиции из одного заказа!'
  ELSE
    begin
      errmsg:=Copy(E.Message,Pos('~',E.Message)+1,Length(E.Message)-Pos('~',E.Message));
      errmsg:=Copy(errmsg,1,Pos('~',errmsg)-1);
    end;
  ShowMessage(errmsg);
  Action:=daAbort;
end;//proc

procedure TF_Prodaja_edit.B_OkClick(Sender: TObject);
begin
  IF (IB_Prodaja_0_edit.FieldByName('DATE_PRO').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      DM_Mebeli.IBTransaction1.Rollback;
      OK_Pressed:=True;
      close;
    end;//IF DataZapretaRedakt

  IF DM_Mebeli.IBTransaction1.Active Then
     begin
       IF (IB_Prodaja_0_edit.State=dsEdit) OR (IB_Prodaja_0_edit.State=dsInsert) Then
          IB_Prodaja_0_edit.Post;
       IF (IB_Prodaja_1_edit.State=dsEdit) OR (IB_Prodaja_1_edit.State=dsInsert) Then
          IB_Prodaja_1_edit.Post;
       DM_Mebeli.IBTransaction1.Commit;
       OK_Pressed:=True;
       close;
     end;//IF
end;//proc

procedure TF_Prodaja_edit.B_ExitClick(Sender: TObject);
begin
  OK_Pressed:=FALSE;
  Close;
end;//proc

procedure TF_Prodaja_edit.DBG_GotovprodKeyPress(Sender: TObject; var Key: Char);
begin
  IF Key=Chr(32) Then
    begin
      if is_signed or is_ReadOnly then exit;
      DBG_GotovprodEditButtonClick(Sender);
    end;
end;//proc

procedure TF_Prodaja_edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Prodaja_edit);
end;

procedure TF_Prodaja_edit.IB_Prodaja_1_editCalcFields(DataSet: TDataSet);
var
         article: integer;
  gotovprod_name: string;
      grupa_name: string;
begin
  IF IB_Prodaja_1_edit.FieldByName('ID_GOTOV_PROD').IsNull Then exit;
  DM_MEBELI.get_gotovprod_name(IB_Prodaja_1_edit.FieldByName('ID_GOTOV_PROD').AsInteger, article, gotovprod_name, grupa_name);
  IB_Prodaja_1_edit.FieldByName('GRUPA_NAME').Value:=grupa_name;
  IB_Prodaja_1_edit.FieldByName('GOTOVPROD_NAME').Value:=gotovprod_name;
  IB_Prodaja_1_edit.FieldByName('ARTICLE').Value:=article;

  if (not IB_Prodaja_1_edit.FieldByname('kol_vo').IsNull) and (not IB_Prodaja_1_edit.FieldByname('price').IsNull) then
    IB_Prodaja_1_edit.FieldByname('summa').Value:=IB_Prodaja_1_edit.FieldByname('kol_vo').AsInteger*IB_Prodaja_1_edit.FieldByname('price').AsFloat;

end;//proc

procedure TF_Prodaja_edit.N_SignClick(Sender: TObject);
var ib_sign: TIBDataSet;
begin
  ib_sign:=TIBDataSet.Create(nil);
  ib_sign.Database:=DM_Mebeli.DB_Mebeli;
  ib_sign.SelectSQL.Add('insert into tables_signatures (table_id, user_id, table_name_id)');
  ib_sign.SelectSQL.Add('values(:table_id, (select id from users_db where sys_username=current_user), (select id from tables_db where table_name=:table_name))');
  ib_sign.ParamByName('table_id').value:=IB_Prodaja_0_edit.FieldByName('id').AsInteger;
  ib_sign.ParamByName('table_name').value:='PRODAJA_GOTOVPROD_0';
  ib_sign.ExecSQL;

  ib_sign.SelectSQL.Clear;
  ib_sign.SelectSQL.Add('update prodaja_gotovprod_1 set kol_vo=kol_vo*1 where id_parent='+IB_Prodaja_0_edit.FieldByName('id').AsString);
  ib_sign.ExecSQL;
  ib_sign.Free;
  DM_Mebeli.IBTransaction1.Commit;
  F_Prodaja_edit.Close;
end;

procedure TF_Prodaja_edit.N_UnSignClick(Sender: TObject);
var ib_sign: TIBDataSet;
begin
  ib_sign:=TIBDataSet.Create(nil);
  ib_sign.Database:=DM_Mebeli.DB_Mebeli;
  ib_sign.SelectSQL.Add('delete from tables_signatures where (table_id= :table_id) and ');
  ib_sign.SelectSQL.Add('(table_name_id=(select id from tables_db where table_name=:table_name))');
  ib_sign.ParamByName('table_id').value:=IB_Prodaja_0_edit.FieldByName('id').AsInteger;
  ib_sign.ParamByName('table_name').value:='PRODAJA_GOTOVPROD_0';
  ib_sign.ExecSQL;

  ib_sign.SelectSQL.Clear;
  ib_sign.SelectSQL.Add('delete from prodaja_gotovprod_1_sebest where id in (');
  ib_sign.SelectSQL.Add('select pr1s.id');
  ib_sign.SelectSQL.Add('from prodaja_gotovprod_1_sebest pr1s, prodaja_gotovprod_1 pr1, prodaja_gotovprod_0 pr0');
  ib_sign.SelectSQL.Add('where (pr1s.id_parent=pr1.id) and (pr1.id_parent=pr0.id) and (pr0.id=:id_doc))');
  ib_sign.ParamByName('id_doc').value:=IB_Prodaja_0_edit.FieldByName('id').AsInteger;
  ib_sign.ExecSQL;

  ib_sign.Close;
  ib_sign.Free;
  DM_Mebeli.IBTransaction1.Commit;
  F_Prodaja_edit.Close;
end;

end.
