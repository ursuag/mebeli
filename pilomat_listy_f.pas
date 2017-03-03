unit pilomat_listy_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, Mask, DB, IBCustomDataSet;

type
  TF_Pilomat_listy = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    DBE_Razmer_Y: TDBEdit;
    DBE_Razmer_X: TDBEdit;
    DBE_Name: TDBEdit;
    L_Area: TLabel;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    CB_IsList: TCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    IB_Pilomat_listy: TIBDataSet;
    IB_Pilomat_listyID_GRUPA: TIntegerField;
    IB_Pilomat_listyGRUPA_NAME: TStringField;
    DS_Pilomat_listy: TDataSource;
    IB_Pilomat_listyID: TIntegerField;
    IB_Pilomat_listyRAZMER_X: TIntegerField;
    IB_Pilomat_listyRAZMER_Y: TIntegerField;
    IB_Pilomat_listyNAME: TIBStringField;
    IB_Pilomat_listyAREA: TIntegerField;
    IB_Pilomat_listyISLIST: TSmallintField;
    IB_Pilomat_Grupa_F: TIBDataSet;
    procedure FormActivate(Sender: TObject);
    procedure DBE_Razmer_XKeyPress(Sender: TObject; var Key: Char);
    procedure DBE_Razmer_YKeyPress(Sender: TObject; var Key: Char);
    procedure DBE_Razmer_XExit(Sender: TObject);
    procedure DBE_Razmer_YExit(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Pilomat_listy: TF_Pilomat_listy;
  OK_Pressed: boolean;
implementation

uses main_f, mebeli_dm, pilomat_f;

{$R *.dfm}

procedure TF_Pilomat_listy.FormActivate(Sender: TObject);
begin
  OK_Pressed:=False;
  IB_Pilomat_listy.Open;
  DM_Mebeli.IB_Pilomat_grupa.Open;
  IB_Pilomat_listy.Locate('ID',F_Pilomat.id_listy,[]);
  IF operation='INSERT' Then
     begin
       IB_Pilomat_listy.Insert;
       IB_Pilomat_listy.FieldByName('NAME').Value:=DM_Mebeli.IB_Pilomat_grupa.FieldByName('NAME').AsString+' ';
       IB_Pilomat_listy.FieldByName('ID_GRUPA').Value:=F_Pilomat.id_group;
     end;
  IF operation='EDIT' Then
     IB_Pilomat_listy.Edit;
  DBE_Name.SetFocus;
  L_Area.Caption:=FloatToStrF ( IB_Pilomat_listy.FieldByName('AREA').AsInteger/1000000 ,ffFixed,18,3 )+' м.кв.';
  IF IB_Pilomat_listy.FieldByName('ISLIST').AsInteger=0 Then
    CB_IsList.Checked:=false
  ELSE
    CB_IsList.Checked:=true;
end;//proc

procedure TF_Pilomat_listy.DBE_Razmer_XKeyPress(Sender: TObject;
  var Key: Char);
begin
  IF not(Key in ['0'..'9',#8]) Then Key := #0;
end;//proc

procedure TF_Pilomat_listy.DBE_Razmer_YKeyPress(Sender: TObject;
  var Key: Char);
begin
  IF not(Key in ['0'..'9',#8]) Then Key := #0;
end;//proc

procedure TF_Pilomat_listy.DBE_Razmer_XExit(Sender: TObject);
begin
  L_Area.Caption:=FloatToStrF ( IB_Pilomat_listy.FieldByName('Razmer_X').AsInteger*IB_Pilomat_listy.FieldByName('Razmer_Y').AsInteger/1000000,ffFixed,18,3 )+' м.кв.';
end;//proc

procedure TF_Pilomat_listy.DBE_Razmer_YExit(Sender: TObject);
begin
  L_Area.Caption:=FloatToStrF ( IB_Pilomat_listy.FieldByName('Razmer_X').AsInteger*IB_Pilomat_listy.FieldByName('Razmer_Y').AsInteger/1000000,ffFixed,18,3 )+' м.кв.';
end;//proc

procedure TF_Pilomat_listy.B_OkClick(Sender: TObject);
begin
  OK_Pressed:=True;
  IF DM_Mebeli.IBTransaction1.Active Then
     begin
       IF CB_IsList.Checked Then
        IB_Pilomat_listy.FieldByName('ISLIST').Value:=1
       ELSE
        IB_Pilomat_listy.FieldByName('ISLIST').Value:=0;
       IB_Pilomat_listy.Post;
       DM_Mebeli.IBTransaction1.Commit;
     end;
end;//proc

procedure TF_Pilomat_listy.FormClose(Sender: TObject;
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
           IF CB_IsList.Checked Then
            IB_Pilomat_listy.FieldByName('ISLIST').Value:=1
           ELSE
            IB_Pilomat_listy.FieldByName('ISLIST').Value:=0;
          IB_Pilomat_listy.Post;
          DM_Mebeli.IBTransaction1.Commit;
        end;//IF DM_Mebeli.IBTransaction1.Active
end;//proc

end.
