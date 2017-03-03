unit Print_Forms_2_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, QRCtrls, QuickRpt, ExtCtrls;

type
  TF_Print_Forms_2 = class(TForm)
    QR_Zakaz_ostalosi_sdelati: TQuickRep;
    QRBand33: TQRBand;
    QRShape40: TQRShape;
    QRLabel53: TQRLabel;
    QRLabel56: TQRLabel;
    QRShape38: TQRShape;
    QRLabel66: TQRLabel;
    QRShape44: TQRShape;
    L_Zakaz_ostalosi_sdelati_kolvo2: TQRLabel;
    L_Zakaz_ostalosi_sdelati_kolvo3: TQRLabel;
    L_Zakaz_ostalosi_sdelati_kolvo4: TQRLabel;
    L_Zakaz_ostalosi_sdelati_kolvo5: TQRLabel;
    L_Zakaz_ostalosi_sdelati_kolvo6: TQRLabel;
    L_Zakaz_ostalosi_sdelati_kolvo7: TQRLabel;
    L_Zakaz_ostalosi_sdelati_kolvo8: TQRLabel;
    L_Zakaz_ostalosi_sdelati_kolvo9: TQRLabel;
    L_Zakaz_ostalosi_sdelati_kolvo10: TQRLabel;
    L_Zakaz_ostalosi_sdelati_kolvo11: TQRLabel;
    L_Zakaz_ostalosi_sdelati_kolvo12: TQRLabel;
    L_PRODAJA_OSTATOK: TQRLabel;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRBand34: TQRBand;
    QRDBText27: TQRDBText;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRGroup8: TQRGroup;
    QRDBText30: TQRDBText;
    QRLabel61: TQRLabel;
    QRBand35: TQRBand;
    QRLabel62: TQRLabel;
    L_Zakaz_ostalosi_sdelati_date: TQRLabel;
    QRBand36: TQRBand;
    QRSysData10: TQRSysData;
    QRSysData11: TQRSysData;
    QRLabel64: TQRLabel;
    IBQuery1: TIBQuery;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRShape5: TQRShape;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRDBText2: TQRDBText;
    procedure QRBand34BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Print_Forms_2: TF_Print_Forms_2;

implementation

uses main_f, mebeli_dm, reports_f;
{$R *.dfm}


procedure TF_Print_Forms_2.QRBand34BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  IF IBQuery1.FieldByName('AKT_KOLVO_OSTATOK2').AsInteger=0 Then
    QRDBText31.Font.Color:=clWhite
  ELSE
    QRDBText31.Font.Color:=clBlack;
  IF IBQuery1.FieldByName('AKT_KOLVO_OSTATOK3').AsInteger=0 Then
    QRDBText32.Font.Color:=clWhite
  ELSE
    QRDBText32.Font.Color:=clBlack;
  IF IBQuery1.FieldByName('AKT_KOLVO_OSTATOK4').AsInteger=0 Then
    QRDBText33.Font.Color:=clWhite
  ELSE
    QRDBText33.Font.Color:=clBlack;
  IF IBQuery1.FieldByName('AKT_KOLVO_OSTATOK5').AsInteger=0 Then
    QRDBText34.Font.Color:=clWhite
  ELSE
    QRDBText34.Font.Color:=clBlack;
  IF IBQuery1.FieldByName('AKT_KOLVO_OSTATOK6').AsInteger=0 Then
    QRDBText35.Font.Color:=clWhite
  ELSE
    QRDBText35.Font.Color:=clBlack;
  IF IBQuery1.FieldByName('AKT_KOLVO_OSTATOK7').AsInteger=0 Then
    QRDBText36.Font.Color:=clWhite
  ELSE
    QRDBText36.Font.Color:=clBlack;
  IF IBQuery1.FieldByName('AKT_KOLVO_OSTATOK8').AsInteger=0 Then
    QRDBText37.Font.Color:=clWhite
  ELSE
    QRDBText37.Font.Color:=clBlack;
  IF IBQuery1.FieldByName('AKT_KOLVO_OSTATOK9').AsInteger=0 Then
    QRDBText38.Font.Color:=clWhite
  ELSE
    QRDBText38.Font.Color:=clBlack;
  IF IBQuery1.FieldByName('AKT_KOLVO_OSTATOK10').AsInteger=0 Then
    QRDBText39.Font.Color:=clWhite
  ELSE
    QRDBText39.Font.Color:=clBlack;
  IF IBQuery1.FieldByName('AKT_KOLVO_OSTATOK11').AsInteger=0 Then
    QRDBText40.Font.Color:=clWhite
  ELSE
    QRDBText40.Font.Color:=clBlack;
  IF IBQuery1.FieldByName('AKT_KOLVO_OSTATOK12').AsInteger=0 Then
    QRDBText41.Font.Color:=clWhite
  ELSE
    QRDBText41.Font.Color:=clBlack;
end;//proc

end.
