unit Ostatok_listy_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ExtCtrls, DB,
  IBCustomDataSet;

type
  TF_Ostatok_listy_edit = class(TForm)
    Label7: TLabel;
    P_Shapka: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    DBE_ID: TDBEdit;
    DBE_Date_p: TDBEdit;
    DBEdit1: TDBEdit;
    DBL_Sklad: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    IB_Prihod_listy_0_Edit: TIBDataSet;
    DS_Prihod_listy_0_Edit: TDataSource;
    IB_Prihod_listy_1_Edit: TIBDataSet;
    DS_Prihod_listy_1_Edit: TDataSource;
    IB_Prihod_listy_1_EditID: TIntegerField;
    IB_Prihod_listy_1_EditID_PARENT: TIntegerField;
    IB_Prihod_listy_1_EditID_LISTY: TIntegerField;
    IB_Prihod_listy_1_EditKOL_VO: TIntegerField;
    IB_Prihod_listy_1_EditID_GRUPA: TIntegerField;
    IB_Prihod_listy_1_EditSUMMA: TIBBCDField;
    IB_Prihod_listy_0_EditID: TIntegerField;
    IB_Prihod_listy_0_EditDATE_P: TDateField;
    IB_Prihod_listy_0_EditID_SKLAD: TIntegerField;
    IB_Prihod_listy_0_EditPRIMECHANIE: TIBStringField;
    IB_Prihod_listy_0_EditSKLAD_NAME: TStringField;
    IB_Prihod_listy_1_EditGRUPA_NAME: TStringField;
    IB_Prihod_listy_1_EditLISTY_NAME: TStringField;
    IB_Prihod_listy_0_EditID_AKT_RASPIL: TIntegerField;
    IB_Prihod_listy_0_EditID_CONTRAGENT: TIntegerField;
    IB_Prihod_listy_0_EditID_STATYA_DOHODA: TIntegerField;
    IB_Prihod_listy_0_EditNOMER_TTN: TIBStringField;
    IB_Prihod_listy_0_EditID_REVIZIA: TIntegerField;
    IB_Prihod_listy_0_EditIS_OSTATOK: TSmallintField;
    procedure IB_Prihod_listy_1_EditNewRecord(DataSet: TDataSet);
    procedure IB_Prihod_listy_0_EditNewRecord(DataSet: TDataSet);
    procedure IB_Prihod_listy_1_EditCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Ostatok_listy_edit: TF_Ostatok_listy_edit;

implementation

uses mebeli_dm, main_f, Ostatok_listy_f, pilomat_f;

{$R *.dfm}

procedure TF_Ostatok_listy_edit.IB_Prihod_listy_1_EditNewRecord(
  DataSet: TDataSet);
begin
  IB_Prihod_listy_1_Edit.FieldByName('id_parent').Value:=IB_Prihod_listy_0_Edit.FieldByName('id').AsInteger;
end;

procedure TF_Ostatok_listy_edit.IB_Prihod_listy_0_EditNewRecord(
  DataSet: TDataSet);
begin
  IB_Prihod_listy_0_Edit.FieldByName('is_ostatok').Value:=1;
end;

procedure TF_Ostatok_listy_edit.IB_Prihod_listy_1_EditCalcFields(
  DataSet: TDataSet);
var ib_tmp:TIBDataSet;
begin
  IF IB_Prihod_listy_1_Edit.FieldByName('ID_LISTY').IsNull Then exit;
  ib_tmp:=TIBDataSet.Create(nil);
  ib_tmp.Database:=DM_Mebeli.DB_Mebeli;
  ib_tmp.SelectSQL.Add('select pg.name grupa_name, pl.name listy_name from pilomat_grupa pg, pilomat_listy pl where (pl.id_grupa=pg.id) and (pl.id=:id_listy)');
  ib_tmp.ParamByName('id_listy').Value:=IB_Prihod_listy_1_Edit.FieldByName('ID_LISTY').AsInteger;
  ib_tmp.open;
  IB_Prihod_listy_1_Edit.FieldByName('GRUPA_NAME').Value:=ib_tmp.FieldByName('grupa_name').AsString;
  IB_Prihod_listy_1_Edit.FieldByName('LISTY_NAME').Value:=ib_tmp.FieldByName('listy_name').AsString;
  ib_tmp.Close;
  ib_tmp.Free;
end;//proc

procedure TF_Ostatok_listy_edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Ostatok_listy_edit);
end;

procedure TF_Ostatok_listy_edit.B_OkClick(Sender: TObject);
begin
  if (IB_Prihod_listy_0_Edit.State=dsInsert) or (IB_Prihod_listy_0_Edit.State=dsEdit) then
    IB_Prihod_listy_0_Edit.Post;
  if (IB_Prihod_listy_1_Edit.State=dsInsert) or (IB_Prihod_listy_1_Edit.State=dsEdit) then
    IB_Prihod_listy_1_Edit.Post;
  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Commit;
  F_Ostatok_listy_edit.Close;
end;

procedure TF_Ostatok_listy_edit.B_ExitClick(Sender: TObject);
begin
  F_Ostatok_listy_edit.Close;
end;

procedure TF_Ostatok_listy_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not DM_Mebeli.IBTransaction1.Active then
    exit;

end;

procedure TF_Ostatok_listy_edit.FormActivate(Sender: TObject);
begin
  if operation='INSERT' then
    begin
      IB_Prihod_listy_0_Edit.Open;
      IB_Prihod_listy_1_Edit.Open;
      IB_Prihod_listy_0_Edit.Insert;
    end;

  if operation='EDIT' then
    begin
      IB_Prihod_listy_0_Edit.ParamByname('id_akt').Value:=F_Ostatok_listy.F_IB_Prihod_listy_0.FieldByname('id').AsInteger;
      IB_Prihod_listy_0_Edit.Open;
      IB_Prihod_listy_1_Edit.Open;
    end;
end;

procedure TF_Ostatok_listy_edit.DBGrid1EditButtonClick(Sender: TObject);
var old_operation: string [6];
    old_select_listy: tstrings;
    old_select_grupa: tstrings;
begin
  old_operation:=operation;
  operation:='SELECT';
  old_select_listy:=TStringList.Create;
  old_select_grupa:=TStringList.Create;
  old_select_listy.Assign(F_Pilomat.IB_Pilomat_listy_F.SelectSQL);
  old_select_grupa.Assign(F_Pilomat.IB_Pilomat_grupa_F.SelectSQL);
  F_Pilomat.IB_Pilomat_listy_F.SelectSQL.Clear;
  F_Pilomat.IB_Pilomat_listy_F.SelectSQL.Add('select * from PILOMAT_listy where id_grupa= :id order by name');
  F_Pilomat.IB_Pilomat_grupa_F.SelectSQL.Clear;
  F_Pilomat.IB_Pilomat_grupa_F.SelectSQL.Add('select * from pilomat_grupa order by name');

  IF F_Pilomat.ShowModal=mrOk Then
    begin
      DM_Mebeli.IB_pilomat_listy.Open;
      DM_Mebeli.IB_pilomat_detali.Open;
      DM_Mebeli.IB_Prihod_listy_1.Edit;
      DM_Mebeli.IB_Prihod_listy_1.FieldByName('ID_LISTY').Value:=F_Pilomat.id_listy;
      DM_Mebeli.IB_Prihod_listy_1.FieldByName('kol_vo').Value:=0;
      DM_Mebeli.IB_Prihod_listy_1.Post;
      DBGrid1.SelectedIndex:=2;
      DM_Mebeli.IB_Prihod_listy_1.Edit;
    end;//IF =mrOk
  operation:=old_operation;
  F_Pilomat.IB_Pilomat_listy_F.SelectSQL.Assign(old_select_listy);
  F_Pilomat.IB_Pilomat_grupa_F.SelectSQL.Assign(old_select_grupa);
end;//proc

end.
