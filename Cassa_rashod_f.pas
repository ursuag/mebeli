unit Cassa_rashod_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, IBCustomDataSet, DB, DBCtrls, StdCtrls, Mask,
  ExtCtrls, Buttons, IBQuery;

type
  TF_Cassa_rashod = class(TForm)
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
    Label9: TLabel;
    P_Buttons: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    DS_Bank_Prihod: TDataSource;
    IB_Cassa_Rashod: TIBDataSet;
    IB_Cassa_RashodID: TIntegerField;
    IB_Cassa_RashodSUMMA: TIBBCDField;
    IB_Cassa_RashodID_CONTRAGENT: TIntegerField;
    IB_Cassa_RashodID_SOTRUDNIK: TIntegerField;
    IB_Cassa_RashodCONTRAGENT_NAME: TStringField;
    IB_Cassa_RashodSOTRUDNIK_NAME: TStringField;
    IB_Cassa_RashodSTATYA_NAME: TStringField;
    IB_Cassa_RashodDESCRIPTION: TIBStringField;
    IB_Cassa_RashodDATE_CAS: TDateField;
    DateTimePicker1: TDateTimePicker;
    IB_Cassa_RashodID_STATYA_RASHODA: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Cassa_rashod: TF_Cassa_rashod;

implementation

uses main_f, mebeli_dm, cassa_jurnal_f;
{$R *.dfm}

procedure TF_Cassa_rashod.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Cassa_rashod);
end;

procedure TF_Cassa_rashod.DateTimePicker1Exit(Sender: TObject);
begin
  IB_Cassa_Rashod.Edit;
  IB_Cassa_Rashod.FieldByname('date_cas').value:=DateTimePicker1.Date;
end;

procedure TF_Cassa_rashod.B_ExitClick(Sender: TObject);
begin
  close;
end;

procedure TF_Cassa_rashod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not button_clicked then
    if (Application.MessageBox( PChar('Выйте без сохранения?'), PChar('Confirm'), MB_YESNO or MB_DEFBUTTON2 or MB_ICONQUESTION) = IDNO) then
      action:=caNone
    else
      IB_Cassa_Rashod.Close;
end;

procedure TF_Cassa_rashod.FormActivate(Sender: TObject);
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
      IB_Cassa_Rashod.Open;
      sql_bank:=TIBQuery.Create(nil);
      sql_bank.Database:=F_Main.IBQuery1.Database;
      sql_bank.SQL.Add('SELECT GEN_ID(GEN_CASSA_DOCS, 1) id from RDB$DATABASE');
      sql_bank.Open;
      id_Cassa_Rashod:=sql_bank.FieldByname('id').AsInteger;
      IB_Cassa_Rashod.Insert;
      IB_Cassa_Rashod.FieldByname('id').Value:=id_Cassa_Rashod;
      IB_Cassa_Rashod.FieldByname('date_cas').Value:=Date();
      IB_Cassa_Rashod.ParamByName('id').Value:=id_Cassa_Rashod;
      sql_bank.Close;
      sql_bank.Free;
    end;
  if operation='EDIT' then
    IB_Cassa_Rashod.ParamByName('id').Value:=id_Cassa_Rashod;
  IB_Cassa_Rashod.Open;
  DateTimePicker1.Date:=IB_Cassa_Rashod.FieldByname('date_cas').AsDateTime;
end;

procedure TF_Cassa_rashod.B_OkClick(Sender: TObject);
begin
  button_clicked:=true;
  if (IB_Cassa_Rashod.state=dsInsert) or (IB_Cassa_Rashod.state=dsEdit) then IB_Cassa_Rashod.Post;
  if DM_Mebeli.IBTransaction1.Active then DM_Mebeli.IBTransaction1.Commit;
  F_Cassa_Rashod.Close;
end;

end.
