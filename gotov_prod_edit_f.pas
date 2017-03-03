unit gotov_prod_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids, ExtCtrls, DB,
  IBCustomDataSet;

type
  TF_Gotov_prod_edit = class(TForm)
    DBGR_FURNITURA: TDBGrid;
    DBGR_DETALI: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    DBG_Vid_rabot: TDBGrid;
    IB_Gotov_prod_1: TIBDataSet;
    DS_Gotov_prod_1: TDataSource;
    IB_Gotov_prod_2: TIBDataSet;
    DS_Gotov_Prod_2: TDataSource;
    IB_Gotov_prod_1ID: TIntegerField;
    IB_Gotov_prod_1DETALI_GRUPA: TIBStringField;
    IB_Gotov_prod_1DETALI_NAME: TIBStringField;
    IB_Gotov_prod_1KOL_VO: TIntegerField;
    IB_Gotov_prod_1ID_DETALI: TIntegerField;
    IB_Gotov_prod_2ID: TIntegerField;
    IB_Gotov_prod_2ID_FURNITURA: TIntegerField;
    IB_Gotov_prod_2FURNITURA_GRUPA: TIBStringField;
    IB_Gotov_prod_2FURNITURA_NAME: TIBStringField;
    IB_Gotov_prod_2KOL_VO: TIBBCDField;
    IB_Gotov_prod_2ED_IZM: TIBStringField;
    DS_GOTOV_PROD_VIDRABOT: TDataSource;
    IB_GOTOV_PROD_VIDRABOT: TIBDataSet;
    IB_GOTOV_PROD_VIDRABOTID: TIntegerField;
    IB_GOTOV_PROD_VIDRABOTID_VID_RABOT: TIntegerField;
    IB_GOTOV_PROD_VIDRABOTVid_rabot: TStringField;
    IB_GOTOV_PROD_VIDRABOTID_NORMA: TIntegerField;
    IB_Gotov_prod_2ID_NORMA: TIntegerField;
    IB_Gotov_prod_1ID_NORMA: TIntegerField;
    DBE_Data: TDBEdit;
    DBE_Descr: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBL_Category: TDBLookupComboBox;
    Label3: TLabel;
    IB_GOTOV_PROD_CATEGORIES_NORMY: TIBDataSet;
    DS_GOTOV_PROD_CATEGORIES_NORMY: TDataSource;
    IB_GOTOV_PROD_CATEGORIES_NORMYID: TIntegerField;
    IB_GOTOV_PROD_CATEGORIES_NORMYID_NORMA: TIntegerField;
    IB_GOTOV_PROD_CATEGORIES_NORMYID_CATEGORY: TIntegerField;
    IB_GOTOV_PROD_CATEGORIES_NORMYCATEGORY_NAME: TStringField;
    IB_GOTOV_PROD_VIDRABOTID_GOTOV_PROD: TIntegerField;
    IB_GOTOV_PROD_VIDRABOTID_CATEGORY: TIntegerField;
    IB_GOTOV_PROD_VIDRABOTCATEGORY_NAME: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGR_DETALIEditButtonClick(Sender: TObject);
    procedure DBGR_FURNITURAEditButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IB_GOTOV_PROD_VIDRABOTNewRecord(DataSet: TDataSet);
    procedure IB_Gotov_prod_2NewRecord(DataSet: TDataSet);
    procedure IB_Gotov_prod_1NewRecord(DataSet: TDataSet);
    procedure IB_GOTOV_PROD_CATEGORIES_NORMYNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Gotov_prod_edit: TF_Gotov_prod_edit;
         OK_Pressed: boolean;
implementation

uses main_f, mebeli_dm, pilomat_f, furnitura_f, Gotov_prod_normy_f;

{$R *.dfm}

procedure TF_Gotov_prod_edit.FormActivate(Sender: TObject);
begin
  IB_Gotov_prod_1.Open;
  IB_Gotov_prod_2.Open;
  IB_Gotov_prod_vidrabot.Open;
//  DM_Mebeli.IB_Gotov_prod_0.Open;
  IB_GOTOV_PROD_CATEGORIES_NORMY.Open;
  OK_Pressed:=False;
end;//proc

procedure TF_Gotov_prod_edit.B_ExitClick(Sender: TObject);
begin
  OK_Pressed:=False;
  Close;
end;//proc

procedure TF_Gotov_prod_edit.B_OkClick(Sender: TObject);
begin
  if (IB_Gotov_prod_1.State=dsInsert) or (IB_Gotov_prod_1.State=dsEdit) then IB_Gotov_prod_1.post;
  if (IB_Gotov_prod_2.State=dsInsert) or (IB_Gotov_prod_2.State=dsEdit) then IB_Gotov_prod_2.post;
  if (IB_GOTOV_PROD_VIDRABOT.State=dsInsert) or (IB_GOTOV_PROD_VIDRABOT.State=dsEdit) then IB_GOTOV_PROD_VIDRABOT.post;
  if (IB_GOTOV_PROD_CATEGORIES_NORMY.State=dsInsert) or (IB_GOTOV_PROD_CATEGORIES_NORMY.State=dsEdit) then IB_GOTOV_PROD_CATEGORIES_NORMY.post;
  if (F_Gotov_prod_normy.IB_Gotovprod_normy.State=dsInsert) or (F_Gotov_prod_normy.IB_Gotovprod_normy.State=dsEdit) then F_Gotov_prod_normy.IB_Gotovprod_normy.post;

  IF DM_Mebeli.IBTransaction1.Active Then
    DM_Mebeli.IBTransaction1.Commit;
  OK_Pressed:=True;
  close;
end;//proc

procedure TF_Gotov_prod_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var res:TModalResult;
begin
  IF OK_Pressed Then exit;

  res:=MessageDlg('Сохранить изменения?',mtConfirmation,[mbYes,mbNo,mbCancel],0);
  IF res=mrCancel Then
     Action:=caNone;
  IF res=mrNo Then
     IF DM_Mebeli.IBTransaction1.Active Then
        DM_Mebeli.IBTransaction1.Rollback;
  IF res=mrYes Then
     IF DM_Mebeli.IBTransaction1.Active Then
        begin
          if DM_Mebeli.IB_Gotov_prod_0.state=dsEdit then DM_Mebeli.IB_Gotov_prod_0.Post;
          DM_Mebeli.IBTransaction1.Commit;
        end;//IF DM_Mebeli.IBTransaction1.Active
end;//proc

procedure TF_Gotov_prod_edit.DBGR_DETALIEditButtonClick(Sender: TObject);
var old_operation: string[20];
    id: integer;
begin
  old_operation:=operation;
  operation:='SELECT';
  IF F_Pilomat.ShowModal=mrOk Then
    begin
      if IB_Gotov_prod_1.FieldByName('id').IsNull then
        IB_Gotov_prod_1.Insert
      Else
        IB_Gotov_prod_1.Edit;
      IB_Gotov_prod_1.FieldByName('ID_DETALI').Value:=F_Pilomat.id_detali;
      IB_Gotov_prod_1.FieldByName('kol_vo').Value:=0;
      IB_Gotov_prod_1.FieldByName('ID_NORMA').Value:=F_Gotov_prod_normy.IB_Gotovprod_normy.FieldByName('id').AsInteger;
      IB_Gotov_prod_1.Post;
      id:=IB_Gotov_prod_1.FieldByName('id').AsInteger+1;
      IB_Gotov_prod_1.Close;
      IB_Gotov_prod_1.Open;
      IB_Gotov_prod_1.Locate('id',id,[]);
      DBGR_DETALI.SelectedIndex:=3;
    end;//IF =mrOk
  operation:=old_operation;
end;

procedure TF_Gotov_prod_edit.DBGR_FURNITURAEditButtonClick(
  Sender: TObject);
var old_operation: string[20];
    id: integer;
begin
  old_operation:=operation;
  operation:='SELECT';
  IF F_Furnitura.ShowModal=mrOk Then
    begin
      if IB_Gotov_prod_2.FieldByName('id').IsNull then
        IB_Gotov_prod_2.Insert
      Else
        IB_Gotov_prod_2.Edit;
      IB_Gotov_prod_2.FieldByName('ID_FURNITURA').Value:=id_furnitura;
      IB_Gotov_prod_2.FieldByName('kol_vo').Value:=0;
      IB_Gotov_prod_2.FieldByName('ID_NORMA').Value:=F_Gotov_prod_normy.IB_Gotovprod_normy.FieldByName('id').AsInteger;
      IB_Gotov_prod_2.Post;
      id:=IB_Gotov_prod_2.FieldByName('id').AsInteger+1;
      IB_Gotov_prod_2.Close;
      IB_Gotov_prod_2.Open;
      IB_Gotov_prod_2.Locate('id',id,[]);
      DBGR_FURNITURA.SelectedIndex:=4;
    end;//IF =mrOk
  operation:=old_operation;
end;

procedure TF_Gotov_prod_edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Gotov_prod_edit);
end;

procedure TF_Gotov_prod_edit.IB_GOTOV_PROD_VIDRABOTNewRecord(
  DataSet: TDataSet);
begin
  IB_GOTOV_PROD_VIDRABOT.FieldByName('id_norma').Value:=F_Gotov_prod_normy.IB_Gotovprod_normy.FieldByName('id').AsInteger;
  IB_GOTOV_PROD_VIDRABOT.FieldByName('id_category').Value:=IB_GOTOV_PROD_CATEGORIES_NORMY.FieldByName('id_category').AsInteger;
end;

procedure TF_Gotov_prod_edit.IB_Gotov_prod_2NewRecord(DataSet: TDataSet);
begin
  IB_GOTOV_PROD_2.FieldByName('id_norma').Value:=F_Gotov_prod_normy.IB_Gotovprod_normy.FieldByName('id').AsInteger;
end;

procedure TF_Gotov_prod_edit.IB_Gotov_prod_1NewRecord(DataSet: TDataSet);
begin
  IB_GOTOV_PROD_1.FieldByName('id_norma').Value:=F_Gotov_prod_normy.IB_Gotovprod_normy.FieldByName('id').AsInteger;
end;

procedure TF_Gotov_prod_edit.IB_GOTOV_PROD_CATEGORIES_NORMYNewRecord(
  DataSet: TDataSet);
begin
  IB_GOTOV_PROD_CATEGORIES_NORMY.FieldByName('id_norma').Value:=F_Gotov_prod_normy.IB_Gotovprod_normy.FieldByName('id').AsInteger;
end;

end.
