unit sklad_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids;

type
  TF_Sklad = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    procedure B_ExitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Sklad: TF_Sklad;

implementation

uses mebeli_dm;

{$R *.dfm}

procedure TF_Sklad.B_ExitClick(Sender: TObject);
begin
  Close;
end;//proc

procedure TF_Sklad.FormActivate(Sender: TObject);
begin
  DM_Mebeli.IB_Sklad.Open
end;//proc

end.
