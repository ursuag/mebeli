unit akt_vip_rabot_jurnal_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB,DateUtils, Menus,
  IBCustomDataSet, IBQuery;

type
  TF_Akt_vip_rabot_jurnal = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Insert: TButton;
    B_Edit: TButton;
    B_Delete: TButton;
    DNG_Rashod_furnitura: TDBGrid;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    N_Period_of_view: TMenuItem;
    N1: TMenuItem;
    N_Filtre_Rabota: TMenuItem;
    N_Filtre_Sotrudnik: TMenuItem;
    N_Filtre_Clear: TMenuItem;
    L_Filtre: TLabel;
    IB_Podrobno: TIBDataSet;
    DS_Podrobno: TDataSource;
    IB_PodrobnoGRUPA_NAME: TIBStringField;
    IB_PodrobnoFURNITURA_NAME: TIBStringField;
    IB_PodrobnoKOL_VO: TIBBCDField;
    P_Podrobno: TPanel;
    DBG_Podrobno: TDBGrid;
    N_Podrobno: TMenuItem;
    IB_PodrobnoSUMMA: TIBBCDField;
    PopupMenu_Furnitura: TPopupMenu;
    N_Real_Rashod: TMenuItem;
    IB_Rashod_furnitura_F: TIBDataSet;
    DS_Rashod_furnitura_F: TDataSource;
    IB_PodrobnoID_FURNITURA: TIntegerField;
    N2: TMenuItem;
    N_Change_Rashod_firnitura: TMenuItem;
    IB_Akt_vip_rabot_1: TIBDataSet;
    DS_Akt_vip_rabot_1: TDataSource;
    N3: TMenuItem;
    N_Filtre_Zakaz: TMenuItem;
    N4: TMenuItem;
    N_Search_by_id: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure B_InsertClick(Sender: TObject);
    procedure B_EditClick(Sender: TObject);
    procedure B_DeleteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DNG_Rashod_furnituraExit(Sender: TObject);
    procedure N_Period_of_viewClick(Sender: TObject);
    procedure N_Filtre_RabotaClick(Sender: TObject);
    procedure N_Filtre_SotrudnikClick(Sender: TObject);
    procedure N_Filtre_ClearClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure N_PodrobnoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N_Real_RashodClick(Sender: TObject);
    procedure N_Change_Rashod_firnituraClick(Sender: TObject);
    procedure N_Filtre_ZakazClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N_Search_by_idClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_sotrudnik: integer;
     id_vidrabot: integer;
  end;

var
  F_Akt_vip_rabot_jurnal: TF_Akt_vip_rabot_jurnal;
                  id_akt: integer;
            period_start: TDate;
implementation

uses main_f, mebeli_dm, Akt_vip_rab_edit_f, sotrudniki_f, vidy_rabot_f;

{$R *.dfm}

procedure Reopen_tables;
begin
  With DM_Mebeli Do
    begin
      IB_Akt_vip_rabot_0.Close;
      F_Akt_vip_rabot_jurnal.IB_Akt_vip_rabot_1.Close;
      F_Akt_vip_rabot_jurnal.IB_Rashod_furnitura_f.Close;
      F_Akt_vip_rabot_jurnal.IB_Podrobno.Close;
      IB_Akt_vip_rabot_0.ParamByName('date_start').Value:=DateToStr(period_start);
      IB_Akt_vip_rabot_0.Open;
      F_Akt_vip_rabot_jurnal.IB_Akt_vip_rabot_1.Open;
      F_Akt_vip_rabot_jurnal.IB_Rashod_furnitura_f.Open;
      IF id_akt=0 Then
        IB_Akt_vip_rabot_0.Last
      ELSE
        IB_Akt_vip_rabot_0.Locate('NOMER',id_akt,[]);
      F_Akt_vip_rabot_jurnal.IB_Rashod_furnitura_f.Open;
      F_Akt_vip_rabot_jurnal.IB_Podrobno.Open;
    end;//With
end;//proc

procedure TF_Akt_vip_rabot_jurnal.FormActivate(Sender: TObject);
begin
  L_Filtre.Visible:=false;
  id_akt:=0;
  DM_Mebeli.IB_Akt_vip_rabot_0.Close;
  DM_Mebeli.IB_Akt_vip_rabot_0.SelectSQL[1]:='where (date_a >=:date_start)';
  period_start:=IncDay(Date,-360);
  DM_Mebeli.IB_Akt_vip_rabot_0.ParamByName('date_start').Value:=DateToStr(period_start);
  Reopen_tables;
end;//proc

procedure TF_Akt_vip_rabot_jurnal.B_InsertClick(Sender: TObject);
begin
  operation:='INSERT';
  id_akt:=DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('NOMER').AsInteger;
  F_Akt_vip_rab_edit.ShowModal;
  Reopen_tables;
end;//proc

procedure TF_Akt_vip_rabot_jurnal.B_EditClick(Sender: TObject);
begin
  IF DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('NOMER').IsNull Then
    exit;
  operation:='EDIT';
  id_akt:=DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('NOMER').AsInteger;
  F_Akt_vip_rab_edit.ShowModal;
  Reopen_tables;
end;//proc

procedure TF_Akt_vip_rabot_jurnal.B_DeleteClick(Sender: TObject);
begin
  IF (DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('DATE_A').AsDateTime<=DataZapretaRedakt) AND (Role_name<>'CONTSUPERIOR') AND (Role_name<>'ADMIN') Then
    begin
      ShowMessage('Дата документа меньше даты запрета редактирования');
      exit;
    end;//IF DataZapretaRedakt

  IF MessageDlg('Вы уверены, что хотите удалить?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       DM_Mebeli.IB_Akt_vip_rabot_0.Prior;
       id_akt:=DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('NOMER').AsInteger;
       DM_Mebeli.IB_Akt_vip_rabot_0.Next;
       DM_Mebeli.IB_Akt_vip_rabot_0.Delete;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//IF
end;//proc

procedure TF_Akt_vip_rabot_jurnal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM_Mebeli.IB_Rashod_furnitura.Close;
  IB_Podrobno.Close;
 end;//proc

procedure TF_Akt_vip_rabot_jurnal.DNG_Rashod_furnituraExit(Sender: TObject);
begin
  id_akt:=DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('NOMER').AsInteger;
  IF DM_Mebeli.IBTransaction1.Active Then
  begin
    DM_Mebeli.IBTransaction1.Commit;
    Reopen_tables;
  end;//IF DM_Mebeli.IBTransaction1.Active Then
end;//proc


procedure TF_Akt_vip_rabot_jurnal.N_Period_of_viewClick(Sender: TObject);
begin
  period_start:=StrToDate( InputBox('Начало периода просмотра','Введите дату', DateToStr(IncDay(Date,-60))) );
  id_akt:=DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('NOMER').AsInteger;
  DM_Mebeli.IB_Akt_vip_rabot_0.Close;
  DM_Mebeli.IB_Akt_vip_rabot_0.ParamByName('date_start').Value:=DateToStr(period_start);
  reopen_tables;
end;

procedure TF_Akt_vip_rabot_jurnal.N_Filtre_RabotaClick(Sender: TObject);
begin
  id_akt:=DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('NOMER').AsInteger;
  operation:='SELECT';
  F_Vidy_rabot.ShowModal;
  DM_Mebeli.IB_Akt_vip_rabot_0.Close;
  DM_Mebeli.IB_Akt_vip_rabot_0.SelectSQL[1]:='where (date_a >=:date_start) and (id_vid_rabot='+IntToStr(id_vidrabot)+')';
  DM_Mebeli.IB_Akt_vip_rabot_0.ParamByName('date_start').Value:=DateToStr(period_start);
  DM_Mebeli.IB_Akt_vip_rabot_0.Open;
  DM_Mebeli.IB_Akt_vip_rabot_0.Locate('NOMER',id_akt,[]);
  L_Filtre.Visible:=true;
  L_Filtre.Caption:='Включен фильтр по Виду работ!';
end;//proc

procedure TF_Akt_vip_rabot_jurnal.N_Filtre_SotrudnikClick(Sender: TObject);
begin
  operation:='SELECT';
  F_Sotrudniki.ShowModal;
  id_akt:=DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('NOMER').AsInteger;
  DM_Mebeli.IB_Akt_vip_rabot_0.Close;
  DM_Mebeli.IB_Akt_vip_rabot_0.SelectSQL[1]:='where (date_a >=:date_start) and (id_sotrudnik='+IntToStr(id_sotrudnik)+')';
  DM_Mebeli.IB_Akt_vip_rabot_0.ParamByName('date_start').Value:=DateToStr(period_start);
  DM_Mebeli.IB_Akt_vip_rabot_0.Open;
  DM_Mebeli.IB_Akt_vip_rabot_0.Locate('NOMER',id_akt,[]);
  L_Filtre.Visible:=true;
  L_Filtre.Caption:='Включен фильтр по Сотруднику!';
end;//proc

procedure TF_Akt_vip_rabot_jurnal.N_Filtre_ClearClick(Sender: TObject);
begin
  id_akt:=DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('NOMER').AsInteger;
  DM_Mebeli.IB_Akt_vip_rabot_0.Close;
  DM_Mebeli.IB_Akt_vip_rabot_0.SelectSQL[1]:='where (date_a >=:date_start)';
  DM_Mebeli.IB_Akt_vip_rabot_0.ParamByName('date_start').Value:=DateToStr(period_start);
  DM_Mebeli.IB_Akt_vip_rabot_0.Open;
  DM_Mebeli.IB_Akt_vip_rabot_0.Locate('NOMER',id_akt,[]);
  L_Filtre.Visible:=false;
end;//proc

procedure TF_Akt_vip_rabot_jurnal.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Akt_vip_rabot_jurnal.N_PodrobnoClick(Sender: TObject);
begin
  if P_Podrobno.Visible then
    begin
      P_Podrobno.Visible:=false;
      IB_Podrobno.Close;
    end
  else
    begin
      P_Podrobno.Visible:=true;
      IB_Podrobno.Open;
    end
end;

procedure TF_Akt_vip_rabot_jurnal.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Akt_vip_rabot_jurnal);
end;

procedure TF_Akt_vip_rabot_jurnal.N_Real_RashodClick(Sender: TObject);
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
  sql_update_kolvo.SQL.Add('execute procedure SET_REAL_KOLVO_RASHOD_FURNITURA(:id_akt_vip_rabot,null,:id_furnitura,:id_gotov_prod,:new_kolvo)');
  sql_update_kolvo.ParamByName('id_akt_vip_rabot').Value:=IB_Rashod_furnitura_F.FieldByName('id_akt_vip_rabot').AsInteger;
  sql_update_kolvo.ParamByName('id_furnitura').Value:=IB_Rashod_furnitura_F.FieldByName('id_furnitura').AsInteger;
  sql_update_kolvo.ParamByName('id_gotov_prod').Value:=IB_Rashod_furnitura_F.FieldByName('id_gotov_prod').AsInteger;
  sql_update_kolvo.ParamByName('new_kolvo').Value:=new_kolvo;
  sql_update_kolvo.ExecSQL;
  IB_Rashod_furnitura_F.Close;
  IB_Rashod_furnitura_F.Open;
  sql_update_kolvo.Free;
end;

procedure TF_Akt_vip_rabot_jurnal.N_Change_Rashod_firnituraClick(Sender: TObject);
begin
  N_Real_RashodClick(Sender);
end;

procedure TF_Akt_vip_rabot_jurnal.N_Filtre_ZakazClick(Sender: TObject);
var zakaz_str: string;
begin
  zakaz_str:=Dialogs.Inputbox('Фильтр по Заказу','Введите номер заказа:','');
  operation:='SELECT';
  id_akt:=DM_Mebeli.IB_Akt_vip_rabot_0.FieldByName('NOMER').AsInteger;
  DM_Mebeli.IB_Akt_vip_rabot_0.Close;
  DM_Mebeli.IB_Akt_vip_rabot_0.SelectSQL[1]:='where (date_a >=:date_start) and (id_zakaz='+zakaz_str+')';
  DM_Mebeli.IB_Akt_vip_rabot_0.ParamByName('date_start').Value:=DateToStr(period_start);
  DM_Mebeli.IB_Akt_vip_rabot_0.Open;
  DM_Mebeli.IB_Akt_vip_rabot_0.Locate('NOMER',id_akt,[]);
  L_Filtre.Visible:=true;
  L_Filtre.Caption:='Включен фильтр по Заказу!';
end;

procedure TF_Akt_vip_rabot_jurnal.DBGrid1DblClick(Sender: TObject);
begin
  B_EditClick(Sender);
end;

procedure TF_Akt_vip_rabot_jurnal.N_Search_by_idClick(Sender: TObject);
var id_doc: string;
begin
  id_doc:=InputBox('Найти документ по номеру','Введите номер Акта','');
  DM_Mebeli.IB_Akt_vip_rabot_0.Locate('nomer',id_doc,[])
end;

end.
