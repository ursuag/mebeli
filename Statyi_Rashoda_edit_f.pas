unit Statyi_Rashoda_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, IBCustomDataSet, Mask, DBCtrls, Buttons;

type
  TF_Statyi_Rashoda_edit = class(TForm)
    Panel1: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    DS_Statya_rashoda_edit: TDataSource;
    IB_Statya_rashoda_edit: TIBDataSet;
    Label1: TLabel;
    CB_Grupa: TComboBox;
    Label2: TLabel;
    DBE_Name: TDBEdit;
    CB_Sebestoimosti: TCheckBox;
    CB_is_Rashod: TCheckBox;
    B_Gruap_clear: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_OkClick(Sender: TObject);
    procedure CB_SebestoimostiClick(Sender: TObject);
    procedure CB_is_RashodClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Statyi_Rashoda_edit: TF_Statyi_Rashoda_edit;

implementation

uses main_f, mebeli_dm, Statyi_Rashoda_f;

{$R *.dfm}

procedure TF_Statyi_Rashoda_edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Statyi_Rashoda_edit);
end;

procedure TF_Statyi_Rashoda_edit.FormActivate(Sender: TObject);
var FDQ_tmp: TIBDataSet;
    i: integer;
begin
  i:=0;
  FDQ_tmp:=TIBDataSet.create(nil);
  FDQ_tmp.Database:=DM_Mebeli.DB_Mebeli;
  FDQ_tmp.SelectSql.Clear;
  FDQ_tmp.SelectSql.Add ('select id, name from statyi_rashoda where id_parent is null order by name');
  FDQ_tmp.Open;
  FDQ_tmp.First;
  CB_Grupa.Items.Clear;
  CB_Grupa.Items.AddObject(' ', TObject(integer(-5)));
  while not FDQ_tmp.Eof do
    begin
      CB_Grupa.Items.AddObject(FDQ_tmp.FieldByName('name').AsString, TObject(FDQ_tmp.FieldByName('id').AsInteger));
      FDQ_tmp.Next;
    end;
  FDQ_tmp.Close;

  if operation='EDIT' then
    begin
      IB_Statya_rashoda_edit.ParamByName('id').Value:=F_Statyi_Rashoda.id_statya_rashoda;
      IB_Statya_rashoda_edit.Open;
      if IB_Statya_rashoda_edit.FieldByname('id_parent').IsNull then
        begin
          CB_Grupa.ItemIndex:=0;
          CB_Grupa.Enabled:=false;
        end
      else
        begin
          CB_Grupa.Enabled:=true;
          for i:=1 to CB_Grupa.Items.Count-1 do
            begin
              CB_Grupa.ItemIndex:=i;
              if integer(TObject(CB_Grupa.Items.Objects[CB_Grupa.ItemIndex]))=IB_Statya_rashoda_edit.FieldByname('id_parent').AsInteger then
                break;
            end;
        end;//else
        CB_Grupa.ItemIndex:=i;
      if IB_Statya_rashoda_edit.FieldByname('is_sebestoimosti').AsInteger=1 then
        CB_Sebestoimosti.Checked:=true
      else
        CB_Sebestoimosti.Checked:=false;
      if IB_Statya_rashoda_edit.FieldByname('is_rashod').AsInteger=1 then
        CB_Is_Rashod.Checked:=true
      else
        CB_Is_Rashod.Checked:=false;
      IB_Statya_rashoda_edit.Edit;
    end;//if EDIT
    
  if operation='INSERT_GRUPA' then
    begin
      IB_Statya_rashoda_edit.Open;
      IB_Statya_rashoda_edit.Insert;
      CB_Grupa.ItemIndex:=0;
      CB_Grupa.Enabled:=false;
      CB_Is_Rashod.Checked:=false;
      CB_Sebestoimosti.Checked:=false;
    end; //if INSERT

  if operation='INSERT_STATYA' then
    begin
      CB_Grupa.Enabled:=true;
      IB_Statya_rashoda_edit.Open;
      IB_Statya_rashoda_edit.Insert;
      for i:=1 to CB_Grupa.Items.Count-1 do
        begin
          CB_Grupa.ItemIndex:=i;
          if integer(TObject(CB_Grupa.Items.Objects[CB_Grupa.ItemIndex]))=F_Statyi_Rashoda.IB_Statyi_Rashoda_0.FieldByname('id').AsInteger then
            break;
        end;
      CB_Grupa.ItemIndex:=i;
      if F_Statyi_Rashoda.IB_Statyi_Rashoda_0.FieldByname('is_sebestoimosti').AsInteger=1 then
        CB_Sebestoimosti.Checked:=true
      else
        CB_Sebestoimosti.Checked:=false;
      if F_Statyi_Rashoda.IB_Statyi_Rashoda_0.FieldByname('is_rashod').AsInteger=1 then
        CB_Is_Rashod.Checked:=true
      else
        CB_Is_Rashod.Checked:=false;
    end; //if INSERT
  FDQ_tmp.Free;
end;

procedure TF_Statyi_Rashoda_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IB_Statya_rashoda_edit.Close;
end;

procedure TF_Statyi_Rashoda_edit.B_OkClick(Sender: TObject);
begin
  if integer(TObject(CB_Grupa.Items.Objects[CB_Grupa.ItemIndex]))<0 then
    IB_Statya_rashoda_edit.FieldByname('id_parent').Value:=null
  else
    IB_Statya_rashoda_edit.FieldByname('id_parent').Value:=integer(TObject(CB_Grupa.Items.Objects[CB_Grupa.ItemIndex]));
  if CB_Is_Rashod.Checked then
    IB_Statya_rashoda_edit.FieldByname('is_rashod').Value:=1
  else
    IB_Statya_rashoda_edit.FieldByname('is_rashod').Value:=0;
  if CB_Sebestoimosti.Checked then
    IB_Statya_rashoda_edit.FieldByname('is_sebestoimosti').Value:=1
  else
    IB_Statya_rashoda_edit.FieldByname('is_sebestoimosti').Value:=0;
  IB_Statya_rashoda_edit.Post;
  if DM_Mebeli.IBTransaction1.Active then DM_Mebeli.IBTransaction1.Commit;
  close;
end;

procedure TF_Statyi_Rashoda_edit.CB_SebestoimostiClick(Sender: TObject);
begin
  if CB_Sebestoimosti.Checked then
    CB_Is_Rashod.Checked:=false;
end;

procedure TF_Statyi_Rashoda_edit.CB_is_RashodClick(Sender: TObject);
begin
  if CB_Is_Rashod.Checked then
    CB_Sebestoimosti.Checked:=false;
end;

end.
