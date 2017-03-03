unit Peremeschenie_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, DB;

type
  TF_Peremeschenie_edit = class(TForm)
    DBGR_DETALI: TDBGrid;
    P_Buttons: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    P_Shapka: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBE_ID: TDBEdit;
    DBE_Date_PER: TDBEdit;
    Label3: TLabel;
    CB_Sklad_otkuda: TDBLookupComboBox;
    CB_Sklad_kuda: TDBLookupComboBox;
    Label4: TLabel;
    DBG_Furnitura: TDBGrid;
    DBGrid2: TDBGrid;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure B_OkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBE_Date_PERExit(Sender: TObject);
    procedure DBG_FurnituraEditButtonClick(Sender: TObject);
    procedure DBG_FurnituraEnter(Sender: TObject);
    procedure DBGrid2Enter(Sender: TObject);
    procedure DBGR_DETALIEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_furnitura: integer;
  end;

var
  F_Peremeschenie_edit: TF_Peremeschenie_edit;
            OK_Pressed: boolean;
              Old_Date: TDateTime;            
implementation

uses main_f, mebeli_dm, Peremeschenie_jurnal_f, furnitura_f;

{$R *.dfm}

procedure TF_Peremeschenie_edit.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF (Shift=[ssCtrl]) and (Key=VK_END)	Then //нажали Ctrl+END
    B_OKClick(Sender);
end;//proc

procedure TF_Peremeschenie_edit.B_OkClick(Sender: TObject);
begin
  IF (DM_Mebeli.IB_peremeschenie_0.FieldByName('DATE_PER').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      DM_Mebeli.IBTransaction1.Rollback;
      OK_Pressed:=True;
      close;
    end;//IF DataZapretaRedakt

  IF DM_Mebeli.IBTransaction1.Active Then
     begin
       IF (DM_Mebeli.IB_Peremeschenie_0.State=dsEdit) OR (DM_Mebeli.IB_Peremeschenie_0.State=dsInsert) Then
          DM_Mebeli.IB_Peremeschenie_0.Post;
       IF (DM_Mebeli.IB_Peremeschenie_detali.State=dsEdit) OR (DM_Mebeli.IB_Peremeschenie_detali.State=dsInsert) Then
          DM_Mebeli.IB_Peremeschenie_detali.Post;
       IF (DM_Mebeli.IB_Peremeschenie_listy.State=dsEdit) OR (DM_Mebeli.IB_Peremeschenie_listy.State=dsInsert) Then
          DM_Mebeli.IB_Peremeschenie_listy.Post;
       DM_Mebeli.IBTransaction1.Commit;
     end;//IF
  OK_pressed:=true;
  Close;
end;//proc

procedure TF_Peremeschenie_edit.FormActivate(Sender: TObject);
begin
  OK_Pressed:=False;
  DBE_ID.SetFocus;
  Old_Date:=Date;
  IF operation='INSERT' Then
     begin
       IF not DM_Mebeli.IBTransaction1.active Then
          DM_Mebeli.IBTransaction1.StartTransaction;
       DM_Mebeli.IB_peremeschenie_0.Insert;
       DM_Mebeli.IB_peremeschenie_0.FieldByName('DATE_PER').Value:=Date;
       DM_Mebeli.IB_peremeschenie_0.FieldByName('ID_SKLAD_OTKUDA').Value:=0;
       DM_Mebeli.IB_peremeschenie_0.FieldByName('ID_SKLAD_KUDA').Value:=0;
       DM_Mebeli.IB_peremeschenie_0.Post;
       DM_Mebeli.IB_peremeschenie_0.Edit;
       DM_Mebeli.IB_peremeschenie_0.FieldByName('ID_SKLAD_OTKUDA').Value:=null;
       DM_Mebeli.IB_peremeschenie_0.FieldByName('ID_SKLAD_KUDA').Value:=null;
     end;//IF 'INSERT'
  IF operation='EDIT' Then
     begin
      DM_Mebeli.IB_Peremeschenie_0.Edit;
      Old_Date:=DM_Mebeli.IB_Peremeschenie_0.FieldByName('DATE_PER').AsDateTime;
      ID_AKT:=DM_Mebeli.IB_peremeschenie_0.FieldByName('ID').AsInteger;
     end;//IF operation='EDIT'

  IF (DM_Mebeli.IB_peremeschenie_0.FieldByName('DATE_PER').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      B_Exit.Enabled:=false;
      ShowMessage('Дата документа меньше даты запрета редактирования');
    end;//IF DataZapretaRedakt
end;//proc

procedure TF_Peremeschenie_edit.B_ExitClick(Sender: TObject);
begin
  OK_Pressed:=FALSE;
  Close;
end;//proc

procedure TF_Peremeschenie_edit.FormClose(Sender: TObject;
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
       IF (DM_Mebeli.IB_Peremeschenie_detali.State=dsEdit) OR (DM_Mebeli.IB_Peremeschenie_detali.State=dsInsert) Then
          DM_Mebeli.IB_Peremeschenie_detali.Post;
       IF (DM_Mebeli.IB_Peremeschenie_listy.State=dsEdit) OR (DM_Mebeli.IB_Peremeschenie_listy.State=dsInsert) Then
          DM_Mebeli.IB_Peremeschenie_listy.Post;
       IF (DM_Mebeli.IB_Peremeschenie_0.State=dsEdit) OR (DM_Mebeli.IB_Peremeschenie_0.State=dsInsert) Then
          DM_Mebeli.IB_Peremeschenie_0.Post;
       DM_Mebeli.IBTransaction1.Commit;
     end;//IF DM_Mebeli.IBTransaction1.Active
end;//proc

procedure TF_Peremeschenie_edit.DBE_Date_PERExit(Sender: TObject);
begin
  //изменять дату акта на большую (вперед) могут только пользователи группы BUHGALTER или ADMIN
  IF (Old_Date<DM_Mebeli.IB_Peremeschenie_0.FieldByName('DATE_PER').AsDateTime) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      ShowMessage('Изменять дату на большую нельзя. Обратитесь к бухгалтеру');
      DM_Mebeli.IB_Peremeschenie_0.FieldByName('DATE_PER').Value:=Old_Date;
    end;//IF
end;//proc

procedure TF_Peremeschenie_edit.DBG_FurnituraEditButtonClick(Sender: TObject);
var old_operation: string;
begin
  IF (DBG_Furnitura.SelectedIndex=(DBG_Furnitura.Columns.Count-1)) and (not DM_Mebeli.IB_Peremeschenie_furnitura.FieldByName('kol_vo').isNull) Then
    begin
      DM_Mebeli.IB_Peremeschenie_furnitura.Edit;
      DM_Mebeli.IB_Peremeschenie_furnitura.FieldByName('id_sotrudnik').Value:=null;
      DM_Mebeli.IB_Peremeschenie_furnitura.Post;
    end;

  if (UpperCase(DBG_Furnitura.Columns[DBG_Furnitura.SelectedIndex].FieldName)='GRUPA_NAME') or (UpperCase(DBG_Furnitura.Columns[DBG_Furnitura.SelectedIndex].FieldName)='FURNITURA_NAME') then
    begin
      old_operation:=operation;
      operation:='SELECT';
      F_Furnitura.ShowModal;
      DM_Mebeli.IB_Furnitura.Open;
      operation:=old_operation;
      IF DM_Mebeli.IB_Peremeschenie_furnitura.State=dsBrowse Then
        DM_Mebeli.IB_Peremeschenie_furnitura.Edit;
      DM_Mebeli.IB_Peremeschenie_furnitura.FieldByName('ID_FURNITURA').Value:=id_furnitura;
    end;
end;//

procedure TF_Peremeschenie_edit.DBG_FurnituraEnter(Sender: TObject);
begin
  DM_Mebeli.IB_Peremeschenie_0.Post;
  DM_Mebeli.IB_Peremeschenie_0.Edit;
end;//

procedure TF_Peremeschenie_edit.DBGrid2Enter(Sender: TObject);
begin
  IF (DM_Mebeli.IB_Peremeschenie_0.State=dsEdit) OR (DM_Mebeli.IB_Peremeschenie_0.State=dsInsert) Then
    DM_Mebeli.IB_Peremeschenie_0.Post;
end;

procedure TF_Peremeschenie_edit.DBGR_DETALIEnter(Sender: TObject);
begin
  IF (DM_Mebeli.IB_Peremeschenie_0.State=dsEdit) OR (DM_Mebeli.IB_Peremeschenie_0.State=dsInsert) Then
    DM_Mebeli.IB_Peremeschenie_0.Post;
end;

procedure TF_Peremeschenie_edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Peremeschenie_edit);
end;

end.

