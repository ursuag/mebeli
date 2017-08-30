unit Bank_rashod_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, DBCtrls, StdCtrls, Mask, ExtCtrls, Buttons, IBQuery,
  ComCtrls;

type
  TF_Bank_rashod = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    B_Contragent_clear: TSpeedButton;
    Label6: TLabel;
    B_Sotrudnik_Clear: TSpeedButton;
    Label8: TLabel;
    P_Buttons: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DS_Bank_Rashod: TDataSource;
    IB_Bank_Rashod: TIBDataSet;
    IB_Bank_RashodID: TIntegerField;
    IB_Bank_RashodDATE_BANK: TDateField;
    IB_Bank_RashodSUMMA: TIBBCDField;
    IB_Bank_RashodID_CONTRAGENT: TIntegerField;
    IB_Bank_RashodID_SOTRUDNIK: TIntegerField;
    IB_Bank_RashodCONTRAGENT_NAME: TStringField;
    IB_Bank_RashodSOTRUDNIK_NAME: TStringField;
    IB_Bank_RashodID_STATYA_RASHODA: TIntegerField;
    IB_Bank_RashodSTATYA_NAME: TStringField;
    IB_Bank_RashodDESCRIPTION: TIBStringField;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    DateTimePicker1: TDateTimePicker;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure B_Contragent_clearClick(Sender: TObject);
    procedure B_Sotrudnik_ClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Bank_rashod: TF_Bank_rashod;

implementation

uses main_f, mebeli_dm, bank_jurnal_f;

{$R *.dfm}

procedure TF_Bank_rashod.FormActivate(Sender: TObject);
var
  sql_bank: TIBQuery;
begin
  button_clicked:=false;
  IF role_name='USER' Then
    DateTimePicker1.Enabled:=false
  else
    DateTimePicker1.Enabled:=true;

  if operation='INSERT' then
    begin
      IB_Bank_Rashod.Open;
      sql_bank:=TIBQuery.Create(nil);
      sql_bank.Database:=F_Main.IBQuery1.Database;
      sql_bank.SQL.Add('SELECT GEN_ID(GEN_BANK_DOCS, 1) id from RDB$DATABASE');
      sql_bank.Open;
      id_bank_Rashod:=sql_bank.FieldByname('id').AsInteger;
      IB_Bank_Rashod.Insert;
      IB_Bank_Rashod.FieldByname('id').Value:=id_bank_Rashod;
      IB_Bank_Rashod.FieldByname('date_bank').Value:=Date();
      IB_Bank_Rashod.ParamByName('id').Value:=id_bank_Rashod;
      sql_bank.Close;
      sql_bank.Free;
    end;
  if operation='EDIT' then
    IB_Bank_Rashod.ParamByName('id').Value:=id_bank_Rashod;
  IB_Bank_Rashod.Open;
  DateTimePicker1.Date:=IB_Bank_Rashod.FieldByname('date_bank').AsDateTime;
end;

procedure TF_Bank_rashod.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Bank_rashod);
end;

procedure TF_Bank_rashod.B_OkClick(Sender: TObject);
begin
  button_clicked:=true;
  if (IB_Bank_Rashod.state=dsInsert) or (IB_Bank_Rashod.state=dsEdit) then
    IB_Bank_Rashod.Post;
  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Commit;
  F_Bank_rashod.Close;
end;

procedure TF_Bank_rashod.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Bank_rashod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not button_clicked then
    if (Application.MessageBox( PChar('Выйте без сохранения?'), PChar('Confirm'), MB_YESNO or MB_DEFBUTTON2 or MB_ICONQUESTION) = IDNO) then
      action:=caNone;
end;

procedure TF_Bank_rashod.DateTimePicker1Exit(Sender: TObject);
begin
  IB_Bank_Rashod.Edit;
  IB_Bank_Rashod.FieldByname('date_bank').value:=DateTimePicker1.Date;
end;

procedure TF_Bank_rashod.B_Contragent_clearClick(Sender: TObject);
begin
  IB_Bank_Rashod.Edit;
  IB_Bank_Rashod.FieldByName('id_contragent').Value:=null;
end;

procedure TF_Bank_rashod.B_Sotrudnik_ClearClick(Sender: TObject);
begin
  IB_Bank_Rashod.Edit;
  IB_Bank_Rashod.FieldByName('id_sotrudnik').Value:=null;
end;

end.
