unit statyi_Dohoda_edit_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons;

type
  TF_Statyi_Dohoda_edit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    B_Gruap_clear: TSpeedButton;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Ok: TButton;
    CB_Grupa: TComboBox;
    DBE_Name: TDBEdit;
    CB_is_Dohod: TCheckBox;
    DS_Statya_dohoda_edit: TDataSource;
    IB_Statya_dohoda_edit: TIBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure B_OkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Statyi_Dohoda_edit: TF_Statyi_Dohoda_edit;

implementation

uses main_f, mebeli_dm, Statyi_Dohoda_f;

{$R *.dfm}

procedure TF_Statyi_Dohoda_edit.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Statyi_Dohoda_edit);
end;

procedure TF_Statyi_Dohoda_edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IB_Statya_dohoda_edit.Close;
end;

procedure TF_Statyi_Dohoda_edit.FormActivate(Sender: TObject);
var FDQ_tmp: TIBDataSet;
    i: integer;
begin
  i:=0;
  FDQ_tmp:=TIBDataSet.create(nil);
  FDQ_tmp.Database:=DM_Mebeli.DB_Mebeli;
  FDQ_tmp.SelectSql.Clear;
  FDQ_tmp.SelectSql.Add ('select id, name from statyi_Dohoda where id_parent is null order by name');
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
      IB_Statya_Dohoda_edit.ParamByName('id').Value:=F_Statyi_Dohoda.id_statya_Dohoda;
      IB_Statya_Dohoda_edit.Open;
      if IB_Statya_Dohoda_edit.FieldByname('id_parent').IsNull then
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
              if integer(TObject(CB_Grupa.Items.Objects[CB_Grupa.ItemIndex]))=IB_Statya_Dohoda_edit.FieldByname('id_parent').AsInteger then
                break;
            end;
        end;//else
        CB_Grupa.ItemIndex:=i;
      if IB_Statya_Dohoda_edit.FieldByname('is_dohod').AsInteger=1 then
        CB_is_Dohod.Checked:=true
      else
        CB_is_Dohod.Checked:=false;
      IB_Statya_Dohoda_edit.Edit;
    end;//if EDIT
    
  if operation='INSERT_GRUPA' then
    begin
      IB_Statya_Dohoda_edit.Open;
      IB_Statya_Dohoda_edit.Insert;
      CB_Grupa.ItemIndex:=0;
      CB_Grupa.Enabled:=false;
      CB_is_Dohod.Checked:=false;
    end; //if INSERT

  if operation='INSERT_STATYA' then
    begin
      CB_Grupa.Enabled:=true;
      IB_Statya_Dohoda_edit.Open;
      IB_Statya_Dohoda_edit.Insert;
      for i:=1 to CB_Grupa.Items.Count-1 do
        begin
          CB_Grupa.ItemIndex:=i;
          if integer(TObject(CB_Grupa.Items.Objects[CB_Grupa.ItemIndex]))=F_Statyi_Dohoda.IB_Statyi_Dohoda_0.FieldByname('id').AsInteger then
            break;
        end;
      CB_Grupa.ItemIndex:=i;
      if F_Statyi_Dohoda.IB_Statyi_Dohoda_0.FieldByname('is_dohod').AsInteger=1 then
        CB_is_Dohod.Checked:=true
      else
        CB_is_Dohod.Checked:=false;
    end; //if INSERT
  FDQ_tmp.Free;
end;

procedure TF_Statyi_Dohoda_edit.B_OkClick(Sender: TObject);
begin
  if integer(TObject(CB_Grupa.Items.Objects[CB_Grupa.ItemIndex]))<0 then
    IB_Statya_Dohoda_edit.FieldByname('id_parent').Value:=null
  else
    IB_Statya_Dohoda_edit.FieldByname('id_parent').Value:=integer(TObject(CB_Grupa.Items.Objects[CB_Grupa.ItemIndex]));
    
  if CB_is_Dohod.Checked then
    IB_Statya_Dohoda_edit.FieldByname('is_dohod').Value:=1
  else
    IB_Statya_Dohoda_edit.FieldByname('is_dohod').Value:=0;
  IB_Statya_Dohoda_edit.Post;
  if DM_Mebeli.IBTransaction1.Active then DM_Mebeli.IBTransaction1.Commit;
  close;
end;

end.
