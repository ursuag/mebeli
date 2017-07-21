unit akt_vip_prod_jurnal_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, IBCustomDataSet, Menus, DateUtils, IBQuery;

type
  TF_Akt_vip_prod_jurnal = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Insert: TButton;
    B_Edit: TButton;
    B_Delete: TButton;
    DBG_Detali: TDBGrid;
    DBG_Furnitura: TDBGrid;
    Button1: TButton;
    IB_Rashod_detali: TIBDataSet;
    DS_Rashod_detali: TDataSource;
    IB_Rashod_detaliID_PILOMAT_DETALI: TIntegerField;
    IB_Rashod_detaliDETALI_NAME: TIBStringField;
    IB_Rashod_detaliKOL_VO: TIntegerField;
    IB_Rashod_detaliAREA: TIBBCDField;
    PopupMenu_detali: TPopupMenu;
    N1: TMenuItem;
    DBG_Group_area: TDBGrid;
    IB_Group_area: TIBDataSet;
    DS_Group_area: TDataSource;
    N2: TMenuItem;
    PopupMenu_Furnitura: TPopupMenu;
    M_Edit_furnitura: TMenuItem;
    MainMenu1: TMainMenu;
    N_Period_of_view: TMenuItem;
    N_Podrobno: TMenuItem;
    P_Podrobno: TPanel;
    B_Podrobno_Close: TButton;
    DBG_Podrodno: TDBGrid;
    IB_Podrobno: TIBDataSet;
    DS_Podrobno: TDataSource;
    N3: TMenuItem;
    N_Change_Rashod_firnitura: TMenuItem;
    IB_Rashod_furnitura_F: TIBDataSet;
    DS_Rashod_furnitura_F: TDataSource;
    N4: TMenuItem;
    N_Insert_main: TMenuItem;
    N_Edit_main: TMenuItem;
    N5: TMenuItem;
    N_Delete_main: TMenuItem;
    N6: TMenuItem;
    N_Search_ID: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure B_InsertClick(Sender: TObject);
    procedure B_EditClick(Sender: TObject);
    procedure B_DeleteClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure M_Edit_furnituraClick(Sender: TObject);
    procedure N_Period_of_viewClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N_PodrobnoClick(Sender: TObject);
    procedure B_Podrobno_CloseClick(Sender: TObject);
    procedure N_Change_Rashod_firnituraClick(Sender: TObject);
    procedure N_Search_IDClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Akt_vip_prod_jurnal: TF_Akt_vip_prod_jurnal;
                 id_akt: integer;
           period_start: TDate;
implementation

uses mebeli_dm, akt_vip_prod_edit_f, main_f,
  Akt_vip_prod_rashod_furnitura_f;

{$R *.dfm}
procedure Reopen_tables;
begin
  F_Akt_vip_prod_jurnal.IB_Rashod_detali.Open;
  F_Akt_vip_prod_jurnal.IB_Rashod_furnitura_F.Open;
  With DM_Mebeli Do
    begin
      IB_Akt_vip_prod_0.Close;
      IB_Akt_vip_prod_1.Close;
      DM_Mebeli.IB_Akt_vip_prod_0.ParamByName('date_start').Value:=DateToStr(period_start);
      IB_Akt_vip_prod_0.Open;
      IB_Akt_vip_prod_1.Open;
      IB_Akt_vip_prod_1.Open;
      IF id_akt=0 Then
        IB_Akt_vip_prod_0.Last
      Else
      IB_Akt_vip_prod_0.Locate('NOMER',id_akt,[]);
    end;//With
end;//proc

procedure TF_Akt_vip_prod_jurnal.FormActivate(Sender: TObject);
begin
  id_akt:=0;
  DM_Mebeli.IB_Akt_vip_prod_0.Close;
  DM_Mebeli.IB_Akt_vip_prod_0.SelectSQL[1]:='where date_a >=:date_start';
  period_start:=IncDay(Date,-360);
  DM_Mebeli.IB_Akt_vip_prod_0.ParamByName('date_start').Value:=DateToStr(period_start);
  Reopen_tables;
end;//proc

procedure TF_Akt_vip_prod_jurnal.B_InsertClick(Sender: TObject);
begin
  operation:='INSERT';
  F_Akt_vip_prod_edit.ShowModal;
  Reopen_tables;
end;//proc

procedure TF_Akt_vip_prod_jurnal.B_EditClick(Sender: TObject);
begin
  IF DM_Mebeli.IB_Akt_vip_prod_0.FieldByName('NOMER').IsNull Then
    exit;
  operation:='EDIT';
  F_Akt_vip_prod_edit.ShowModal;
  Reopen_tables;
end;//proc

procedure TF_Akt_vip_prod_jurnal.B_DeleteClick(Sender: TObject);
begin
  IF (DM_Mebeli.IB_Akt_vip_prod_0.FieldByName('DATE_A').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'BUHGALTER') AND (Role_name<>'ADMIN') Then
    begin
      ShowMessage('Дата документа меньше даты запрета редактирования');
      exit;
    end;//IF DataZapretaRedakt

  IF MessageDlg('Вы уверены, что хотите удалить акт №?'+DM_Mebeli.IB_Akt_vip_prod_0.FieldByName('NOMER').AsString,mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       DM_Mebeli.IB_Akt_vip_prod_0.Prior;
       id_akt:=DM_Mebeli.IB_Akt_vip_prod_0.FieldByName('NOMER').AsInteger;
       DM_Mebeli.IB_Akt_vip_prod_0.Next;
       DM_Mebeli.IB_Akt_vip_prod_0.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//IF
end;//proc

procedure TF_Akt_vip_prod_jurnal.Button1Click(Sender: TObject);
begin
  reopen_tables;
end;//proc

procedure TF_Akt_vip_prod_jurnal.N1Click(Sender: TObject);
begin
  IB_Group_area.Open;
  DBG_Group_area.Visible:=true;
end;//proc

procedure TF_Akt_vip_prod_jurnal.N2Click(Sender: TObject);
begin
  IB_Group_area.Close;
  DBG_Group_area.Visible:=false;
end;//proc


procedure TF_Akt_vip_prod_jurnal.M_Edit_furnituraClick(Sender: TObject);
var new_kolvo: double;
    new_kolvo_str: string;
    sql_update_kolvo: TIBQuery;
begin
  IF role_name='USERS' Then
    begin
      ShowMessage('Редкатирование запрещено');
      exit;
    end;

  new_kolvo_str:=InputBox('Реальный расход материалов', 'Введите количество', '');
  if new_kolvo_str='' then
    exit;
  if TryStrToFloat(new_kolvo_str, new_kolvo)=false then
    begin
      ShowMessage('Вы ввели неверное число');
      exit;
    end;
  sql_update_kolvo:=TIBQuery.Create(nil);
  sql_update_kolvo.Database:=F_Main.IBQuery1.Database;
  sql_update_kolvo.SQL.Add('execute procedure SET_REAL_KOLVO_RASHOD_FURNITURA(:null, :id_akt_vip_prod, :id_furnitura, :id_gotov_prod, :new_kolvo)');
  sql_update_kolvo.ParamByName('id_akt_vip_prod').Value:=IB_Rashod_furnitura_F.FieldByName('id_akt_vip_prod').AsInteger;
  sql_update_kolvo.ParamByName('id_furnitura').Value:=IB_Rashod_furnitura_F.FieldByName('id_furnitura').AsInteger;
  sql_update_kolvo.ParamByName('id_gotov_prod').Value:=IB_Rashod_furnitura_F.FieldByName('id_gotov_prod').AsInteger;
  sql_update_kolvo.ParamByName('new_kolvo').Value:=new_kolvo;
  sql_update_kolvo.ExecSQL;

//  IB_Rashod_furnitura_F.Close;
//  IB_Rashod_furnitura_F.Open;

  sql_update_kolvo.Free;

  id_akt:=DM_Mebeli.IB_Akt_vip_prod_0.FieldByName('NOMER').AsInteger;
  IF DM_Mebeli.IBTransaction1.Active Then
  begin
    DM_Mebeli.IBTransaction1.Commit;
    Reopen_tables;
  end;//IF DM_Mebeli.IBTransaction1.Active Then


end;//proc

procedure TF_Akt_vip_prod_jurnal.N_Period_of_viewClick(Sender: TObject);
begin
  period_start:=StrToDate( InputBox('Начало периода просмотра','Введите дату', DateToStr(IncDay(Date,-60))) );
  id_akt:=DM_Mebeli.IB_Akt_vip_prod_0.FieldByName('NOMER').AsInteger;
  DM_Mebeli.IB_Akt_vip_prod_0.Close;
  DM_Mebeli.IB_Akt_vip_prod_0.ParamByName('date_start').Value:=DateToStr(period_start);
  reopen_tables;
end;//proc

procedure TF_Akt_vip_prod_jurnal.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Akt_vip_prod_jurnal.FormCreate(Sender: TObject);
begin
    F_Main.AdjustResolution(F_Akt_vip_prod_jurnal);
end;

procedure TF_Akt_vip_prod_jurnal.N_PodrobnoClick(Sender: TObject);
begin
  if P_Podrobno.Visible then
    begin
      P_Podrobno.Visible:=false;
      IB_Podrobno.Close;
      DBG_Detali.Visible:=true;
      DBG_Furnitura.Visible:=true;
    end
  else
    begin
      P_Podrobno.Visible:=true;
      DBG_Detali.Visible:=false;
      DBG_Furnitura.Visible:=false;
      IB_Podrobno.Open;
    end
end;

procedure TF_Akt_vip_prod_jurnal.B_Podrobno_CloseClick(Sender: TObject);
begin
  P_Podrobno.Visible:=false;
  IB_Podrobno.Close;
end;

procedure TF_Akt_vip_prod_jurnal.N_Change_Rashod_firnituraClick(
  Sender: TObject);
begin
  M_Edit_furnituraClick(Sender); 
end;

procedure TF_Akt_vip_prod_jurnal.N_Search_IDClick(Sender: TObject);
var id_doc: integer;
begin
  id_doc:=StrToInt( InputBox('Поиск по номеру','Введите номер акта', '1') );
  DM_Mebeli.IB_Akt_vip_prod_0.Locate('nomer',id_doc,[]);
end;

end.
