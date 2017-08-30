unit akt_raspil_jurnal_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, IBCustomDataSet, Menus, DateUtils;

type
  TF_Akt_raspil_jurnal = class(TForm)
    DBGrid1: TDBGrid;
    DBG_Listy: TDBGrid;
    DBGrid3: TDBGrid;
    Panel1: TPanel;
    B_Exit: TButton;
    B_Insert: TButton;
    B_Edit: TButton;
    B_Delete: TButton;
    B_Refresh: TButton;
    DBGrid4: TDBGrid;
    IB_Akt_raspil_listy: TIBDataSet;
    DS_Akt_raspil_listy: TDataSource;
    DS_Akt_raspil_detali: TDataSource;
    IB_Akt_raspil_detali: TIBDataSet;
    MainMenu1: TMainMenu;
    N_Period_of_view: TMenuItem;
    N_Podrobno: TMenuItem;
    IB_Akt_raspil_listy_price: TIBDataSet;
    DS_Akt_raspil_listy_Price: TDataSource;
    P_Podrobno: TPanel;
    DBG_Listy_price: TDBGrid;
    B_Podrobno_close: TButton;
    DBGrid2: TDBGrid;
    IB_Akt_raspil_detali_price: TIBDataSet;
    DS_Akt_raspil_detaly_price: TDataSource;
    DBGrid5: TDBGrid;
    IB_Akt_raspil_ostatok_price: TIBDataSet;
    DS_Akt_raspil_ostatok_price: TDataSource;
    IB_Akt_raspil_listy_priceGRUPA_NAME: TIBStringField;
    IB_Akt_raspil_listy_priceLISTY_NAME: TIBStringField;
    IB_Akt_raspil_listy_priceKOL_VO: TIntegerField;
    IB_Akt_raspil_detali_priceGRUPA_NAME: TIBStringField;
    IB_Akt_raspil_detali_priceDETALY_NAME: TIBStringField;
    IB_Akt_raspil_detali_priceKOL_VO: TIntegerField;
    IB_Akt_raspil_ostatok_priceGRUPA_NAME: TIBStringField;
    IB_Akt_raspil_ostatok_priceLISTY_NAME: TIBStringField;
    IB_Akt_raspil_ostatok_priceKOL_VO: TIntegerField;
    IB_Akt_raspil_detali_priceSUMMA: TIBBCDField;
    IB_Akt_raspil_listy_priceSUMMA: TIBBCDField;
    IB_Akt_raspil_ostatok_priceSUMMA: TIBBCDField;
    IB_Akt_raspil_listy_priceID_LIST: TIntegerField;
    IB_Akt_raspil_detali_priceID_DETALI: TIntegerField;
    IB_Akt_raspil_listy_pricePRICE_UNIT: TIBBCDField;
    IB_Akt_raspil_listyID_LISTY: TIntegerField;
    IB_Akt_raspil_listyGRUPA_NAME: TIBStringField;
    IB_Akt_raspil_listyLISTY_NAME: TIBStringField;
    IB_Akt_raspil_listyKOL_VO: TIntegerField;
    IB_Akt_raspil_ostatok_priceID_LISTY: TIntegerField;
    IB_Akt_raspil_listy_pricePRICE_M2: TFloatField;
    IB_Akt_raspil_detali_pricePRICE_M2: TFloatField;
    IB_Akt_raspil_ostatok_pricePRICE_M2: TFloatField;
    procedure B_InsertClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_EditClick(Sender: TObject);
    procedure B_DeleteClick(Sender: TObject);
    procedure B_RefreshClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N_Period_of_viewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure N_PodrobnoClick(Sender: TObject);
    procedure B_Podrobno_closeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Akt_raspil_jurnal: TF_Akt_raspil_jurnal;
            sql_listy: TStrings;
           sql_detali: TStrings;
               id_akt: integer;
         period_start: TDate;
implementation

uses mebeli_dm, main_f, Akt_raspil_edit_f, geScale;

{$R *.dfm}

procedure Reopen_tables;
begin
  With DM_Mebeli do
    begin
      IB_Akt_raspil.Close;
      IB_Akt_raspil_listy.Close;
      IB_Akt_raspil_detali.Close;
      IB_Akt_raspil_ostatok.Close;

      IB_Akt_raspil.ParamByName('date_start').Value:=DateToStr(period_start);
      IB_Akt_raspil.Open;
      F_Akt_raspil_jurnal.IB_Akt_raspil_listy.Open;
      F_Akt_raspil_jurnal.IB_Akt_raspil_detali.open;
      IB_Akt_raspil_ostatok.Open;
      IF id_akt=0 Then
        IB_Akt_raspil.Last
      ELSE
        IB_Akt_raspil.Locate('ID',id_akt,[]);
    end;//witn
  if F_Akt_raspil_jurnal.P_Podrobno.Visible then
    begin
      F_Akt_raspil_jurnal.IB_Akt_raspil_listy_Price.Open;
      F_Akt_raspil_jurnal.IB_Akt_raspil_detali_Price.Open;
      F_Akt_raspil_jurnal.IB_Akt_raspil_ostatok_price.Open;
    end;
end;//proc

procedure TF_Akt_raspil_jurnal.FormActivate(Sender: TObject);
begin
  DM_Mebeli.IB_Akt_raspil.Close;
  DM_Mebeli.IB_Akt_raspil.SelectSQL[1]:='where date_r >=:date_start';
  period_start:=IncDay(Date,-360);
  DM_Mebeli.IB_Akt_raspil.ParamByName('date_start').Value:=DateToStr(period_start);
  Reopen_tables;
end;//proc

procedure TF_Akt_raspil_jurnal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IB_Akt_raspil_listy.Close;
  IB_Akt_raspil_detali.Close;
  IB_Akt_raspil_listy_price.Close;
end;//proc

procedure TF_Akt_raspil_jurnal.B_InsertClick(Sender: TObject);
begin
  id_akt:=DM_Mebeli.IB_Akt_raspil.FieldByName('ID').AsInteger;
  operation:='INSERT';
  F_Akt_raspil_edit.ShowModal;
  Reopen_tables;
end;//proc

procedure TF_Akt_raspil_jurnal.B_EditClick(Sender: TObject);
begin
  if DM_Mebeli.IB_Akt_raspil.FieldByName('ID').IsNull then exit;
  id_akt:=DM_Mebeli.IB_Akt_raspil.FieldByName('ID').AsInteger;
  operation:='EDIT';
  F_Akt_raspil_edit.ShowModal;
  Reopen_tables;
end;//proc

procedure TF_Akt_raspil_jurnal.B_DeleteClick(Sender: TObject);
begin
  IF MessageDlg('Вы уверены, что хотите удалить?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
       id_akt:=DM_Mebeli.IB_Akt_raspil.FieldByName('ID').AsInteger;
       DM_Mebeli.IB_Akt_raspil.Next;
       IF id_akt=DM_Mebeli.IB_Akt_raspil.FieldByName('ID').AsInteger Then //если запись последняя в таблице
        begin
         DM_Mebeli.IB_Akt_raspil.Prior;
         id_akt:=DM_Mebeli.IB_Akt_raspil.FieldByName('ID').AsInteger;
         DM_Mebeli.IB_Akt_raspil.Next;
        end
       ELSE //если запись не последняя
        begin
         id_akt:=DM_Mebeli.IB_Akt_raspil.FieldByName('ID').AsInteger;
         DM_Mebeli.IB_Akt_raspil.Prior;
        end;//ELSE
       Try
        DM_Mebeli.IB_Akt_raspil.Delete;
       Except
        id_akt:=DM_Mebeli.IB_Akt_raspil.FieldByName('ID').AsInteger;
       end;
       DM_Mebeli.IBTransaction1.Commit;
       Reopen_tables;
     end;//IF
end;//proc

procedure TF_Akt_raspil_jurnal.B_RefreshClick(Sender: TObject);
begin
  Reopen_tables;
end;//proc

procedure TF_Akt_raspil_jurnal.DBGrid1DblClick(Sender: TObject);
begin
  B_EditClick(Sender);
end;//proc

procedure TF_Akt_raspil_jurnal.N_Period_of_viewClick(Sender: TObject);
begin
  period_start:=StrToDate( InputBox('Начало периода просмотра','Введите дату', DateToStr(IncDay(Date,-60))) );
  id_akt:=DM_Mebeli.IB_Akt_raspil.FieldByName('ID').AsInteger;
  DM_Mebeli.IB_Akt_raspil.Close;
  DM_Mebeli.IB_Akt_raspil.ParamByName('date_start').Value:=DateToStr(period_start);
  reopen_tables;
end;//proc

procedure TF_Akt_raspil_jurnal.FormCreate(Sender: TObject);
begin
  F_Main.AdjustResolution(F_Akt_raspil_jurnal);
end;

procedure TF_Akt_raspil_jurnal.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Akt_raspil_jurnal.N_PodrobnoClick(Sender: TObject);
begin
  if P_Podrobno.Visible then
    begin
      P_Podrobno.Visible:=false;
      IB_Akt_raspil_listy_Price.Close;
      IB_Akt_raspil_detali_Price.Close;
      IB_Akt_raspil_ostatok_price.Close;
    end
  else
    begin
      P_Podrobno.Visible:=true;
      IB_Akt_raspil_listy_Price.Open;
      IB_Akt_raspil_detali_Price.Open;
      IB_Akt_raspil_ostatok_price.Open;
    end
end;

procedure TF_Akt_raspil_jurnal.B_Podrobno_closeClick(Sender: TObject);
begin
  P_Podrobno.Visible:=false;
  IB_Akt_raspil_listy_price.Close;
  IB_Akt_raspil_detali_price.Close;
  IB_Akt_raspil_ostatok_price.Close;
end;

end.
