unit Ostatok_furnitura_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ExtCtrls, DB,
  IBCustomDataSet;

type
  TF_Ostatok_furnitura_edit = class(TForm)
    Label6: TLabel;
    P_Shapka: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBE_ID: TDBEdit;
    DBE_Date_p: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    IB_Prihod_furnitura_0: TIBDataSet;
    DS_Prihod_furnitura_0: TDataSource;
    IB_Prihod_furnitura_1: TIBDataSet;
    DS_Prihod_furnitura_1: TDataSource;
    IB_Prihod_furnitura_1ID_PARENT: TIntegerField;
    IB_Prihod_furnitura_1ID_FURNITURA: TIntegerField;
    IB_Prihod_furnitura_1KOL_VO: TIBBCDField;
    IB_Prihod_furnitura_1ID: TIntegerField;
    IB_Prihod_furnitura_1SUMMA: TIBBCDField;
    IB_Prihod_furnitura_0ID: TIntegerField;
    IB_Prihod_furnitura_0DATE_P: TDateField;
    IB_Prihod_furnitura_0ID_SKLAD: TIntegerField;
    IB_Prihod_furnitura_0PRIMECHANIE: TIBStringField;
    IB_Prihod_furnitura_0ID_CONTRAGENT: TIntegerField;
    IB_Prihod_furnitura_0ID_STATYA_DOHODA: TIntegerField;
    IB_Prihod_furnitura_0NOMER_TTN: TIBStringField;
    IB_Prihod_furnitura_0ID_REVIZIA: TIntegerField;
    IB_Prihod_furnitura_0IS_OSTATOK: TSmallintField;
    IB_Prihod_furnitura_0SKLAD_NAME: TStringField;
    IB_Prihod_furnitura_1GRUPA_NAME: TStringField;
    IB_Prihod_furnitura_1FURNITURA_NAME: TStringField;
    IB_Prihod_furnitura_1FURNITURA_EDIZM: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure IB_Prihod_furnitura_1NewRecord(DataSet: TDataSet);
    procedure IB_Prihod_furnitura_1CalcFields(DataSet: TDataSet);
    procedure B_OkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_ExitClick(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Ostatok_furnitura_edit: TF_Ostatok_furnitura_edit;

implementation

uses main_f, mebeli_dm, Ostatok_furnitura_f, furnitura_f;

{$R *.dfm}

procedure TF_Ostatok_furnitura_edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Ostatok_furnitura_edit);
end;

procedure TF_Ostatok_furnitura_edit.FormActivate(Sender: TObject);
begin
  IB_prihod_furnitura_0.Open;
  IF operation='INSERT' Then
     begin
       IF not DM_Mebeli.IBTransaction1.active Then
          DM_Mebeli.IBTransaction1.StartTransaction;
       IB_prihod_furnitura_0.Insert;
       IB_prihod_furnitura_0.FieldByName('DATE_P').Value:=Date;
       IB_prihod_furnitura_0.FieldByName('ID_SKLAD').Value:=sklad_detali;
       IB_prihod_furnitura_0.FieldByName('IS_OSTATOK').Value:=1;
     end;//IF 'INSERT'
  F_Ostatok_furnitura.id_akt:=IB_prihod_furnitura_0.FieldByName('ID').AsInteger;
  IF (IB_prihod_furnitura_0.FieldByName('DATE_P').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      B_OK.Enabled:=false;
      ShowMessage('Дата документа меньше даты запрета редактирования');
    end;//IF DataZapretaRedakt
  IB_prihod_furnitura_1.Open;
end;

procedure TF_Ostatok_furnitura_edit.IB_Prihod_furnitura_1NewRecord(DataSet: TDataSet);
begin
  IB_Prihod_furnitura_1.FieldByName('id_parent').Value:=IB_Prihod_furnitura_0.FieldByname('id').AsInteger;
end;

procedure TF_Ostatok_furnitura_edit.IB_Prihod_furnitura_1CalcFields(
  DataSet: TDataSet);
var ib_tmp:TIBDataSet;
begin
  IF IB_Prihod_furnitura_1.FieldByName('ID_FURNITURA').IsNull Then exit;
  ib_tmp:=TIBDataSet.Create(nil);
  ib_tmp.Database:=DM_Mebeli.DB_Mebeli;
  ib_tmp.SelectSQL.Add('select fg.name grupa_name, f.name furnitura_name, f.ed_izm ed_izm from furnitura_grupa fg, furnitura f where (fg.id=f.id_parent) and (f.id=:id_furnitura)');
  ib_tmp.ParamByName('id_furnitura').Value:=IB_Prihod_furnitura_1.FieldByName('ID_FURNITURA').AsInteger;
  ib_tmp.open;
  IB_Prihod_furnitura_1.FieldByName('grupa_name').Value:=ib_tmp.FieldByname('grupa_name').AsString;
  IB_Prihod_furnitura_1.FieldByName('furnitura_name').Value:=ib_tmp.FieldByname('furnitura_name').AsString;
  IB_Prihod_furnitura_1.FieldByName('furnitura_edizm').Value:=ib_tmp.FieldByname('ed_izm').AsString;
  ib_tmp.Close;
  ib_tmp.Free;
end;//proc

procedure TF_Ostatok_furnitura_edit.B_OkClick(Sender: TObject);
begin
  if (IB_Prihod_furnitura_0.State=dsInsert) or (IB_Prihod_furnitura_0.State=dsEdit) then
    IB_Prihod_furnitura_0.Post;
  if (IB_Prihod_furnitura_1.State=dsInsert) or (IB_Prihod_furnitura_1.State=dsEdit) then
    IB_Prihod_furnitura_1.Post;
  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Commit;
  F_Ostatok_furnitura_edit.Close;
end;

procedure TF_Ostatok_furnitura_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var res:TModalResult;
begin
  if DM_Mebeli.IBTransaction1.Active then
  begin
    res:=MessageDlg('Сохранить изменения?',mtConfirmation,[mbYes,mbNo,mbCancel],0);
    if res=mrCancel then
      action:=caNone;
    if res=mrNo then
      begin
        if DM_Mebeli.IBTransaction1.Active then
          DM_Mebeli.IBTransaction1.Rollback;
        F_Ostatok_furnitura_edit.close;
      end;
    if res=mrYes then
      B_OkClick(Sender);
  end;
end;

procedure TF_Ostatok_furnitura_edit.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Ostatok_furnitura_edit.DBGrid1EditButtonClick(
  Sender: TObject);
var old_operation: string;
begin
  old_operation:=operation;
  operation:='SELECT';
  F_Furnitura.ShowModal;
  operation:=old_operation;
  IF IB_Prihod_furnitura_1.State=dsBrowse Then
    IB_Prihod_furnitura_1.Edit;
  IB_Prihod_furnitura_1.FieldByName('ID_FURNITURA').Value:=id_furnitura;;
end;//proc

end.
