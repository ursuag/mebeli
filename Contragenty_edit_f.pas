unit Contragenty_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, DB, IBCustomDataSet;

type
  TF_Contragenty_edit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Panel1: TPanel;
    B_Ok: TButton;
    B_Cancel: TButton;
    IB_Contragenty_0: TIBDataSet;
    DS_Contragenty_1: TDataSource;
    IB_Contragenty_1: TIBDataSet;
    IB_Contragenty_1ID: TIntegerField;
    IB_Contragenty_1ID_PARENT: TIntegerField;
    IB_Contragenty_1NAME: TIBStringField;
    IB_Contragenty_1CODFISCAL: TIBStringField;
    IB_Contragenty_1GRUPA_NAME: TStringField;
    Label7: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    procedure B_OkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure B_CancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Contragenty_edit: TF_Contragenty_edit;

implementation

uses mebeli_dm, main_f, Contragenty_f;

{$R *.dfm}

procedure TF_Contragenty_edit.B_OkClick(Sender: TObject);
begin
  if (IB_Contragenty_1.State=dsEdit) or (IB_Contragenty_1.State=dsInsert) then
    IB_Contragenty_1.Post;
  DM_Mebeli.IBTransaction1.Commit;
  F_Contragenty_edit.Close;
end;

procedure TF_Contragenty_edit.FormActivate(Sender: TObject);
begin
  IB_Contragenty_1.ParamByName('id_contragent').Value:=id_contragent;
  IB_Contragenty_1.Open;
  if operation='INSERT' then
    begin
      IB_Contragenty_1.Insert;
      IB_Contragenty_1.FieldByName('id_parent').Value:=DM_Mebeli.IB_Contragenty_0.FieldByname('id').AsInteger;
    end;
    
  if operation='EDIT' then
    IB_Contragenty_1.Edit;
end;

procedure TF_Contragenty_edit.B_CancelClick(Sender: TObject);
begin
  F_Contragenty_edit.Close;
end;

procedure TF_Contragenty_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DM_Mebeli.IBTransaction1.Active then
    begin
    if (Application.MessageBox( PChar('Выйте без сохранения?'), PChar('Confirm'), MB_YESNO or MB_DEFBUTTON2 or MB_ICONQUESTION) = IDNO) then
      action:=caNone
    else
      DM_Mebeli.IBTransaction1.Rollback;
    end;
end;

end.
