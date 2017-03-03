unit prihod_listy_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, ExtCtrls, DB, Mask;

type
  TF_Prihod_listy_edit = class(TForm)
    P_Shapka: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBE_ID: TDBEdit;
    DBE_Date_p: TDBEdit;
    DBL_STATYA_DOHODA: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBL_Contragent: TDBLookupComboBox;
    Label6: TLabel;
    DBL_Sklad: TDBLookupComboBox;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    E_Itogo: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBE_Date_pExit(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Prihod_listy_edit: TF_Prihod_listy_edit;
           OK_Pressed: boolean;
             Old_Date: TDateTime; 

implementation

uses main_f, mebeli_dm, prihod_listy_jurnal_f, pilomat_f;

{$R *.dfm}

procedure TF_Prihod_listy_edit.FormActivate(Sender: TObject);
begin
  OK_Pressed:=False;
  DBGrid1.SetFocus;
  IF operation='INSERT' Then
     begin
       IF not DM_Mebeli.IBTransaction1.active Then
          DM_Mebeli.IBTransaction1.StartTransaction;
       DM_Mebeli.IB_prihod_listy_0.Insert;
       DM_Mebeli.IB_prihod_listy_0.FieldByName('DATE_P').Value:=Date;
       DM_Mebeli.IB_prihod_listy_0.FieldByName('ID_SKLAD').Value:=sklad_listy;
       DM_Mebeli.IB_prihod_listy_0.Post;
     end;//IF 'INSERT'

  F_Main.IBQuery1.Close;
  F_Main.IBQuery1.SQL.Clear;
  F_Main.IBQuery1.SQL.Add('select sum(summa) summa from prihod_listy_1 where id_parent='+DM_Mebeli.IB_prihod_listy_0.FieldByName('id').AsString);
  F_Main.IBQuery1.Open;
  E_Itogo.Text:=F_Main.IBQuery1.FieldByName('summa').AsString;
  F_Main.IBQuery1.Close;

//  DM_Mebeli.IB_prihod_listy_0.Edit;
  ID_AKT:=DM_Mebeli.IB_prihod_listy_0.FieldByName('ID').AsInteger;

  IF (DM_Mebeli.IB_prihod_listy_0.FieldByName('DATE_P').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      B_Exit.Enabled:=false;
      ShowMessage('Дата документа меньше даты запрета редактирования');
    end;//IF DataZapretaRedakt
end;//proc

procedure TF_Prihod_listy_edit.B_OkClick(Sender: TObject);
begin
  IF (DM_Mebeli.IB_prihod_listy_0.FieldByName('DATE_P').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      DM_Mebeli.IBTransaction1.Rollback;
      OK_Pressed:=True;
      close;
      exit;
    end;//IF DataZapretaRedakt

  IF DM_Mebeli.IB_Prihod_listy_0.FieldByName('id_contragent').IsNull then
    begin
      ShowMessage('Не указан поставщик');
      DBL_Contragent.SetFocus;
      exit;
    end;

  IF DM_Mebeli.IB_Prihod_listy_0.FieldByName('id_contragent').IsNull then
    begin
      ShowMessage('Не указан поставщик');
      DBL_Contragent.SetFocus;
      exit;
    end;
  IF DM_Mebeli.IBTransaction1.Active Then
     begin
       IF (DM_Mebeli.IB_Prihod_listy_0.State=dsEdit) OR (DM_Mebeli.IB_Prihod_detali_0.State=dsInsert) Then
          DM_Mebeli.IB_Prihod_listy_0.Post;
       IF (DM_Mebeli.IB_Prihod_listy_1.State=dsEdit) OR (DM_Mebeli.IB_Prihod_listy_1.State=dsInsert) Then
          DM_Mebeli.IB_Prihod_listy_1.Post;
       DM_Mebeli.IBTransaction1.Commit;
     end;//IF
  OK_Pressed:=True;
  close;
end;//proc

procedure TF_Prihod_listy_edit.B_ExitClick(Sender: TObject);
begin
  OK_Pressed:=FALSE;
  Close;
end;//proc

procedure TF_Prihod_listy_edit.FormClose(Sender: TObject;
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
         IF DM_Mebeli.IB_Prihod_listy_0.FieldByName('id_contragent').IsNull then
           begin
             ShowMessage('Не указан поставщик');
             DBL_Contragent.SetFocus;
             Action:=caNone;
             exit;
           end;

           IF (DM_Mebeli.IB_Prihod_listy_0.State=dsEdit) OR (DM_Mebeli.IB_Prihod_listy_0.State=dsInsert) Then
              DM_Mebeli.IB_Prihod_listy_0.Post;
           IF (DM_Mebeli.IB_Prihod_listy_1.State=dsEdit) OR (DM_Mebeli.IB_Prihod_listy_1.State=dsInsert) Then
              DM_Mebeli.IB_Prihod_listy_1.Post;
           DM_Mebeli.IBTransaction1.Commit;
        end;//IF DM_Mebeli.IBTransaction1.Active
end;//proc

procedure TF_Prihod_listy_edit.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF (Shift=[ssCtrl]) and (Key=VK_END)	Then //нажали Ctrl+END
    B_OKClick(Sender);
end;//proc

procedure TF_Prihod_listy_edit.DBE_Date_pExit(Sender: TObject);
begin
  //изменять дату акта на большую (вперед) могут только пользователи группы BUHGALTER или ADMIN
{  IF (Old_Date<DM_Mebeli.IB_Prihod_listy_0.FieldByName('DATE_P').AsDateTime) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      ShowMessage('Изменять дату на большую нельзя. Обратитесь к бухгалтеру');
      DM_Mebeli.IB_Prihod_listy_0.FieldByName('DATE_A').Value:=Old_Date;
    end;//IF}
end;//proc

procedure TF_Prihod_listy_edit.DBGrid1EditButtonClick(Sender: TObject);
var old_operation: string [6];
    old_select_listy: tstrings;
    old_select_grupa: tstrings;
begin
  old_operation:=operation;
  operation:='SELECT';
  old_select_listy:=TStringList.Create;
  old_select_grupa:=TStringList.Create;
  old_select_listy.Assign(F_Pilomat.IB_Pilomat_listy_F.SelectSQL);
  old_select_grupa.Assign(F_Pilomat.IB_Pilomat_grupa_F.SelectSQL);
  F_Pilomat.IB_Pilomat_listy_F.SelectSQL.Clear;
  F_Pilomat.IB_Pilomat_listy_F.SelectSQL.Add('select * from PILOMAT_listy where id_grupa= :id order by name');
  F_Pilomat.IB_Pilomat_grupa_F.SelectSQL.Clear;
  F_Pilomat.IB_Pilomat_grupa_F.SelectSQL.Add('select * from pilomat_grupa order by name');

  IF F_Pilomat.ShowModal=mrOk Then
    begin
      DM_Mebeli.IB_pilomat_listy.Open;
      DM_Mebeli.IB_pilomat_detali.Open;
      DM_Mebeli.IB_Prihod_listy_1.Edit;
      DM_Mebeli.IB_Prihod_listy_1.FieldByName('ID_LISTY').Value:=F_Pilomat.id_listy;
      DM_Mebeli.IB_Prihod_listy_1.FieldByName('kol_vo').Value:=0;
      DM_Mebeli.IB_Prihod_listy_1.Post;
      DBGrid1.SelectedIndex:=2;
      DM_Mebeli.IB_Prihod_listy_1.Edit;
    end;//IF =mrOk
  operation:=old_operation;
  F_Pilomat.IB_Pilomat_listy_F.SelectSQL.Assign(old_select_listy);
  F_Pilomat.IB_Pilomat_grupa_F.SelectSQL.Assign(old_select_grupa);
end;//proc

procedure TF_Prihod_listy_edit.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  IF Key=' ' Then
    DBGrid1EditButtonClick(Sender);
end;//proc

procedure TF_Prihod_listy_edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Prihod_listy_edit);
end;

end.
