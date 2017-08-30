unit constanty_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TF_Constanty = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    procedure B_ExitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  F_Constanty: TF_Constanty;

implementation

uses main_f, mebeli_dm;
{$R *.dfm}

procedure TF_Constanty.B_ExitClick(Sender: TObject);
begin
  IF DM_Mebeli.IBTransaction1.Active Then
    DM_Mebeli.IBTransaction1.Commit;
  Close;
end;

procedure TF_Constanty.FormActivate(Sender: TObject);
begin
  DM_Mebeli.IB_Constanty.Open;
end;//proc

procedure TF_Constanty.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM_Mebeli.IB_Constanty.Open;
end;

end.
