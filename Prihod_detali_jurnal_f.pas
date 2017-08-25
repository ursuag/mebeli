unit Prihod_detali_jurnal_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, IBCustomDataSet, IBQuery;

type
  TF_Prihod_detali_jurnal = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Insert: TButton;
    B_Edit: TButton;
    B_Delete: TButton;
    IB_Prihod_detali_1_F: TIBDataSet;
    DS_Prihod_detali_1_F: TDataSource;
    DS_Prihod_detali_0_F: TDataSource;
    IB_Prihod_detali_0_F: TIBDataSet;
    IB_Prihod_detali_1_FID: TIntegerField;
    IB_Prihod_detali_1_FKOL_VO: TIntegerField;
    IB_Prihod_detali_1_FSUMMA: TIBBCDField;
    IB_Prihod_detali_1_FDETALI_GRUPA: TIBStringField;
    IB_Prihod_detali_1_FDETALI_NAME: TIBStringField;
    IB_Prihod_detali_1_FID_PILOMAT_DETALI: TIntegerField;
    IB_Prihod_detali_1_FPRICE_UNIT: TIBBCDField;
    procedure FormActivate(Sender: TObject);
    procedure B_EditClick(Sender: TObject);
    procedure B_InsertClick(Sender: TObject);
    procedure B_DeleteClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Prihod_detali_jurnal: TF_Prihod_detali_jurnal;
                  id_akt: integer;
                
implementation

uses mebeli_dm, main_f, Prihod_detali_edit_f;

{$R *.dfm}
procedure Reopen_tables;
begin
  with F_Prihod_detali_jurnal do
    begin
      IB_prihod_detali_0_F.Close;
      IB_Prihod_detali_1_F.Close;
      IB_prihod_detali_0_F.Open;
      IB_prihod_detali_1_F.Open;
      IF id_akt=0 Then
        IB_prihod_detali_0_F.Last
      ELSE
        IB_prihod_detali_0_F.Locate('ID',id_akt,[]);
    end;//With
end;//proc

procedure TF_Prihod_detali_jurnal.FormActivate(Sender: TObject);
begin
  id_akt:=0;
  Reopen_tables;
end;//proc

procedure TF_Prihod_detali_jurnal.B_EditClick(Sender: TObject);
begin
  IF (IB_Prihod_detali_0_F.FieldByName('ID_AKT_RASPIL').IsNull) or (role_name='ADMIN') or (role_name='CONTSUPERIOR') Then
    begin
      operation:='EDIT';
      id_akt:=IB_Prihod_detali_0_F.FieldByName('ID').AsInteger;
      F_Prihod_detali_edit.ShowModal;
      Reopen_tables;
    end//IF IsNull
  ELSE
    begin
      ShowMessage('Запись сгенерирована автоматически.'+Chr(13)+Chr(10)+' Измените акт распила №'+IB_Prihod_detali_0_F.FieldByName('ID_AKT_RASPIL').AsString);
    end;//ELSE
end;//proc

procedure TF_Prihod_detali_jurnal.B_InsertClick(Sender: TObject);
begin
  operation:='INSERT';
  F_Prihod_detali_edit.ShowModal;
  Reopen_tables;
end;//proc

procedure TF_Prihod_detali_jurnal.B_DeleteClick(Sender: TObject);
var sql_delete: TIBQuery;
begin
  IF not IB_Prihod_detali_0_F.FieldByName('ID_Akt_raspil').IsNull Then
    begin
      ShowMessage('Запись сгенерирована автоматически.'+Chr(13)+Chr(10)+' Удалите акт распила №'+IB_Prihod_detali_0_F.FieldByName('ID_AKT_RASPIL').AsString);
      exit;
    end;//if
  IF MessageDlg('Вы уверены, что хотите удалить?',mtWarning,[mbOk,mbNo],0)=mrOk Then
    begin
      sql_delete:=TIBQuery.Create(nil);
      sql_delete.Database:=F_Main.IBQuery1.Database;
      sql_delete.SQL.Add('delete from prihod_detali_0 where id='+IB_Prihod_detali_0_F.FieldByName('ID').AsString);
      IB_Prihod_detali_0_F.Prior;
      id_akt:=IB_Prihod_detali_0_F.FieldByName('ID').AsInteger;
      sql_delete.ExecSQL;
      sql_delete.Free;
      DM_Mebeli.IBTransaction1.Commit;
      Reopen_tables;
     end;//IF
end;//proc

procedure TF_Prihod_detali_jurnal.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Prihod_detali_jurnal.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Prihod_detali_jurnal);
end;

procedure TF_Prihod_detali_jurnal.DBGrid1DblClick(Sender: TObject);
begin
  F_Prihod_detali_jurnal.B_EditClick(Sender); 
end;

end.
