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
    E_Zakaz: TEdit;
    Label1: TLabel;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure B_SelectClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_ZakazExit(Sender: TObject);
    procedure E_ZakazKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    E_Zakaz.SetFocus;
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

procedure TF_Zakaz_select.E_ZakazExit(Sender: TObject);
var id_zakaz: integer;
begin
  id_zakaz:=0;
  if E_Zakaz.text='' then exit;
  Try
    id_zakaz:=StrToInt(E_Zakaz.text);
  except
    ShowMessage('Неправильный номер');
  end;
  IB_Zakaz_0.Locate('id',id_zakaz,[]);
  B_Select.SetFocus;
end;

procedure TF_Zakaz_select.E_ZakazKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then
    begin
      if E_Zakaz.text='' then exit;
      id_zakaz:=0;
      Try
        id_zakaz:=StrToInt(E_Zakaz.text);
      except
        ShowMessage('Неправильный номер');
      end;
      IB_Zakaz_0.Locate('id',id_zakaz,[]);
    end;
end;

end.
