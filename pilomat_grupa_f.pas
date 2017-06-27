unit pilomat_grupa_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrls, Grids, DBGrids, DB;

type
  TF_pilomat_grupa = class(TForm)
    DBGrid1: TDBGrid;
    DBE_Grupa_name: TDBEdit;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    DBE_ID: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBE_Article: TDBEdit;
    DB_MANUFACTURER_CODE: TDBEdit;
    Label3: TLabel;
    procedure B_ExitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBE_Grupa_nameExit(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_pilomat_grupa: TF_pilomat_grupa;
  OK_Pressed: boolean;
implementation

uses mebeli_dm, main_f;

{$R *.dfm}

procedure TF_pilomat_grupa.B_ExitClick(Sender: TObject);
begin
  OK_Pressed:=False;
  Close;
end;//proc

procedure TF_pilomat_grupa.FormActivate(Sender: TObject);
begin
  OK_Pressed:=False;
  DM_Mebeli.IB_Pilomat_grupa.Open;
  IF operation='INSERT' Then
     DM_Mebeli.IB_Pilomat_grupa.Insert;
  IF operation='EDIT' Then
     DM_Mebeli.IB_Pilomat_grupa.Edit;
end;//proc

procedure TF_pilomat_grupa.B_OkClick(Sender: TObject);
begin
  IF operation='ERROR' Then
    begin
      DBGrid1.SetFocus;
      exit;
    end;
  OK_Pressed:=True;
  IF DM_Mebeli.IB_Pilomat_grupa.State=dsEdit Then
    DM_Mebeli.IB_Pilomat_grupa.Post;
  DM_Mebeli.IBTransaction1.Commit;
  close;
end;//proc

procedure TF_pilomat_grupa.FormClose(Sender: TObject;
  var Action: TCloseAction);
var res:TModalResult;
begin
  IF OK_Pressed Then exit;
  IF operation='ERROR' Then
    begin
      DM_Mebeli.IB_Pilomat_grupa_vidrabot.Cancel;
      DM_Mebeli.IBTransaction1.Rollback;
      exit;
    end;//proc
  res:=MessageDlg('Сохранить изменения?',mtConfirmation,[mbYes,mbNo,mbCancel],0);
  IF res=mrCancel Then
     Action:=caNone;
  IF res=mrNo Then
     IF DM_Mebeli.IBTransaction1.Active Then
        DM_Mebeli.IBTransaction1.Rollback
  ELSE
     IF DM_Mebeli.IBTransaction1.Active Then
        begin
          DM_Mebeli.IB_Pilomat_grupa.Post;
          DM_Mebeli.IBTransaction1.Commit;
        end;//IF DM_Mebeli.IBTransaction1.Active
end;//proc

procedure TF_pilomat_grupa.DBE_Grupa_nameExit(Sender: TObject);
begin
  IF operation='INSERT' Then
    begin
       DM_Mebeli.IB_Pilomat_grupa.Post;
       DM_Mebeli.IB_Pilomat_grupa.Edit;
       operation:='0';
    end;//IF operation
end;//proc

procedure TF_pilomat_grupa.DBGrid1Exit(Sender: TObject);
begin
  IF DM_Mebeli.IBTransaction1.Active Then
     begin
       Try
         DM_Mebeli.IB_Pilomat_grupa.Post;
         DM_Mebeli.IBTransaction1.Commit;
         operation:='';
       Except
            operation:='ERROR';
       end;//try
     end;//if
end;//proc

end.
