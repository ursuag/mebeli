unit furnitura_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, Mask, DB, IBCustomDataSet, Grids,
  DBGrids;

type
  TF_Furnitura_edit = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBE_Name: TDBEdit;
    Label3: TLabel;
    DBComboBox1: TDBComboBox;
    B_Ok: TButton;
    B_Exit: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    DSFurnitura: TDataSource;
    IBFurnitura: TIBDataSet;
    IBFurnituraID: TIntegerField;
    IBFurnituraED_IZM: TIBStringField;
    IBFurnituraID_PARENT: TIntegerField;
    IBFurnituraGRUPA_NAME: TStringField;
    CB_IsUsed_Akt_viprabot: TCheckBox;
    GB_Vid_rabot: TGroupBox;
    IBFurnitura_vidrabot: TIBDataSet;
    IBFurnitura_vidrabotID: TIntegerField;
    IBFurnitura_vidrabotID_FURNITURA: TIntegerField;
    IBFurnitura_vidrabotID_VID_RABOT: TIntegerField;
    IBFurnitura_vidrabotVIDRABOT_NAME: TStringField;
    DSFurnitura_vidrabot: TDataSource;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    IBFurnituraMANUFACTURER_NAME: TIBStringField;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBE_Article: TDBEdit;
    IBFurnituraARTICLE: TIntegerField;
    IBFurnituraNAME: TIBStringField;
    IBFurnituraMANUFACTURER_CODE: TIBStringField;
    procedure IBFurnituraNewRecord(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CB_IsUsed_Akt_viprabotClick(Sender: TObject);
    procedure IBFurnitura_vidrabotNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Furnitura_edit: TF_Furnitura_edit;
  OK_Pressed: boolean;
implementation

uses main_f, mebeli_dm;

{$R *.dfm}

procedure TF_Furnitura_edit.IBFurnituraNewRecord(DataSet: TDataSet);
begin
  IBFurnitura.FieldByName('ID_PARENT').Value:=DM_Mebeli.IB_Furnitura_grupa.FieldByName('ID').AsInteger;
end;//proc

procedure TF_Furnitura_edit.FormActivate(Sender: TObject);
begin
  CB_IsUsed_Akt_viprabot.Checked:=false;
  IBFurnitura.ParamByName('nomer_akt').Value:=Tag;
  IBFurnitura.Open;
  IBFurnitura_vidrabot.Open;
  IF operation='INSERT' Then
    IBFurnitura.Insert;
  IF operation='EDIT' Then
    begin
      IBFurnitura.Edit;
      IF not IBFurnitura_vidrabot.FieldByName('ID_FURNITURA').IsNull Then
        CB_IsUsed_Akt_viprabot.Checked:=true;
    end;//proc
  DBE_Name.SetFocus;
end;//proc

procedure TF_Furnitura_edit.B_ExitClick(Sender: TObject);
begin
  OK_Pressed:=False;
  Close;
end;//proc

procedure TF_Furnitura_edit.B_OkClick(Sender: TObject);
begin
  IF DM_Mebeli.IBTransaction1.Active Then
     begin
       IF not CB_IsUsed_Akt_viprabot.Checked Then
        begin
          F_Main.IBQuery1.Close;
          F_Main.IBQuery1.SQL.Clear;
          F_Main.IBQuery1.SQL.Add('delete from FURNITURA_VIDRABOT where id_furnitura='+IBFurnitura.FieldByName('id').AsString);
          F_Main.IBQuery1.ExecSQL;
        end;//IF
       IBFurnitura.Post;
       DM_Mebeli.IBTransaction1.Commit;
     end;//IF
  OK_Pressed:=True;
  close;
end;//proc

procedure TF_Furnitura_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var res:TModalResult;
begin
  IF OK_Pressed Then exit;

  res:=MessageDlg('Сохранить изменения?',mtConfirmation,[mbYes,mbNo,mbCancel],0);
  IF res=mrCancel Then
     begin
      Action:=caNone;
      exit;
     end;
  IF res=mrNo Then
     IF DM_Mebeli.IBTransaction1.Active Then
        DM_Mebeli.IBTransaction1.Rollback;
  IF res=mrYes Then
     IF DM_Mebeli.IBTransaction1.Active Then
        begin
       IF not CB_IsUsed_Akt_viprabot.Checked Then
          begin
            F_Main.IBQuery1.Close;
            F_Main.IBQuery1.SQL.Clear;
            F_Main.IBQuery1.SQL.Add('delete from FURNITURA_VIDRABOT where id_furnitura='+IBFurnitura.FieldByName('id').AsString);
            F_Main.IBQuery1.ExecSQL;
          end;
          IBFurnitura.Post;
          DM_Mebeli.IBTransaction1.Commit;
        end;//IF DM_Mebeli.IBTransaction1.Active
  IBFurnitura.Close;
end;//proc

procedure TF_Furnitura_edit.CB_IsUsed_Akt_viprabotClick(Sender: TObject);
begin
  IF CB_IsUsed_Akt_viprabot.Checked Then
    GB_Vid_rabot.Visible:=True
  ELSE
    GB_Vid_rabot.Visible:=False;
end;//proc

procedure TF_Furnitura_edit.IBFurnitura_vidrabotNewRecord(
  DataSet: TDataSet);
begin
  IBFurnitura_vidrabot.FieldByName('id_furnitura').Value:=IBFurnitura.FieldByName('id').AsInteger;
end;//proc

end.
