unit prihod_furnitura_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ExtCtrls, DB;

type
  TF_prihod_furnitura_edit = class(TForm)
    P_Shapka: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBE_ID: TDBEdit;
    DBE_Date_p: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    E_Itogo: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBE_Date_pExit(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_prihod_furnitura_edit: TF_prihod_furnitura_edit;
               OK_Pressed: boolean;
                 Old_Date: TDateTime;
implementation

uses prihod_furnitura_jurnal_f, main_f, mebeli_dm, furnitura_f;

{$R *.dfm}

procedure TF_prihod_furnitura_edit.FormActivate(Sender: TObject);
begin
  OK_Pressed:=False;
  DBE_ID.SetFocus;
  IF operation='INSERT' Then
     begin
       IF not DM_Mebeli.IBTransaction1.active Then
          DM_Mebeli.IBTransaction1.StartTransaction;
       DM_Mebeli.IB_prihod_furnitura_0.Insert;
       DM_Mebeli.IB_prihod_furnitura_0.FieldByName('DATE_P').Value:=Date;
       DM_Mebeli.IB_prihod_furnitura_0.FieldByName('ID_SKLAD').Value:=sklad_detali;
       DM_Mebeli.IB_prihod_furnitura_0.Post;
     end;//IF 'INSERT'
  F_Main.IBQuery1.Close;
  F_Main.IBQuery1.SQL.Clear;
  F_Main.IBQuery1.SQL.Add('select sum(summa) summa from prihod_furnitura_1 where id_parent='+DM_Mebeli.IB_prihod_furnitura_0.FieldByName('id').AsString);
  F_Main.IBQuery1.Open;
  E_Itogo.Text:=F_Main.IBQuery1.FieldByName('summa').AsString;
  F_Main.IBQuery1.Close;
  
  DM_Mebeli.IB_prihod_furnitura_0.Edit;
  ID_AKT:=DM_Mebeli.IB_prihod_furnitura_0.FieldByName('ID').AsInteger;
  DM_Mebeli.IB_Contragenty_1.Open;
  
  IF (DM_Mebeli.IB_prihod_furnitura_0.FieldByName('DATE_P').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      B_Exit.Enabled:=false;
      ShowMessage('Дата документа меньше даты запрета редактирования');
    end;//IF DataZapretaRedakt
  DM_Mebeli.IB_prihod_furnitura_1.Open;
end;//proc

procedure TF_prihod_furnitura_edit.B_ExitClick(Sender: TObject);
begin
  OK_Pressed:=FALSE;
  Close;
end;//proc

procedure TF_prihod_furnitura_edit.B_OkClick(Sender: TObject);
begin
  IF (DM_Mebeli.IB_prihod_furnitura_0.FieldByName('DATE_P').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      DM_Mebeli.IBTransaction1.Rollback;
      OK_Pressed:=True;
      close;
    end;//IF DataZapretaRedakt

  IF DM_Mebeli.IBTransaction1.Active Then
     begin
       IF (DM_Mebeli.IB_Prihod_furnitura_0.State=dsEdit) OR (DM_Mebeli.IB_Prihod_furnitura_0.State=dsInsert) Then
          DM_Mebeli.IB_Prihod_furnitura_0.Post;
       IF (DM_Mebeli.IB_Prihod_furnitura_1.State=dsEdit) OR (DM_Mebeli.IB_Prihod_furnitura_1.State=dsInsert) Then
          DM_Mebeli.IB_Prihod_furnitura_1.Post;
       DM_Mebeli.IBTransaction1.Commit;
     end;//IF
  OK_Pressed:=True;
  close;
end;//proc

procedure TF_prihod_furnitura_edit.FormClose(Sender: TObject;
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
           IF (DM_Mebeli.IB_Prihod_furnitura_0.State=dsEdit) OR (DM_Mebeli.IB_Prihod_furnitura_0.State=dsInsert) Then
              DM_Mebeli.IB_Prihod_furnitura_0.Post;
           IF (DM_Mebeli.IB_Prihod_furnitura_1.State=dsEdit) OR (DM_Mebeli.IB_Prihod_furnitura_1.State=dsInsert) Then
              DM_Mebeli.IB_Prihod_furnitura_1.Post;
           DM_Mebeli.IBTransaction1.Commit;
        end;//IF DM_Mebeli.IBTransaction1.Active
end;//proc

procedure TF_prihod_furnitura_edit.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  IF (Shift=[ssCtrl]) and (Key=VK_END)	Then //нажали Ctrl+END
    B_OKClick(Sender);
end;//proc

procedure TF_prihod_furnitura_edit.DBE_Date_pExit(Sender: TObject);
begin
  //изменять дату акта на большую (вперед) могут только пользователи группы BUHGALTER или ADMIN
  IF (Old_Date<DM_Mebeli.IB_Prihod_furnitura_0.FieldByName('DATE_P').AsDateTime) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      ShowMessage('Изменять дату на большую нельзя. Обратитесь к бухгалтеру');
      DM_Mebeli.IB_Prihod_furnitura_0.FieldByName('DATE_A').Value:=Old_Date;
    end;//IF
end;//proc

procedure TF_prihod_furnitura_edit.DBGrid1EditButtonClick(Sender: TObject);
var old_operation: string;
begin
  old_operation:=operation;
  operation:='SELECT';
  F_Furnitura.ShowModal;
  DM_Mebeli.IB_Furnitura.Open;
  operation:=old_operation;
  IF DM_Mebeli.IB_Prihod_furnitura_1.State=dsBrowse Then
    DM_Mebeli.IB_Prihod_furnitura_1.Edit;
  DM_Mebeli.IB_Prihod_furnitura_1.FieldByName('ID_FURNITURA').Value:=id_furnitura;;
end;//proc

procedure TF_prihod_furnitura_edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_prihod_furnitura_edit);
end;

end.
