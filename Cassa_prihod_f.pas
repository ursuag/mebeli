unit Cassa_prihod_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, IBCustomDataSet, DB, DBCtrls, StdCtrls, Mask,
  ExtCtrls, Buttons, IBQuery;

type
  TF_Cassa_prihod = class(TForm)
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
    IB_Cassa_Prihod: TIBDataSet;
    IB_Cassa_PrihodID: TIntegerField;
    IB_Cassa_PrihodSUMMA: TIBBCDField;
    IB_Cassa_PrihodID_CONTRAGENT: TIntegerField;
    IB_Cassa_PrihodID_SOTRUDNIK: TIntegerField;
    IB_Cassa_PrihodID_STATYA_DOHODA: TIntegerField;
    IB_Cassa_PrihodCONTRAGENT_NAME: TStringField;
    IB_Cassa_PrihodSOTRUDNIK_NAME: TStringField;
    IB_Cassa_PrihodSTATYA_NAME: TStringField;
    IB_Cassa_PrihodDESCRIPTION: TIBStringField;
    DateTimePicker1: TDateTimePicker;
    IB_Cassa_PrihodDATE_CAS: TDateField;
    procedure FormCreate(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_Contragent_clearClick(Sender: TObject);
    procedure B_Sotrudnik_ClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Cassa_prihod: TF_Cassa_prihod;

implementation

uses main_f, mebeli_dm, cassa_jurnal_f;

{$R *.dfm}

procedure TF_Cassa_prihod.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Cassa_prihod);
end;

procedure TF_Cassa_prihod.DateTimePicker1Exit(Sender: TObject);
begin
  IB_Cassa_Prihod.Edit;
  IB_Cassa_Prihod.FieldByname('date_cas').value:=DateTimePicker1.Date;
end;

procedure TF_Cassa_prihod.FormActivate(Sender: TObject);
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
      IB_Cassa_Prihod.Open;
      sql_bank:=TIBQuery.Create(nil);
      sql_bank.Database:=F_Main.IBQuery1.Database;
      sql_bank.SQL.Add('SELECT GEN_ID(GEN_CASSA_DOCS, 1) id from RDB$DATABASE');
      sql_bank.Open;
      id_cassa_prihod:=sql_bank.FieldByname('id').AsInteger;
      IB_Cassa_Prihod.Insert;
      IB_Cassa_Prihod.FieldByname('id').Value:=id_cassa_prihod;
      IB_Cassa_Prihod.FieldByname('date_cas').Value:=Date();
      IB_Cassa_Prihod.ParamByName('id').Value:=id_cassa_prihod;
      sql_bank.Close;
      sql_bank.Free;
    end;
  if operation='EDIT' then
    IB_Cassa_Prihod.ParamByName('id').Value:=id_cassa_prihod;
  IB_Cassa_Prihod.Open;
  DateTimePicker1.Date:=IB_Cassa_Prihod.FieldByname('date_cas').AsDateTime;
end;

procedure TF_Cassa_prihod.B_OkClick(Sender: TObject);
begin
  button_clicked:=true;
  if (IB_Cassa_Prihod.state=dsInsert) or (IB_Cassa_Prihod.state=dsEdit) then IB_Cassa_Prihod.Post;
  if DM_Mebeli.IBTransaction1.Active then DM_Mebeli.IBTransaction1.Commit;
  F_Cassa_prihod.Close;
end;

procedure TF_Cassa_prihod.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Cassa_prihod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not button_clicked then
    if (Application.MessageBox( PChar('Выйте без сохранения?'), PChar('Confirm'), MB_YESNO or MB_DEFBUTTON2 or MB_ICONQUESTION) = IDNO) then
      action:=caNone
    else
      IB_Cassa_Prihod.Close;
end;

procedure TF_Cassa_prihod.B_Contragent_clearClick(Sender: TObject);
begin
  IB_Cassa_Prihod.Edit;
  IB_Cassa_Prihod.FieldByName('id_contragent').Value:=null;
end;

procedure TF_Cassa_prihod.B_Sotrudnik_ClearClick(Sender: TObject);
begin
  IB_Cassa_Prihod.Edit;
  IB_Cassa_Prihod.FieldByName('id_sotrudnik').Value:=null;
end;

end.
