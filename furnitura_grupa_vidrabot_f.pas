unit furnitura_grupa_vidrabot_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, DB;

type
  TF_furnitura_grupa_vidrabot = class(TForm)
    DBEdit1: TDBEdit;
    Label1: TLabel;
    GB_Vid_rabot: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    CB_IsUsed_Akt_viprabot: TCheckBox;
    Panel1: TPanel;
    B_Cancel: TButton;
    B_Ok: TButton;
    procedure FormActivate(Sender: TObject);
    procedure CB_IsUsed_Akt_viprabotClick(Sender: TObject);
    procedure B_CancelClick(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_furnitura_grupa_vidrabot: TF_furnitura_grupa_vidrabot;
  OK_Pressed: boolean;

implementation

uses main_f, mebeli_dm;

{$R *.dfm}

procedure TF_furnitura_grupa_vidrabot.FormActivate(Sender: TObject);
begin
  CB_IsUsed_Akt_viprabot.Checked:=false;
  IF operation='EDIT' Then
    begin
      DM_Mebeli.IB_Furnitura_grupa.Edit;
      IF not DM_Mebeli.IB_Furnitura_grupa.FieldByName('ID_VID_RABOT').IsNull Then
        CB_IsUsed_Akt_viprabot.Checked:=true;
    end;//IF operation='EDIT'

  IF operation='INSERT' Then
     DM_Mebeli.IB_Furnitura_grupa.Insert;
end;//proc

procedure TF_furnitura_grupa_vidrabot.CB_IsUsed_Akt_viprabotClick(
  Sender: TObject);
begin
  IF CB_IsUsed_Akt_viprabot.Checked Then
    GB_Vid_rabot.Visible:=True
  ELSE
    GB_Vid_rabot.Visible:=False;
end;//proc

procedure TF_furnitura_grupa_vidrabot.B_CancelClick(Sender: TObject);
begin
  OK_Pressed:=false;
  Close;
end;//proc

procedure TF_furnitura_grupa_vidrabot.B_OkClick(Sender: TObject);
begin
  IF not CB_IsUsed_Akt_viprabot.Checked Then
     DM_Mebeli.IB_Furnitura_grupa.FieldByName('ID_VID_RABOT').Value:=null;
  IF DM_Mebeli.IBTransaction1.Active Then
     begin
       IF (DM_Mebeli.IB_Furnitura_grupa.State=dsEdit) OR (DM_Mebeli.IB_Furnitura_grupa.State=dsInsert) Then
          DM_Mebeli.IB_Furnitura_grupa.Post;
       DM_Mebeli.IBTransaction1.Commit;
     end;//IF
  OK_Pressed:=True;
  close;
end;//proc

procedure TF_furnitura_grupa_vidrabot.FormClose(Sender: TObject;
  var Action: TCloseAction);
var res:TModalResult;
begin
  IF OK_Pressed Then exit;

  res:=MessageDlg('Сохранить изменения?',mtConfirmation,[mbYes,mbNo,mbCancel],0);
  IF res=mrCancel Then
     Action:=caNone;
  IF res=mrNo Then
     IF DM_Mebeli.IBTransaction1.Active Then
        DM_Mebeli.IBTransaction1.Rollback
  ELSE
     IF DM_Mebeli.IBTransaction1.Active Then
        begin
           IF (DM_Mebeli.IB_Furnitura_grupa.State=dsEdit) OR (DM_Mebeli.IB_Furnitura_grupa.State=dsInsert) Then
              DM_Mebeli.IB_Furnitura_grupa.Post;
           DM_Mebeli.IBTransaction1.Commit;
        end;//IF DM_Mebeli.IBTransaction1.Active
end;//proc

end.
