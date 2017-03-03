unit print_forms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, DB, IBCustomDataSet, IBQuery, ExtCtrls,
  QRPrntr, DateUtils;

type
  TF_Print_Forms = class(TForm)
    QR_Ostatki_sklad: TQuickRep;
    IBQuery1: TIBQuery;
    QRBand1: TQRBand;
    QRGroup1: TQRGroup;
    QRDBText_sklad: TQRDBText;
    QRGroup2: TQRGroup;
    QRDBText_grupa: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText_Area: TQRDBText;
    QR_Dvij_vid_rab: TQuickRep;
    QRBand2: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRGroup3: TQRGroup;
    QRDBText9: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText8: TQRDBText;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRBand4: TQRBand;
    QRLabel6: TQRLabel;
    L_Period_detali_rabota: TQRLabel;
    QRBand5: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel7: TQRLabel;
    QRBand6: TQRBand;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QR_Ostatki_vidrabot: TQuickRep;
    QRBand7: TQRBand;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRShape10: TQRShape;
    QRGroup4: TQRGroup;
    QRDBText13: TQRDBText;
    QRLabel11: TQRLabel;
    QRGroup5: TQRGroup;
    QRDBText14: TQRDBText;
    QRBand8: TQRBand;
    QRShape12: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRBand9: TQRBand;
    L_group_area: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel15: TQRLabel;
    QRBand10: TQRBand;
    QRLabel14: TQRLabel;
    L_date_ostatok_sklad: TQRLabel;
    QR_Dvij_mater: TQuickRep;
    QRBand11: TQRBand;
    QRDBText1: TQRDBText;
    RASHOD_AREA: TQRDBText;
    QRBand12: TQRBand;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRBand14: TQRBand;
    QRLabel22: TQRLabel;
    L_Dvij_mater_sklad: TQRLabel;
    L_Dvij_mater_material: TQRLabel;
    QRShape15: TQRShape;
    QRBand13: TQRBand;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel20: TQRLabel;
    QRBand15: TQRBand;
    QRLabel16: TQRLabel;
    QRSysData3: TQRSysData;
    PRIHOD_AREA: TQRDBText;
    QRLabel21: TQRLabel;
    QRExpr5: TQRExpr;
    QRLabel24: TQRLabel;
    QRExpr4: TQRExpr;
    L_Dvij_mater_ostatok_begin: TQRLabel;
    L_Dvij_mater_ostatok_end: TQRLabel;
    QR_kolvo_aktviprabot: TQuickRep;
    QRBand16: TQRBand;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRBand17: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText12: TQRDBText;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRGroup6: TQRGroup;
    QRDBText15: TQRDBText;
    QRLabel28: TQRLabel;
    QRBand18: TQRBand;
    QRLabel29: TQRLabel;
    QRL_AKT_VIP_RAB_PERIOD: TQRLabel;
    QRBand19: TQRBand;
    QRSysData4: TQRSysData;
    QRSysData5: TQRSysData;
    QRLabel31: TQRLabel;
    QRBand20: TQRBand;
    QRExpr6: TQRExpr;
    QRLabel30: TQRLabel;
    QR_AVR_Sotrudnik: TQuickRep;
    QRBand21: TQRBand;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRBand22: TQRBand;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDB_AVR_Category_name: TQRDBText;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRGroup7: TQRGroup;
    QRL_AVR_Sotrudnik: TQRDBText;
    QRLabel35: TQRLabel;
    QRBand23: TQRBand;
    QRLabel36: TQRLabel;
    QRL_AVR_Sotrudnik_period: TQRLabel;
    QRBand24: TQRBand;
    QRSysData6: TQRSysData;
    QRSysData7: TQRSysData;
    QRLabel38: TQRLabel;
    QRBand25: TQRBand;
    QRExpr7: TQRExpr;
    QRLabel39: TQRLabel;
    QRGR_AVR_Vidrabot_grupa: TQRGroup;
    QRDB_AVR_Vidrabot_grupa: TQRDBText;
    QR_Akt_raspila: TQuickRep;
    QRBand28: TQRBand;
    QRShape39: TQRShape;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRBand29: TQRBand;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRShape41: TQRShape;
    QRBand30: TQRBand;
    QRLabel57: TQRLabel;
    QRL_Akt_raspila_period: TQRLabel;
    QRBand31: TQRBand;
    QRSysData8: TQRSysData;
    QRSysData9: TQRSysData;
    QRLabel59: TQRLabel;
    QRBand32: TQRBand;
    QRExpr8: TQRExpr;
    QRLabel60: TQRLabel;
    QR_Zakaz_hod_raboty: TQuickRep;
    QRBand33: TQRBand;
    QRShape40: TQRShape;
    QRLabel53: TQRLabel;
    QRLabel56: TQRLabel;
    QRBand34: TQRBand;
    QRDBText27: TQRDBText;
    QRGroup8: TQRGroup;
    QRDBText30: TQRDBText;
    QRLabel61: TQRLabel;
    QRBand35: TQRBand;
    QRLabel62: TQRLabel;
    L_Zakaz_hod_raboty_date: TQRLabel;
    QRBand36: TQRBand;
    QRSysData10: TQRSysData;
    QRSysData11: TQRSysData;
    QRLabel64: TQRLabel;
    QRShape38: TQRShape;
    QRLabel66: TQRLabel;
    QRShape44: TQRShape;
    L_Zakaz_hod_raboty_kolvo2: TQRLabel;
    L_Zakaz_hod_raboty_kolvo3: TQRLabel;
    L_Zakaz_hod_raboty_kolvo4: TQRLabel;
    L_Zakaz_hod_raboty_kolvo5: TQRLabel;
    L_Zakaz_hod_raboty_kolvo6: TQRLabel;
    L_Zakaz_hod_raboty_kolvo7: TQRLabel;
    L_Zakaz_hod_raboty_kolvo8: TQRLabel;
    L_Zakaz_hod_raboty_kolvo9: TQRLabel;
    L_Zakaz_hod_raboty_kolvo10: TQRLabel;
    L_Zakaz_hod_raboty_kolvo11: TQRLabel;
    L_Zakaz_hod_raboty_kolvo12: TQRLabel;
    L_Zakaz_hod_raboty_prodaja_kolvo: TQRLabel;
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
    QR_Akt_Spisania: TQuickRep;
    QRBand37: TQRBand;
    QRShape68: TQRShape;
    QRLabel58: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel68: TQRLabel;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRDBText46: TQRDBText;
    QRL_Spisanie_primechanie: TQRLabel;
    QRBand38: TQRBand;
    QRShape73: TQRShape;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRBand39: TQRBand;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRBand40: TQRBand;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel67: TQRLabel;
    QRGroup9: TQRGroup;
    QRDBText45: TQRDBText;
    QR_Prodaja_nakladnaya: TQuickRep;
    QRBand41: TQRBand;
    QRShape79: TQRShape;
    QRLabel73: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRDBText53: TQRDBText;
    QRL_Prodaja_primechanie: TQRLabel;
    QRBand42: TQRBand;
    QRShape84: TQRShape;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRBand43: TQRBand;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRDBText57: TQRDBText;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRBand44: TQRBand;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel82: TQRLabel;
    QRExpr9: TQRExpr;
    QRShape93: TQRShape;
    QRLabel87: TQRLabel;
    QRDBText58: TQRDBText;
    QRDBText_kolvo: TQRDBText;
    QRDBText_name: TQRDBText;
    QRShape92: TQRShape;
    L_Dvij_mater_period: TQRLabel;
    QRDB_Prihod: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDB_Rashod: TQRDBText;
    QRShape1: TQRShape;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRLabel23: TQRLabel;
    QRShape94: TQRShape;
    QRLabel94: TQRLabel;
    QR_Peremeschenie: TQuickRep;
    QRBand45: TQRBand;
    QRShape95: TQRShape;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRBand46: TQRBand;
    QRShape98: TQRShape;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRDBText62: TQRDBText;
    QRL_Peremeschenie_primechanie: TQRLabel;
    QRBand47: TQRBand;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRShape103: TQRShape;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    QRBand48: TQRBand;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    procedure QR_Ostatki_skladBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand9BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QR_Dvij_materBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand11BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand34BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Print_Forms: TF_Print_Forms;

implementation

uses main_f, mebeli_dm, reports_f;

{$R *.dfm}

procedure TF_Print_Forms.QR_Ostatki_skladBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  L_date_ostatok_sklad.Caption:='на дату '+DateToStr(DateOstatok);
end;//proc

procedure TF_Print_Forms.QRBand9BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  IF IBQuery1.FieldByName('TIP_MATERIALA').AsInteger=3 Then //тип материала  ќћѕЋ≈ “”ёў»≈ - не печатаем
    QRBand9.Height:=0
  ELSE
    begin
      QRBand9.Height:=29;
      L_group_area.Caption:='ѕлощадь группы Ђ'+IBQuery1.FieldValues['GRUPA_NAME']+'ї'
    end;//ELSE
end;//proc

procedure TF_Print_Forms.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  IF IBQuery1.FieldValues['AREA']=0 Then
    QRDBText_Area.Font.Color:=clWhite
  ELSE
    QRDBText_Area.Font.Color:=clBlack
end;//proc

procedure TF_Print_Forms.QR_Dvij_materBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  L_dvij_mater_sklad.Caption:=DM_Mebeli.IB_Sklad.FieldValues['name'];
  L_Dvij_mater_period.Caption:='ѕериод с '+DateToStr(F_Reports.Dvij_mater_date_Begin.DateTime)+' по '+DateToStr(F_Reports.Dvij_mater_date_End.DateTime);
  L_Dvij_mater_material.Caption:=F_Reports.Dvij_mater_material;
end;//proc

procedure TF_Print_Forms.QRBand11BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRDB_Rashod.Font.Color:=clBlack;
  QRDB_Prihod.Font.Color:=clBlack;
  Prihod_Area.Font.Color:=clBlack;
  Rashod_Area.Font.Color:=clBlack;
  IF IBQuery1.FieldByName('KOLVO_RASHOD').AsFloat=0 Then
    QRDB_Rashod.Font.Color:=clWhite;
  IF IBQuery1.FieldByName('KOLVO_PRIHOD').AsFloat=0 Then
    QRDB_Prihod.Font.Color:=clWhite;
  IF IBQuery1.FieldByName('Rashod_AREA').AsFloat=0 Then
    Rashod_Area.Font.Color:=clWhite;
  IF IBQuery1.FieldByName('Prihod_AREA').AsFloat=0 Then
    Prihod_Area.Font.Color:=clWhite;
end;//proc

procedure TF_Print_Forms.QRBand34BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var i: integer;
begin
  for i:=31 to 42 do
    begin
      IF IBQuery1.FieldValues[ (FindComponent('QRDBText'+IntToStr(i)) as TQRDBText).DataField]=0 Then
        (FindComponent('QRDBText'+IntToStr(i)) as TQRDBText).Font.Color:=clWhite
      ELSE
        (FindComponent('QRDBText'+IntToStr(i)) as TQRDBText).Font.Color:=clBlack;
    end;
end;//proc

end.
