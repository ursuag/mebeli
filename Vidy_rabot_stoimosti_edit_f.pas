unit Vidy_rabot_stoimosti_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, ExtCtrls;

type
  TF_Vidy_rabot_stoimosti_edit = class(TForm)
    Label1: TLabel;
    DBE_Vid_Rabot: TDBEdit;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    Label2: TLabel;
    DBE_Date_stoim: TDBEdit;
    Label3: TLabel;
    DBE_Price: TDBEdit;
    Label4: TLabel;
    DB_Gotov_prod: TDBLookupComboBox;
    Label5: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Vidy_rabot_stoimosti_edit: TF_Vidy_rabot_stoimosti_edit;
  OK_Pressed: boolean;
implementation

uses main_f, mebeli_dm;

{$R *.dfm}

procedure TF_Vidy_rabot_stoimosti_edit.FormActivate(Sender: TObject);
begin
  DM_Mebeli.IB_Vidy_rabot_stoimosti.Open;
  IF operation='INSERT' Then
    begin
      DM_Mebeli.IB_Vidy_rabot_stoimosti.Insert;
      DM_Mebeli.IB_Vidy_rabot_stoimosti.FieldByName('DATE_STOIM').Value:=Date;
    end;//IF operation='INSERT'
  IF operation='EDIT' Then
    DM_Mebeli.IB_Vidy_rabot_stoimosti.Edit;
  DB_Gotov_prod.SetFocus;
end;//proc

procedure TF_Vidy_rabot_stoimosti_edit.B_OkClick(Sender: TObject);
begin
  IF DM_Mebeli.IBTransaction1.Active Then
     begin
       DM_Mebeli.IB_Vidy_rabot_stoimosti.Post;
       DM_Mebeli.IBTransaction1.Commit;
     end;//IF
  OK_Pressed:=True;
  close;
end;//proc

procedure TF_Vidy_rabot_stoimosti_edit.B_ExitClick(Sender: TObject);
begin
  OK_Pressed:=False;
  Close;
end;//proc

procedure TF_Vidy_rabot_stoimosti_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var res:TModalResult;
begin
  IF OK_Pressed Then exit;
  res:=MessageDlg('Сохранить изменения?',mtConfirmation,[mbYes,mbNo,mbCancel],0);
  IF res=mrCancel Then
     Action:=caNone;
  IF res=mrNo Then
     IF DM_Mebeli.IBTransaction1.Active Then
        DM_Mebeli.IBTransaction1.Rollback;
  IF res=mrYes Then
     IF DM_Mebeli.IBTransaction1.Active Then
        begin
          DM_Mebeli.IB_Vidy_rabot_stoimosti.Post;
          DM_Mebeli.IBTransaction1.Commit;
        end;//IF DM_Mebeli.IBTransaction1.Active
end;//proc

end.
