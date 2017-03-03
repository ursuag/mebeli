unit vidy_rabot_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  QDialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, Consts, IBCustomDataSet;

type
  TF_Vidy_rabot = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Edit: TButton;
    B_Insert: TButton;
    B_Delete: TButton;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Panel2: TPanel;
    B_Stoimosti_Edit: TButton;
    B_Stoimosti_Insert: TButton;
    B_Stoimosti_Delete: TButton;
    B_Select: TButton;
    IB_Vidy_rabot: TIBDataSet;
    IB_Vidy_rabotID: TIntegerField;
    IB_Vidy_rabotNAME: TIBStringField;
    IB_Vidy_rabot_stoimosti: TIBDataSet;
    DS_Vidy_rabot: TDataSource;
    DS_Vidy_rabot_stoimosti: TDataSource;
    procedure B_InsertClick(Sender: TObject);
    procedure B_EditClick(Sender: TObject);
    procedure B_DeleteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure B_Stoimosti_InsertClick(Sender: TObject);
    procedure B_Stoimosti_EditClick(Sender: TObject);
    procedure B_Stoimosti_DeleteClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure B_SelectClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Vidy_rabot: TF_Vidy_rabot;
  ID_Vid_rabot: integer;
implementation

uses mebeli_dm, Vidy_rabot_stoimosti_edit_f, main_f, reports_f,
  akt_vip_rabot_jurnal_f;

{$R *.dfm}

procedure Reopen_Tables;
begin
  F_Vidy_rabot.IB_Vidy_rabot.Open;
  F_Vidy_rabot.IB_Vidy_rabot_stoimosti.Open;
  F_Vidy_rabot.IB_Vidy_rabot.Locate('ID',ID_Vid_rabot,[]);
end;//proc

procedure TF_Vidy_rabot.B_InsertClick(Sender: TObject);
var sql: TStrings;
     id: integer;
      s: widestring;
      i: integer;
  MaxID: integer;
begin
  sql:=TStringList.Create;
  sql.Assign(IB_Vidy_rabot.SelectSQL);
  id:=IB_Vidy_rabot.FieldByName('ID').AsInteger+1;
  ID_Vid_rabot:=id;
  IB_Vidy_rabot.Last;
  MaxID:=IB_Vidy_rabot.FieldByName('ID').AsInteger;
  IB_Vidy_rabot.Close;
  IB_Vidy_rabot.SelectSQL.Clear;
  IB_Vidy_rabot.SelectSQL.Add('update vidy_rabot');
  IB_Vidy_rabot.SelectSQL.Add('set ID=ID+1 where ID=:OLD_ID');
  For i:=MaxID DownTo id do
    begin
      IB_Vidy_rabot.ParamByName('OLD_ID').Value:=i;
      IB_Vidy_rabot.ExecSQL;
    end;//For
  s:='';
  IF InputQuery('Редактирование данных','Введите наименование:',s) Then

     begin
        IB_Vidy_rabot.SelectSQL.Clear;
        IB_Vidy_rabot.SelectSQL.Add('insert into vidy_rabot (id,name)');
        IB_Vidy_rabot.SelectSQL.Add('values ('+IntToStr(id)+','''+s+''')');
        IB_Vidy_rabot.ExecSQL;
        DM_Mebeli.IBTransaction1.Commit;
     end;//if
  IB_Vidy_rabot.SelectSQL.Assign(sql);
  Reopen_Tables;
  sql.Free;
end;//proc

procedure TF_Vidy_rabot.B_EditClick(Sender: TObject);
var s: widestring;
begin
  s:=IB_Vidy_rabot.FieldByName('NAME').AsString;
  ID_Vid_rabot:=IB_Vidy_rabot.FieldByName('ID').AsInteger;
  IF InputQuery('Редактирование данных','Введите наименование:',s) Then
     begin
       IB_Vidy_rabot.Edit;
       IB_Vidy_rabot.FieldByName('NAME').Value:=s;
       IB_Vidy_rabot.Post;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//if
end;//proc

procedure TF_Vidy_rabot.B_DeleteClick(Sender: TObject);
var sql: TStrings;
     id: integer;
      i: integer;
  MaxID: integer;
begin
  id:=IB_Vidy_rabot.FieldByName('ID').AsInteger;
  IF MessageDlg('Удалить текущий этап №'+IntToStr(ID),mtConfirmation, [mbYes, mbCancel], 0)=mrCancel then
     Exit;
  sql:=TStringList.Create;
  sql.Assign(IB_Vidy_rabot.SelectSQL);

  Try
    IB_Vidy_rabot.Delete;
    DM_Mebeli.IBTransaction1.Commit;
  Except on EDatabaseError Do
    begin
      MessageDlg('На данный этап ссылаются другие документы. Сначала удалите его оттуда.',mtError,[mbAbort],0);
      DM_Mebeli.IBTransaction1.Rollback;
      IB_Vidy_rabot.SelectSQL.Assign(sql);
      IB_Vidy_rabot.Open;
      sql.Free;
      DM_Mebeli.IBTransaction1.Rollback;
      exit;
    end;//except
  end;//Try

  IB_Vidy_rabot.Open;
  IB_Vidy_rabot.Last;
  MaxID:=IB_Vidy_rabot.FieldByName('ID').AsInteger;
  IB_Vidy_rabot.Close;
  IB_Vidy_rabot.SelectSQL.Clear;
  IB_Vidy_rabot.SelectSQL.Add('update vidy_rabot');
  IB_Vidy_rabot.SelectSQL.Add('set ID=ID-1 where ID=:OLD_ID');
  For i:=id to MaxID do
    begin
      IB_Vidy_rabot.ParamByName('OLD_ID').Value:=i;
      IB_Vidy_rabot.ExecSQL;
    end;//While For

  DM_Mebeli.IBTransaction1.Commit;
  IB_Vidy_rabot.Close;
  IB_Vidy_rabot.SelectSQL.Assign(sql);
  Reopen_tables;
  sql.Free;
end;//proc

procedure TF_Vidy_rabot.FormActivate(Sender: TObject);
begin
  Reopen_tables;
  IF operation='SELECT' Then
    begin
      Panel1.Visible:=false;
      B_Select.Visible:=true;
      DBGrid1.ReadOnly:=true;
    end
  ELSE
    begin
      Panel1.Visible:=true;
      B_Select.Visible:=false;
      DBGrid1.ReadOnly:=false;
    end
end;//proc

procedure TF_Vidy_rabot.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF (Shift =[ssCtrl]) and (KEY=VK_DELETE) Then
     F_Vidy_rabot.B_DeleteClick(Sender);
end;//proc

procedure TF_Vidy_rabot.B_Stoimosti_InsertClick(Sender: TObject);
begin
  ID_Vid_rabot:=IB_Vidy_rabot.FieldByName('ID').AsInteger;
  operation:='INSERT';
  F_Vidy_rabot_stoimosti_edit.ShowModal;
  Reopen_tables;
end;//proc

procedure TF_Vidy_rabot.B_Stoimosti_EditClick(Sender: TObject);
begin
  ID_Vid_rabot:=IB_Vidy_rabot.FieldByName('ID').AsInteger;
  operation:='EDIT';
  F_Vidy_rabot_stoimosti_edit.ShowModal;
  Reopen_tables;
end;//proc

procedure TF_Vidy_rabot.B_Stoimosti_DeleteClick(Sender: TObject);
begin
  ID_Vid_rabot:=IB_Vidy_rabot.FieldByName('ID').AsInteger;
  IF MessageDlg('Вы уверены, что хотите удалить расценку?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       DM_Mebeli.IB_Vidy_rabot_stoimosti.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//IF
end;//proc

procedure TF_Vidy_rabot.DBGrid2DblClick(Sender: TObject);
begin
  F_Vidy_rabot.B_Stoimosti_EditClick(Sender);
end;//proc

procedure TF_Vidy_rabot.B_SelectClick(Sender: TObject);
begin
  F_Reports.id_vidrabot:=IB_Vidy_rabot.FieldByName('id').AsInteger;
  F_Reports.E_AVR_vidrabot.Text:=IB_Vidy_rabot.FieldByName('name').AsString;
  F_Akt_vip_rabot_jurnal.id_vidrabot:=IB_Vidy_rabot.FieldByName('id').AsInteger;
  close;
end;//proc

procedure TF_Vidy_rabot.DBGrid1DblClick(Sender: TObject);
begin
  IF operation='SELECT' Then B_SelectClick(Sender);
end;

procedure TF_Vidy_rabot.B_ExitClick(Sender: TObject);
begin
  Close;
end;

end.
