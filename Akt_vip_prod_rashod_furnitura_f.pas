unit Akt_vip_prod_rashod_furnitura_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, Grids, DBGrids, StdCtrls, ExtCtrls, Mask,
  DBCtrls;

type
  TF_Akt_vip_prod_rashod_furnitura = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBE_NOMER: TDBEdit;
    Label2: TLabel;
    DBE_Date_a: TDBEdit;
    P_OK_Cancel: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure B_ExitClick(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Akt_vip_prod_rashod_furnitura: TF_Akt_vip_prod_rashod_furnitura;
                       OK_Pressed: boolean;
implementation

{$R *.dfm}
uses main_f, mebeli_dm, furnitura_f;

procedure TF_Akt_vip_prod_rashod_furnitura.FormActivate(Sender: TObject);
begin
  DM_Mebeli.IB_rashod_furnitura.Close;
  DM_Mebeli.IB_rashod_furnitura.ParamByname('nomer').Value:=DM_Mebeli.IB_Akt_vip_prod_0.FieldByname('nomer').AsInteger;
  DM_Mebeli.IB_rashod_furnitura.Open;
end;//proc

procedure TF_Akt_vip_prod_rashod_furnitura.DBGrid1EditButtonClick(
  Sender: TObject);
begin
  IF (DM_Mebeli.IB_Rashod_furnitura.FieldByname('kol_vo').AsFloat>0) and (DM_Mebeli.IB_Rashod_furnitura.State=dsBrowse) Then
    begin
      ShowMessage('Удалите старую запись!!!');
      exit;
    end;//IF
  operation:='SELECT';
  IF F_Furnitura.ShowModal=mrCancel Then
    begin
      DM_Mebeli.IB_Rashod_furnitura.Delete;
      exit;
    end;//IF
  DM_Mebeli.IB_Rashod_furnitura.Edit;
  DM_Mebeli.IB_Rashod_furnitura.FieldByName('id_furnitura').Value:=id_furnitura;
  DM_Mebeli.IB_Rashod_furnitura.FieldByName('kol_vo').Value:=0;
  DM_Mebeli.IB_Rashod_furnitura.FieldByName('DATE_R').Value:=DM_Mebeli.IB_Akt_vip_prod_0.FieldByName('DATE_A').AsDateTime;
  DM_Mebeli.IB_Rashod_furnitura.FieldByName('ID_AKT_VIP_PROD').Value:=DM_Mebeli.IB_Akt_vip_prod_0.FieldByName('NOMER').AsInteger;
  DM_Mebeli.IB_Rashod_furnitura.Post;
  DM_Mebeli.IB_Rashod_furnitura.Close;
  DM_Mebeli.IB_Rashod_furnitura.Open;
  DM_Mebeli.IB_Rashod_furnitura.Locate('id_furnitura;id_akt_vip_prod',VarArrayOf([id_furnitura,DM_Mebeli.IB_Akt_vip_prod_0.FieldByname('nomer').AsInteger]),[]);
end;//proc

procedure TF_Akt_vip_prod_rashod_furnitura.FormClose(Sender: TObject;
  var Action: TCloseAction);
var msg_res: word;
begin
  IF OK_Pressed Then exit;
  IF DM_Mebeli.IBTransaction1.Active Then
  begin
    msg_res:=MessageDlg('Сохранить изменения в расходе комплектующих?',mtConfirmation, [mbYes, mbNo], 0);
    IF msg_res = mrYes then
      begin
        IF (DM_Mebeli.IB_Rashod_furnitura.State=dsEdit) or (DM_Mebeli.IB_Rashod_furnitura.State=dsInsert) Then
          DM_Mebeli.IB_Rashod_furnitura.Post;
        DM_Mebeli.IBTransaction1.Commit;
      end//IF MessageDlg
    ELSE //IF MessageDlg
      begin
        IF (DM_Mebeli.IB_Rashod_furnitura.State=dsEdit) or (DM_Mebeli.IB_Rashod_furnitura.State=dsInsert) Then
          DM_Mebeli.IB_Rashod_furnitura.Cancel;
        DM_Mebeli.IBTransaction1.Rollback;
      end;//ELSE
  end;//IF DM_Mebeli.IBTransaction1.Active Then
end;//proc

procedure TF_Akt_vip_prod_rashod_furnitura.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  If (key=Chr(27)) and (DM_Mebeli.IB_Rashod_furnitura.FieldByName('kol_vo').AsFloat=0) Then
    DM_Mebeli.IB_Rashod_furnitura.Delete;
end;

procedure TF_Akt_vip_prod_rashod_furnitura.B_ExitClick(Sender: TObject);
begin
  OK_Pressed:=false;
  close;
end;//proc

procedure TF_Akt_vip_prod_rashod_furnitura.B_OkClick(Sender: TObject);
begin
  IF DM_Mebeli.IBTransaction1.Active Then
  begin
    IF (DM_Mebeli.IB_Rashod_furnitura.State=dsEdit) or (DM_Mebeli.IB_Rashod_furnitura.State=dsInsert) Then
      DM_Mebeli.IB_Rashod_furnitura.Post;
    DM_Mebeli.IBTransaction1.Commit;
  end;//IF DM_Mebeli.IBTransaction1.Active Then
  OK_Pressed:=true;
  close;
end;//proc

procedure TF_Akt_vip_prod_rashod_furnitura.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Akt_vip_prod_rashod_furnitura);
end;

end.

