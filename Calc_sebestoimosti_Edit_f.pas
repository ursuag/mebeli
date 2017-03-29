unit Calc_sebestoimosti_Edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, Grids, DBGrids, Mask, DBCtrls,
  ExtCtrls, ComCtrls, DateUtils;

type
  TF_Calc_sebestoimosti_Edit = class(TForm)
    P_Shapka: TPanel;
    Label2: TLabel;
    Label5: TLabel;
    DBE_ID: TDBEdit;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    DS_Calc_Sebest_0: TDataSource;
    IB_Calc_Sebest_0: TIBDataSet;
    Label1: TLabel;
    DT_Date_calc: TDateTimePicker;
    B_Calc_Sebest: TButton;
    IB_Calc_Sebest_1: TIBDataSet;
    DS_Calc_Sebest_1: TDataSource;
    IB_Calc_Sebest_1ID: TIntegerField;
    IB_Calc_Sebest_1ID_PARENT: TIntegerField;
    IB_Calc_Sebest_1ID_GOTOVPROD: TIntegerField;
    IB_Calc_Sebest_1PRICE_SEBEST: TIBBCDField;
    IB_Calc_Sebest_1GRUPA_NAME: TStringField;
    IB_Calc_Sebest_1GOTOVPROD_NAME: TStringField;
    IB_Calc_Sebest_1ARTICLE: TIntegerField;
    DBEdit2: TDBEdit;
    DS_Calc_Sebest_2: TDataSource;
    IB_Calc_Sebest_2: TIBDataSet;
    DBGrid2: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure DT_Date_calcExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure IB_Calc_Sebest_1CalcFields(DataSet: TDataSet);
    procedure B_Calc_SebestClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Calc_sebestoimosti_Edit: TF_Calc_sebestoimosti_Edit;

implementation

{$R *.dfm}

uses main_f, mebeli_dm, calc_sebestoimosti_f;

procedure TF_Calc_sebestoimosti_Edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Calc_sebestoimosti_Edit);
end;

procedure TF_Calc_sebestoimosti_Edit.DT_Date_calcExit(Sender: TObject);
begin
  IB_Calc_Sebest_0.FieldByName('date_doc').Value:=DT_Date_calc.Date;
end;

procedure TF_Calc_sebestoimosti_Edit.FormActivate(Sender: TObject);
begin
  IB_Calc_Sebest_0.Open;
  if operation='INSERT' then
    begin
      IB_Calc_Sebest_0.Insert;
      DT_Date_calc.Date:=IncDay(Date,-1);
      IB_Calc_Sebest_0.FieldByName('date_doc').Value:=DT_Date_calc.Date;
    end;
  if operation='EDIT' then
    begin
      DT_Date_calc.Date:=IB_Calc_Sebest_0.FieldByName('date_doc').AsDateTime;
      IB_Calc_sebest_1.Open;
      IB_Calc_sebest_2.Open;
    end;
end;

procedure TF_Calc_sebestoimosti_Edit.IB_Calc_Sebest_1CalcFields(
  DataSet: TDataSet);
var ib_tmp:TIBDataSet;
begin
  IF IB_Calc_sebest_1.FieldByName('ID_GOTOVPROD').IsNull Then exit;
  ib_tmp:=TIBDataSet.Create(nil);
  ib_tmp.Database:=DM_Mebeli.DB_Mebeli;
  ib_tmp.SelectSQL.Add('select gpg.name as grupa_name, gp0.name gotovprod_name, gp0.article article from gotov_prod_grupa as gpg, gotov_prod_0 as gp0 where (gpg.id=gp0.id_grupa) and (gp0.id=:id_gotovprod)');
  ib_tmp.ParamByname('id_gotovprod').Value:=IB_Calc_sebest_1.FieldByName('ID_GOTOVPROD').AsInteger;
  ib_tmp.open;
  IB_Calc_sebest_1.FieldByName('GRUPA_NAME').Value:=ib_tmp.FieldByName('grupa_name').AsString;
  IB_Calc_sebest_1.FieldByName('GOTOVPROD_NAME').Value:=ib_tmp.FieldByName('gotovprod_name').AsString;
  IB_Calc_sebest_1.FieldByName('ARTICLE').Value:=ib_tmp.FieldByName('article').AsString;
  ib_tmp.close;
  ib_tmp.Free;
end;//proc

procedure TF_Calc_sebestoimosti_Edit.B_Calc_SebestClick(Sender: TObject);
var ib_tmp:TIBDataSet;
begin
  IB_Calc_sebest_2.Close;
  ib_tmp:=TIBDataSet.Create(nil);
  ib_tmp.Database:=DM_Mebeli.DB_Mebeli;
  ib_tmp.SelectSQL.Add('delete from calc_sebest_2 where id_parent='+IB_Calc_Sebest_0.FieldByname('id').AsString);
  ib_tmp.ExecSQL;
  ib_tmp.SelectSQL.Clear;
  ib_tmp.SelectSQL.Add('insert into CALC_SEBEST_2 (id_parent, doc_name, statya_rashoda, material_name, summa)');
  ib_tmp.SelectSQL.Add('select :id_parent, doc_name, statya_rashoda, material_name, summa from get_summa_for_sebest(current_date) order by 1,2');
  ib_tmp.ParamByname('id_parent').Value:=IB_Calc_Sebest_0.FieldByname('id').AsInteger;
  ib_tmp.ExecSQL;
  ib_tmp.Close;
  ib_tmp.Free;
  IB_Calc_sebest_2.Open;
end;

procedure TF_Calc_sebestoimosti_Edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DM_Mebeli.IBTransaction1.Active then DM_Mebeli.IBTransaction1.Rollback;
end;

end.
