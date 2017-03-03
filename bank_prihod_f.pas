unit bank_prihod_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, IBCustomDataSet, Buttons, DBCtrls, Mask, IBQuery,
  ComCtrls;

type
  TF_Bank_prihod = class(TForm)
    P_Buttons: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    DS_Bank_Prihod: TDataSource;
    IB_Bank_Prihod: TIBDataSet;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    IB_Bank_PrihodID: TIntegerField;
    IB_Bank_PrihodDATE_BANK: TDateField;
    IB_Bank_PrihodSUMMA: TIBBCDField;
    IB_Bank_PrihodID_CONTRAGENT: TIntegerField;
    IB_Bank_PrihodID_SOTRUDNIK: TIntegerField;
    IB_Bank_PrihodID_STATYA_DOHODA: TIntegerField;
    IB_Bank_PrihodCONTRAGENT_NAME: TStringField;
    IB_Bank_PrihodSOTRUDNIK_NAME: TStringField;
    IB_Bank_PrihodSTATYA_NAME: TStringField;
    Label7: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    B_Contragent_clear: TSpeedButton;
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    B_Sotrudnik_Clear: TSpeedButton;
    Label8: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    IB_Bank_PrihodDESCRIPTION: TIBStringField;
    DateTimePicker1: TDateTimePicker;
    procedure B_Contragent_clearClick(Sender: TObject);
    procedure B_Sotrudnik_ClearClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DateTimePicker1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Bank_prihod: TF_Bank_prihod;

implementation

uses main_f, mebeli_dm, bank_jurnal_f;

{$R *.dfm}

procedure TF_Bank_prihod.B_Contragent_clearClick(Sender: TObject);
begin
  IB_Bank_Prihod.Edit;
  IB_Bank_Prihod.FieldByName('id_contragent').Value:=null;
end;

procedure TF_Bank_prihod.B_Sotrudnik_ClearClick(Sender: TObject);
begin
  IB_Bank_Prihod.Edit;
  IB_Bank_Prihod.FieldByName('id_sotrudnik').Value:=null;
end;

procedure TF_Bank_prihod.FormActivate(Sender: TObject);
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
      IB_Bank_Prihod.Open;
      sql_bank:=TIBQuery.Create(nil);
      sql_bank.Database:=F_Main.IBQuery1.Database;
      sql_bank.SQL.Add('SELECT GEN_ID(GEN_BANK_DOCS, 1) id from RDB$DATABASE');
      sql_bank.Open;
      id_bank_prihod:=sql_bank.FieldByname('id').AsInteger;
      IB_Bank_Prihod.Insert;
      IB_Bank_Prihod.FieldByname('id').Value:=id_bank_prihod;
      IB_Bank_Prihod.FieldByname('date_bank').Value:=Date();
      IB_Bank_Prihod.ParamByName('id').Value:=id_bank_prihod;
      sql_bank.Close;
      sql_bank.Free;
    end;
  if operation='EDIT' then
    IB_Bank_Prihod.ParamByName('id').Value:=id_bank_prihod;
  IB_Bank_Prihod.Open;
  DateTimePicker1.Date:=IB_Bank_Prihod.FieldByname('date_bank').AsDateTime;
end;

procedure TF_Bank_prihod.B_OkClick(Sender: TObject);
begin
  button_clicked:=true;
  if (IB_Bank_Prihod.state=dsInsert) or (IB_Bank_Prihod.state=dsEdit) then IB_Bank_Prihod.Post;
  if DM_Mebeli.IBTransaction1.Active then DM_Mebeli.IBTransaction1.Commit;
  F_Bank_prihod.Close;
end;

procedure TF_Bank_prihod.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Bank_prihod);
end;

procedure TF_Bank_prihod.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Bank_prihod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not button_clicked then
    if (Application.MessageBox( PChar('Выйте без сохранения?'), PChar('Confirm'), MB_YESNO or MB_DEFBUTTON2 or MB_ICONQUESTION) = IDNO) then
      action:=caNone;
end;

procedure TF_Bank_prihod.DateTimePicker1Exit(Sender: TObject);
begin
  IB_Bank_Prihod.Edit;
  IB_Bank_Prihod.FieldByname('date_bank').value:=DateTimePicker1.Date;
end;

end.
