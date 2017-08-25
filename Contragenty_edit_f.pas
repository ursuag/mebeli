unit Contragenty_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, DB;

type
  TF_Contragenty_edit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Panel1: TPanel;
    B_Ok: TButton;
    B_Cancel: TButton;
    procedure B_OkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Contragenty_edit: TF_Contragenty_edit;

implementation

uses mebeli_dm, main_f;

{$R *.dfm}

procedure TF_Contragenty_edit.B_OkClick(Sender: TObject);
begin
  if (DM_Mebeli.IB_Contragenty_1.State=dsEdit) or (DM_Mebeli.IB_Contragenty_1.State=dsInsert) then
    DM_Mebeli.IB_Contragenty_1.Post;
  DM_Mebeli.IBTransaction1.Commit;
end;

end.
