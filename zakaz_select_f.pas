unit zakaz_select_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids;

type
  TF_Zakaz_select = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Select: TButton;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure B_SelectClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Zakaz_select: TF_Zakaz_select;

implementation

uses mebeli_dm;

{$R *.dfm}

procedure TF_Zakaz_select.DBGrid1DblClick(Sender: TObject);
begin
  F_Zakaz_select.ModalResult:=mrOk;
end;//proc

procedure TF_Zakaz_select.FormActivate(Sender: TObject);
begin
  DM_Mebeli.IB_Zakaz_0.close;
  DM_Mebeli.IB_Zakaz_0.open;
  DM_Mebeli.IB_Zakaz_1.open;
  DM_Mebeli.IB_Zakaz_0.Last;
end;//proc

procedure TF_Zakaz_select.B_SelectClick(Sender: TObject);
begin
  F_Zakaz_select.ModalResult:=mrOk;
end;

procedure TF_Zakaz_select.B_ExitClick(Sender: TObject);
begin
  Close;
end;

end.
