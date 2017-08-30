unit password_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TF_Password = class(TForm)
    E_User_Name: TEdit;
    E_Password: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    B_Ok: TButton;
    B_Exit: TButton;
    procedure B_ExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Password: TF_Password;

implementation

{$R *.dfm}

procedure TF_Password.B_ExitClick(Sender: TObject);
begin
  ModalResult:=mrAbort;
end;

end.
