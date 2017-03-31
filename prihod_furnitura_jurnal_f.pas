unit prihod_furnitura_jurnal_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, Menus, DateUtils,
  IBCustomDataSet;

type
  TF_Prihod_furnitura_jurnal = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Insert: TButton;
    B_Edit: TButton;
    B_Delete: TButton;
    MainMenu1: TMainMenu;
    N_Period_of_view: TMenuItem;
    IB_Prihod_furnitura_1_F: TIBDataSet;
    IB_Prihod_furnitura_1_FGRUPA_NAME: TIBStringField;
    IB_Prihod_furnitura_1_FFURNITURA_NAME: TIBStringField;
    IB_Prihod_furnitura_1_FID_FURNITURA: TIntegerField;
    IB_Prihod_furnitura_1_FKOL_VO: TIBBCDField;
    IB_Prihod_furnitura_1_FED_IZM: TIBStringField;
    IB_Prihod_furnitura_1_FSUMMA: TIBBCDField;
    DS_Prihod_furnitura_1_F: TDataSource;
    IB_Prihod_furnitura_0_F: TIBDataSet;
    DS_Prihod_furnitura_0_F: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_InsertClick(Sender: TObject);
    procedure B_EditClick(Sender: TObject);
    procedure B_DeleteClick(Sender: TObject);
    procedure N_Period_of_viewClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Prihod_furnitura_jurnal: TF_Prihod_furnitura_jurnal;
                  id_akt: integer;
implementation

uses main_f, mebeli_dm, prihod_furnitura_edit_f;

{$R *.dfm}

procedure Reopen_tables;
begin
  DM_Mebeli.IB_prihod_furnitura_0.Close;
  F_Prihod_furnitura_jurnal.IB_prihod_furnitura_0_F.Close;
  F_Prihod_furnitura_jurnal.IB_prihod_furnitura_1_F.Close;
  F_Prihod_furnitura_jurnal.IB_prihod_furnitura_0_F.ParamByName('date_start').Value:=DateToStr(select_date_start);

  F_Prihod_furnitura_jurnal.IB_prihod_furnitura_0_F.Open;
  F_Prihod_furnitura_jurnal.IB_prihod_furnitura_1_F.Open;
  IF id_akt=0 Then
    F_Prihod_furnitura_jurnal.IB_prihod_furnitura_0_F.Last
  ELSE
    F_Prihod_furnitura_jurnal.IB_prihod_furnitura_0_F.Locate('ID',id_akt,[]);
end;//proc


procedure TF_Prihod_furnitura_jurnal.FormActivate(Sender: TObject);
begin
  id_akt:=0;
  Reopen_tables;
end;//proc

procedure TF_Prihod_furnitura_jurnal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM_Mebeli.IB_Prihod_furnitura_0.Close;
  DM_Mebeli.IB_Prihod_furnitura_1.Close;
end;//proc

procedure TF_Prihod_furnitura_jurnal.B_InsertClick(Sender: TObject);
begin
  operation:='INSERT';
  DM_Mebeli.IB_Prihod_furnitura_0.Open;
  F_Prihod_furnitura_edit.ShowModal;
  Reopen_tables;
end;//proc

procedure TF_Prihod_furnitura_jurnal.B_EditClick(Sender: TObject);
begin
  operation:='EDIT';
  id_akt:=IB_prihod_furnitura_0_F.FieldByName('id').AsInteger;
  DM_Mebeli.IB_Prihod_furnitura_0.ParamByName('id').Value:=id_akt;
  DM_Mebeli.IB_Prihod_furnitura_0.Open;
  F_Prihod_furnitura_edit.ShowModal;
  Reopen_tables;
end;//proc

procedure TF_Prihod_furnitura_jurnal.B_DeleteClick(Sender: TObject);
var
  id_for_delete: integer;
        ib_temp: TIBDataSet;
begin
  IF MessageDlg('Вы уверены, что хотите удалить?',mtWarning,[mbOk,mbNo],0)=mrOk Then
    begin
      id_for_delete:=IB_Prihod_furnitura_0_F.FieldByName('ID').AsInteger;
      IB_Prihod_furnitura_0_F.Prior;
      id_akt:=IB_Prihod_furnitura_0_F.FieldByName('ID').AsInteger;
      ib_temp:=TIBDataSet.Create(nil);
      ib_temp.Database:=DM_Mebeli.DB_Mebeli;
      ib_temp.SelectSQL.Add('delete from prihod_furnitura_0 where id='+IntToStr(id_for_delete));
      ib_temp.ExecSQL;
      ib_temp.free;
      DM_Mebeli.IBTransaction1.Commit;
      Reopen_tables;
     end;//IF
end;//proc

procedure TF_Prihod_furnitura_jurnal.N_Period_of_viewClick(
  Sender: TObject);
begin
  select_date_start:=StrToDate( InputBox('Начало периода просмотра','Введите дату', DateToStr(IncDay(Date,-60))) );
  id_akt:=DM_Mebeli.IB_Prihod_furnitura_0.FieldByName('ID').AsInteger;
  reopen_tables;
end;

procedure TF_Prihod_furnitura_jurnal.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Prihod_furnitura_jurnal.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Prihod_furnitura_jurnal);
end;

end.
