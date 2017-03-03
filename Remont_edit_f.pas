unit Remont_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DB, IBCustomDataSet, DBCtrls, StdCtrls, Mask, Grids,
  DBGrids, ExtCtrls, IBQuery;

type
  TF_Remont_edit = class(TForm)
    IB_Remont_0: TIBDataSet;
    DS_Remont_0: TDataSource;
    P_OK_Cancel: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    DBG_Vidrabot: TDBGrid;
    Label1: TLabel;
    DBE_NOMER: TDBEdit;
    Label2: TLabel;
    DBE_Date_a: TDBEdit;
    Label3: TLabel;
    IB_Remont_0ID: TIntegerField;
    IB_Remont_0DATE_REM: TDateField;
    IB_Remont_0ID_CONTRAGENT: TIntegerField;
    IB_Remont_0ID_STATYA_RASHODA: TIntegerField;
    IB_Remont_0ID_STATYA_DOHODA: TIntegerField;
    IB_Remont_0SUMMA_PRODAJA: TIBBCDField;
    IB_Remont_0ID_GOTOV_PROD: TIntegerField;
    IB_Remont_0DESCRIPTION: TIBStringField;
    IB_Remont_0CONTRAGENT_NAME: TStringField;
    IB_Remont_0STATYA_RASH_NAME: TStringField;
    IB_Remont_0STATYA_DOHODA_NAME: TStringField;
    B_Select_GotovProd: TSpeedButton;
    E_Gotov_prod: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBL_Contragent: TDBLookupComboBox;
    DBE_Summa: TDBEdit;
    DBL_Statya_Rashodov: TDBLookupComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    IB_Remont_Rabota: TIBDataSet;
    DS_Remont_Rabota: TDataSource;
    IB_Remont_RabotaID: TIntegerField;
    IB_Remont_RabotaID_VID_RABOT: TIntegerField;
    IB_Remont_RabotaID_SOTRUDNIK: TIntegerField;
    IB_Remont_RabotaSUMMA_RABOT: TIBBCDField;
    IB_Remont_RabotaID_PARENT: TIntegerField;
    IB_Remont_RabotaSOTRUDNIK_NAME: TStringField;
    IB_Remont_RabotaVIDRABOT_NAME: TStringField;
    DBG_Furnitura: TDBGrid;
    DBG_Detali: TDBGrid;
    IB_Rashod_Furnitura: TIBDataSet;
    DS_Rashod_Furnitura: TDataSource;
    IB_Rashod_FurnituraID: TIntegerField;
    IB_Rashod_FurnituraID_FURNITURA: TIntegerField;
    IB_Rashod_FurnituraKOL_VO: TIBBCDField;
    IB_Rashod_FurnituraDATE_R: TDateField;
    IB_Rashod_FurnituraID_AKT_VIP_PROD: TIntegerField;
    IB_Rashod_FurnituraID_AKT_VIP_RABOT: TIntegerField;
    IB_Rashod_FurnituraID_GOTOV_PROD: TIntegerField;
    IB_Rashod_FurnituraID_SKLAD: TIntegerField;
    IB_Rashod_FurnituraID_PRODAJA: TIntegerField;
    IB_Rashod_FurnituraKOLVO_NORMA: TIBBCDField;
    IB_Rashod_FurnituraID_REMONT: TIntegerField;
    IB_Rashod_Detali: TIBDataSet;
    DS_Rashod_Detali: TDataSource;
    IB_Rashod_DetaliID: TIntegerField;
    IB_Rashod_DetaliID_PILOMAT_DETALI: TIntegerField;
    IB_Rashod_DetaliKOL_VO: TIntegerField;
    IB_Rashod_DetaliDATE_R: TDateField;
    IB_Rashod_DetaliID_GOTOV_PROD: TIntegerField;
    IB_Rashod_DetaliAREA: TIntegerField;
    IB_Rashod_DetaliID_SKLAD: TIntegerField;
    IB_Rashod_DetaliID_REMONT: TIntegerField;
    IB_Rashod_FurnituraGRUPA_NAME: TStringField;
    IB_Rashod_FurnituraFURNITURA_NAME: TStringField;
    IB_Rashod_FurnituraEDIZM_NAME: TStringField;
    IB_Rashod_DetaliGRUPA_NAME: TStringField;
    IB_Rashod_DetaliID_AKT_VIP_PROD: TIntegerField;
    IB_Rashod_DetaliDETALI_NAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure B_Select_GotovProdClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure IB_Remont_RabotaNewRecord(DataSet: TDataSet);
    procedure IB_Rashod_FurnituraNewRecord(DataSet: TDataSet);
    procedure IB_Rashod_DetaliNewRecord(DataSet: TDataSet);
    procedure IB_Rashod_FurnituraCalcFields(DataSet: TDataSet);
    procedure IB_Rashod_FurnituraBeforePost(DataSet: TDataSet);
    procedure DBG_FurnituraEnter(Sender: TObject);
    procedure DBG_FurnituraEditButtonClick(Sender: TObject);
    procedure IB_Rashod_DetaliCalcFields(DataSet: TDataSet);
    procedure B_ExitClick(Sender: TObject);
    procedure DBG_DetaliEditButtonClick(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Remont_edit: TF_Remont_edit;

implementation

uses mebeli_dm, main_f, Remont_jurnal_f, gotov_prod_f, furnitura_f,
  pilomat_f;
{$R *.dfm}

procedure TF_Remont_edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Remont_edit);
end;

procedure TF_Remont_edit.B_Select_GotovProdClick(Sender: TObject);
var old_operation: string [6];
    sql_gotovprod: TIBQuery;
begin
  old_operation:=operation;
  operation:='SELECT';
  sql_gotovprod:=TIBQuery.Create(nil);
  sql_gotovprod.Database:=F_Main.IBQuery1.Database;
  IF F_Gotov_prod.ShowModal=mrOk Then
    begin
      IB_Remont_0.Edit;
      IB_Remont_0.FieldByName('ID_GOTOV_PROD').Value:=F_Gotov_prod.GotovProd_ID;
      sql_gotovprod.SQL.Add('select gpg.name grupa_name, gp.name gotovprod_name from gotov_prod_0 gp, gotov_prod_grupa gpg where (gpg.id=gp.id_grupa) and (gp.id= :id_gotovprod)');
      sql_gotovprod.ParamByName('id_gotovprod').Value:=F_Gotov_prod.GotovProd_ID;
      sql_gotovprod.Open;
      E_Gotov_prod.Text:=sql_gotovprod.FieldByName('grupa_name').AsString+' / '+sql_gotovprod.FieldByName('gotovprod_name').AsString;
    end;//IF =mrOk
  operation:=old_operation;
  sql_gotovprod.Close;
  sql_gotovprod.Free;
end;//proc

procedure TF_Remont_edit.FormActivate(Sender: TObject);
var
  sql_gotovprod: TIBQuery;
begin
  if operation='EDIT' then
    begin
      IB_Remont_0.ParamByName('id').Value:=F_Remont_jurnal.id_akt;
        IB_Remont_0.Open;
      IB_Remont_0.Edit;
      sql_gotovprod:=TIBQuery.Create(nil);
      sql_gotovprod.Database:=F_Main.IBQuery1.Database;
      sql_gotovprod.SQL.Add('select gpg.name grupa_name, gp.name gotovprod_name from gotov_prod_0 gp, gotov_prod_grupa gpg where (gpg.id=gp.id_grupa) and (gp.id= :id_gotovprod)');
      sql_gotovprod.ParamByName('id_gotovprod').Value:=IB_Remont_0.FieldByName('id_gotov_prod').AsInteger;
      sql_gotovprod.Open;
      E_Gotov_prod.Text:=sql_gotovprod.FieldByName('grupa_name').AsString+' / '+sql_gotovprod.FieldByName('gotovprod_name').AsString;
      sql_gotovprod.Close;
      sql_gotovprod.Free;
    end;//IF =mrOk

  if operation='INSERT' then
    begin
      IB_Remont_0.Open;
      IB_Remont_0.Insert;
      IB_Remont_0.FieldByname('date_rem').Value:=Date();
      E_Gotov_prod.Text:='';
    end;
    
  IB_Remont_Rabota.Open;
  IB_Rashod_Furnitura.Open;
  IB_Rashod_Detali.Open;
end;

procedure TF_Remont_edit.IB_Remont_RabotaNewRecord(DataSet: TDataSet);
begin
  IB_Remont_Rabota.FieldByName('id_parent').Value:=IB_Remont_0.FieldValues['id'];
end;

procedure TF_Remont_edit.IB_Rashod_FurnituraNewRecord(DataSet: TDataSet);
begin
  IB_Rashod_Furnitura.FieldByName('id_remont').Value:=IB_Remont_0.FieldValues['id'];
  IB_Rashod_Furnitura.FieldByName('id_sklad').Value:=sklad_detali;
  IB_Rashod_Furnitura.FieldByName('id_gotov_prod').Value:=IB_Remont_0.FieldValues['id_gotov_prod'];
  IB_Rashod_Furnitura.FieldByName('date_r').Value:=IB_Remont_0.FieldValues['date_rem'];
end;

procedure TF_Remont_edit.IB_Rashod_DetaliNewRecord(DataSet: TDataSet);
begin
  IB_Rashod_Detali.FieldByName('id_remont').Value:=IB_Remont_0.FieldValues['id'];
  IB_Rashod_Detali.FieldByName('id_sklad').Value:=sklad_detali;
  IB_Rashod_Detali.FieldByName('date_r').Value:=IB_Remont_0.FieldValues['date_rem'];
  IB_Rashod_Detali.FieldByName('id_gotov_prod').Value:=IB_Remont_0.FieldValues['id_gotov_prod'];
end;

procedure TF_Remont_edit.IB_Rashod_FurnituraCalcFields(DataSet: TDataSet);
var ib_tmp:TIBDataSet;
begin
  IF IB_Rashod_furnitura.FieldByName('ID_FURNITURA').IsNull Then exit;
  ib_tmp:=TIBDataSet.Create(nil);
  ib_tmp.Database:=DM_Mebeli.DB_Mebeli;
  ib_tmp.SelectSQL.Add('select name from furnitura_grupa where id=(select id_parent from furnitura where id=:id_furnitura)');
  ib_tmp.ParamByName('id_furnitura').Value:=IB_Rashod_furnitura.FieldByname('id_furnitura').AsInteger;
  ib_tmp.open;
  IB_Rashod_furnitura.FieldByName('GRUPA_NAME').Value:=ib_tmp.FieldByName('name').AsString;
  ib_tmp.Close;
  ib_tmp.Free;
end;//proc

procedure TF_Remont_edit.IB_Rashod_FurnituraBeforePost(DataSet: TDataSet);
begin
  IB_Rashod_Furnitura.FieldByName('kolvo_norma').Value:=IB_Rashod_Furnitura.FieldByName('kol_vo').Value;
end;

procedure TF_Remont_edit.DBG_FurnituraEnter(Sender: TObject);
begin
  if IB_Remont_0.FieldByname('id_gotov_prod').IsNull then
    begin
      ShowMessage('Не указана готовая продукция!');
      E_Gotov_prod.SetFocus; 
    end;
end;

procedure TF_Remont_edit.DBG_FurnituraEditButtonClick(Sender: TObject);
var old_operation: string;
begin
  old_operation:=operation;
  operation:='SELECT';
  F_Furnitura.ShowModal;
  DM_Mebeli.IB_Furnitura.Open;
  operation:=old_operation;
  IF IB_Rashod_furnitura.State=dsBrowse Then
    IB_Rashod_furnitura.Edit;
  IB_Rashod_furnitura.FieldByName('ID_FURNITURA').Value:=id_furnitura;
end;//proc

procedure TF_Remont_edit.IB_Rashod_DetaliCalcFields(DataSet: TDataSet);
var ib_tmp:TIBDataSet;
begin
  IF IB_Rashod_detali.FieldByName('ID_PILOMAT_DETALI').IsNull Then exit;
  ib_tmp:=TIBDataSet.Create(nil);
  ib_tmp.Database:=DM_Mebeli.DB_Mebeli;
  ib_tmp.SelectSQL.Add('select (select name from pilomat_grupa where id=(select id_grupa from pilomat_detali where id=:id_pilomat_detali)) grupa_name, name detali_name');
  ib_tmp.SelectSQL.Add('from pilomat_detali where id=:id_pilomat_detali');
  ib_tmp.ParamByName('id_pilomat_detali').Value:=IB_Rashod_detali.FieldByname('id_pilomat_detali').AsInteger;
  ib_tmp.open;
  IB_Rashod_detali.FieldByName('GRUPA_NAME').Value:=ib_tmp.FieldByName('grupa_name').AsString;
  IB_Rashod_detali.FieldByName('DETALI_NAME').Value:=ib_tmp.FieldByName('detali_name').AsString;
  ib_tmp.Close;
  ib_tmp.Free;
end;//proc

procedure TF_Remont_edit.B_ExitClick(Sender: TObject);
begin
  F_Remont_edit.Close;
end;

procedure TF_Remont_edit.DBG_DetaliEditButtonClick(Sender: TObject);
var old_operation: string [6];
begin
  old_operation:=operation;
  operation:='SELECT';
  IF F_Pilomat.ShowModal=mrOk Then
    begin
      IB_Rashod_detali.Edit;
      IB_Rashod_detali.FieldByName('ID_PILOMAT_DETALI').Value:=F_Pilomat.id_detali;
    end;//IF =mrOk
  operation:=old_operation;
end;//proc

procedure TF_Remont_edit.B_OkClick(Sender: TObject);
begin
  if (IB_Remont_0.State=dsEdit) or (IB_Remont_0.State=dsInsert) then
    IB_Remont_0.Post;
  if (IB_Remont_Rabota.State=dsEdit) or (IB_Remont_Rabota.State=dsInsert) then
    IB_Remont_Rabota.Post;
  if (IB_Rashod_Furnitura.State=dsEdit) or (IB_Rashod_Furnitura.State=dsInsert) then
    IB_Rashod_Furnitura.Post;
  if (IB_Rashod_Detali.State=dsEdit) or (IB_Rashod_Detali.State=dsInsert) then
    IB_Rashod_Detali.Post;
  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Commit;
  F_Remont_edit.Close;
end;

procedure TF_Remont_edit.FormClose(Sender: TObject;
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
      if (IB_Remont_0.State=dsEdit) or (IB_Remont_0.State=dsInsert) then
        IB_Remont_0.Post;
      if (IB_Remont_Rabota.State=dsEdit) or (IB_Remont_Rabota.State=dsInsert) then
        IB_Remont_Rabota.Post;
      if (IB_Rashod_Furnitura.State=dsEdit) or (IB_Rashod_Furnitura.State=dsInsert) then
        IB_Rashod_Furnitura.Post;
      if (IB_Rashod_Detali.State=dsEdit) or (IB_Rashod_Detali.State=dsInsert) then
      DM_Mebeli.IBTransaction1.Commit;
    end;
end;

end.
