unit Zakaz_Gotovprod_Ostatok_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, IBCustomDataSet;

type
  TF_Zakaz_Gotovprod_Ostatok = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    B_Select: TButton;
    B_Close: TButton;
    IB_ZAKAZ_GOTOVPROD_OSTATOK: TIBDataSet;
    DS_ZAKAZ_GOTOVPROD_OSTATOK: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure B_CloseClick(Sender: TObject);
    procedure B_SelectClick(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Zakaz_Gotovprod_Ostatok: TF_Zakaz_Gotovprod_Ostatok;

implementation

uses main_f, mebeli_dm;

{$R *.dfm}

procedure TF_Zakaz_Gotovprod_Ostatok.FormActivate(Sender: TObject);
begin
  IB_ZAKAZ_GOTOVPROD_OSTATOK.Open;
end;

procedure TF_Zakaz_Gotovprod_Ostatok.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TF_Zakaz_Gotovprod_Ostatok.B_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Zakaz_Gotovprod_Ostatok.B_SelectClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TF_Zakaz_Gotovprod_Ostatok.DBGrid1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key=13 then
    ModalResult:=mrOk;
end;

procedure TF_Zakaz_Gotovprod_Ostatok.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Zakaz_Gotovprod_Ostatok);
end;

end.
