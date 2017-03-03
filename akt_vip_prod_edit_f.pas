unit akt_vip_prod_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, Buttons, Grids, DBGrids, ExtCtrls, DB;

type
  TF_Akt_vip_prod_edit = class(TForm)
    P_OK_Cancel: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    DBGrid1: TDBGrid;
    P_Shapka: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    B_Select_Zakaz: TSpeedButton;
    DBE_NOMER: TDBEdit;
    DBE_Date_a: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBE_ID_Zakaz: TDBEdit;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    procedure B_Select_ZakazClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_OkClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Akt_vip_prod_edit: TF_Akt_vip_prod_edit;
           OK_Pressed: boolean;
implementation

uses mebeli_dm, main_f, zakaz_select_f, akt_vip_prod_jurnal_f,
  gotov_prod_f;

{$R *.dfm}

Function Check_IF_ALL_DATA: Boolean;
var s: string;
begin
  s:='';
  IF DM_Mebeli.IB_Akt_vip_prod_0.fieldbyname('ID_SKLAD_OTKUDA').IsNull Then
     s:=s+' (СКЛАД ОТПУСКА)';
  IF DM_Mebeli.IB_Akt_vip_prod_0.fieldbyname('ID_SKLAD_KUDA').IsNull Then
     s:=s+' (СКЛАД НАЗНАЧЕНИЯ)';
  IF s<>'' Then
    begin
      ShowMessage('Не указан: '+s);
      result:=False;
    end
  ELSE
    Result:=True;
end;//proc

procedure TF_Akt_vip_prod_edit.B_Select_ZakazClick(Sender: TObject);
begin
  F_Zakaz_select.ShowModal;
  DM_Mebeli.IB_Akt_vip_prod_0.Edit;
  IF F_Zakaz_select.ModalResult=mrOk Then
    DM_Mebeli.IB_Akt_vip_prod_0.FieldByName('ID_ZAKAZ').Value:=DM_Mebeli.IB_Zakaz_0.FieldByname('ID').AsInteger;
end;//proc

procedure TF_Akt_vip_prod_edit.FormActivate(Sender: TObject);
begin
  OK_Pressed:=False;
  DBE_Nomer.SetFocus;
  IF operation='INSERT' Then
     begin
       IF not DM_Mebeli.IBTransaction1.active Then
          DM_Mebeli.IBTransaction1.StartTransaction;
       DM_Mebeli.IB_Akt_vip_prod_0.Insert;
       DM_Mebeli.IB_Akt_vip_prod_0.FieldByName('DATE_A').Value:=Date;
       DM_Mebeli.IB_Akt_vip_prod_0.FieldByName('ID_SKLAD_OTKUDA').Value:=3;
       DM_Mebeli.IB_Akt_vip_prod_0.FieldByName('ID_SKLAD_KUDA').Value:=2;
       DM_Mebeli.IB_Akt_vip_prod_0.Post;
       DM_Mebeli.IB_Akt_vip_prod_0.Edit;
     end;//IF 'INSERT'
  IF operation='EDIT' Then
     DM_Mebeli.IB_Akt_vip_prod_0.Edit;
  ID_Akt:=DM_Mebeli.IB_Akt_vip_prod_0.FieldByName('NOMER').AsInteger;
  DM_Mebeli.IB_Rashod_detali.Open;
  DM_Mebeli.IB_Rashod_furnitura.Open;
  IF (DM_Mebeli.IB_Akt_vip_prod_0.FieldByName('DATE_A').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      B_Exit.Enabled:=false;
      DBGrid1.ReadOnly:=true;
      ShowMessage('Дата документа меньше даты запрета редактирования');
    end;//IF DataZapretaRedakt

end;//proc

procedure TF_Akt_vip_prod_edit.FormClose(Sender: TObject;
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
    IF Check_IF_All_Data=False Then
      action:=caNone
    ELSE
      begin
        IF DM_Mebeli.IBTransaction1.Active Then
        begin
          IF DM_Mebeli.IB_Akt_vip_prod_0.State=dsEdit	Then
             DM_Mebeli.IB_Akt_vip_prod_0.Post;
          IF (DM_Mebeli.IB_Akt_vip_prod_1.State=dsEdit) OR (DM_Mebeli.IB_Akt_vip_prod_1.State=dsInsert) Then
             DM_Mebeli.IB_Akt_raspil_listy.Post;
          DM_Mebeli.IBTransaction1.Commit;
        end;//IF DM_Mebeli.IBTransaction1.Active
      end;//ELSE
  DM_Mebeli.IB_Rashod_detali.Close;
  DM_Mebeli.IB_Rashod_furnitura.Close;
end;//proc

procedure TF_Akt_vip_prod_edit.B_OkClick(Sender: TObject);
begin
  IF Check_IF_All_Data=False Then
     exit;

  IF (DM_Mebeli.IB_Akt_vip_prod_0.FieldByName('DATE_A').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      if DM_Mebeli.IBTransaction1.Active then DM_Mebeli.IBTransaction1.Rollback;
      OK_Pressed:=True;
      close;
    end;//IF DataZapretaRedakt

  IF DM_Mebeli.IBTransaction1.Active Then
     begin
       IF (DM_Mebeli.IB_Akt_vip_prod_0.State=dsEdit) OR (DM_Mebeli.IB_Akt_vip_prod_0.State=dsInsert) Then
          DM_Mebeli.IB_Akt_vip_prod_0.Post;
       IF (DM_Mebeli.IB_Akt_vip_prod_1.State=dsInsert) Then
          DM_Mebeli.IB_Akt_vip_prod_1.Post;

  //проверяем если не было ошибок с нехваткой комплектующих 
  IF Is_post_error Then
    begin
      OK_Pressed:=True;
      abort;
    end;//IF

       DM_Mebeli.IBTransaction1.Commit;
     end;//IF
  OK_Pressed:=True;
  close;
end;//proc

procedure TF_Akt_vip_prod_edit.B_ExitClick(Sender: TObject);
begin
  OK_Pressed:=FALSE;
  Close;
end;//proc

procedure TF_Akt_vip_prod_edit.DBGrid1Enter(Sender: TObject);
begin
  IF Check_IF_All_Data=False Then
    begin
      DBE_ID_ZAKAZ.SetFocus;
      exit;
    end;//if
end;//proc

procedure TF_Akt_vip_prod_edit.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF (Shift=[ssCtrl]) and ((Key=VK_END)	or (Key=83)) Then //нажали Ctrl+END или Ctrl+S
    B_OKClick(Sender);
end;//proc

procedure TF_Akt_vip_prod_edit.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  IF Key=#32 Then
    DBGrid1EditButtonClick(Sender);
end;//proc

procedure TF_Akt_vip_prod_edit.DBGrid1EditButtonClick(Sender: TObject);
var old_operation: string [6];
begin
  old_operation:=operation;
  operation:='SELECT';
  IF F_Gotov_prod.ShowModal=mrOk Then
    begin
      DM_Mebeli.IB_Akt_vip_prod_1.Edit;
      DM_Mebeli.IB_Akt_vip_prod_1.FieldByName('ID_GOTOV_PROD').Value:=F_Gotov_prod.GotovProd_ID;
    end;//IF =mrOk
  operation:=old_operation;
end;

procedure TF_Akt_vip_prod_edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Akt_vip_prod_edit);
end;

end.
