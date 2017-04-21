unit Akt_vip_rab_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,IBQuery,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids, ExtCtrls, Buttons, DB;

type
  TF_Akt_vip_rab_edit = class(TForm)
    Panel1: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    DBGrid1: TDBGrid;
    P_Shapka: TPanel;
    Label1: TLabel;
    DBE_NOMER: TDBEdit;
    Label2: TLabel;
    DBE_Date_a: TDBEdit;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label4: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label5: TLabel;
    DBE_ID_Zakaz: TDBEdit;
    B_Select_Zakaz: TSpeedButton;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    B_Sotrudnik2_clear: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure B_Select_ZakazClick(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_ExitClick(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBLookupComboBox2DropDown(Sender: TObject);
    procedure DBE_Date_aExit(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure B_Sotrudnik2_clearClick(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Akt_vip_rab_edit: TF_Akt_vip_rab_edit;
          OK_Pressed: boolean;
            Old_Date: TDateTime;
implementation

uses main_f, mebeli_dm, akt_vip_rabot_jurnal_f, zakaz_select_f,
  gotov_prod_f;

{$R *.dfm}
Function Check_IF_ALL_DATA: Boolean;
var s: string;
begin
  s:='';
  IF DM_Mebeli.IB_Akt_vip_rabot_0.fieldbyname('ID_ZAKAZ').IsNull Then
     s:=s+'(НОМЕР ЗАКАЗА)';
  IF DM_Mebeli.IB_Akt_vip_rabot_0.fieldbyname('ID_SOTRUDNIK').IsNull Then
     s:=s+' (ИСПОЛНИТЕЛЬ)';
  IF DM_Mebeli.IB_Akt_vip_rabot_0.fieldbyname('ID_VID_RABOT').IsNull Then
     s:=s+' (ВИД РАБОТ)';
  IF s<>'' Then
    begin
      ShowMessage('Не указан: '+s);
      result:=False;
    end
  ELSE
    Result:=True;
end;//proc

//Процедура генерирует записи в таблицах AKT_VIP_RABOT_DETALI
Procedure Generate_detali_po_aktu;
begin
  F_Main.IBQuery1.Close;
  F_Main.IBQuery1.SQL.Clear;
  F_Main.IBQuery1.SQL.Add('delete from akt_vip_rabot_detali where id_parent='+IntToStr(id_akt));
  F_Main.IBQuery1.ExecSQL;
  F_Main.IBQuery1.SQL.Clear;
  F_Main.IBQuery1.SQL.Add('SELECT GEN_ID(GEN_AKT_VIP_RABOT_DETALI_ID, 1) from RDB$DATABASE');

  //готовим выборку деталей с количеством для Готовой продукции
  F_Main.IBQuery2.Close;
  F_Main.IBQuery2.SQL.Clear;
  F_Main.IBQuery2.SQL.Add('select gp1.id_detali, gp1.kol_vo from gotov_prod_1 as gp1, pilomat_detali as pd');
  F_Main.IBQuery2.SQL.Add('where (gp1.id_parent=:ID_GOTPR) and (gp1.id_detali=pd.id)');

  With DM_Mebeli do
    begin
      IB_Akt_vip_rabot_0.Open;
      IB_Akt_vip_rabot_0.Locate('NOMER',id_akt,[]);
      IB_Gotov_prod_1.Open;
      IB_Akt_vip_rabot_1.Open;
      IB_Akt_vip_rabot_1.First;
      IB_Akt_vip_rabot_detali.Open;
      While not IB_Akt_vip_rabot_1.Eof Do
        begin
          F_Main.IBQuery2.ParamByName('id_gotpr').Value:=IB_Akt_vip_rabot_1.FieldValues['id_gotov_prod'];
          F_Main.IBQuery2.Open;
          F_Main.IBQuery2.Open; F_Main.IBQuery2.First;
          While not F_Main.IBQuery2.Eof Do
            begin
              F_Main.IBQuery1.Open;//Generator of ID
              IB_Akt_vip_rabot_detali.Insert;
              IB_Akt_vip_rabot_detali.FieldByName('ID').Value:=F_Main.IBQuery1.FieldByName('GEN_ID').AsInteger;
              IB_Akt_vip_rabot_detali.FieldByName('ID_PARENT').Value:=id_akt;
              IB_Akt_vip_rabot_detali.FieldByName('DATE_A').Value:=IB_Akt_vip_rabot_0.FieldValues['date_a'];
              IB_Akt_vip_rabot_detali.FieldByName('ID_VID_RABOT').Value:=IB_Akt_vip_rabot_0.FieldValues['ID_VID_RABOT'];
              IB_Akt_vip_rabot_detali.FieldByName('ID_PILOMAT_DETALI').Value:=F_Main.IBQuery2.FieldValues['ID_DETALI'];
              IB_Akt_vip_rabot_detali.FieldByName('KOL_VO').Value:=F_Main.IBQuery2.FieldValues['KOL_VO']*IB_Akt_vip_rabot_1.FieldValues['KOL_VO'];
              IB_Akt_vip_rabot_detali.Post;
              F_Main.IBQuery1.Close;
              F_Main.IBQuery2.Next;
            end;//While not F_Main.IBQuery2.Eof
          F_Main.IBQuery2.Close;
          IB_Akt_vip_rabot_1.Next;
        end;//While
    end;//With DM_Mebeli
end;//proc

procedure TF_Akt_vip_rab_edit.FormActivate(Sender: TObject);
begin
  OK_Pressed:=False;
  DBE_Nomer.SetFocus;
  Old_Date:=Date;
  IF operation='INSERT' Then
     begin
       IF not DM_Mebeli.IBTransaction1.active Then
          DM_Mebeli.IBTransaction1.StartTransaction;
       DM_Mebeli.IB_Akt_vip_rabot_0.Insert;
       DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('DATE_A').Value:=Date;
       DM_Mebeli.IB_Akt_vip_rabot_0.Post;
       DM_Mebeli.IB_Akt_vip_rabot_0.Edit;
     end;//IF 'INSERT'
  IF operation='EDIT' Then
     begin
      DM_Mebeli.IB_Akt_vip_rabot_0.Edit;
      Old_Date:=DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('DATE_A').AsDateTime;
     end;//IF operation='EDIT'
  ID_Akt:=DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('NOMER').AsInteger;
  DM_Mebeli.IB_Akt_vip_rabot_1.Open;
  IF (DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('DATE_A').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      B_Exit.Enabled:=false;
      ShowMessage('Дата документа меньше даты запрета редактирования');
    end;//IF DataZapretaRedakt

end;//proc


procedure TF_Akt_vip_rab_edit.B_Select_ZakazClick(Sender: TObject);
begin
  DM_Mebeli.IB_Akt_vip_rabot_0.Edit;
  IF F_Zakaz_select.ShowModal=mrOk Then
    begin
      DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('id_zakaz').Value:=id_zakaz;
      F_Main.IBQuery1.Close;
      F_Main.IBQuery1.SQL.Clear;
      F_Main.IBQuery1.SQL.Add('update akt_vip_rabot_0 set id_zakaz='+DM_Mebeli.IB_Zakaz_0.FieldByname('ID').AsString+' where nomer='+DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('NOMER').AsString);
      F_Main.IBQuery1.ExecSQL;
      DBE_ID_Zakaz.SetFocus;
    end;
end;//proc

procedure TF_Akt_vip_rab_edit.B_OkClick(Sender: TObject);
begin
  IF Check_IF_All_Data=False Then
     exit;

  IF (DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('DATE_A').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      DM_Mebeli.IBTransaction1.Rollback;
      OK_Pressed:=True;
      close;
    end;//IF DataZapretaRedakt

  //пересчет расхода фурнитуры при смене даты документа
  if Old_Date<>DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('DATE_A').AsDateTime then
    begin
      DM_Mebeli.IB_Akt_vip_rabot_1.First;
      while not DM_Mebeli.IB_Akt_vip_rabot_1.Eof do
        begin
          DM_Mebeli.IB_Akt_vip_rabot_1.Edit;
          DM_Mebeli.IB_Akt_vip_rabot_1.Post;
          DM_Mebeli.IB_Akt_vip_rabot_1.Next;
        end;
    end;

  IF DM_Mebeli.IBTransaction1.Active Then
     begin
       IF (DM_Mebeli.IB_Akt_vip_rabot_0.State=dsEdit) OR (DM_Mebeli.IB_Akt_vip_rabot_0.State=dsInsert) Then
          DM_Mebeli.IB_Akt_vip_rabot_0.Post;
       IF (DM_Mebeli.IB_Akt_vip_rabot_1.State=dsEdit) OR (DM_Mebeli.IB_Akt_vip_rabot_1.State=dsInsert) Then
          DM_Mebeli.IB_Akt_vip_rabot_1.Post;
       Generate_detali_po_aktu;
       DM_Mebeli.IBTransaction1.Commit;
     end;//IF
  OK_Pressed:=True;
  close;
end;//proc

procedure TF_Akt_vip_rab_edit.B_ExitClick(Sender: TObject);
begin
  OK_Pressed:=FALSE;
  Close;
end;//proc

procedure TF_Akt_vip_rab_edit.FormClose(Sender: TObject;
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
          IF DM_Mebeli.IB_Akt_vip_rabot_0.State=dsEdit	Then
             DM_Mebeli.IB_Akt_vip_rabot_0.Post;
          IF (DM_Mebeli.IB_Akt_vip_rabot_1.State=dsEdit) OR (DM_Mebeli.IB_Akt_vip_rabot_1.State=dsInsert) Then
             DM_Mebeli.IB_Akt_raspil_listy.Post;
          Generate_detali_po_aktu;
          DM_Mebeli.IBTransaction1.Commit;
        end;//IF DM_Mebeli.IBTransaction1.Active
      end;//ELSE
end;//proc

procedure TF_Akt_vip_rab_edit.DBGrid1Enter(Sender: TObject);
begin
  IF Check_IF_All_Data=False Then
    begin
      DBE_ID_ZAKAZ.SetFocus;
      exit;
    end;//if
  DM_Mebeli.IB_Akt_vip_rabot_0.Post;
end;//proc

procedure TF_Akt_vip_rab_edit.DBLookupComboBox2DropDown(Sender: TObject);
begin
  DBLookupComboBox2.Height:=500;
end;//proc

procedure TF_Akt_vip_rab_edit.DBE_Date_aExit(Sender: TObject);
begin
  //изменять дату акта на большую (вперед) могут только пользователи группы BUHGALTER или ADMIN
  IF (Old_Date<DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('DATE_A').AsDateTime) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      ShowMessage('Изменять дату вперед нельзя. Обратитесь к бухгалтеру');
      DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('DATE_A').Value:=Old_Date;
      DBE_Date_a.SetFocus;
    end;//IF

  IF (DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('DATE_A').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      ShowMessage('Дата документа меньше даты запрета редактирования: '+DateToStr(DataZapretaRedakt));
      DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('DATE_A').Value:=Old_Date;
      DBE_Date_a.SetFocus;
    end;//IF DataZapretaRedakt
end;//proc

procedure TF_Akt_vip_rab_edit.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF (Shift=[ssCtrl]) and (Key=VK_END)	Then //нажали Ctrl+END
    B_OKClick(Sender);
end;//proc

procedure TF_Akt_vip_rab_edit.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  IF Key=#32 Then
    DBGrid1EditButtonClick(Sender);
end;//proc

procedure TF_Akt_vip_rab_edit.B_Sotrudnik2_clearClick(Sender: TObject);
begin
  DM_Mebeli.IB_Akt_vip_rabot_0.Edit;
  DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('id_sotrudnik2').Value:=null;
  DM_Mebeli.IB_Akt_vip_rabot_0.Post;
end;

procedure TF_Akt_vip_rab_edit.DBLookupComboBox2Exit(Sender: TObject);
begin
  DM_Mebeli.IB_Akt_vip_rabot_0.Post;
  DM_Mebeli.IB_Akt_vip_rabot_0.Edit;
end;//

procedure TF_Akt_vip_rab_edit.DBGrid1EditButtonClick(Sender: TObject);
var old_operation: string [6];
begin
  old_operation:=operation;
  operation:='SELECT';
  IF F_Gotov_prod.ShowModal=mrOk Then
    begin
      DM_Mebeli.IB_Akt_vip_rabot_1.Edit;
      IF DM_Mebeli.IB_Akt_vip_rabot_1.FieldByName('ID_PARENT').IsNull Then
        DM_Mebeli.IB_Akt_vip_rabot_1.FieldByName('ID_PARENT').Value:=DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('NOMER').AsInteger;
      DM_Mebeli.IB_Akt_vip_rabot_1.FieldByName('ID_GOTOV_PROD').Value:=F_Gotov_prod.GotovProd_ID;
    end;//IF =mrOk
  operation:=old_operation;
end;//proc

procedure TF_Akt_vip_rab_edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Akt_vip_rab_edit);
end;

end.
