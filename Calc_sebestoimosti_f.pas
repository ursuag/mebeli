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
    N2: TMenuItem;
    B_New_doc_mainmenu: TMenuItem;
    N_Edit_mainmenu: TMenuItem;
    N5: TMenuItem;
    N_Delete_Mainmenu: TMenuItem;
    N_Period_of_view: TMenuItem;
    IB_Calc_Sebest_Jurnal: TIBDataSet;
    DS_Calc_Sebest_Jurnal: TDataSource;
    PopupMenu1: TPopupMenu;
    N_Prihod: TMenuItem;
    N_Rashod: TMenuItem;
    N7: TMenuItem;
    N_Edit: TMenuItem;
    N1: TMenuItem;
    N_Delete: TMenuItem;
    IB_Calc_Sebest_1_Jurnal: TIBDataSet;
    DS_Calc_Sebest_1_Jurnal: TDataSource;
    DBGrid2: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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

uses main_f, mebeli_dm;

{$R *.dfm}

procedure Reopen_tables;
begin
  with F_Calc_sebestoimosti do
    begin
      IB_Calc_Sebest_Jurnal.Close;
      IB_Calc_Sebest_1_Jurnal.Close;
      IB_Calc_Sebest_Jurnal.Open;
      if not IB_Calc_Sebest_Jurnal.Locate('id', id_akt,[]) then
        IB_Calc_Sebest_Jurnal.last;
      IB_Calc_Sebest_1_Jurnal.Open;
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

end.
