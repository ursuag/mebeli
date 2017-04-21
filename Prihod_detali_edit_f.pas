unit Prihod_detali_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ExtCtrls, DB, Buttons,
  IBCustomDataSet;

type
  TF_Prihod_detali_edit = class(TForm)
    P_Shapka: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBE_ID: TDBEdit;
    DBE_Date_p: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    DBLookupComboBox3: TDBLookupComboBox;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    DBE_ID_Zakaz: TDBEdit;
    B_Select_Zakaz: TSpeedButton;
    DS_Prihod_detali_F_1: TDataSource;
    IB_Prihod_detali_F_1: TIBDataSet;
    IB_Prihod_detali_F_1ID_PARENT: TIntegerField;
    IB_Prihod_detali_F_1ID_PILOMAT_DETALI: TIntegerField;
    IB_Prihod_detali_F_1KOL_VO: TIntegerField;
    IB_Prihod_detali_F_1ID: TIntegerField;
    IB_Prihod_detali_F_1SUMMA: TIBBCDField;
    IB_Pilomat_Detali_F: TIBDataSet;
    IB_Prihod_detali_F_1GRUPA_NAME: TStringField;
    IB_Prihod_detali_F_1DETALI_NAME: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBLookupComboBox3Enter(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBE_Date_pExit(Sender: TObject);
    procedure B_Select_ZakazClick(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IB_Prihod_detali_F_1NewRecord(DataSet: TDataSet);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Prihod_detali_edit: TF_Prihod_detali_edit;
            OK_Pressed: boolean;
              Old_Date: TDateTime;
implementation

uses main_f, mebeli_dm, Prihod_detali_jurnal_f, zakaz_select_f, pilomat_f;

{$R *.dfm}

procedure TF_Prihod_detali_edit.FormActivate(Sender: TObject);
begin
  DM_Mebeli.IB_prihod_detali_0.Open;
  IB_Prihod_detali_F_1.Open;
  OK_Pressed:=False;
  DBE_ID.SetFocus;
  DM_Mebeli.IB_prihod_detali_0.Locate('id',id_akt,[]);
  IF operation='INSERT' Then
     begin
       IF not DM_Mebeli.IBTransaction1.active Then
          DM_Mebeli.IBTransaction1.StartTransaction;
       DM_Mebeli.IB_prihod_detali_0.Insert;
       DM_Mebeli.IB_prihod_detali_0.FieldByName('DATE_P').Value:=Date;
       DM_Mebeli.IB_prihod_detali_0.FieldByName('ID_SKLAD').Value:=sklad_detali;
       DM_Mebeli.IB_prihod_detali_0.FieldByName('ID_VID_RABOT').Value:=1;
       DM_Mebeli.IB_prihod_detali_0.FieldByName('IS_OSTATOK').Value:=null;
       DM_Mebeli.IB_prihod_detali_0.FieldByName('ID_REVIZIA').Value:=null;
       DM_Mebeli.IB_prihod_detali_0.Post;
     end;//IF 'INSERT'
  DM_Mebeli.IB_prihod_detali_0.Edit;

  ID_AKT:=DM_Mebeli.IB_prihod_detali_0.FieldByName('ID').AsInteger;

  IF (DM_Mebeli.IB_prihod_detali_0.FieldByName('DATE_P').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      B_Exit.Enabled:=false;
      ShowMessage('Дата документа меньше даты запрета редактирования');
    end;//IF DataZapretaRedakt
end;//proc

procedure TF_Prihod_detali_edit.B_ExitClick(Sender: TObject);
begin
  OK_Pressed:=FALSE;
  Close;
end;//proc

procedure TF_Prihod_detali_edit.B_OkClick(Sender: TObject);
begin
  IF (DM_Mebeli.IB_prihod_detali_0.FieldByName('DATE_P').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      DM_Mebeli.IBTransaction1.Rollback;
      OK_Pressed:=True;
      close;
    end;//IF DataZapretaRedakt

  IF DM_Mebeli.IBTransaction1.Active Then
     begin
       IF (DM_Mebeli.IB_Prihod_detali_0.State=dsEdit) OR (DM_Mebeli.IB_Prihod_detali_0.State=dsInsert) Then
          DM_Mebeli.IB_Prihod_detali_0.Post;
       IF (IB_Prihod_detali_F_1.State=dsEdit) OR (IB_Prihod_detali_F_1.State=dsInsert) Then
          IB_Prihod_detali_F_1.Post;
       DM_Mebeli.IBTransaction1.Commit;
     end;//IF
  OK_Pressed:=True;
  close;
end;//proc

procedure TF_Prihod_detali_edit.FormClose(Sender: TObject;
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
           IF (DM_Mebeli.IB_Prihod_detali_0.State=dsEdit) OR (DM_Mebeli.IB_Prihod_detali_0.State=dsInsert) Then
              DM_Mebeli.IB_Prihod_detali_0.Post;
           IF (IB_Prihod_detali_F_1.State=dsEdit) OR (IB_Prihod_detali_F_1.State=dsInsert) Then
              IB_Prihod_detali_F_1.Post;
           DM_Mebeli.IBTransaction1.Commit;
        end;//IF DM_Mebeli.IBTransaction1.Active
end;//proc

procedure TF_Prihod_detali_edit.DBLookupComboBox3Enter(Sender: TObject);
begin
  DBLookupComboBox3.DropDown
end;

procedure TF_Prihod_detali_edit.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF (Shift=[ssCtrl]) and (Key=VK_END)	Then //нажали Ctrl+END
    B_OKClick(Sender);
end;//proc

procedure TF_Prihod_detali_edit.DBE_Date_pExit(Sender: TObject);
begin
  //изменять дату акта на большую (вперед) могут только пользователи группы BUHGALTER или ADMIN
  IF (Old_Date<DM_Mebeli.IB_Prihod_detali_0.FieldByName('DATE_P').AsDateTime) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      ShowMessage('Изменять дату на большую нельзя. Обратитесь к бухгалтеру');
      DM_Mebeli.IB_Prihod_detali_0.FieldByName('DATE_A').Value:=Old_Date;
    end;//IF
end;//proc

procedure TF_Prihod_detali_edit.B_Select_ZakazClick(Sender: TObject);
begin
  F_Zakaz_select.ShowModal;
  DM_Mebeli.IB_Prihod_detali_0.Edit;
  IF F_Zakaz_select.ModalResult=mrOk Then
    DM_Mebeli.IB_Prihod_detali_0.FieldByName('ID_ZAKAZ').Value:=id_zakaz;
end;//proc

procedure TF_Prihod_detali_edit.DBGrid1Enter(Sender: TObject);
begin
  IF DM_Mebeli.IB_Prihod_detali_0.FieldByName('id_zakaz').IsNull Then
    begin
      ShowMessage('Не выбран заказ!');
      DBE_ID_Zakaz.SetFocus;
    end;
end;

procedure TF_Prihod_detali_edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Prihod_detali_edit);
end;

procedure TF_Prihod_detali_edit.IB_Prihod_detali_F_1NewRecord(
  DataSet: TDataSet);
begin
  IB_Prihod_detali_F_1.FieldByName('ID_PARENT').Value:=DM_Mebeli.IB_Prihod_detali_0.FieldByName('ID').AsInteger;
end;

procedure TF_Prihod_detali_edit.DBGrid1EditButtonClick(Sender: TObject);
var old_operation: string [6];
begin
  old_operation:=operation;
  operation:='SELECT';
  IF F_Pilomat.ShowModal=mrOk Then
    begin
      IB_Prihod_detali_F_1.Edit;
      IB_Prihod_detali_F_1.FieldByName('ID_PILOMAT_DETALI').Value:=F_Pilomat.id_detali;
//      IB_Prihod_detali_F_1.Post;
    end;//IF =mrOk
  operation:=old_operation;
  DBGrid1.SelectedIndex:=4;
end;//proc

procedure TF_Prihod_detali_edit.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  IF Key=' ' Then
    DBGrid1EditButtonClick(Sender);
end;

end.
