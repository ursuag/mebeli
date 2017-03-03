unit Gotov_prod_categories_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  QDialogs, StdCtrls, ExtCtrls, Grids, DBGrids;

type
  TF_Gotov_prod_categories = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Edit: TButton;
    B_Insert: TButton;
    B_Delete: TButton;
    B_Select: TButton;
    procedure FormActivate(Sender: TObject);
    procedure B_InsertClick(Sender: TObject);
    procedure B_EditClick(Sender: TObject);
    procedure B_DeleteClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure B_SelectClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Gotov_prod_categories: TF_Gotov_prod_categories;

implementation

uses mebeli_dm, main_f, reports_f;

{$R *.dfm}

procedure TF_Gotov_prod_categories.FormActivate(Sender: TObject);
begin
  DM_Mebeli.IB_GOTOV_PROD_CATEGORIES.Open;
  IF operation='SELECT' Then
    begin
      Panel1.Visible:=false;
      B_Select.Visible:=true;
    end
  ELSE
    begin
      Panel1.Visible:=true;
      B_Select.Visible:=false;
    end
end;//proc

procedure TF_Gotov_prod_categories.B_InsertClick(Sender: TObject);
var s: WideString;
begin
  s:='';
  IF InputQuery('Новая категория','Введите наименование:',s) Then
     begin
       DM_Mebeli.IB_Gotov_prod_categories.Insert;
       DM_Mebeli.IB_Gotov_prod_categories.FieldByName('NAME').Value:=s;
       DM_Mebeli.IB_Gotov_prod_categories.Post;
       DM_Mebeli.IBTransaction1.Commit;
       DM_Mebeli.IB_Gotov_prod_categories.Close;
       DM_Mebeli.IB_Gotov_prod_categories.Open;
     end;//IF
end;//proc

procedure TF_Gotov_prod_categories.B_EditClick(Sender: TObject);
var s: Widestring;
begin
  s:=DM_Mebeli.IB_Gotov_prod_categories.FieldByName('NAME').AsString;
  IF InputQuery('Редактирование данных','Введите наименование:',s) Then
     begin
       DM_Mebeli.IB_Gotov_prod_categories.Edit;
       DM_Mebeli.IB_Gotov_prod_categories.FieldByName('NAME').Value:=s;
       DM_Mebeli.IB_Gotov_prod_categories.Post;
       DM_Mebeli.IBTransaction1.Commit;
       DM_Mebeli.IB_Gotov_prod_categories.Open;
     end;//IF
end;//proc

procedure TF_Gotov_prod_categories.B_DeleteClick(Sender: TObject);
begin
  IF MessageDlg('Удалить текущую категорию?',mtConfirmation, [mbOK, mbCancel], 0,mbCancel,nil)=mrOk then
     DM_Mebeli.IB_Gotov_prod_categories.Delete;
  DM_Mebeli.IBTransaction1.Commit;
  DM_Mebeli.IB_Gotov_prod_categories.Open;
end;//proc

procedure TF_Gotov_prod_categories.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Gotov_prod_categories.B_SelectClick(Sender: TObject);
begin
  F_Reports.id_category:=DM_Mebeli.IB_GOTOV_PROD_CATEGORIES.FieldByName('id').AsInteger;
  F_Reports.E_AVR_Category.Text:=DM_Mebeli.IB_GOTOV_PROD_CATEGORIES.FieldByName('NAME').AsString;
  Close;
end;

procedure TF_Gotov_prod_categories.DBGrid1DblClick(Sender: TObject);
begin
  IF operation='SELECT' Then
    begin
      F_Reports.id_category:=DM_Mebeli.IB_GOTOV_PROD_CATEGORIES.FieldByName('id').AsInteger;
      F_Reports.E_AVR_Category.Text:=DM_Mebeli.IB_GOTOV_PROD_CATEGORIES.FieldByName('NAME').AsString;
      Close;
    end;//IF
end;

end.
