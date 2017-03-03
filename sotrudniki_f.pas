unit sotrudniki_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  QDialogs, StdCtrls, ExtCtrls, Grids, DBGrids;

type
  TF_Sotrudniki = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Edit: TButton;
    B_Insert: TButton;
    B_Delete: TButton;
    B_Select: TButton;
    procedure B_ExitClick(Sender: TObject);
    procedure B_InsertClick(Sender: TObject);
    procedure B_EditClick(Sender: TObject);
    procedure B_DeleteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure B_SelectClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Sotrudniki: TF_Sotrudniki;

implementation

uses mebeli_dm, reports_f, main_f, akt_vip_rabot_jurnal_f;

{$R *.dfm}

procedure TF_Sotrudniki.B_ExitClick(Sender: TObject);
begin
  Close;
end;//proc

procedure TF_Sotrudniki.B_InsertClick(Sender: TObject);
var s: WideString;
begin
  s:='';
  IF InputQuery('Новый сотрудник','Введите ФИО:',s) Then
     begin
       DM_Mebeli.IB_Sotrudniki.Insert;
       DM_Mebeli.IB_Sotrudniki.FieldByName('FIO').Value:=s;
       DM_Mebeli.IB_Sotrudniki.Post;
       DM_Mebeli.IBTransaction1.Commit;
       DM_Mebeli.IB_Sotrudniki.Close;
       DM_Mebeli.IB_Sotrudniki.Open;
     end;//IF
  DM_Mebeli.IBTransaction1.Commit;
  DM_Mebeli.IB_Sotrudniki.Open;
end;//proc

procedure TF_Sotrudniki.B_EditClick(Sender: TObject);
var s: Widestring;
begin
  s:=DM_Mebeli.IB_Sotrudniki.FieldByName('FIO').AsString;
  IF InputQuery('Редактирование данных','Введите ФИО:',s) Then
     begin
       DM_Mebeli.IB_Sotrudniki.Edit;
       DM_Mebeli.IB_Sotrudniki.FieldByName('FIO').Value:=s;
       DM_Mebeli.IB_Sotrudniki.Post;
       DM_Mebeli.IBTransaction1.Commit;
       DM_Mebeli.IB_Sotrudniki.Close;
       DM_Mebeli.IB_Sotrudniki.Open;
     end;//IF
  DM_Mebeli.IBTransaction1.Commit;
  DM_Mebeli.IB_Sotrudniki.Open;
end;//proc

procedure TF_Sotrudniki.B_DeleteClick(Sender: TObject);
begin
  IF MessageDlg('Удалить текущего сотрудника?',mtConfirmation, [mbYes, mbNo], 0)=mrYes then
     DM_Mebeli.IB_Sotrudniki.Delete;
  DM_Mebeli.IBTransaction1.Commit;
end;//proc

procedure TF_Sotrudniki.FormActivate(Sender: TObject);
begin
  DM_Mebeli.IB_Sotrudniki.Open;
  IF operation='SELECT' Then
    begin
      DBGrid1.ReadOnly:=true;
      Panel1.Visible:=false;
      B_Select.Visible:=true;
    end
  ELSE
    begin
      DBGrid1.ReadOnly:=false;
      Panel1.Visible:=true;
      B_Select.Visible:=false;
    end;
end;//proc

procedure TF_Sotrudniki.B_SelectClick(Sender: TObject);
begin
  F_Reports.id_sotrudnik:=DM_Mebeli.IB_Sotrudniki.FieldByName('id').AsInteger;
  F_Reports.E_AVR_Sotrudnik.Text:=DM_Mebeli.IB_Sotrudniki.FieldByName('FIO').AsString;
  Close;
end;//proc

procedure TF_Sotrudniki.DBGrid1DblClick(Sender: TObject);
begin
  IF operation='SELECT' Then
    begin
      F_Reports.id_sotrudnik:=DM_Mebeli.IB_Sotrudniki.FieldByName('id').AsInteger;
      F_Reports.E_AVR_Sotrudnik.Text:=DM_Mebeli.IB_Sotrudniki.FieldByName('FIO').AsString;
      F_Akt_vip_rabot_jurnal.id_sotrudnik:=DM_Mebeli.IB_Sotrudniki.FieldByName('id').AsInteger;
      Close;
    end;
end;//proc

end.
