unit Revizia_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, DB, IBCustomDataSet, ExtCtrls, Grids,
  DBGrids;

type
  TF_Revizia_edit = class(TForm)
    DBG_Listy: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    IB_Revizia_0_E: TIBDataSet;
    DS_Revizia_0_E: TDataSource;
    DS_Revizia_listy: TDataSource;
    IB_Revizia_listy: TIBDataSet;
    IB_Revizia_0_EID: TIntegerField;
    IB_Revizia_0_EDATE_DOC: TDateField;
    IB_Revizia_0_EID_SKLAD: TIntegerField;
    IB_Revizia_0_EDESCRIPTION: TIBStringField;
    IB_Revizia_0_ESKLAD_NAME: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    DBE_Date_a: TDBEdit;
    DBL_Sklad: TDBLookupComboBox;
    DBE_ID: TDBEdit;
    Label4: TLabel;
    B_Ok: TButton;
    DBG_Furnitura: TDBGrid;
    DBG_Detali: TDBGrid;
    IB_Revizia_listyID: TIntegerField;
    IB_Revizia_listyID_PARENT: TIntegerField;
    IB_Revizia_listyID_LISTY: TIntegerField;
    IB_Revizia_listyKOLVO_PROGRAMA: TIntegerField;
    IB_Revizia_listyKOLVO_REVIZIA: TIntegerField;
    IB_Revizia_listyGRUPA_NAME: TStringField;
    IB_Revizia_listyRAZNITSA: TIntegerField;
    IB_Revizia_listyMATERIAL_NAME: TStringField;
    DBEdit1: TDBEdit;
    B_Fill_Tables: TButton;
    IB_Revizia_Furnitura: TIBDataSet;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    StringField1: TStringField;
    IntegerField6: TIntegerField;
    StringField2: TStringField;
    DS_Revizia_Furnitura: TDataSource;
    IB_Revizia_FurnituraID_FURNITURA: TIntegerField;
    IB_Revizia_FurnituraNA_DETALIAH: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure IB_Revizia_listyCalcFields(DataSet: TDataSet);
    procedure IB_Revizia_listyNewRecord(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure B_Fill_TablesClick(Sender: TObject);
    procedure IB_Revizia_FurnituraNewRecord(DataSet: TDataSet);
    procedure IB_Revizia_FurnituraCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Revizia_edit: TF_Revizia_edit;

implementation

uses main_f, mebeli_dm, Revizii_jurnal_df;

{$R *.dfm}

procedure TF_Revizia_edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Revizia_edit);
end;

procedure TF_Revizia_edit.IB_Revizia_listyCalcFields(DataSet: TDataSet);
var ib_tmp:TIBDataSet;
begin
  ib_tmp:=TIBDataSet.Create(nil);
  ib_tmp.Database:=DM_Mebeli.DB_Mebeli;
  ib_tmp.SelectSQL.Add('select pg.name grupa_name, pl.id id_listy, pl.name listy_name from pilomat_grupa pg, pilomat_listy pl where (pl.id= :id_listy) and (pl.id_grupa=pg.id)');
  ib_tmp.ParamByName('id_listy').Value:=IB_Revizia_listy.FieldByname('id_listy').AsInteger;
  ib_tmp.open;
  IB_Revizia_listy.FieldByName('grupa_name').Value:=ib_tmp.FieldByName('grupa_name').AsString;
  IB_Revizia_listy.FieldByName('material_name').Value:=ib_tmp.FieldByName('listy_name').AsString;
  IB_Revizia_listy.FieldByName('raznitsa').Value:=IB_Revizia_listy.FieldByName('kolvo_revizia').AsInteger-IB_Revizia_listy.FieldByName('kolvo_programa').AsInteger;
  ib_tmp.Close;
  ib_tmp.Free;
end;//proc

procedure TF_Revizia_edit.IB_Revizia_listyNewRecord(DataSet: TDataSet);
begin
  IB_Revizia_listy.FieldByName('id_parent').Value:=IB_Revizia_0_E.FieldByName('id').AsInteger;
end;

procedure TF_Revizia_edit.FormActivate(Sender: TObject);
begin
  if operation='INSERT' then
    begin
      IB_Revizia_0_E.Open;
      IB_Revizia_0_E.Insert;
      IB_Revizia_0_E.FieldByname('date_doc').Value:=Date();
    end;

  if operation='EDIT' then
    begin
      IB_Revizia_0_E.ParamByname('id_akt_revizii').Value:=F_Revizii_jurnal.id_akt_revizii;
      IB_Revizia_0_E.Open;
      IB_Revizia_0_E.Edit;
    end;
  IB_Revizia_listy.Open;
end;

procedure TF_Revizia_edit.B_Fill_TablesClick(Sender: TObject);
var ib_tmp:TIBDataSet;
begin
  if IB_Revizia_0_E.FieldByName('id_sklad').IsNull then
    begin
      ShowMessage('Не указан склад');
      exit;
    end;
  ib_tmp:=TIBDataSet.Create(nil);
  ib_tmp.Database:=DM_Mebeli.DB_Mebeli;
  //очистка таблиц от имеющихся данных
  ib_tmp.SelectSQL.Add('delete from revizia_listy where id_parent= :id_parent');
  ib_tmp.ParamByName('id_parent').Value:=IB_Revizia_0_E.FieldByName('id').AsInteger;
  ib_tmp.ExecSQL;
  ib_tmp.SelectSQL.Clear;
  ib_tmp.SelectSQL.Add('delete from revizia_furnitura where id_parent= :id_parent');
  ib_tmp.ParamByName('id_parent').Value:=IB_Revizia_0_E.FieldByName('id').AsInteger;
  ib_tmp.ExecSQL;
  ib_tmp.SelectSQL.Clear;
  ib_tmp.SelectSQL.Add('delete from revizia_detali where id_parent= :id_parent');
  ib_tmp.ParamByName('id_parent').Value:=IB_Revizia_0_E.FieldByName('id').AsInteger;
  ib_tmp.ExecSQL;

  ib_tmp.SelectSQL.Clear;
  ib_tmp.SelectSQL.Add('insert into revizia_listy (id_parent, id_listy, kolvo_programa, kolvo_revizia)');
  ib_tmp.SelectSQL.Add('select cast( :id_parent as integer),  id_listy, ostatok, ostatok from (');
  ib_tmp.SelectSQL.Add('select pl.id id_listy,');
  ib_tmp.SelectSQL.Add('coalesce((');
  ib_tmp.SelectSQL.Add('select LIST_OSTATOK from OSTATOK_LIST(pl.id, :id_sklad, :date_revizia)');
  ib_tmp.SelectSQL.Add('),0) ostatok');
  ib_tmp.SelectSQL.Add('from pilomat_listy pl ) where ostatok>0');
  ib_tmp.ParamByName('id_parent').Value:=IB_Revizia_0_E.FieldByName('id').AsInteger;
  ib_tmp.ParamByName('id_sklad').Value:=IB_Revizia_0_E.FieldByName('id_sklad').AsInteger;
  ib_tmp.ParamByName('date_revizia').Value:=IB_Revizia_0_E.FieldByName('date_doc').AsDateTime;
  ib_tmp.ExecSQL;
  IB_Revizia_listy.Close;
  IB_Revizia_listy.Open;

  ib_tmp.free;
end;

procedure TF_Revizia_edit.IB_Revizia_FurnituraNewRecord(DataSet: TDataSet);
begin
  IB_Revizia_furnitura.FieldByName('id_parent').Value:=IB_Revizia_0_E.FieldByName('id').AsInteger;
end;

procedure TF_Revizia_edit.IB_Revizia_FurnituraCalcFields(
  DataSet: TDataSet);
var ib_tmp:TIBDataSet;
begin
  ib_tmp:=TIBDataSet.Create(nil);
  ib_tmp.Database:=DM_Mebeli.DB_Mebeli;
  ib_tmp.SelectSQL.Add('select fg.name grupa_name, f.id id_furnitura, f.name furnitura_name from furnitura_grupa fg, furnitura f where (f.id= :id_furnitura) and (f.id_grupa=fg.id)');
  ib_tmp.ParamByName('id_furnitura').Value:=IB_Revizia_furnitura.FieldByname('id_furnitura').AsInteger;
  ib_tmp.open;
  IB_Revizia_furnitura.FieldByName('grupa_name').Value:=ib_tmp.FieldByName('grupa_name').AsString;
  IB_Revizia_furnitura.FieldByName('material_name').Value:=ib_tmp.FieldByName('furnitura_name').AsString;
  IB_Revizia_furnitura.FieldByName('raznitsa').Value:=IB_Revizia_furnitura.FieldByName('kolvo_revizia').AsInteger-IB_Revizia_furnitura.FieldByName('kolvo_programa').AsInteger;
  ib_tmp.Close;
  ib_tmp.Free;
end;//proc

end.
