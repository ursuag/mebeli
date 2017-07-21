unit spisanie_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, ExtCtrls, Grids, DBGrids, DB;

type
  TF_Spisanie_edit = class(TForm)
    DBGR_DETALI: TDBGrid;
    P_Buttons: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    P_Shapka: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBE_ID: TDBEdit;
    DBE_Date_SPIS: TDBEdit;
    CB_Sklad: TDBLookupComboBox;
    DBG_Furn: TDBGrid;
    DBG_Listy: TDBGrid;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    procedure DBGR_DETALIKeyPress(Sender: TObject; var Key: Char);
    procedure B_OkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure P_ShapkaExit(Sender: TObject);
    procedure DBGR_DETALIEditButtonClick(Sender: TObject);
    procedure CB_SkladExit(Sender: TObject);
    procedure DBG_FurnExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Spisanie_edit: TF_Spisanie_edit;
       OK_Pressed: boolean;
         Old_Date: TDateTime;

implementation

uses main_f, mebeli_dm, spisanie_jurnal_f, pilomat_f;

{$R *.dfm}

procedure TF_Spisanie_edit.FormActivate(Sender: TObject);
begin
  DBG_Listy.Enabled:=true;
  DBG_Furn.Enabled:=true;
  DBGR_DETALI.Enabled:=true;
  OK_Pressed:=False;
  DBE_ID.SetFocus;
  Old_Date:=Date;
  IF operation='INSERT' Then
     begin
       IF not DM_Mebeli.IBTransaction1.active Then
          DM_Mebeli.IBTransaction1.StartTransaction;
       DM_Mebeli.IB_spisanie_0.Insert;
       DM_Mebeli.IB_spisanie_0.FieldByName('DATE_SPIS').Value:=Date;
       DM_Mebeli.IB_spisanie_0.FieldByName('ID_SKLAD').Value:=null;
       DM_Mebeli.IB_spisanie_0.Post;
       DM_Mebeli.IB_spisanie_0.Edit;
     end;//IF 'INSERT'
  IF operation='EDIT' Then
     begin
      DM_Mebeli.IB_spisanie_0.Edit;
      Old_Date:=DM_Mebeli.IB_spisanie_0.FieldByName('DATE_SPIS').AsDateTime;
     end;//IF operation='EDIT'
  ID_AKT:=DM_Mebeli.IB_spisanie_0.FieldByName('ID').AsInteger;

end;//proc

procedure TF_Spisanie_edit.DBGR_DETALIKeyPress(Sender: TObject;
  var Key: Char);
var old_operation: string [6];
begin
  IF DBGR_DETALI.SelectedField.FieldName='OPLATA_NAME' Then
    IF Key=Chr(VK_Space) Then
      IF (DM_Mebeli.IB_Spisanie_detali.State<>dsEdit) OR (DM_Mebeli.IB_Spisanie_detali.State<>dsInsert) Then
        begin
          DM_Mebeli.IB_Spisanie_detali.Edit;
          DM_Mebeli.IB_Spisanie_detali.FieldByName('OPLATA').Value:=DM_Mebeli.IB_Spisanie_detali.FieldByName('OPLATA').AsInteger XOR 1;
        end;//IF
  IF (DBGR_DETALI.SelectedField.FieldName='GRUPA_NAME') or (DBGR_DETALI.SelectedField.FieldName='DETALI_NAME') Then
      IF Key=Chr(VK_Space) Then
        begin
        old_operation:=operation;
        operation:='SELECT';
        IF F_Pilomat.ShowModal=mrOk Then
          begin
            DM_Mebeli.IB_pilomat_listy.Open;
            DM_Mebeli.IB_pilomat_detali.Open;
            DM_Mebeli.IB_Spisanie_detali.Edit;
            DM_Mebeli.IB_Spisanie_detali.FieldByName('ID_PILOMAT_DETALI').Value:=F_Pilomat.id_detali;
            DM_Mebeli.IB_Spisanie_detali.FieldByName('kol_vo').Value:=0;
          end;//IF =mrOk
        operation:=old_operation;
      end;//IF Key
end;//proc

procedure TF_Spisanie_edit.B_OkClick(Sender: TObject);
begin
  IF (DM_Mebeli.IB_spisanie_0.FieldByName('DATE_SPIS').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      DM_Mebeli.IBTransaction1.Rollback;
      OK_Pressed:=True;
      close;
    end;//IF DataZapretaRedakt

  IF DM_Mebeli.IBTransaction1.Active Then
     begin
       IF (DM_Mebeli.IB_Spisanie_detali.State=dsEdit) OR (DM_Mebeli.IB_Spisanie_detali.State=dsInsert) Then
          DM_Mebeli.IB_Spisanie_detali.Post;
       IF (DM_Mebeli.IB_Spisanie_listy.State=dsEdit) OR (DM_Mebeli.IB_Spisanie_listy.State=dsInsert) Then
          DM_Mebeli.IB_Spisanie_listy.Post;
       IF (DM_Mebeli.IB_Spisanie_0.State=dsEdit) OR (DM_Mebeli.IB_Spisanie_0.State=dsInsert) Then
          DM_Mebeli.IB_Spisanie_0.Post;
       DM_Mebeli.IBTransaction1.Commit;
     end;//IF
  OK_pressed:=true;
  Close;
end;//proc

procedure TF_Spisanie_edit.B_ExitClick(Sender: TObject);
begin
  OK_Pressed:=FALSE;
  Close;
end;//proc

procedure TF_Spisanie_edit.FormClose(Sender: TObject;
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
       IF (DM_Mebeli.IB_Spisanie_0.State=dsEdit) OR (DM_Mebeli.IB_Spisanie_0.State=dsInsert) Then
          DM_Mebeli.IB_Spisanie_0.Post;
       IF (DM_Mebeli.IB_Spisanie_detali.State=dsEdit) OR (DM_Mebeli.IB_Spisanie_detali.State=dsInsert) Then
          DM_Mebeli.IB_Spisanie_detali.Post;
       IF (DM_Mebeli.IB_Spisanie_listy.State=dsEdit) OR (DM_Mebeli.IB_Spisanie_listy.State=dsInsert) Then
          DM_Mebeli.IB_Spisanie_listy.Post;
       DM_Mebeli.IBTransaction1.Commit;
     end;//IF DM_Mebeli.IBTransaction1.Active
end;//proc

procedure TF_Spisanie_edit.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF (Shift=[ssCtrl]) and (Key=VK_END)	Then //нажали Ctrl+END
    B_OKClick(Sender);
end;//proc

procedure TF_Spisanie_edit.P_ShapkaExit(Sender: TObject);
begin
  IF CB_Sklad.Field.IsNull = True Then
    begin
      ShowMessage('Не выбран склад!');
      CB_Sklad.SetFocus;
    end;//IF
end;//proc

procedure TF_Spisanie_edit.DBGR_DETALIEditButtonClick(Sender: TObject);
var old_operation: string [6];
begin
  old_operation:=operation;
  operation:='SELECT_STOCKS';
  IF F_Pilomat.ShowModal=mrOk Then
    begin
      DM_Mebeli.IB_pilomat_listy.Open;
      DM_Mebeli.IB_pilomat_detali.Open;
      DM_Mebeli.IB_Spisanie_detali.Edit;
      DM_Mebeli.IB_Spisanie_detali.FieldByName('ID_PILOMAT_DETALI').Value:=F_Pilomat.id_detali;
      DM_Mebeli.IB_Spisanie_detali.FieldByName('kol_vo').Value:=0;
    end;//IF =mrOk
  operation:=old_operation;
end;//proc

procedure TF_Spisanie_edit.CB_SkladExit(Sender: TObject);
begin
  IF (DM_Mebeli.IB_Spisanie_0.State=dsEdit) OR (DM_Mebeli.IB_Spisanie_0.State=dsInsert) Then
    DM_Mebeli.IB_Spisanie_0.Post;
end;

procedure TF_Spisanie_edit.DBG_FurnExit(Sender: TObject);
begin
  IF (DM_Mebeli.IB_Spisanie_Furnitura.State=dsEdit) OR (DM_Mebeli.IB_Spisanie_Furnitura.State=dsInsert) Then
    DM_Mebeli.IB_Spisanie_Furnitura.Post;

end;

procedure TF_Spisanie_edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Spisanie_edit);
end;

end.
