unit zakaz_select_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, IBCustomDataSet;

type
  TF_Zakaz_select = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Select: TButton;
    IB_Zakaz_0: TIBDataSet;
    DS_Zakaz_0: TDataSource;
    IB_Zakaz_1: TIBDataSet;
    DS_Zakaz_1: TDataSource;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure B_SelectClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Zakaz_select: TF_Zakaz_select;

implementation

uses mebeli_dm, main_f;

{$R *.dfm}

procedure TF_Zakaz_select.DBGrid1DblClick(Sender: TObject);
begin
  F_Zakaz_select.ModalResult:=mrOk;
end;//proc

procedure TF_Zakaz_select.FormActivate(Sender: TObject);
begin
    IB_Zakaz_0.open;
    IB_Zakaz_0.last;
    IB_Zakaz_1.Open;
end;//proc

procedure TF_Zakaz_select.B_SelectClick(Sender: TObject);
begin
  F_Zakaz_select.ModalResult:=mrOk;
end;

procedure TF_Zakaz_select.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Zakaz_select.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  id_zakaz:=IB_Zakaz_0.FieldByname('id').AsInteger;
end;

end.
