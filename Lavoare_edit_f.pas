unit Lavoare_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, Grids, DBGrids, IBCustomDataSet,
  DBCtrls, Mask, IBQuery;

type
  TF_Lavoare_edit = class(TForm)
    P_OK_Cancel: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    IB_Lavoare_grupa: TIBDataSet;
    IB_Lavoare_1: TIBDataSet;
    DS_Lavoare_1: TDataSource;
    IB_Lavoare_1ID: TIntegerField;
    IB_Lavoare_1NAME: TIBStringField;
    IB_Lavoare_1ID_PARENT: TIntegerField;
    IB_Lavoare_1ARTICLE: TIntegerField;
    IB_Lavoare_1GRUPA_NAME: TStringField;
    DBE_Lavoar: TDBEdit;
    DBL_Grupa: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    IB_Lavoare_1MANUFACTURER_CODE: TIBStringField;
    DBE_Cod_manufacturer: TDBEdit;
    Label3: TLabel;
    IB_Lavoare_Gotovprod: TIBDataSet;
    DS_Lavoare_Gotovprod: TDataSource;
    IB_Lavoare_GotovprodID: TIntegerField;
    IB_Lavoare_GotovprodDESCRIPTION: TIBStringField;
    IB_Lavoare_GotovprodID_LAVOAR: TIntegerField;
    IB_Lavoare_GotovprodID_GOTOVPROD: TIntegerField;
    IB_Lavoare_GotovprodGOTOVPROD_GRUPA: TStringField;
    IB_Lavoare_GotovprodGOTOVPROD_NAME: TStringField;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    DBE_Articul: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure IB_Lavoare_GotovprodCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_OkClick(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure IB_Lavoare_GotovprodNewRecord(DataSet: TDataSet);
    procedure IB_Lavoare_1NewRecord(DataSet: TDataSet);
    procedure DBGrid1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Lavoare_edit: TF_Lavoare_edit;

implementation

{$R *.dfm}
uses main_f, mebeli_dm, lavoare_list_f, gotov_prod_f;

procedure TF_Lavoare_edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Lavoare_edit);
end;

procedure TF_Lavoare_edit.B_ExitClick(Sender: TObject);
begin
  F_Lavoare_edit.Close;
end;

procedure TF_Lavoare_edit.FormActivate(Sender: TObject);
begin
  if operation='EDIT' Then
    begin
      IB_Lavoare_1.ParamByName('id').Value:=F_Lavoare_list.id_lavoar;
      IB_Lavoare_1.Open;
      IB_Lavoare_1.Edit;
    end;

  if operation='INSERT' Then
    begin
      IB_Lavoare_1.Open;
      IB_Lavoare_1.Insert;
    end;
  IB_Lavoare_gotovprod.Open;
end;

procedure TF_Lavoare_edit.IB_Lavoare_GotovprodCalcFields(
  DataSet: TDataSet);
var ib_tmp:TIBDataSet;
begin
  IF IB_Lavoare_gotovprod.FieldByName('ID_GOTOVPROD').IsNull Then exit;
  ib_tmp:=TIBDataSet.Create(nil);
  ib_tmp.Database:=DM_Mebeli.DB_Mebeli;
  ib_tmp.SelectSQL.Add('select name from gotov_prod_grupa where id=(select id_grupa from gotov_prod_0 where id= :id_gotovprod)');
  ib_tmp.ParamByName('id_gotovprod').Value:=IB_Lavoare_gotovprod.FieldByname('id_gotovprod').AsInteger;
  ib_tmp.open;
  IB_Lavoare_gotovprod.FieldByName('GOTOVPROD_GRUPA').Value:=ib_tmp.FieldByName('name').AsString;
  ib_tmp.Close;
  ib_tmp.Free;
end;//proc

procedure TF_Lavoare_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var res:TModalResult;
begin
  if not DM_Mebeli.IBTransaction1.Active then
    exit;

  res:=MessageDlg('Сохранить изменения?',mtConfirmation,[mbYes,mbNo,mbCancel],0);
  IF res=mrCancel Then
     Action:=caNone;
  IF res=mrNo Then
    DM_Mebeli.IBTransaction1.Rollback;

  IF res=mrYes Then
    begin
      if (IB_Lavoare_1.State=dsEdit) or (IB_Lavoare_1.State=dsInsert) then
        IB_Lavoare_1.Post;
      if (IB_Lavoare_Gotovprod.State=dsEdit) or (IB_Lavoare_gotovprod.State=dsInsert) then
        IB_Lavoare_gotovprod.Post;
      DM_Mebeli.IBTransaction1.Commit;
    end;
end;

procedure TF_Lavoare_edit.B_OkClick(Sender: TObject);
begin
  if (IB_Lavoare_1.State=dsEdit) or (IB_Lavoare_1.State=dsInsert) then
    IB_Lavoare_1.Post;
  if (IB_Lavoare_Gotovprod.State=dsEdit) or (IB_Lavoare_gotovprod.State=dsInsert) then
    IB_Lavoare_gotovprod.Post;
  DM_Mebeli.IBTransaction1.Commit;
  F_Lavoare_edit.Close;
end;

procedure TF_Lavoare_edit.DBGrid1EditButtonClick(Sender: TObject);
var old_operation: string [10];
    sql_gotovprod: TIBQuery;
begin
  old_operation:=operation;
  operation:='SELECT';
  sql_gotovprod:=TIBQuery.Create(nil);
  sql_gotovprod.Database:=F_Main.IBQuery1.Database;
  IF F_Gotov_prod.ShowModal=mrOk Then
    begin
      IB_Lavoare_Gotovprod.Edit;
      IB_Lavoare_Gotovprod.FieldByName('ID_GOTOVPROD').Value:=F_Gotov_prod.GotovProd_ID;
    end;//IF =mrOk
  operation:=old_operation;
  sql_gotovprod.Close;
  sql_gotovprod.Free;
end;//proc

procedure TF_Lavoare_edit.IB_Lavoare_GotovprodNewRecord(DataSet: TDataSet);
begin
  IB_Lavoare_Gotovprod.FieldByName('id_lavoar').Value:=IB_Lavoare_1.FieldByname('id').AsInteger;
end;

procedure TF_Lavoare_edit.IB_Lavoare_1NewRecord(DataSet: TDataSet);
begin
  IB_Lavoare_1.FieldByname('id_parent').AsInteger:=F_Lavoare_list.id_lavoar_grupa;
end;

procedure TF_Lavoare_edit.DBGrid1Exit(Sender: TObject);
begin
  if IB_Lavoare_Gotovprod.State<>dsBrowse then
    IB_Lavoare_Gotovprod.Post;
end;

end.
