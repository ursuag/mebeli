unit Peremeschenie_jurnal_print_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBQuery, StdCtrls, ExtCtrls, ComCtrls, Buttons, Grids, DBGrids, DateUtils, DB,
  QRCtrls, QuickRpt, IBCustomDataSet;

type
  TF_Peremeschenie_jurnal_print = class(TForm)
    Label13: TLabel;
    DBG_Sklad_otkuda: TDBGrid;
    RG_Peremeschenie_jurnal: TRadioGroup;
    E_Listy: TEdit;
    E_Detali: TEdit;
    E_Furnitura: TEdit;
    B_Listy_select: TSpeedButton;
    B_Listy_clear: TSpeedButton;
    CB_OSTSKL_Listy_grupa: TCheckBox;
    B_Detali_select: TSpeedButton;
    B_Detali_clear: TSpeedButton;
    CB_OstSkl_Detali_grupa: TCheckBox;
    B_Furnitura_select: TSpeedButton;
    B_Furnitura_clear: TSpeedButton;
    CB_OstSkl_Furnitura_grupa: TCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    Date_Begin: TDateTimePicker;
    Date_End: TDateTimePicker;
    Panel1: TPanel;
    B_Report: TButton;
    B_Exit: TButton;
    Label1: TLabel;
    Label2: TLabel;
    DBG_Sklad_kuda: TDBGrid;
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRL_period: TQRLabel;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel7: TQRLabel;
    QRShape6: TQRShape;
    QRLabel8: TQRLabel;
    QRShape7: TQRShape;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    IB_Peremeschenie_jurnal_print: TIBDataSet;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRSysData1: TQRSysData;
    procedure FormActivate(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_Listy_selectClick(Sender: TObject);
    procedure B_Detali_selectClick(Sender: TObject);
    procedure B_Furnitura_selectClick(Sender: TObject);
    procedure B_Listy_clearClick(Sender: TObject);
    procedure B_Detali_clearClick(Sender: TObject);
    procedure B_Furnitura_clearClick(Sender: TObject);
    procedure B_ReportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
            id_listy: integer;
           id_detali: integer;
        id_furnitura: integer;
    id_pilomat_grupa: integer;
  id_furnitura_grupa: integer;

  end;

var
  F_Peremeschenie_jurnal_print: TF_Peremeschenie_jurnal_print;
               IB_Sklad_otkuda: TIBQuery;
               DS_Sklad_otkuda: TDataSource;
                 IB_Sklad_kuda: TIBQuery;
                 DS_Sklad_kuda: TDataSource;
implementation

uses mebeli_dm, pilomat_f, main_f, furnitura_f;

{$R *.dfm}

procedure TF_Peremeschenie_jurnal_print.FormActivate(Sender: TObject);
begin
  IB_Peremeschenie_jurnal_print.Database:=DM_Mebeli.DB_Mebeli;
  IB_Sklad_otkuda:=TIBQuery.Create(nil);
  IB_Sklad_otkuda.Database:=DM_Mebeli.DB_Mebeli;
  IB_Sklad_kuda:=TIBQuery.Create(nil);
  IB_Sklad_kuda.Database:=DM_Mebeli.DB_Mebeli;
  IB_Sklad_otkuda.SQL.Add('select * from sklad order by id');
  IB_Sklad_kuda.SQL.Add('select * from sklad order by id');
  IB_Sklad_otkuda.Open;
  IB_Sklad_kuda.Open;
  DS_Sklad_otkuda:=TDataSource.Create(nil);
  DS_Sklad_kuda:=TDataSource.Create(nil);
  DS_Sklad_otkuda.DataSet:=IB_Sklad_otkuda;
  DS_Sklad_kuda.DataSet:=IB_Sklad_kuda;
  DBG_Sklad_otkuda.DataSource:=DS_Sklad_otkuda;
  DBG_Sklad_kuda.DataSource:=DS_Sklad_kuda;

  DM_Mebeli.IB_Sklad.Open;
  Date_Begin.Date:=StartOfTheMonth(Date);
  Date_End.Date:=Date;
  E_Listy.Text:='';
  E_Detali.Text:='';
  E_Furnitura.Text:='';

  id_listy:=-1;
  id_detali:=-1;
  id_furnitura:=-1;
  id_pilomat_grupa:=-1;
  id_furnitura_grupa:=-1;
end;//

procedure TF_Peremeschenie_jurnal_print.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Peremeschenie_jurnal_print.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IB_Peremeschenie_jurnal_print.Close;
  IB_Sklad_otkuda.Free;
  IB_Sklad_kuda.Free;
  DM_Mebeli.IB_Sklad.Close;
end;//

procedure TF_Peremeschenie_jurnal_print.B_Listy_selectClick(
  Sender: TObject);
begin
  operation:='SELECT';
  F_Pilomat.ShowModal;
  id_detali:=-1;
  E_Detali.Text:='';
  RG_Peremeschenie_jurnal.ItemIndex:=0;
end;//proc


procedure TF_Peremeschenie_jurnal_print.B_Detali_selectClick(
  Sender: TObject);
begin
  operation:='SELECT';
  F_Pilomat.ShowModal;
  id_listy:=-1;
  E_Listy.Text:='';
  RG_Peremeschenie_jurnal.ItemIndex:=1;
end;//

procedure TF_Peremeschenie_jurnal_print.B_Furnitura_selectClick(
  Sender: TObject);
begin
  operation:='SELECT';
  F_Furnitura.ShowModal;
  id_listy:=-1;
  E_Listy.Text:='';
  id_detali:=-1;
  E_Detali.Text:='';
  RG_Peremeschenie_jurnal.ItemIndex:=2;
end;//

procedure TF_Peremeschenie_jurnal_print.B_Listy_clearClick(
  Sender: TObject);
begin
  id_listy:=-1;
  E_Listy.Text:='';
end;//

procedure TF_Peremeschenie_jurnal_print.B_Detali_clearClick(
  Sender: TObject);
begin
  id_detali:=-1;
  E_Detali.Text:='';
end;//

procedure TF_Peremeschenie_jurnal_print.B_Furnitura_clearClick(
  Sender: TObject);
begin
  id_furnitura:=-1;
  E_Furnitura.Text:='';
end;//

procedure TF_Peremeschenie_jurnal_print.B_ReportClick(Sender: TObject);
begin
  IB_Peremeschenie_jurnal_print.Close;
  IF RG_Peremeschenie_jurnal.ItemIndex=2 then
    begin
      if id_furnitura=-1 then
        IB_Peremeschenie_jurnal_print.ParamByName('ID_FURNITURA').Value:=null
      else
        IB_Peremeschenie_jurnal_print.ParamByName('ID_FURNITURA').Value:=id_furnitura;
      IB_Peremeschenie_jurnal_print.ParamByName('ID_SKLAD_OTKUDA').Value:=IB_Sklad_otkuda.fieldByName('id').AsInteger;
      IB_Peremeschenie_jurnal_print.ParamByName('ID_SKLAD_KUDA').Value:=IB_Sklad_kuda.fieldByName('id').AsInteger;
      IB_Peremeschenie_jurnal_print.ParamByName('PERIOD_START').Value:=DateToStr(Date_Begin.Date);
      IB_Peremeschenie_jurnal_print.ParamByName('PERIOD_END').Value:=DateToStr(Date_End.Date);
      IB_Peremeschenie_jurnal_print.Open;
      QRL_period.Caption:='с '+DateToStr(Date_Begin.Date)+' по '+DateToStr(Date_End.Date);
      QuickRep1.PreviewModal;
    end;//IF id_furnitura>0
end;//

end.
