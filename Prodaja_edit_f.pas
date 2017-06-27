unit Prodaja_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DBCtrls, Mask, ExtCtrls, DB,
  IBCustomDataSet, StrUtils;

type
  TF_Prodaja_edit = class(TForm)
    P_Shapka: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    DBE_NOMER: TDBEdit;
    DBE_Date_pro: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    IB_Prodaja_0_edit: TIBDataSet;
    DS_Prodaja_0_edit: TDataSource;
    IB_Prodaja_0_editID: TIntegerField;
    IB_Prodaja_0_editDATE_PRO: TDateField;
    IB_Prodaja_0_editID_CONTRAGENT: TIntegerField;
    IB_Prodaja_0_editPRIMECHANIE: TIBStringField;
    IB_Prodaja_0_editKONTRAGENT_NAME: TStringField;
    IB_Prodaja_1_edit: TIBDataSet;
    DS_Prodaja_1_edit: TDataSource;
    IB_Prodaja_1_editID: TIntegerField;
    IB_Prodaja_1_editID_PARENT: TIntegerField;
    IB_Prodaja_1_editID_GOTOV_PROD: TIntegerField;
    IB_Prodaja_1_editKOL_VO: TIntegerField;
    IB_Prodaja_1_editID_ZAKAZ: TIntegerField;
    IB_Prodaja_1_editPRICE: TIBBCDField;
    IB_Prodaja_1_editSEBESTOIMOSTI: TIBBCDField;
    IB_Prodaja_1_editSUMMA: TFloatField;
    IB_Prodaja_1_editGRUPA_NAME: TStringField;
    IB_Prodaja_1_editGOTOVPROD_NAME: TStringField;
    IB_Prodaja_1_editARTICLE: TIntegerField;
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IB_Prodaja_1_editNewRecord(DataSet: TDataSet);
    procedure IB_Prodaja_1_editBeforePost(DataSet: TDataSet);
    procedure IB_Prodaja_1_editPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure B_OkClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure IB_Prodaja_1_editCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Prodaja_edit: TF_Prodaja_edit;
      OK_Pressed: boolean;
implementation

uses main_f, mebeli_dm, Prodaja_jurnal_f, Zakaz_Gotovprod_Ostatok_f;

{$R *.dfm}

procedure TF_Prodaja_edit.FormActivate(Sender: TObject);
begin
  IF operation='EDIT' Then
    begin
      IB_Prodaja_0_edit.ParamByName('id_prodaja').Value:=F_Prodaja_jurnal.IB_Prodaja_0.FieldByName('nomer_akt').AsInteger;
      IB_Prodaja_0_edit.Open;
      IB_Prodaja_1_edit.Open;
      IB_Prodaja_0_edit.Edit;
    end;
  IF operation='INSERT' Then
    begin
      IB_Prodaja_0_edit.Open;
      IB_Prodaja_1_edit.Open;
      IB_Prodaja_0_edit.Insert;
      IB_Prodaja_0_edit.FieldByName('date_pro').Value:=Date;
    end;
  DM_Mebeli.IB_Contragenty_1.Open;
  OK_Pressed:=False;
  IF (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    DBE_Date_pro.ReadOnly:=true;  
end;//

procedure TF_Prodaja_edit.DBGrid1EditButtonClick(Sender: TObject);
begin
  IF F_Zakaz_Gotovprod_Ostatok.ShowModal<>mrOk Then exit;
  IB_Prodaja_1_edit.Edit;
  IB_Prodaja_1_edit.FieldByName('id_zakaz').Value:=F_Zakaz_Gotovprod_Ostatok.IB_Zakaz_Gotovprod_Ostatok.FieldByName('id_zakaz').AsInteger;
  IB_Prodaja_1_edit.FieldByName('id_gotov_prod').Value:=F_Zakaz_Gotovprod_Ostatok.IB_Zakaz_Gotovprod_Ostatok.FieldByName('id_gotovprod').AsInteger;
  IB_Prodaja_1_edit.FieldByName('kol_vo').Value:=F_Zakaz_Gotovprod_Ostatok.IB_Zakaz_Gotovprod_Ostatok.FieldByName('ostatok').AsInteger;
  IB_Prodaja_1_edit.Post;
  F_Zakaz_Gotovprod_Ostatok.IB_ZAKAZ_GOTOVPROD_OSTATOK.Close;
end;//proc

procedure TF_Prodaja_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var res:TModalResult;
begin
  IF OK_Pressed Then
    begin
      IB_Prodaja_0_edit.Close;
      IB_Prodaja_1_edit.Close;
      F_Zakaz_Gotovprod_Ostatok.IB_ZAKAZ_GOTOVPROD_OSTATOK.Close;
      exit;
    end;
  res:=MessageDlg('—охранить изменени€?',mtConfirmation,[mbYes,mbNo,mbCancel],0);
  IF res=mrCancel Then
     begin
      Action:=caNone;
      exit;
     end;
  IF res=mrNo Then
     IF DM_Mebeli.IBTransaction1.Active Then
        DM_Mebeli.IBTransaction1.Rollback;
  IF res=mrYes Then
    begin
      ok_pressed:=true;
      IF DM_Mebeli.IBTransaction1.Active Then
         begin
            IF (IB_Prodaja_0_edit.State=dsEdit) OR (IB_Prodaja_0_edit.State=dsInsert) Then
               IB_Prodaja_0_edit.Post;
            IF (IB_Prodaja_1_edit.State=dsEdit) OR (IB_Prodaja_1_edit.State=dsInsert) Then
               IB_Prodaja_1_edit.Post;
            DM_Mebeli.IBTransaction1.Commit
         end;//IF DM_Mebeli.IBTransaction1.Active
    end;//IF res=mrYes
    IB_Prodaja_0_edit.Close;
    IB_Prodaja_1_edit.Close;
    F_Zakaz_Gotovprod_Ostatok.IB_ZAKAZ_GOTOVPROD_OSTATOK.Close;
end;//proc

procedure TF_Prodaja_edit.IB_Prodaja_1_editNewRecord(DataSet: TDataSet);
begin
  IB_Prodaja_1_edit.FieldByName('id_parent').Value:=IB_Prodaja_0_edit.FieldByName('id').AsInteger;
end;

procedure TF_Prodaja_edit.IB_Prodaja_1_editBeforePost(DataSet: TDataSet);
begin
  IF IB_Prodaja_1_edit.FieldByName('id_parent').IsNull Then
    IB_Prodaja_1_edit.FieldByName('id_parent').Value:=IB_Prodaja_0_edit.FieldByName('id').AsInteger;
end;//proc

procedure TF_Prodaja_edit.IB_Prodaja_1_editPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var errmsg: string;
begin
  IF AnsiContainsText(E.Message,'UNIQUE')=True Then
    errmsg:='Ќельз€ выбрать две одинаковые позиции из одного заказа!'
  ELSE
    begin
      errmsg:=Copy(E.Message,Pos('~',E.Message)+1,Length(E.Message)-Pos('~',E.Message));
      errmsg:=Copy(errmsg,1,Pos('~',errmsg)-1);
    end;
  ShowMessage(errmsg);
  Action:=daAbort;
end;//proc

procedure TF_Prodaja_edit.B_OkClick(Sender: TObject);
begin
  IF (IB_Prodaja_0_edit.FieldByName('DATE_PRO').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      DM_Mebeli.IBTransaction1.Rollback;
      OK_Pressed:=True;
      close;
    end;//IF DataZapretaRedakt

  IF DM_Mebeli.IBTransaction1.Active Then
     begin
       IF (IB_Prodaja_0_edit.State=dsEdit) OR (IB_Prodaja_0_edit.State=dsInsert) Then
          IB_Prodaja_0_edit.Post;
       IF (IB_Prodaja_1_edit.State=dsEdit) OR (IB_Prodaja_1_edit.State=dsInsert) Then
          IB_Prodaja_1_edit.Post;
       DM_Mebeli.IBTransaction1.Commit;
       OK_Pressed:=True;
       close;
     end;//IF
end;//proc

procedure TF_Prodaja_edit.B_ExitClick(Sender: TObject);
begin
  OK_Pressed:=FALSE;
  Close;
end;//proc

procedure TF_Prodaja_edit.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  IF Key=Chr(32) Then
    DBGrid1EditButtonClick(Sender);
end;//proc

procedure TF_Prodaja_edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Prodaja_edit);
end;

procedure TF_Prodaja_edit.IB_Prodaja_1_editCalcFields(DataSet: TDataSet);

var ib_tmp:TIBDataSet;
begin
  IF IB_Prodaja_1_edit.FieldByName('ID_GOTOV_PROD').IsNull Then exit;
  ib_tmp:=TIBDataSet.Create(nil);
  ib_tmp.Database:=DM_Mebeli.DB_Mebeli;
  ib_tmp.SelectSQL.Add('select gpg.name as grupa_name, gp0.name gotovprod_name, gp0.article article from gotov_prod_grupa as gpg, gotov_prod_0 as gp0 where (gpg.id=gp0.id_grupa) and (gp0.id=:id_gotovprod)');
  ib_tmp.ParamByname('id_gotovprod').Value:=IB_Prodaja_1_edit.FieldByName('ID_GOTOV_PROD').AsInteger;
  ib_tmp.open;
  IB_Prodaja_1_edit.FieldByName('GRUPA_NAME').Value:=ib_tmp.FieldByName('grupa_name').AsString;
  IB_Prodaja_1_edit.FieldByName('GOTOVPROD_NAME').Value:=ib_tmp.FieldByName('gotovprod_name').AsString;
  IB_Prodaja_1_edit.FieldByName('ARTICLE').Value:=ib_tmp.FieldByName('article').AsInteger;
  ib_tmp.close;
  ib_tmp.Free;

  if (not IB_Prodaja_1_edit.FieldByname('kol_vo').IsNull) and (not IB_Prodaja_1_edit.FieldByname('price').IsNull) then
    IB_Prodaja_1_edit.FieldByname('summa').Value:=IB_Prodaja_1_edit.FieldByname('kol_vo').AsInteger*IB_Prodaja_1_edit.FieldByname('price').AsFloat;

end;//proc

end.
