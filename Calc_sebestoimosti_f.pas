unit Calc_sebestoimosti_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, IBCustomDataSet, Grids, DBGrids, StdCtrls, ExtCtrls, DateUtils;

type
  TF_Calc_sebestoimosti = class(TForm)
    Panel1: TPanel;
    B_Exit: TButton;
    B_Refresh: TButton;
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    N_Docs: TMenuItem;
    N_Insert_main: TMenuItem;
    N_Edit_main: TMenuItem;
    N5: TMenuItem;
    N_Delete_Main: TMenuItem;
    N_Period_of_view: TMenuItem;
    IB_Calc_Sebest_Jurnal: TIBDataSet;
    DS_Calc_Sebest_Jurnal: TDataSource;
    PopupMenu1: TPopupMenu;
    N_Insert_popup: TMenuItem;
    N_Edit_popup: TMenuItem;
    N1: TMenuItem;
    N_Delete: TMenuItem;
    IB_Calc_Sebest_1: TIBDataSet;
    DS_Calc_Sebest_1: TDataSource;
    DBGrid2: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N_Insert_mainClick(Sender: TObject);
    procedure N_Insert_popupClick(Sender: TObject);
    procedure N_Edit_mainClick(Sender: TObject);
    procedure N_Edit_popupClick(Sender: TObject);
    procedure N_DeleteClick(Sender: TObject);
    procedure N_Delete_MainClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_akt: integer;
  end;

var
  F_Calc_sebestoimosti: TF_Calc_sebestoimosti;
  period_start: TDate;
implementation

uses main_f, mebeli_dm, Calc_sebestoimosti_Edit_f;

{$R *.dfm}

procedure Reopen_tables;
begin
  with F_Calc_sebestoimosti do
    begin
      IB_Calc_Sebest_Jurnal.Close;
      IB_Calc_Sebest_1.Close;
      IB_Calc_Sebest_Jurnal.Open;
      if not IB_Calc_Sebest_Jurnal.Locate('id', id_akt,[]) then
        IB_Calc_Sebest_Jurnal.last;
      IB_Calc_Sebest_1.Open;
    end; //With
end;

procedure TF_Calc_sebestoimosti.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Calc_sebestoimosti);
end;

procedure TF_Calc_sebestoimosti.FormActivate(Sender: TObject);
begin
  period_start:=IncDay(Date,-360);
  IB_Calc_Sebest_Jurnal.ParamByName('date_start').Value:=DateToStr(period_start);
  Reopen_tables;
end;

procedure TF_Calc_sebestoimosti.N_Insert_popupClick(Sender: TObject);
begin
  N_Insert_mainClick(Sender);
end;

procedure TF_Calc_sebestoimosti.N_Insert_mainClick(Sender: TObject);
begin
  id_akt:=IB_Calc_Sebest_Jurnal.FieldByname('id').AsInteger;
  operation:='INSERT';
  F_Calc_sebestoimosti_Edit.ShowModal;
  Reopen_tables;
end;

procedure TF_Calc_sebestoimosti.N_Edit_mainClick(Sender: TObject);
begin
  id_akt:=IB_Calc_Sebest_Jurnal.FieldByname('id').AsInteger;
  operation:='EDIT';
  F_Calc_sebestoimosti_Edit.ShowModal;
  Reopen_tables;
end;

procedure TF_Calc_sebestoimosti.N_Delete_MainClick(Sender: TObject);
begin
  IF MessageDlg('Вы уверены, что хотите удалить калькуляцию?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
        IB_Calc_sebest_jurnal.Delete;
        DM_Mebeli.IBTransaction1.Commit;
        reopen_tables;
     end;
end;//proc

procedure TF_Calc_sebestoimosti.N_Edit_popupClick(Sender: TObject);
begin
  N_Edit_mainClick(Sender);
end;

procedure TF_Calc_sebestoimosti.N_DeleteClick(Sender: TObject);
begin
  N_Delete_MainClick(Sender);
end;


end.
