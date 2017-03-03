unit zakaz_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, DB;

type
  TF_Zakaz_edit = class(TForm)
    Panel1: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBE_Date_z: TDBEdit;
    DBGrid1: TDBGrid;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Zakaz_edit: TF_Zakaz_edit;
    OK_Pressed: boolean;
implementation

uses main_f, mebeli_dm, gotov_prod_f;

{$R *.dfm}

procedure TF_Zakaz_edit.FormActivate(Sender: TObject);
begin
  OK_Pressed:=False;
  DBE_Date_z.ReadOnly:=False;
  IF operation='INSERT' Then
     begin
       IF not DM_Mebeli.IBTransaction1.active Then
          DM_Mebeli.IBTransaction1.StartTransaction;
       DM_Mebeli.IB_Zakaz_0.Insert;
       DM_Mebeli.IB_Zakaz_0.FieldByName('DATE_Z').Value:=Date;
       DM_Mebeli.IB_Zakaz_0.Post;
       DBE_Date_z.ReadOnly:=True;
     end;//IF 'INSERT'
  IF operation='EDIT' Then
     DM_Mebeli.IB_Zakaz_0.Edit;
end;//proc

procedure TF_Zakaz_edit.B_ExitClick(Sender: TObject);
begin
  OK_Pressed:=FALSE;
  Close;
end;//proc

procedure TF_Zakaz_edit.B_OkClick(Sender: TObject);
begin
  IF DM_Mebeli.IBTransaction1.Active Then
    begin
      Try
        IF DM_Mebeli.IB_Zakaz_0.State=dsEdit	Then
          DM_Mebeli.IB_Zakaz_0.Post;
        IF (DM_Mebeli.IB_Zakaz_1.State=dsEdit) OR (DM_Mebeli.IB_Zakaz_1.State=dsInsert) Then
          DM_Mebeli.IB_Zakaz_1.Post;
        DM_Mebeli.IBTransaction1.Commit;
        OK_Pressed:=True;
        close;
      Except
        ShowMessage('Не все поля заполнены!');
      end;//Try
    end;//IF
end;//proc

procedure TF_Zakaz_edit.FormClose(Sender: TObject;
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
         IF DM_Mebeli.IB_Zakaz_0.State=dsEdit	Then
            DM_Mebeli.IB_Zakaz_0.Post;
         IF (DM_Mebeli.IB_Zakaz_1.State=dsEdit) OR (DM_Mebeli.IB_Zakaz_1.State=dsInsert) Then
            DM_Mebeli.IB_Zakaz_1.Post;
            DM_Mebeli.IBTransaction1.Commit;
       end;//IF DM_Mebeli.IBTransaction1.Active
end;//proc

procedure TF_Zakaz_edit.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var old_operation: string [6];
begin
  IF Key=#32 Then
    begin
      old_operation:=operation;
      operation:='SELECT';
      IF F_Gotov_prod.ShowModal=mrOk Then
        begin
          DM_Mebeli.IB_Zakaz_1.Edit;
          DM_Mebeli.IB_Zakaz_1.FieldByName('ID_GOTOV_PROD').Value:=F_Gotov_prod.GotovProd_ID;
        end;//IF =mrOk
      operation:=old_operation;
    end;//IF Key=#32
end;//proc

procedure TF_Zakaz_edit.DBGrid1EditButtonClick(Sender: TObject);
var old_operation: string [6];
begin
  old_operation:=operation;
  operation:='SELECT';
  IF F_Gotov_prod.ShowModal=mrOk Then
    begin
      DM_Mebeli.IB_Zakaz_1.Edit;
      DM_Mebeli.IB_Zakaz_1.FieldByName('ID_GOTOV_PROD').Value:=F_Gotov_prod.GotovProd_ID;
    end;//IF =mrOk
  operation:=old_operation;
end;//proc

procedure TF_Zakaz_edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Zakaz_edit);
end;

end.
