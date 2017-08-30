unit Spisanie_jurnal_print_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, QRCtrls, QuickRpt, StdCtrls, ExtCtrls,
  ComCtrls, Grids, DBGrids, Buttons, DateUtils;

type
  TF_Spisanie_jurnal_print = class(TForm)
    Label13: TLabel;
    B_Listy_select: TSpeedButton;
    B_Listy_clear: TSpeedButton;
    B_Detali_select: TSpeedButton;
    B_Detali_clear: TSpeedButton;
    B_Furnitura_select: TSpeedButton;
    B_Furnitura_clear: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    DBG_Sklad_otkuda: TDBGrid;
    RG_Spisanie_jurnal: TRadioGroup;
    E_Listy: TEdit;
    E_Detali: TEdit;
    E_Furnitura: TEdit;
    CB_OSTSKL_Listy_grupa: TCheckBox;
    CB_OstSkl_Detali_grupa: TCheckBox;
    CB_OstSkl_Furnitura_grupa: TCheckBox;
    Date_Begin: TDateTimePicker;
    Date_End: TDateTimePicker;
    Panel1: TPanel;
    B_Report: TButton;
    B_Exit: TButton;
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRL_header: TQRLabel;
    QRL_period: TQRLabel;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand3: TQRBand;
    QRShape13: TQRShape;
    QRShape12: TQRShape;
    QRShape11: TQRShape;
    QRShape10: TQRShape;
    QRShape8: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRSysData1: TQRSysData;
    IB_Spisanie_jurnal_print: TIBDataSet;
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
  F_Spisanie_jurnal_print: TF_Spisanie_jurnal_print;

implementation

uses mebeli_dm, pilomat_f, main_f, furnitura_f;

{$R *.dfm}

procedure TF_Spisanie_jurnal_print.FormActivate(Sender: TObject);
begin
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

procedure TF_Spisanie_jurnal_print.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TF_Spisanie_jurnal_print.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IB_Spisanie_jurnal_print.Close;
  DM_Mebeli.IB_Sklad.Close;
end;

procedure TF_Spisanie_jurnal_print.B_Listy_selectClick(Sender: TObject);
begin
  operation:='SELECT';
  F_Pilomat.ShowModal;
  id_detali:=-1;
  E_Detali.Text:='';
  RG_Spisanie_jurnal.ItemIndex:=0;
end;

procedure TF_Spisanie_jurnal_print.B_Detali_selectClick(Sender: TObject);
begin
  operation:='SELECT';
  F_Pilomat.ShowModal;
  id_listy:=-1;
  E_Listy.Text:='';
  RG_Spisanie_jurnal.ItemIndex:=1;
end;

procedure TF_Spisanie_jurnal_print.B_Furnitura_selectClick(
  Sender: TObject);
begin
  operation:='SELECT';
  F_Furnitura.ShowModal;
  id_listy:=-1;
  E_Listy.Text:='';
  id_detali:=-1;
  E_Detali.Text:='';
  RG_Spisanie_jurnal.ItemIndex:=2;
end;

procedure TF_Spisanie_jurnal_print.B_Listy_clearClick(Sender: TObject);
begin
  id_listy:=-1;
  E_Listy.Text:='';
end;

procedure TF_Spisanie_jurnal_print.B_Detali_clearClick(Sender: TObject);
begin
  id_detali:=-1;
  E_Detali.Text:='';
end;

procedure TF_Spisanie_jurnal_print.B_Furnitura_clearClick(Sender: TObject);
begin
  id_furnitura:=-1;
  E_Furnitura.Text:='';
end;

procedure TF_Spisanie_jurnal_print.B_ReportClick(Sender: TObject);
begin
  IB_Spisanie_jurnal_print.Close;

  IF RG_Spisanie_jurnal.ItemIndex=0 then
    begin
      IB_Spisanie_jurnal_print.SelectSQL.Clear;
      IB_Spisanie_jurnal_print.SelectSQL.Add('select * from GET_SPISANIE_LISTY_JURNAL(:ID_LISTY, :ID_SKLAD)');
      IB_Spisanie_jurnal_print.SelectSQL.Add('where (date_akt>=:period_start) and  (date_akt<=:period_end)');
      if id_listy=-1 then
        IB_Spisanie_jurnal_print.ParamByName('ID_LISTY').Value:=null
      else
        IB_Spisanie_jurnal_print.ParamByName('ID_LISTY').Value:=id_listy;
      IB_Spisanie_jurnal_print.ParamByName('ID_SKLAD').Value:=DM_Mebeli.IB_Sklad.fieldByName('id').AsInteger;
      IB_Spisanie_jurnal_print.ParamByName('PERIOD_START').Value:=DateToStr(Date_Begin.Date);
      IB_Spisanie_jurnal_print.ParamByName('PERIOD_END').Value:=DateToStr(Date_End.Date);
      IB_Spisanie_jurnal_print.Open;
      QRL_header.Caption:='Отчет по списаниям (листы)';
      QRL_period.Caption:='с '+DateToStr(Date_Begin.Date)+' по '+DateToStr(Date_End.Date);
      QuickRep1.PreviewModal;
    end;//LISTY

  IF RG_Spisanie_jurnal.ItemIndex=1 then
    begin
      IB_Spisanie_jurnal_print.SelectSQL.Clear;
      IB_Spisanie_jurnal_print.SelectSQL.Add('select * from GET_SPISANIE_DETALI_JURNAL(:ID_DETALI, :ID_SKLAD)');
      IB_Spisanie_jurnal_print.SelectSQL.Add('where (date_akt>=:period_start) and  (date_akt<=:period_end)');
      if id_detali=-1 then
        IB_Spisanie_jurnal_print.ParamByName('ID_DETALI').Value:=null
      else
        IB_Spisanie_jurnal_print.ParamByName('ID_DETALI').Value:=id_listy;
      IB_Spisanie_jurnal_print.ParamByName('ID_SKLAD').Value:=DM_Mebeli.IB_Sklad.fieldByName('id').AsInteger;
      IB_Spisanie_jurnal_print.ParamByName('PERIOD_START').Value:=DateToStr(Date_Begin.Date);
      IB_Spisanie_jurnal_print.ParamByName('PERIOD_END').Value:=DateToStr(Date_End.Date);
      IB_Spisanie_jurnal_print.Open;
      QRL_header.Caption:='Отчет по списаниям (детали)';
      QRL_period.Caption:='с '+DateToStr(Date_Begin.Date)+' по '+DateToStr(Date_End.Date);
      QuickRep1.PreviewModal;
    end;//DETALI

  IF RG_Spisanie_jurnal.ItemIndex=2 then
    begin
      IB_Spisanie_jurnal_print.SelectSQL.Clear;
      IB_Spisanie_jurnal_print.SelectSQL.Add('select * from GET_SPISANIE_FURNITURA_JURNAL(:ID_FURNITURA, :ID_SKLAD)');
      IB_Spisanie_jurnal_print.SelectSQL.Add('where (date_akt>=:period_start) and  (date_akt<=:period_end)');
      if id_furnitura=-1 then
        IB_Spisanie_jurnal_print.ParamByName('ID_FURNITURA').Value:=null
      else
        IB_Spisanie_jurnal_print.ParamByName('ID_FURNITURA').Value:=id_furnitura;
      IB_Spisanie_jurnal_print.ParamByName('ID_SKLAD').Value:=DM_Mebeli.IB_Sklad.fieldByName('id').AsInteger;
      IB_Spisanie_jurnal_print.ParamByName('PERIOD_START').Value:=DateToStr(Date_Begin.Date);
      IB_Spisanie_jurnal_print.ParamByName('PERIOD_END').Value:=DateToStr(Date_End.Date);
      IB_Spisanie_jurnal_print.Open;
      QRL_header.Caption:='Отчет по списаниям (комплектующие)';
      QRL_period.Caption:='с '+DateToStr(Date_Begin.Date)+' по '+DateToStr(Date_End.Date);
      QuickRep1.PreviewModal;
    end;//Furnitura
end;//

end.
