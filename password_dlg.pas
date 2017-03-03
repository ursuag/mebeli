unit password_dlg;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons;

type
  TPasswordDlg = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PasswordDlg: TPasswordDlg;

implementation

uses main_f;

{$R *.dfm}


procedure TPasswordDlg.FormActivate(Sender: TObject);
begin
  Password.Text:='';
  Password.SetFocus;
end;//proc

procedure TPasswordDlg.FormCreate(Sender: TObject);
begin
  Tag:=0;
end;

end.

