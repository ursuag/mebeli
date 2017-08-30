unit pilomat_detali_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls, DB, IBCustomDataSet,
  IBDatabase, Grids, DBGrids;

type
  TF_Pilomat_detali = class(TForm)
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
    DSPilomat_detali: TDataSource;
    IBPilomat_detali: TIBDataSet;
    DBLookupComboBox1: TDBLookupComboBox;
    IBPilomat_detaliID: TIntegerField;
    IBPilomat_detaliRAZMER_X: TIntegerField;
    IBPilomat_detaliRAZMER_Y: TIntegerField;
    IBPilomat_detaliNAME: TIBStringField;
    IBPilomat_detaliAREA: TIntegerField;
    IBPilomat_detaliID_GRUPA: TIntegerField;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    IBPilomat_detaliGRUPA_NAME: TStringField;
    IB_Pilomat_Grupa_F: TIBDataSet;
    procedure FormActivate(Sender: TObject);
    procedure DBE_Razmer_XKeyPress(Sender: TObject; var Key: Char);
    procedure DBE_Razmer_YKeyPress(Sender: TObject; var Key: Char);
    procedure DBE_Razmer_XExit(Sender: TObject);
    procedure DBE_Razmer_YExit(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IBPilomat_detaliBeforePost(DataSet: TDataSet);
    procedure DBGrid1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Pilomat_detali: TF_Pilomat_detali;
        OK_Pressed: boolean;
implementation

uses main_f, mebeli_dm, pilomat_f;

{$R *.dfm}

procedure TF_Pilomat_detali.FormActivate(Sender: TObject);
begin
  IBpilomat_detali.open;
  DM_Mebeli.IB_Furnitura.Open;
  DM_Mebeli.IB_Pilomat_grupa.Locate('ID',F_Pilomat.id_group,[]);
  OK_Pressed:=False;
  IBPilomat_detali.Locate('ID',F_Pilomat.id_detali,[]);
  IF operation='INSERT' Then
     begin
       IBPilomat_detali.Insert;
       IBPilomat_detali.FieldByName('ID_GRUPA').Value:=F_Pilomat.id_group;
     end;//IF operation
  IF operation='EDIT' Then
    IBPilomat_detali.Edit;

  DBE_Name.SetFocus;
  L_Area.Caption:=FloatToStrF ( IBPilomat_detali.FieldByName('AREA').AsInteger/1000000 ,ffFixed,18,3 )+' м.кв.';
end;//proc

procedure TF_Pilomat_detali.DBE_Razmer_XKeyPress(Sender: TObject;
  var Key: Char);
begin
  IF not(Key in ['0'..'9',#8]) Then Key := #0;
end;//proc

procedure TF_Pilomat_detali.DBE_Razmer_YKeyPress(Sender: TObject;
  var Key: Char);
begin
  IF not(Key in ['0'..'9',#8]) Then Key := #0;
end;//proc

procedure TF_Pilomat_detali.DBE_Razmer_XExit(Sender: TObject);
begin
  L_Area.Caption:=FloatToStrF ( IBPilomat_detali.FieldByName('Razmer_X').AsInteger*IBPilomat_detali.FieldByName('Razmer_Y').AsInteger/1000000,ffFixed,18,3 )+' м.кв.';
end;//proc

procedure TF_Pilomat_detali.DBE_Razmer_YExit(Sender: TObject);
begin
  L_Area.Caption:=FloatToStrF ( IBPilomat_detali.FieldByName('Razmer_X').AsInteger*IBPilomat_detali.FieldByName('Razmer_Y').AsInteger/1000000,ffFixed,18,3 )+' м.кв.';
end;//proc

procedure TF_Pilomat_detali.B_OkClick(Sender: TObject);
begin
  OK_Pressed:=true;
  F_Pilomat.id_group:=IBPilomat_detali.FieldByName('ID_GRUPA').AsInteger;
  IF DM_Mebeli.IBTransaction1.Active Then
     begin
       IBPilomat_detali.Post;
       DM_Mebeli.IBTransaction1.Commit;
     end;
end;//proc

procedure TF_Pilomat_detali.FormClose(Sender: TObject;
  var Action: TCloseAction);
var res:TModalResult;
begin
  IF OK_Pressed Then exit;

  res:=MessageDlg('Сохранить изменения?',mtConfirmation,[mbYes,mbNo,mbCancel],0);
  IF res=mrCancel Then
     Action:=caNone
  ELSE
      IF res=mrNo Then
         IF DM_Mebeli.IBTransaction1.Active Then
            DM_Mebeli.IBTransaction1.Rollback
      ELSE
         IF DM_Mebeli.IBTransaction1.Active Then
            begin
              F_Pilomat.id_group:=IBPilomat_detali.FieldByName('ID_GRUPA').AsInteger;
              IBPilomat_detali.Post;
              DM_Mebeli.IBTransaction1.Commit;
            end;//IF DM_Mebeli.IBTransaction1.Active
end;//proc

procedure TF_Pilomat_detali.IBPilomat_detaliBeforePost(DataSet: TDataSet);
begin
  IBPilomat_detali.FieldByName('AREA').Value:=IBPilomat_detali.FieldByName('Razmer_X').AsInteger*IBPilomat_detali.FieldByName('Razmer_Y').AsInteger;
end;//proc

procedure TF_Pilomat_detali.DBGrid1Exit(Sender: TObject);
begin
  IF (DM_Mebeli.IB_Pilomat_detali_furn.State=dsEdit) or (DM_Mebeli.IB_Pilomat_detali_furn.State=dsInsert) Then
    DM_Mebeli.IB_Pilomat_detali_furn.Post;
end;//proc

end.
