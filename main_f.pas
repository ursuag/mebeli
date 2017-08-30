unit main_f;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Menus, Math, StdCtrls, DB, IBCustomDataSet, IBQuery,
  ExtCtrls, IniFiles, EXLReportExcelTLB, EXLReportBand, EXLReport, DBCtrls,
  Consts, ImgList, DateUtils, ComObj, IB, UHojaCalc;

type
  TF_Main = class(TForm)
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    N_Spravochnik: TMenuItem;
    N_Akty: TMenuItem;
    N_Prihod: TMenuItem;
    N_Zakaz: TMenuItem;
    N_Exit: TMenuItem;
    N_Sotrudnik: TMenuItem;
    N_Sklad: TMenuItem;
    N_Vid_rabot: TMenuItem;
    N_Pilomat: TMenuItem;
    N_Furnitura: TMenuItem;
    N_Gotov_prod: TMenuItem;
    N_New_Zakaz: TMenuItem;
    N_Edit_Zakaz: TMenuItem;
    N_Delete_Zakaz: TMenuItem;
    N_Akt_vip_rabot: TMenuItem;
    N_Akt_vipusk_prod: TMenuItem;
    N_Akt_raspil: TMenuItem;
    N_prihod_listy: TMenuItem;
    N_prihod_detali: TMenuItem;
    N_prihod_furnitura: TMenuItem;
    DBGrid2: TDBGrid;
    IBQuery1: TIBQuery;
    L_Role: TLabel;
    Panel1: TPanel;
    B_Exit: TButton;
    IBQuery2: TIBQuery;
    IBQuery3: TIBQuery;
    N_Reports: TMenuItem;
    N1: TMenuItem;
    N_Akt_spisania: TMenuItem;
    N2: TMenuItem;
    IBQuery4: TIBQuery;
    N3: TMenuItem;
    N_Gotov_prod_categories: TMenuItem;
    N4: TMenuItem;
    N_Zakazy_view: TMenuItem;
    ImageList1: TImageList;
    IMG_Logo: TImage;
    N5: TMenuItem;
    N_Contragenty: TMenuItem;
    N_Prodaja: TMenuItem;
    L_user: TLabel;
    L_Server: TLabel;
    N6: TMenuItem;
    N_Constanty: TMenuItem;
    Label1: TLabel;
    N7: TMenuItem;
    N_Statyi_Rashoda: TMenuItem;
    N_Statyi_Dohoda: TMenuItem;
    N_Manage_signs: TMenuItem;
    N_Money: TMenuItem;
    N_Bank: TMenuItem;
    N_Kassa: TMenuItem;
    N8: TMenuItem;
    N_Peremeschenia: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N_Remont: TMenuItem;
    Button1: TButton;
    N_Calculation_Sebest: TMenuItem;
    N_Zakrytie_Mesiatsa: TMenuItem;
    N_Lavoare: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N_Revizii: TMenuItem;
    N13: TMenuItem;
    N_Ostatok_listy: TMenuItem;
    N_Ostatok_detali: TMenuItem;
    N_Ostatok_furnitura: TMenuItem;
    DS_Zakaz_1: TDataSource;
    F_IB_Zakaz_1: TIBDataSet;
    L_Database: TLabel;
    N14: TMenuItem;
    N_Akt_raspil_detali: TMenuItem;
    IDGOTOVPROD1: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    IDDETALI1: TMenuItem;
    N19: TMenuItem;
    N_Spsanie_detali_zamena: TMenuItem;
    N20: TMenuItem;
    Timer1: TTimer;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N_General: TMenuItem;
    N_materialy_Ostatok_sklad: TMenuItem;
    EXLReport1: TEXLReport;
    N25: TMenuItem;
    N_Get_zakaz_rabota: TMenuItem;
    N_Get_zakaz_ostalosi_sdelati: TMenuItem;
    N26: TMenuItem;
    N_Furnitura_in_Norma: TMenuItem;
    N_Detali_in_Norma: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N_Rashod_na_gotovprod_furnitura: TMenuItem;
    N_Rashod_na_gotovprod_pilomat: TMenuItem;
    procedure N_ExitClick(Sender: TObject);
    function VolumeID:dword;
    procedure FormCreate(Sender: TObject);
    procedure MouseWheel (var Msg: TMsg; var Handled: Boolean);
    procedure ErrorHandle(Sender: TObject; E: Exception);
    procedure FormActivate(Sender: TObject);
    procedure N_SotrudnikClick(Sender: TObject);
    procedure N_SkladClick(Sender: TObject);
    procedure N_Vid_rabotClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure N_PilomatClick(Sender: TObject);
    procedure N_FurnituraClick(Sender: TObject);
    procedure N_Gotov_prodClick(Sender: TObject);
    procedure N_New_ZakazClick(Sender: TObject);
    procedure N_Edit_ZakazClick(Sender: TObject);
    procedure N_Delete_ZakazClick(Sender: TObject);
    procedure N_Akt_raspilClick(Sender: TObject);
    procedure N_Akt_vip_rabotClick(Sender: TObject);
    procedure N_prihod_detaliClick(Sender: TObject);
    procedure N_Akt_vipusk_prodClick(Sender: TObject);
    procedure N_prihod_listyClick(Sender: TObject);
    procedure N_prihod_furnituraClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N_Akt_spisaniaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N_Gotov_prod_categoriesClick(Sender: TObject);
    procedure N_Zakazy_viewClick(Sender: TObject);
    procedure N_ContragentyClick(Sender: TObject);
    procedure N_ProdajaClick(Sender: TObject);
    procedure N_ConstantyClick(Sender: TObject);
    procedure N_Statyi_RashodaClick(Sender: TObject);
    procedure N_Manage_signsClick(Sender: TObject);
    procedure N_BankClick(Sender: TObject);
    procedure N_Statyi_DohodaClick(Sender: TObject);
    procedure N_PeremescheniaClick(Sender: TObject);
    procedure N_KassaClick(Sender: TObject);
    procedure N_RemontClick(Sender: TObject);
    procedure N_LavoareClick(Sender: TObject);
    procedure N_ReviziiClick(Sender: TObject);
    procedure N_Calculation_SebestClick(Sender: TObject);
    procedure N_Ostatok_furnituraClick(Sender: TObject);
    procedure N_Ostatok_listyClick(Sender: TObject);
    procedure N_Ostatok_detaliClick(Sender: TObject);
    procedure N_PrihodClick(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N_Akt_raspil_detaliClick(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N_Spsanie_detali_zamenaClick(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N_GeneralClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N_Get_zakaz_rabotaClick(Sender: TObject);
    procedure N_Get_zakaz_ostalosi_sdelatiClick(Sender: TObject);
    procedure N_materialy_Ostatok_skladClick(Sender: TObject);
    procedure N_Rashod_na_gotovprod_furnituraClick(Sender: TObject);
    procedure N_Furnitura_in_NormaClick(Sender: TObject);
    procedure N_Detali_in_NormaClick(Sender: TObject);
    procedure N_Rashod_na_gotovprod_pilomatClick(Sender: TObject);
  private
    { Private declarations }
  public
    function Kolvo_detali_na_etape(id_vidrabot: integer; id_detali: integer; date_check: string; isAkt_vip_rabot: boolean):integer;
    function Kolvo_detali_na_etape_sklade(id_vidrabot: integer; id_detali: integer; id_sklad: integer; date_check: string):integer;
    function Kolvo_detali_sklad(id_detali: integer; date_check: TDateTime; id_sklad: integer):integer;
    function Kolvo_detali_viprabot(id_vidrabot: integer; id_detali: integer; date_check: string):integer;
    function Kolvo_listov_na_sklade(id_pilomat_listy: integer; date_check: TDateTime; id_sklad: integer):integer;
    function Kolvo_furnitury_na_sklade(id_furnitura: integer; date_check: TDateTime; id_sklad: integer):double;
    procedure AdjustResolution(oForm:TForm);
  end;

const
  codfiscal_mebeli='1002600022290';

var
  F_Main: TF_Main;
  CopyRightOK: boolean;
  operation: string[20]; //EDIT, INSERT, CHANGED, SELECT
  button_clicked: boolean;
  select_date_start: TDateTime; //начало периода просмотра документов
  sklad_detali: byte; //№ склада "СБОРОЧНЫЙ ЦЕХ" для распил или купл. деталей (пока №3)
   sklad_listy: byte; //№ склада "Листовых материалов" (пока №1)
 sklad_gotprod: byte; //№ склада готовой продукции
 user_FIO: string[60];
 Last_vid_rabot: integer;
 Mebeli_INI: TIniFile;
 Role_name:string[50];//Роль (группа) пользователя в БД
 DecimalSeparator_Old: char;
 DataZapretaRedakt: TDateTime; // дата запрета редактирования
 Is_post_error: boolean;
 id_zakaz: integer;
 id_furnitura: integer;
 id_contragent: integer;
implementation

uses mebeli_dm, password_dlg, sotrudniki_f, sklad_f, password_f,
  vidy_rabot_f, pilomat_f, furnitura_f, gotov_prod_f, zakaz_edit_f,
  akt_raspil_jurnal_f, akt_vip_rabot_jurnal_f, Prihod_detali_jurnal_f,
  akt_vip_prod_jurnal_f, prihod_listy_jurnal_f, prihod_furnitura_jurnal_f,
  Peremeschenie_jurnal_f, about, spisanie_jurnal_f, reports_f, print_forms,
  Gotov_prod_categories_f, Contragenty_f, Prodaja_jurnal_f, constanty_f,
  Statyi_Rashoda_f, Signs_Management_f, Bank_Jurnal_f, Statyi_Dohoda_f,
  Cassa_Jurnal_f, Remont_jurnal_f, Lavoare_list_f, Revizii_jurnal_df,
  gotov_prod_edit_f, Calc_sebestoimosti_f, Ostatok_furnitura_f,
  Ostatok_listy_f, Ostatok_detali_f, Get_zakaz_rabota_f,
  Report_Get_Zakaz_Ostalosi_Sdelati_f, Report_Ostatok_materialy_f,
  Rashod_na_gotovprod_furnitura_f, Print_Furnitura_In_Norma_f,
  Print_Detali_In_Norma_f, Rashod_na_gotovprod_detali_f;

{$R *.dfm}

procedure TF_Main.AdjustResolution(oForm:TForm);
 var
   iPercentage:integer;
    width: integer;
   height: integer;
begin
  width:=oForm.width;
  height:=740;
  if Screen.Width>1440 then width:=1360;
  if Screen.Width > width then
   begin
      iPercentage:=Round(((Screen.Width-width)/width)*100)+100;
      if Screen.Height<oForm.height*ipercentage/100 then
        iPercentage:=Round(((Screen.Height-height)/height)*100)+100;
        oForm.ScaleBy(iPercentage,100);
   end;//if
end;

function GetAveCharSize(Canvas: TCanvas): TPoint;
var
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
  for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
  GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
  Result.X := Result.X div 52;
end;//proc

//Колво деталей выпущенных по "Актам выполн работ" на указанной этапе
function TF_Main.Kolvo_detali_viprabot(id_vidrabot: integer; id_detali: integer; date_check: string):integer;
var
  IB_kolvo_detali: TIBQuery;
begin
  IB_kolvo_detali:=TIBQuery.Create(nil);
  IB_kolvo_detali.Database:=F_Main.IBQuery1.Database;
  IB_kolvo_detali.SQL.Add('select sum(avr1.kol_vo*gp1.kol_vo) as detali_kolvo from gotov_prod_1 as gp1, akt_vip_rabot_1 as avr1, akt_vip_rabot_0 as avr0');
  IB_kolvo_detali.SQL.Add('where (avr1.id_gotov_prod=gp1.id_parent) and (gp1.id_detali=:ID_DETALI) and (avr0.id_vid_rabot=:ID_VIDRABOT) and (avr0.nomer=avr1.id_parent) and (avr0.date_a<=:DATE_A)');
  IB_kolvo_detali.ParamByName('ID_DETALI').Value:=id_detali;
  IB_kolvo_detali.ParamByName('ID_VIDRABOT').Value:=id_vidrabot;
  IB_kolvo_detali.ParamByName('DATE_A').Value:=date_check;
  IB_kolvo_detali.Open;
  Result:=IB_kolvo_detali.FieldByname('DETALI_KOLVO').AsInteger;
  //отнимаем детали, списанные  по вине сотрудника по данному виду работ
  IB_kolvo_detali.Close;
  IB_kolvo_detali.SQL.Clear;
  IB_kolvo_detali.SQL.Add('select sum(kol_vo) as kolvo_spisanie from spisanie_0 as sp0, spisanie_detali as spd');
  IB_kolvo_detali.SQL.Add('where (sp0.id=spd.id_parent) and (sp0.date_spis<=:date_spis) and (spd.id_pilomat_detali=:id_detali) and (spd.oplata=0)');
  IB_kolvo_detali.ParamByName('date_spis').Value:=date_check;
  IB_kolvo_detali.ParamByName('id_detali').Value:=id_detali;
  IB_kolvo_detali.Open;
  Result:=Result-IB_kolvo_detali.FieldByname('KOLVO_SPISANIE').AsInteger;

  IB_kolvo_detali.Close;
  IB_kolvo_detali.Free;
end;//proc

{Функция возвращает количество деталей на этапе работ, в т.ч. и пришедших на склад со стороны
 Если этап работ над деталью не производится, то возвращает отрицательное значение
 ОПЛАТА или НЕОПЛАТА не учитываются!}
function TF_Main.Kolvo_detali_na_etape(id_vidrabot: integer; id_detali: integer; date_check: string; isAkt_vip_rabot: boolean):integer;
          //isAkt_vip_rabot=True если функцию вызываем из "Акта выполнен работ"
          //необходима для корректного подсчета деталей на 1-м этапе
var
  IB_vidy_rabot: TIBQuery;
IB_kolvo_detali: TIBQuery;
   detali_kolvo: integer;
   detali_kolvo_next_etap: integer;
begin
  IB_vidy_rabot:=TIBQuery.Create(nil);
  IB_vidy_rabot.Database:=DM_Mebeli.DB_Mebeli;
  IB_kolvo_detali:=TIBQuery.Create(nil);
  IB_kolvo_detali.Database:=DM_Mebeli.DB_Mebeli;

  //Получаем список видов работ для детали
  IB_vidy_rabot.Close;
  IB_vidy_rabot.SQL.Clear;
  IB_vidy_rabot.SQL.Add('select pgvr.id_vid_rabot from pilomat_grupa_vidrabot as pgvr, pilomat_detali as pd');
  IB_vidy_rabot.SQL.Add('where (pd.id=:ID_DETALI) and (pd.id_grupa=pgvr.id_grupa)');
  IB_vidy_rabot.SQL.Add('order by 1');
  IB_vidy_rabot.ParamByName('ID_DETALI').Value:=ID_DETALI;
  IB_vidy_rabot.Open;
  //если вид работ над деталью не производится, то выходим
  IF IB_vidy_rabot.Locate('ID_VID_RABOT',ID_VIDRABOT,[])=False Then
    begin
      Result:=0;
      Exit;
    end;//IF Locate

  //Для расчета реального кол-ва деталей необходимо от кол-ва деталей на текущем этапе+склад ЦЕХ
  //отнять кол-во деталей на следующем этапе (т.е. перешедших на дальнейшую обработку)

  //количество деталей на текущем этапе по актам выполн работ
  {IB_kolvo_detali.SQL.Add('select sum(avr1.kol_vo*gp1.kol_vo) as detali_kolvo from gotov_prod_1 as gp1, akt_vip_rabot_1 as avr1, akt_vip_rabot_0 as avr0');
  IB_kolvo_detali.SQL.Add('where (avr1.id_gotov_prod=gp1.id_parent) and (gp1.id_detali=:ID_DETALI) and (avr0.id_vid_rabot=:ID_VIDRABOT) and (avr0.nomer=avr1.id_parent) and (avr0.date_a<=:DATE_A)');
  IB_kolvo_detali.ParamByName('ID_DETALI').Value:=id_detali;
  IB_kolvo_detali.ParamByName('ID_VIDRABOT').Value:=id_vidrabot;
  IB_kolvo_detali.ParamByName('DATE_A').Value:=date_check;
  IB_kolvo_detali.Open;}


  IB_kolvo_detali.SQL.Add('select sum (avrd.kol_vo) as detali_kolvo from akt_vip_rabot_detali as avrd');
  IB_kolvo_detali.SQL.Add('where (avrd.id_pilomat_detali=:ID_DETALI) and (avrd.id_vid_rabot=:ID_VIDRABOT) and (avrd.date_a<=:DATE_A)');
  IB_kolvo_detali.ParamByName('ID_DETALI').Value:=id_detali;
  IB_kolvo_detali.ParamByName('ID_VIDRABOT').Value:=id_vidrabot;
  IB_kolvo_detali.ParamByName('DATE_A').Value:=date_check;
  IB_kolvo_detali.Open;


  //если этап=1 (распил), то колво берем только из "Актов распила" + "Приход"
  //"Акты выполн работ" не учитываем
  //IF (id_vidrabot=1) and  IsAkt_vip_rabot Then
  IF (id_vidrabot=1) Then
    detali_kolvo:=0
  ELSE
    detali_kolvo:=IB_kolvo_detali.fieldByName('detali_kolvo').AsInteger;

  //количество деталей на следующем этапе по актам выполн работ
  //Если текущий этап последний (сборка), то проверяем кол-во деталей по акту выпуска продукции
  //записи для проверки берем из Rashod_detali
  IB_vidy_rabot.Next;
  IB_kolvo_detali.Close;
  IB_kolvo_detali.ParamByName('ID_VIDRABOT').Value:=IB_vidy_rabot.FieldByName('id_vid_rabot').AsInteger;
  IB_kolvo_detali.Open;
  detali_kolvo_next_etap:=IB_kolvo_detali.fieldByName('detali_kolvo').AsInteger;
  //если это последний вид работ, то проверяем детали, ушедшие на сборку по "Актам готовой продукции"
  //данные для расчета берем из Rashod_detali
  IF IB_vidy_rabot.Eof Then
    begin
      IB_kolvo_detali.Close;
      IB_kolvo_detali.SQL.Clear;
      IB_kolvo_detali.SQL.Add('select sum(kol_vo) as detali_kolvo from rashod_detali');
      IB_kolvo_detali.SQL.Add('where (id_pilomat_detali='+IntToStr(id_detali)+') and (date_r<='+Chr(39)+date_check+Chr(39)+')');
      IB_kolvo_detali.Open;
      detali_kolvo_next_etap:=IB_kolvo_detali.fieldByName('detali_kolvo').AsInteger;
    end;//IF IB_vidy_rabot.Eof

  //Отнимаем количество деталей на текущем этапе СПИСАННЫХ со склада sklad_detali
  IB_kolvo_detali.Close;
  IB_kolvo_detali.SQL.Clear;
  IB_kolvo_detali.SQL.Add('select sum(kol_vo) as kolvo_spisanie from spisanie_0 as sp0, spisanie_detali as spd');
  IB_kolvo_detali.SQL.Add('where (sp0.id=spd.id_parent) and (sp0.date_spis<=:date_spis) and (spd.id_pilomat_detali=:id_detali) and (spd.id_vid_rabot=:id_vidrabot) and (sp0.id_sklad=:id_sklad_spis)');
  IB_kolvo_detali.ParamByName('date_spis').Value:=date_check;
  IB_kolvo_detali.ParamByName('id_detali').Value:=id_detali;
  IB_kolvo_detali.ParamByName('id_sklad_spis').Value:=sklad_detali;
  IB_kolvo_detali.ParamByName('id_vidrabot').Value:=id_vidrabot;
  IB_kolvo_detali.Open;
  detali_kolvo:=detali_kolvo-IB_kolvo_detali.FieldByName('kolvo_spisanie').AsInteger;

  //количество деталей на складе ЦЕХ, полученных для указанного этапа
  IB_kolvo_detali.Close;
  IB_kolvo_detali.SQL.Clear;
  IB_kolvo_detali.SQL.Add('select sum(prd1.kol_vo) as detali_kolvo from prihod_detali_0 as prd0, prihod_detali_1 as prd1');
  IB_kolvo_detali.SQL.Add('where (prd0.id=prd1.id_parent) and (prd1.id_pilomat_detali=:ID_DETALI) and (prd0.id_vid_rabot=:ID_VIDRABOT) and (prd0.date_p<=:DATE_P) and (prd0.id_sklad='+IntToStr(sklad_detali)+')');

  //если этап=1 и isAkt_vip_rabot=True, то в табл. прихода ищем записи, сформированные "Актом распила"
  IF (id_vidrabot=1) and IsAkt_vip_rabot Then
    IB_kolvo_detali.SQL.Add('and (prd0.id_akt_raspil is not null)');

  IB_kolvo_detali.ParamByName('ID_DETALI').Value:=id_detali;
  IB_kolvo_detali.ParamByName('ID_VIDRABOT').Value:=id_vidrabot;
  IB_kolvo_detali.ParamByName('DATE_P').Value:=date_check;
  IB_kolvo_detali.Open;
  detali_kolvo:=detali_kolvo+IB_kolvo_detali.FieldByName('DETALI_KOLVO').AsInteger;

  //Добавляем количество деталей на складе по ПЕРЕМЕЩЕНИЯМ на склад sklad_detali
  IB_kolvo_detali.Close;
  IB_kolvo_detali.SQL.Clear;
  IB_kolvo_detali.SQL.Add('select sum(kol_vo) as detali_prihod_peremesch from peremeschenie_detali as pd, peremeschenie_0 as p0');
  IB_kolvo_detali.SQL.Add('where (id_vid_rabot=:id_vidrabot) and (pd.id_parent=p0.id) and (p0.date_per<=:date_per) and (p0.id_sklad_kuda=:id_sklad_kuda) and (pd.id_pilomat_detali=:id_detali)');
  IB_kolvo_detali.ParamByName('date_per').Value:=date_check;
  IB_kolvo_detali.ParamByName('id_detali').Value:=id_detali;
  IB_kolvo_detali.ParamByName('id_sklad_kuda').Value:=sklad_detali;
  IB_kolvo_detali.ParamByName('id_vidrabot').Value:=id_vidrabot;
  IB_kolvo_detali.Open;
  detali_kolvo:=detali_kolvo+IB_kolvo_detali.FieldByName('detali_prihod_peremesch').AsInteger;
  //Отнимаем количество деталей на складе по ПЕРЕМЕЩЕНИЯМ со склада sklad_detali
  IB_kolvo_detali.Close;
  IB_kolvo_detali.SQL.Clear;
  IB_kolvo_detali.SQL.Add('select sum(kol_vo) as detali_rashod_peremesch from peremeschenie_detali as pd, peremeschenie_0 as p0');
  IB_kolvo_detali.SQL.Add('where (id_vid_rabot=:id_vidrabot) and (pd.id_parent=p0.id) and (p0.date_per<=:date_per) and (p0.id_sklad_otkuda=:id_sklad_otkuda) and (pd.id_pilomat_detali=:id_detali)');
  IB_kolvo_detali.ParamByName('date_per').Value:=date_check;
  IB_kolvo_detali.ParamByName('id_detali').Value:=id_detali;
  IB_kolvo_detali.ParamByName('id_sklad_otkuda').Value:=sklad_detali;
  IB_kolvo_detali.ParamByName('id_vidrabot').Value:=id_vidrabot;
  IB_kolvo_detali.Open;
  detali_kolvo:=detali_kolvo-IB_kolvo_detali.FieldByName('detali_rashod_peremesch').AsInteger;

  detali_kolvo:=detali_kolvo-detali_kolvo_next_etap;

  //Добавляем из таблицы остатков за предыдущий период OSTATOK_DETALI_VIDRABOT на складе SKLAD_DETALI
  //ищем ближайшую дату
  IB_kolvo_detali.Close;
  IB_kolvo_detali.SQL.Clear;
  IB_kolvo_detali.SQL.Add('select max(date_ost) as max_date from OSTATOK_DETALI_VIDRABOT where  date_ost<=:date_check');
  IB_kolvo_detali.ParamByName('date_check').Value:=date_check;
  IB_kolvo_detali.Open;
  IF not IB_kolvo_detali.FieldByName('max_date').IsNull Then //если есть данные в таблице
    begin
      date_check:=IB_kolvo_detali.FieldByName('max_date').AsString;
      //ищем если есть на найденную ближайшую дату данные по ДЕТАЛИ+ВИД_РАБОТ+sklad_detali
      IB_kolvo_detali.Close;
      IB_kolvo_detali.SQL.Clear;
      IB_kolvo_detali.SQL.Add('select kol_vo from OSTATOK_DETALI_VIDRABOT where (date_ost=:date_check) and (id_pilomat_detali=:id_detali) and (id_vid_rabot=:id_vidrabot) and (id_sklad=:id_sklad)');
      IB_kolvo_detali.ParamByName('date_check').Value:=date_check;
      IB_kolvo_detali.ParamByName('id_detali').Value:=id_detali;
      IB_kolvo_detali.ParamByName('id_vidrabot').Value:=id_vidrabot;
      IB_kolvo_detali.ParamByName('id_sklad').Value:=sklad_detali;
      IB_kolvo_detali.Open;
      detali_kolvo:=detali_kolvo+IB_kolvo_detali.FieldByName('kol_vo').AsInteger;
    end;//IF

  IB_vidy_rabot.Close;
  IB_kolvo_detali.Close;
  IB_vidy_rabot.Free;
  IB_kolvo_detali.Free;
  Result:=detali_kolvo;
end;//proc

//Функция возвращает количество деталей на этапе работ на определенном складе
function TF_Main.Kolvo_detali_na_etape_sklade(id_vidrabot: integer; id_detali: integer; id_sklad: integer; date_check: string):integer;
var
  IB_vidy_rabot: TIBQuery;
IB_kolvo_detali: TIBQuery;
   detali_kolvo: integer;
   detali_kolvo_next_etap: integer;
begin
  IB_vidy_rabot:=TIBQuery.Create(nil);
  IB_vidy_rabot.Database:=F_Main.IBQuery1.Database;
  IB_kolvo_detali:=TIBQuery.Create(nil);
  IB_kolvo_detali.Database:=F_Main.IBQuery1.Database;

  //Получаем список видов работ для детали
  IB_vidy_rabot.Close;
  IB_vidy_rabot.SQL.Clear;
  IB_vidy_rabot.SQL.Add('select pgvr.id_vid_rabot from pilomat_grupa_vidrabot as pgvr, pilomat_detali as pd');
  IB_vidy_rabot.SQL.Add('where (pd.id=:ID_DETALI) and (pd.id_grupa=pgvr.id_grupa)');
  IB_vidy_rabot.SQL.Add('order by 1');
  IB_vidy_rabot.ParamByName('ID_DETALI').Value:=ID_DETALI;
  IB_vidy_rabot.Open;

  //Для расчета реального кол-ва деталей необходимо от кол-ва деталей на текущем этапе+склад
  //отнять кол-во деталей на следующем этапе (т.е. перешедших на дальнейшую обработку)

  IB_kolvo_detali.SQL.Add('select sum (avrd.kol_vo) as detali_kolvo from akt_vip_rabot_detali as avrd');
  IB_kolvo_detali.SQL.Add('where (avrd.id_pilomat_detali=:ID_DETALI) and (avrd.id_vid_rabot=:ID_VIDRABOT) and (avrd.date_a<=:DATE_A)');
  IB_kolvo_detali.ParamByName('ID_DETALI').Value:=id_detali;
  IB_kolvo_detali.ParamByName('ID_VIDRABOT').Value:=id_vidrabot;
  IB_kolvo_detali.ParamByName('DATE_A').Value:=date_check;
  IB_kolvo_detali.Open;

  //если этап=1 (распил), то колво берем только из "Актов распила" + "Приход"
  //"Акты выполн работ" не учитываем
  //если просматриваем не СКЛАД ЦЕХ, куда попадают детали после распила и "Актов выполненных работ", то колво деталей =0  
  IF (id_vidrabot=1) or (id_sklad<>sklad_detali) Then
    detali_kolvo:=0
  ELSE
    detali_kolvo:=IB_kolvo_detali.fieldByName('detali_kolvo').AsInteger;

  //количество деталей на следующем этапе по актам выполн работ
  //Если текущий этап последний (сборка), то проверяем кол-во деталей по акту выпуска продукции
  //записи для проверки берем из Rashod_detali
  IB_vidy_rabot.Next;
  IB_kolvo_detali.Close;
  IB_kolvo_detali.ParamByName('ID_VIDRABOT').Value:=IB_vidy_rabot.FieldByName('id_vid_rabot').AsInteger;
  IB_kolvo_detali.Open;
  detali_kolvo_next_etap:=IB_kolvo_detali.fieldByName('detali_kolvo').AsInteger;
  //если это последний вид работ, то проверяем детали, ушедшие на сборку по "Актам готовой продукции"
  //данные для расчета берем из Rashod_detali
  IF IB_vidy_rabot.Eof Then
    begin
      IB_kolvo_detali.Close;
      IB_kolvo_detali.SQL.Clear;
      IB_kolvo_detali.SQL.Add('select sum(kol_vo) as detali_kolvo from rashod_detali');
      IB_kolvo_detali.SQL.Add('where (id_pilomat_detali='+IntToStr(id_detali)+') and (date_r<='+Chr(39)+date_check+Chr(39)+')');
      IB_kolvo_detali.Open;
      detali_kolvo_next_etap:=IB_kolvo_detali.fieldByName('detali_kolvo').AsInteger;
    end;//IF IB_vidy_rabot.Eof

  IF id_sklad<>sklad_detali Then
    detali_kolvo_next_etap:=0;

  //Отнимаем количество деталей на текущем этапе СПИСАННЫХ со склада id_sklad
  IB_kolvo_detali.Close;
  IB_kolvo_detali.SQL.Clear;
  IB_kolvo_detali.SQL.Add('select sum(kol_vo) as kolvo_spisanie from spisanie_0 as sp0, spisanie_detali as spd');
  IB_kolvo_detali.SQL.Add('where (sp0.id=spd.id_parent) and (sp0.date_spis<=:date_spis) and (spd.id_pilomat_detali=:id_detali) and (spd.id_vid_rabot=:id_vidrabot) and (sp0.id_sklad=:id_sklad_spis)');
  IB_kolvo_detali.ParamByName('date_spis').Value:=date_check;
  IB_kolvo_detali.ParamByName('id_detali').Value:=id_detali;
  IB_kolvo_detali.ParamByName('id_sklad_spis').Value:=id_sklad;
  IB_kolvo_detali.ParamByName('id_vidrabot').Value:=id_vidrabot;
  IB_kolvo_detali.Open;
  detali_kolvo:=detali_kolvo-IB_kolvo_detali.FieldByName('kolvo_spisanie').AsInteger;

  //количество деталей на складе, полученных для указанного этапа
  IB_kolvo_detali.Close;
  IB_kolvo_detali.SQL.Clear;
  IB_kolvo_detali.SQL.Add('select sum(prd1.kol_vo) as detali_kolvo from prihod_detali_0 as prd0, prihod_detali_1 as prd1');
  IB_kolvo_detali.SQL.Add('where (prd0.id=prd1.id_parent) and (prd1.id_pilomat_detali=:ID_DETALI) and (prd0.id_vid_rabot=:ID_VIDRABOT) and (prd0.date_p<=:DATE_P) and (prd0.id_sklad='+IntToStr(id_sklad)+')');
  IB_kolvo_detali.ParamByName('ID_DETALI').Value:=id_detali;
  IB_kolvo_detali.ParamByName('ID_VIDRABOT').Value:=id_vidrabot;
  IB_kolvo_detali.ParamByName('DATE_P').Value:=date_check;
  IB_kolvo_detali.Open;
  detali_kolvo:=detali_kolvo+IB_kolvo_detali.FieldByName('DETALI_KOLVO').AsInteger;

  //Добавляем количество деталей на складе по ПЕРЕМЕЩЕНИЯМ на склад id_sklad
  IB_kolvo_detali.Close;
  IB_kolvo_detali.SQL.Clear;
  IB_kolvo_detali.SQL.Add('select sum(kol_vo) as detali_prihod_peremesch from peremeschenie_detali as pd, peremeschenie_0 as p0');
  IB_kolvo_detali.SQL.Add('where (id_vid_rabot=:id_vidrabot) and (pd.id_parent=p0.id) and (p0.date_per<=:date_per) and (p0.id_sklad_kuda=:id_sklad_kuda) and (pd.id_pilomat_detali=:id_detali)');
  IB_kolvo_detali.ParamByName('date_per').Value:=date_check;
  IB_kolvo_detali.ParamByName('id_detali').Value:=id_detali;
  IB_kolvo_detali.ParamByName('id_sklad_kuda').Value:=id_sklad;
  IB_kolvo_detali.ParamByName('id_vidrabot').Value:=id_vidrabot;
  IB_kolvo_detali.Open;
  detali_kolvo:=detali_kolvo+IB_kolvo_detali.FieldByName('detali_prihod_peremesch').AsInteger;

  //Отнимаем количество деталей на складе по ПЕРЕМЕЩЕНИЯМ со склада id_sklad
  IB_kolvo_detali.Close;
  IB_kolvo_detali.SQL.Clear;
  IB_kolvo_detali.SQL.Add('select sum(kol_vo) as detali_rashod_peremesch from peremeschenie_detali as pd, peremeschenie_0 as p0');
  IB_kolvo_detali.SQL.Add('where (id_vid_rabot=:id_vidrabot) and (pd.id_parent=p0.id) and (p0.date_per<=:date_per) and (p0.id_sklad_otkuda=:id_sklad_otkuda) and (pd.id_pilomat_detali=:id_detali)');
  IB_kolvo_detali.ParamByName('date_per').Value:=date_check;
  IB_kolvo_detali.ParamByName('id_detali').Value:=id_detali;
  IB_kolvo_detali.ParamByName('id_sklad_otkuda').Value:=id_sklad;
  IB_kolvo_detali.ParamByName('id_vidrabot').Value:=id_vidrabot;
  IB_kolvo_detali.Open;

  detali_kolvo:=detali_kolvo-IB_kolvo_detali.FieldByName('detali_rashod_peremesch').AsInteger;

  detali_kolvo:=detali_kolvo-detali_kolvo_next_etap;

  //Добавляем из таблицы остатков за предыдущий период OSTATOK_DETALI_VIDRABOT на указанном складе
  //ищем ближайшую дату
  IB_kolvo_detali.Close;
  IB_kolvo_detali.SQL.Clear;
  IB_kolvo_detali.SQL.Add('select max(date_ost) as max_date from OSTATOK_DETALI_VIDRABOT where  date_ost<=:date_check');
  IB_kolvo_detali.ParamByName('date_check').Value:=date_check;
  IB_kolvo_detali.Open;
  IF not IB_kolvo_detali.FieldByName('max_date').IsNull Then //если есть данные в таблице
    begin
      date_check:=IB_kolvo_detali.FieldByName('max_date').AsString;
      //ищем если есть на найденную ближайшую дату данные по ДЕТАЛИ+ВИД_РАБОТ+sklad_detali
      IB_kolvo_detali.Close;
      IB_kolvo_detali.SQL.Clear;
      IB_kolvo_detali.SQL.Add('select kol_vo from OSTATOK_DETALI_VIDRABOT where (date_ost=:date_check) and (id_pilomat_detali=:id_detali) and (id_vid_rabot=:id_vidrabot) and (id_sklad=:id_sklad)');
      IB_kolvo_detali.ParamByName('date_check').Value:=date_check;
      IB_kolvo_detali.ParamByName('id_detali').Value:=id_detali;
      IB_kolvo_detali.ParamByName('id_vidrabot').Value:=id_vidrabot;
      IB_kolvo_detali.ParamByName('id_sklad').Value:=id_sklad;
      IB_kolvo_detali.Open;
      detali_kolvo:=detali_kolvo+IB_kolvo_detali.FieldByName('kol_vo').AsInteger;
    end;//IF

  IB_vidy_rabot.Close;
  IB_kolvo_detali.Close;
  IB_vidy_rabot.Free;
  IB_kolvo_detali.Free;
  Result:=detali_kolvo;
end;//proc


//Функция возвращает количество деталей на складе
function TF_Main.Kolvo_detali_sklad(id_detali: integer; date_check: TDateTime; id_sklad: integer):integer;
var
IB_kolvo_detali: TIBQuery;
begin
  IB_kolvo_detali:=TIBQuery.Create(nil);
  IB_kolvo_detali.Database:=F_Main.IBQuery1.Database;
  IB_kolvo_detali.Close;
  IB_kolvo_detali.SQL.Clear;
  IB_kolvo_detali.SQL.Add('select DETALI_OSTATOK from DETALI_OSTATOK(:id_pilomat_detali,:id_sklad,:date_ostatok)');
  IB_kolvo_detali.ParamByName('date_ostatok').Value:=Today;
  IB_kolvo_detali.ParamByName('id_pilomat_detali').Value:=id_detali;
  IB_kolvo_detali.ParamByName('id_sklad').Value:=id_sklad;
  IB_kolvo_detali.Open;
  Result:=IB_kolvo_detali.FieldByName('DETALI_OSTATOK').AsInteger;
  IB_kolvo_detali.Close;
  IB_kolvo_detali.Free;
end;//proc

//Количество листов на складе на указанную дату
Function TF_Main.Kolvo_listov_na_sklade(id_pilomat_listy: integer; date_check: TDateTime; id_sklad: integer):integer;
begin
  //количество листов на складе по ПРИХОДУ
  F_Main.IBQuery1.Close;
  F_Main.IBQuery1.SQL.Clear;
  F_Main.IBQuery1.SQL.Add('select * from OSTATOK_LIST(:id_pilomat_listy,:id_sklad,:period_end)');
  F_Main.IBQuery1.ParamByName('id_pilomat_listy').Value:=id_pilomat_listy;
  F_Main.IBQuery1.ParamByName('id_sklad').Value:=id_sklad;
  F_Main.IBQuery1.ParamByName('period_end').Value:=Today;
  F_Main.IBQuery1.Open;
  Result:=F_Main.IBQuery1.FieldByName('list_ostatok').AsInteger;
end;//proc

//Количество комплектующих на складе на указанную дату
Function TF_Main.Kolvo_furnitury_na_sklade(id_furnitura: integer; date_check: TDateTime; id_sklad: integer): double;
begin
  IBQuery1.Close;
  IBQuery1.SQL.Clear;
  IBQuery1.SQL.Add('select FURNITURA_OSTATOK from FURNITURA_OSTATOK(:id_furnitura, :id_sklad, :period_end)');
  IBQuery1.ParamByName('id_furnitura').Value:=id_furnitura;
  IBQuery1.ParamByName('id_sklad').Value:=id_sklad;
  IBQuery1.ParamByName('period_end').Value:=Today;
  IBQuery1.Open;
  Result:=F_Main.IBQuery1.fieldByName('FURNITURA_OSTATOK').AsFloat;
end;//proc

procedure TF_Main.ErrorHandle(Sender: TObject; E: Exception);
begin
  IF Pos ('Unable to complete network request',E.Message)>0 Then
    begin
      IF MessageDlg('Потеряно соединение с Базой Данных, повторить попытку подключения?',mtConfirmation, [mbYes, mbNo], 0)=mrNo then
        Application.Terminate;
      DM_Mebeli.DB_Mebeli.Close;
      DM_Mebeli.DB_Mebeli.Open;
    end;

  IF Pos ('trigger',E.Message)>0 Then
    dm_mebeli.trigger_error(e.Message)
  else
    IF Pos ('UNIQUE',E.Message)>0 Then
      ShowMessage('Такая позиция уже введена в этот документ')
    else
      ShowMessage(e.Message);
end;

//Ловим сообщения о скролинге колеса мышки
//что дает возможность скролировать колесом и в DBGrid
procedure TF_Main.MouseWheel (var Msg: TMsg; var Handled: Boolean) ;
var
 n: integer;
begin
 if Msg.message = WM_MOUSEWHEEL then
 begin
  Msg.message := WM_KEYDOWN;
  Msg.lParam := 0;
  n := Msg.wParam shr 16;
  if n*sign(Msg.wParam) > 0 then
   Msg.wParam := VK_UP
  else
   Msg.wParam := VK_DOWN;
  Handled := False;
 end;
end;//proc

procedure TF_Main.N_ExitClick(Sender: TObject);
begin
  Close;
end;//proc

procedure reopen_tables;
begin
  DM_Mebeli.IB_Zakaz_0.Close;
  F_Main.F_IB_Zakaz_1.Close;

  DM_Mebeli.IB_Zakaz_0.Open;
  F_Main.F_IB_Zakaz_1.Open;
  DM_Mebeli.IB_Zakaz_0.Locate('id',id_zakaz,[]);
end;//proc

procedure TF_Main.FormCreate(Sender: TObject);
begin
  Application.OnMessage := MouseWheel;
  Application.onException := ErrorHandle;
  IF ParamCount>0 Then
    IF ParamStr(1)[2]=':' Then
      mebeli_INI:=TIniFile.Create(ParamStr(1))
    ELSE
      mebeli_INI:=TIniFile.Create(ExtractFileDir(Application.ExeName)+'\'+ParamStr(1))
  ELSE
    mebeli_INI := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\mebeli.ini');
  F_Main.AdjustResolution(F_Main);    
end;//proc

function TF_Main.VolumeID:dword;
var
  DriveChar: Char;
  NotUsed, VolFlags: DWORD;
  Buf: array [0..500] of Char;
  lpVolumeSerialNumber:pdword;
begin
  DriveChar:='C';
  New(lpVolumeSerialNumber);
  Buf[0] := #$00;
  Result:=$1f0123fd;
  IF GetVolumeInformation(PChar(DriveChar + ':\'), Buf, DWORD(sizeof(Buf)),
    lpVolumeSerialNumber, NotUsed, VolFlags, nil, 0) then
       Result:=lpVolumeSerialNumber^;
end;//function

procedure TF_Main.FormActivate(Sender: TObject);
var     db_path: string;
 db_images_path: string;
        db_user: string[100];
   db_user_pass: string[50];
  db_ServerName: string[200];
begin
  Is_post_error:=false;
  IF Tag=1 Then exit;
  DataZapretaRedakt:=IncDay(Date,-10);
  select_date_start:=IncDay(Date,-720);
//  EXLReport1.Template:=ExtractFilePath(Application.ExeName)+'report.xls';
  Tag:=1;
  DateSeparator := '.';
  ShortDateFormat := 'dd.mm.yyyy';
  LongDateFormat := 'dd.mm.yyyy';
  Try
    IMG_logo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'liniah2o_logo.bmp');
  Except;
  end;

  //устанавливаем переменные номеров складов
  sklad_listy:=1;
  sklad_detali:=3;
  sklad_gotprod:=2;
  db_path:=mebeli_INI.ReadString('DATABASE', 'path','NONE');
  IF (db_path='NONE') or (db_path='') Then
    begin
      ShowMessage('Не указан путь к Базе Данных!');
      exit;
    end;

  db_servername:=mebeli_INI.ReadString('DATABASE', 'servername','localhost');
  db_images_path:=db_servername+':'+ExtractFilePath(db_path)+'mebeli_images.fdb';
  L_Database.Caption:='    DB: '+UpperCase(ExtractFileName(db_path));
  db_path:=db_servername+':'+db_path;

  db_user:=mebeli_INI.ReadString('DATABASE', 'user','NONE');
  db_user_pass:=mebeli_INI.ReadString('DATABASE', 'password','NONE');
  //Если в INI файле нет информации о пользователе и пароле, то получаем ее от пользователя
  IF (db_user='NONE') or (db_user='') Then
    IF F_Password.ShowModal=mrAbort Then
       begin
         close;
         exit;
       end//if F_Password
    ELSE  //IF F_Password.ShowModal=mrAbort
      begin
        db_user:=F_Password.E_User_Name.Text;
        db_user_pass:=F_Password.E_Password.Text;
      end;//ELSE

  With DM_Mebeli do
    begin
      DB_Mebeli.Close;
      DB_Mebeli.Params.Clear;
      DB_Mebeli.DatabaseName:=db_path;
      DB_Mebeli.Params.Add('user_name='+db_user);
      DB_Mebeli.Params.Add('password='+db_user_pass);
      DB_Mebeli.Params.Add('lc_ctype=WIN1251');
      Try
        DB_Mebeli.Open;
      Except on EDatabaseError Do
         begin
           MessageDlg('Имя пользователя или пароль неверны!',mtError,[mbAbort],0);
           Application.Terminate;
         end;//except
       end;//Try


      IBQuery1.SQl.Clear;
      IBQuery1.SQl.Add('select * from RDB$USER_PRIVILEGES where rdb$user='''+db_user+''' and rdb$object_type=13');
      IBQuery1.Open;
      Role_name:=Trim( UpperCase(IBQuery1.FieldByName('RDB$RELATION_NAME').AsString) );
      L_Role.Caption:='role: '+Role_name;
      L_user.Caption:='user: '+db_user;
      L_Server.Caption:=  'server: '+UpperCase(db_servername);

      DB_Images.Close;
      DB_Images.Params.Clear;
      DB_Images.DatabaseName:=db_images_path;
      DB_Images.Params.Add('user_name='+db_user);
      DB_Images.Params.Add('password='+db_user_pass);
      DB_Images.Params.Add('lc_ctype=WIN1251');
      DB_Images.Params.Add('sql_role_name='+Role_name);
      DB_Images.Open;

      DB_Mebeli.Close;
      DB_Mebeli.Params.Add('sql_role_name='+Role_name);
      DB_Mebeli.Open;
      IB_Zakaz_0.Open;
      F_IB_Zakaz_1.Open;
      IB_Zakaz_0.Last;
      IB_Vidy_rabot.Open;
      IB_Vidy_rabot.Last;
      Last_vid_rabot:=IB_Vidy_rabot.FieldByName('ID').AsInteger;

      //check Users access rights
      if role_name='DEPOZITAR' then
        begin
          MainMenu1.Items[0].Enabled:=false;
          MainMenu1.Items[1].Enabled:=false;
          MainMenu1.Items[2].Enabled:=false;
          MainMenu1.Items[3].Enabled:=false;
          MainMenu1.Items[4].Enabled:=false;
          MainMenu1.Items[6].Enabled:=false;
          MainMenu1.Items[7].Enabled:=false;
        end;


    end;//With DM_Mebeli
end;//proc

procedure TF_Main.N_SotrudnikClick(Sender: TObject);
begin
  F_Sotrudniki.ShowModal;
end;

procedure TF_Main.N_SkladClick(Sender: TObject);
begin
  F_Sklad.ShowModal;
  reopen_tables;
end;//proc

procedure TF_Main.N_Vid_rabotClick(Sender: TObject);
begin
  F_Vidy_rabot.ShowModal;
end;//proc

procedure TF_Main.B_ExitClick(Sender: TObject);
begin
  Close;
end;//proc

procedure TF_Main.N_PilomatClick(Sender: TObject);
begin
  id_zakaz:=DM_Mebeli.IB_Zakaz_0.FieldByName('id').AsInteger;
  operation:='';
  F_Pilomat.ShowModal;
  reopen_tables;
end;//proc

procedure TF_Main.N_FurnituraClick(Sender: TObject);
begin
  id_zakaz:=DM_Mebeli.IB_Zakaz_0.FieldByName('id').AsInteger;
  operation:='';
  F_Furnitura.ShowModal;
  reopen_tables;
end;//proc

procedure TF_Main.N_Gotov_prodClick(Sender: TObject);
begin
  operation:='';
  F_Gotov_prod.ShowModal;
  reopen_tables;
end;//proc

procedure TF_Main.N_New_ZakazClick(Sender: TObject);
begin
  id_zakaz:=DM_Mebeli.IB_Zakaz_0.FieldByName('id').AsInteger;
  operation:='INSERT';
  F_Zakaz_edit.ShowModal;
  reopen_tables;
end;//proc

procedure TF_Main.N_Edit_ZakazClick(Sender: TObject);
begin
  id_zakaz:=DM_Mebeli.IB_Zakaz_0.FieldByName('id').AsInteger;
  operation:='EDIT';
  F_Zakaz_edit.ShowModal;
  reopen_tables;
end;//proc

procedure TF_Main.N_Delete_ZakazClick(Sender: TObject);
begin
  IF MessageDlg('Вы уверены, что хотите удалить заказ?',mtWarning,[mbOk,mbNo],0)=mrOk Then
     begin
        DM_Mebeli.IB_Zakaz_0.Delete;
        DM_Mebeli.IBTransaction1.Commit;
        reopen_tables;
     end;
end;//proc

procedure TF_Main.N_Akt_raspilClick(Sender: TObject);
begin
  F_Akt_raspil_jurnal.ShowModal;
  reopen_tables;
end;//proc

procedure TF_Main.N_Akt_vip_rabotClick(Sender: TObject);
begin
  F_Akt_vip_rabot_jurnal.ShowModal;
  reopen_tables;
end;//proc

procedure TF_Main.N_prihod_detaliClick(Sender: TObject);
begin
  F_Prihod_detali_jurnal.ShowModal;
  reopen_tables;
end;//proc

procedure TF_Main.N_Akt_vipusk_prodClick(Sender: TObject);
begin
  F_Akt_vip_prod_jurnal.ShowModal;
  reopen_tables;
end;//proc

procedure TF_Main.N_prihod_listyClick(Sender: TObject);
begin
  F_Prihod_listy_jurnal.ShowModal;
  reopen_tables;
end;//proc

procedure TF_Main.N_prihod_furnituraClick(Sender: TObject);
begin
  F_Prihod_furnitura_jurnal.ShowModal;
  reopen_tables;
end;//proc

procedure TF_Main.N2Click(Sender: TObject);
begin
  F_About.ShowModal;
end;//proc

procedure TF_Main.N_Akt_spisaniaClick(Sender: TObject);
begin
  F_Spisanie_jurnal.ShowModal;
  reopen_tables;
end;//proc

procedure TF_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IF DM_Mebeli.IBTransaction1.Active Then
    DM_Mebeli.IBTransaction1.Commit;
end;//proc

procedure TF_Main.N_Gotov_prod_categoriesClick(Sender: TObject);
begin
  F_Gotov_prod_categories.ShowModal;
  reopen_tables;
end;

procedure TF_Main.N_Zakazy_viewClick(Sender: TObject);
begin
  DM_Mebeli.IB_Zakaz_0.Open;
  F_IB_Zakaz_1.Open;
  DM_Mebeli.IB_Zakaz_0.Last;
end;//proc

procedure TF_Main.N_ContragentyClick(Sender: TObject);
begin
  F_Contragenty.ShowModal;
  reopen_tables;
end;//proc

procedure TF_Main.N_ProdajaClick(Sender: TObject);
begin
  F_Prodaja_jurnal.ShowModal;
  reopen_tables;
end;//proc

procedure TF_Main.N_ConstantyClick(Sender: TObject);
begin
  F_Constanty.ShowModal;
  reopen_tables;
end;

procedure TF_Main.N_Statyi_RashodaClick(Sender: TObject);
begin
  F_Statyi_Rashoda.ShowModal;
end;

procedure TF_Main.N_Manage_signsClick(Sender: TObject);
begin
  F_Signs_Management.ShowModal;
end;

procedure TF_Main.N_BankClick(Sender: TObject);
begin
  F_Bank_Jurnal.ShowModal;
end;

procedure TF_Main.N_Statyi_DohodaClick(Sender: TObject);
begin
  F_Statyi_Dohoda.ShowModal;
end;

procedure TF_Main.N_PeremescheniaClick(Sender: TObject);
begin
  F_Peremeschenie_jurnal.ShowModal;
  reopen_tables;
end;

procedure TF_Main.N_KassaClick(Sender: TObject);
begin
  F_Cassa_Jurnal.ShowModal;
end;

procedure TF_Main.N_RemontClick(Sender: TObject);
begin
  F_Remont_jurnal.ShowModal;
end;

procedure TF_Main.N_LavoareClick(Sender: TObject);
begin
  id_zakaz:=DM_Mebeli.IB_Zakaz_0.FieldByName('id').AsInteger;
  operation:='';
  F_Lavoare_list.ShowModal;
  reopen_tables;
end;

procedure TF_Main.N_ReviziiClick(Sender: TObject);
begin
  F_Revizii_jurnal.ShowModal;
end;

procedure TF_Main.N_Calculation_SebestClick(Sender: TObject);
begin
  id_zakaz:=DM_Mebeli.IB_Zakaz_0.FieldByname('id').AsInteger;
  F_Calc_sebestoimosti.ShowModal;
  reopen_tables;
end;

procedure TF_Main.N_Ostatok_furnituraClick(Sender: TObject);
begin
  id_zakaz:=DM_Mebeli.IB_Zakaz_0.FieldByname('id').AsInteger;
  F_Ostatok_furnitura.ShowModal;
  reopen_tables;
end;

procedure TF_Main.N_Ostatok_listyClick(Sender: TObject);
begin
  id_zakaz:=DM_Mebeli.IB_Zakaz_0.FieldByname('id').AsInteger;
  F_Ostatok_listy.ShowModal;
  reopen_tables;
end;

procedure TF_Main.N_Ostatok_detaliClick(Sender: TObject);
begin
  id_zakaz:=DM_Mebeli.IB_Zakaz_0.FieldByname('id').AsInteger;
  F_Ostatok_detali.ShowModal;
  reopen_tables;
end;

procedure TF_Main.N_PrihodClick(Sender: TObject);
begin
F_Pilomat.E_Grupa_Search.Text:='Отфильтровать группу';
F_Pilomat.E_Listy_Search.Text:='Отфильтровать листы';
F_Pilomat.E_Detali_Search.Text:='Отфильтровать детали';
end;

procedure TF_Main.N14Click(Sender: TObject);
begin
  if Role_name<>'ADMIN' then
    F_Main.N14.Enabled:=false;
end;

procedure TF_Main.N_Akt_raspil_detaliClick(Sender: TObject);
var
        s : string;
     Excel: Variant;
         j: Integer;
 FIB_Query: TIBDataSet;
 OpenDialog1: TOpenDialog;
begin
  OpenDialog1:=TOpenDialog.Create(nil);
  FIB_Query:=TIBDataSet.Create(nil);
  FIB_Query.Database:=DM_Mebeli.DB_Mebeli;

  FIB_Query.SelectSQL.Clear;
  FIB_Query.SelectSQL.Add('update akt_raspil_detali_0 set id_detali_new=:new_id_detali where id_pilomat_detali= :old_id_detali');

  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Rollback;
  DM_Mebeli.IBTransaction1.StartTransaction;
  Excel:=CreateOleObject('Excel.Application');
  OpenDialog1.Filter:='Excel files  |*.XLS;*.XLSX';
  if not OpenDialog1.Execute then exit;
  Excel.Application.WorkBooks.Open(OpenDialog1.FileName,0,true);
  j:=2;
  while Excel.Cells[j, 1].Text<>'' do
    begin
      s:=Excel.Cells[j, 1];
      FIB_Query.ParamByName('old_id_detali').Value:=s;
      s:=Excel.Cells[j, 2];
      FIB_Query.ParamByName('new_id_detali').Value:=s;
      FIB_Query.ExecSQL;
      Application.ProcessMessages;
      Inc(j);
    end;

  DM_Mebeli.IBTransaction1.Commit;
  ShowMessage('Imported '+IntToStr(j)+' rows');
  FIB_Query.Free;
  OpenDialog1.free;

  Excel.Quit;
  Excel:=Unassigned;
  reopen_tables;
end;

procedure TF_Main.N15Click(Sender: TObject);
var
        s : string;
     Excel: Variant;
         j: Integer;
 FIB_Query: TIBDataSet;
 OpenDialog1: TOpenDialog;
begin
  OpenDialog1:=TOpenDialog.Create(nil);
  FIB_Query:=TIBDataSet.Create(nil);
  FIB_Query.Database:=DM_Mebeli.DB_Mebeli;

  FIB_Query.SelectSQL.Clear;
  FIB_Query.SelectSQL.Add('update AKT_VIP_RABOT_1_0 set ID_GOTOVPROD_NEW=:ID_GOTOV_PROD where ID_GOTOV_PROD=:OLD_ID_GOTOV_PROD');

  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Rollback;
  DM_Mebeli.IBTransaction1.StartTransaction;
  Excel:=CreateOleObject('Excel.Application');
  OpenDialog1.Filter:='Excel files  |*.XLS;*.XLSX';
  if not OpenDialog1.Execute then exit;
  Excel.Application.WorkBooks.Open(OpenDialog1.FileName,0,true);
  j:=2;
  while Excel.Cells[j, 1].Text<>'' do
    begin
      s:=Excel.Cells[j, 1];
      FIB_Query.ParamByName('OLD_ID_GOTOV_PROD').Value:=s;
      s:=Excel.Cells[j, 2];
      FIB_Query.ParamByName('ID_GOTOV_PROD').Value:=s;
      FIB_Query.ExecSQL;
      Application.ProcessMessages;
      Inc(j);
    end;

  DM_Mebeli.IBTransaction1.Commit;
  ShowMessage('Imported '+IntToStr(j)+' rows');
  FIB_Query.Free;
  OpenDialog1.free;

  Excel.Quit;
  Excel:=Unassigned;
  reopen_tables;
end;

procedure TF_Main.N17Click(Sender: TObject);
var
        s : string;
     Excel: Variant;
         j: Integer;
 FIB_Query: TIBDataSet;
 OpenDialog1: TOpenDialog;
begin
  OpenDialog1:=TOpenDialog.Create(nil);
  FIB_Query:=TIBDataSet.Create(nil);
  FIB_Query.Database:=DM_Mebeli.DB_Mebeli;

  FIB_Query.SelectSQL.Clear;
  FIB_Query.SelectSQL.Add('update furnitura set article=:article where id= :id_furnitura');

  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Rollback;
  DM_Mebeli.IBTransaction1.StartTransaction;
  Excel:=CreateOleObject('Excel.Application');
  OpenDialog1.Filter:='Excel files  |*.XLS;*.XLSX';
  if not OpenDialog1.Execute then exit;
  Excel.Application.WorkBooks.Open(OpenDialog1.FileName,0,true);
  j:=2;
  while Excel.Cells[j, 1].Text<>'' do
    begin
      s:=Excel.Cells[j, 1];
      FIB_Query.ParamByName('article').Value:=s;
      s:=Excel.Cells[j, 2];
      FIB_Query.ParamByName('id_furnitura').Value:=s;
      FIB_Query.ExecSQL;
      Application.ProcessMessages;
      Inc(j);
    end;

  DM_Mebeli.IBTransaction1.Commit;
  ShowMessage('Imported '+IntToStr(j)+' rows');
  FIB_Query.Free;
  OpenDialog1.free;

  Excel.Quit;
  Excel:=Unassigned;
  reopen_tables;
end;

procedure TF_Main.N18Click(Sender: TObject);
var
        s : string;
     Excel: Variant;
         j: Integer;
 FIB_Query: TIBDataSet;
 OpenDialog1: TOpenDialog;
begin
  OpenDialog1:=TOpenDialog.Create(nil);
  FIB_Query:=TIBDataSet.Create(nil);
  FIB_Query.Database:=DM_Mebeli.DB_Mebeli;

  FIB_Query.SelectSQL.Clear;
  FIB_Query.SelectSQL.Add('update zakaz_1_0 set ID_GOTOVPROD_NEW=:ID_GOTOV_PROD where ID_GOTOV_PROD=:OLD_ID_GOTOV_PROD');

  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Rollback;
  DM_Mebeli.IBTransaction1.StartTransaction;
  Excel:=CreateOleObject('Excel.Application');
  OpenDialog1.Filter:='Excel files  |*.XLS;*.XLSX';
  if not OpenDialog1.Execute then exit;
  Excel.Application.WorkBooks.Open(OpenDialog1.FileName,0,true);
  j:=2;
  while Excel.Cells[j, 1].Text<>'' do
    begin
      s:=Excel.Cells[j, 1];
      FIB_Query.ParamByName('OLD_ID_GOTOV_PROD').Value:=s;
      s:=Excel.Cells[j, 2];
      FIB_Query.ParamByName('ID_GOTOV_PROD').Value:=s;
      FIB_Query.ExecSQL;
      Application.ProcessMessages;
      Inc(j);
    end;

  DM_Mebeli.IBTransaction1.Commit;
  ShowMessage('Imported '+IntToStr(j)+' rows');
  FIB_Query.Free;
  OpenDialog1.free;

  Excel.Quit;
  Excel:=Unassigned;
  reopen_tables;
end;

procedure TF_Main.N16Click(Sender: TObject);
var
        s : string;
     Excel: Variant;
         j: Integer;
 FIB_Query: TIBDataSet;
 OpenDialog1: TOpenDialog;
begin
  OpenDialog1:=TOpenDialog.Create(nil);
  FIB_Query:=TIBDataSet.Create(nil);
  FIB_Query.Database:=DM_Mebeli.DB_Mebeli;

  FIB_Query.SelectSQL.Clear;
  FIB_Query.SelectSQL.Add('update AKT_VIP_PROD_1_0 set ID_GOTOVPROD_NEW=:ID_GOTOV_PROD where ID_GOTOV_PROD=:OLD_ID_GOTOV_PROD');

  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Rollback;
  DM_Mebeli.IBTransaction1.StartTransaction;
  Excel:=CreateOleObject('Excel.Application');
  OpenDialog1.Filter:='Excel files  |*.XLS;*.XLSX';
  if not OpenDialog1.Execute then exit;
  Excel.Application.WorkBooks.Open(OpenDialog1.FileName,0,true);
  j:=2;
  while Excel.Cells[j, 1].Text<>'' do
    begin
      s:=Excel.Cells[j, 1];
      FIB_Query.ParamByName('OLD_ID_GOTOV_PROD').Value:=s;
      s:=Excel.Cells[j, 2];
      FIB_Query.ParamByName('ID_GOTOV_PROD').Value:=s;
      FIB_Query.ExecSQL;
      Application.ProcessMessages;
      Inc(j);
    end;

  DM_Mebeli.IBTransaction1.Commit;
  ShowMessage('Imported '+IntToStr(j)+' rows');
  FIB_Query.Free;
  OpenDialog1.free;

  Excel.Quit;
  Excel:=Unassigned;
  reopen_tables;
end;

procedure TF_Main.N19Click(Sender: TObject);
var
        s : string;
     Excel: Variant;
         j: Integer;
 FIB_Query: TIBDataSet;
 OpenDialog1: TOpenDialog;
begin
  OpenDialog1:=TOpenDialog.Create(nil);
  FIB_Query:=TIBDataSet.Create(nil);
  FIB_Query.Database:=DM_Mebeli.DB_Mebeli;

  FIB_Query.SelectSQL.Clear;
  FIB_Query.SelectSQL.Add('update RASHOD_DETALI_0 set id_detali_new=:new_id_detali where id_pilomat_detali= :old_id_detali');

  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Rollback;
  DM_Mebeli.IBTransaction1.StartTransaction;
  Excel:=CreateOleObject('Excel.Application');
  OpenDialog1.Filter:='Excel files  |*.XLS;*.XLSX';
  if not OpenDialog1.Execute then exit;
  Excel.Application.WorkBooks.Open(OpenDialog1.FileName,0,true);
  j:=2;
  while Excel.Cells[j, 1].Text<>'' do
    begin
      s:=Excel.Cells[j, 1];
      FIB_Query.ParamByName('old_id_detali').Value:=s;
      s:=Excel.Cells[j, 2];
      FIB_Query.ParamByName('new_id_detali').Value:=s;
      FIB_Query.ExecSQL;
      Application.ProcessMessages;
      Inc(j);
    end;

  DM_Mebeli.IBTransaction1.Commit;
  ShowMessage('Imported '+IntToStr(j)+' rows');
  FIB_Query.Free;
  OpenDialog1.free;

  Excel.Quit;
  Excel:=Unassigned;
  reopen_tables;
end;

procedure TF_Main.N_Spsanie_detali_zamenaClick(Sender: TObject);
var
        s : string;
     Excel: Variant;
         j: Integer;
 FIB_Query: TIBDataSet;
 OpenDialog1: TOpenDialog;
begin
  OpenDialog1:=TOpenDialog.Create(nil);
  FIB_Query:=TIBDataSet.Create(nil);
  FIB_Query.Database:=DM_Mebeli.DB_Mebeli;

  FIB_Query.SelectSQL.Clear;
  FIB_Query.SelectSQL.Add('update SPISANIE_DETALI_0 set id_detali_new=:new_id_detali where id_pilomat_detali=:old_id_detali');

  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Rollback;
  DM_Mebeli.IBTransaction1.StartTransaction;
  Excel:=CreateOleObject('Excel.Application');
  OpenDialog1.Filter:='Excel files  |*.XLS;*.XLSX';
  if not OpenDialog1.Execute then exit;
  Excel.Application.WorkBooks.Open(OpenDialog1.FileName,0,true);
  j:=2;
  while Excel.Cells[j, 1].Text<>'' do
    begin
      s:=Excel.Cells[j, 1];
      FIB_Query.ParamByName('old_id_detali').Value:=s;
      s:=Excel.Cells[j, 2];
      FIB_Query.ParamByName('new_id_detali').Value:=s;
      ShowMessage('Old='+FIB_Query.ParamByName('old_id_detali').AsString+', new='+FIB_Query.ParamByName('new_id_detali').AsString);
      FIB_Query.ExecSQL;
      Application.ProcessMessages;
      Inc(j);
    end;

  DM_Mebeli.IBTransaction1.Commit;
  ShowMessage('Imported '+IntToStr(j)+' rows');
  FIB_Query.Free;
  OpenDialog1.free;

  Excel.Quit;
  Excel:=Unassigned;
  reopen_tables;
end;

procedure TF_Main.N20Click(Sender: TObject);
var
        s : string;
     Excel: Variant;
         j: Integer;
 FIB_Query: TIBDataSet;
 OpenDialog1: TOpenDialog;
begin
  OpenDialog1:=TOpenDialog.Create(nil);
  FIB_Query:=TIBDataSet.Create(nil);
  FIB_Query.Database:=DM_Mebeli.DB_Mebeli;

  FIB_Query.SelectSQL.Clear;
  FIB_Query.SelectSQL.Add('update AKT_VIP_RABOT_DETALI_0 set id_pilomat_detali=:new_id_detali where id_pilomat_detali= :old_id_detali');

  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Rollback;
  DM_Mebeli.IBTransaction1.StartTransaction;
  Excel:=CreateOleObject('Excel.Application');
  OpenDialog1.Filter:='Excel files  |*.XLS;*.XLSX';
  if not OpenDialog1.Execute then exit;
  Excel.Application.WorkBooks.Open(OpenDialog1.FileName,0,true);
  j:=2;
  while Excel.Cells[j, 1].Text<>'' do
    begin
      s:=Excel.Cells[j, 1];
      FIB_Query.ParamByName('old_id_detali').Value:=s;
      s:=Excel.Cells[j, 2];
      FIB_Query.ParamByName('new_id_detali').Value:=s;
      FIB_Query.ExecSQL;
      Application.ProcessMessages;
      Inc(j);
    end;

  DM_Mebeli.IBTransaction1.Commit;
  ShowMessage('Imported '+IntToStr(j)+' rows');
  FIB_Query.Free;
  OpenDialog1.free;

  Excel.Quit;
  Excel:=Unassigned;
  reopen_tables;
end;

procedure TF_Main.Timer1Timer(Sender: TObject);
var  FIB_Query: TIBDataSet;
begin
  FIB_Query:=TIBDataSet.Create(nil);
  FIB_Query.Database:=DM_Mebeli.DB_Mebeli;
  FIB_Query.SelectSQL.Add('select * from rdb$database');
  Try
    FIB_Query.Open;
  finally
    begin
      FIB_Query.Close;
      FIB_Query.Free;
    end;
  end;
end;

procedure TF_Main.N21Click(Sender: TObject);
var
        s : string;
     Excel: Variant;
         j: Integer;
 FIB_Query: TIBDataSet;
 OpenDialog1: TOpenDialog;
begin
  OpenDialog1:=TOpenDialog.Create(nil);
  FIB_Query:=TIBDataSet.Create(nil);
  FIB_Query.Database:=DM_Mebeli.DB_Mebeli;

  FIB_Query.SelectSQL.Clear;
  FIB_Query.SelectSQL.Add('update rashod_furnitura_0 set ID_GOTOVPROD_NEW=:ID_GOTOV_PROD where ID_GOTOV_PROD=:OLD_ID_GOTOV_PROD');

  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Rollback;
  DM_Mebeli.IBTransaction1.StartTransaction;
  Excel:=CreateOleObject('Excel.Application');
  OpenDialog1.Filter:='Excel files  |*.XLS;*.XLSX';
  if not OpenDialog1.Execute then exit;
  Excel.Application.WorkBooks.Open(OpenDialog1.FileName,0,true);
  j:=2;
  while Excel.Cells[j, 1].Text<>'' do
    begin
      s:=Excel.Cells[j, 1];
      FIB_Query.ParamByName('OLD_ID_GOTOV_PROD').Value:=s;
      s:=Excel.Cells[j, 2];
      FIB_Query.ParamByName('ID_GOTOV_PROD').Value:=s;
      FIB_Query.ExecSQL;
      Application.ProcessMessages;
      Inc(j);
    end;

  DM_Mebeli.IBTransaction1.Commit;
  ShowMessage('Imported '+IntToStr(j)+' rows');
  FIB_Query.Free;
  OpenDialog1.free;

  Excel.Quit;
  Excel:=Unassigned;
  reopen_tables;
end;

procedure TF_Main.N22Click(Sender: TObject);
var
        s : string;
     Excel: Variant;
         j: Integer;
 FIB_Query: TIBDataSet;
 OpenDialog1: TOpenDialog;
begin
  OpenDialog1:=TOpenDialog.Create(nil);
  FIB_Query:=TIBDataSet.Create(nil);
  FIB_Query.Database:=DM_Mebeli.DB_Mebeli;

  FIB_Query.SelectSQL.Clear;
  FIB_Query.SelectSQL.Add('update rashod_detali_0 set ID_GOTOVPROD_NEW=:ID_GOTOV_PROD where ID_GOTOV_PROD=:OLD_ID_GOTOV_PROD');

  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Rollback;
  DM_Mebeli.IBTransaction1.StartTransaction;
  Excel:=CreateOleObject('Excel.Application');
  OpenDialog1.Filter:='Excel files  |*.XLS;*.XLSX';
  if not OpenDialog1.Execute then exit;
  Excel.Application.WorkBooks.Open(OpenDialog1.FileName,0,true);
  j:=2;
  while Excel.Cells[j, 1].Text<>'' do
    begin
      s:=Excel.Cells[j, 1];
      FIB_Query.ParamByName('OLD_ID_GOTOV_PROD').Value:=s;
      s:=Excel.Cells[j, 2];
      FIB_Query.ParamByName('ID_GOTOV_PROD').Value:=s;
      FIB_Query.ExecSQL;
      Application.ProcessMessages;
      Inc(j);
    end;

  DM_Mebeli.IBTransaction1.Commit;
  ShowMessage('Imported '+IntToStr(j)+' rows');
  FIB_Query.Free;
  OpenDialog1.free;

  Excel.Quit;
  Excel:=Unassigned;
  reopen_tables;
end;

procedure TF_Main.N23Click(Sender: TObject);
var
        s : string;
     Excel: Variant;
         j: Integer;
 FIB_Query: TIBDataSet;
 OpenDialog1: TOpenDialog;
begin
  OpenDialog1:=TOpenDialog.Create(nil);
  FIB_Query:=TIBDataSet.Create(nil);
  FIB_Query.Database:=DM_Mebeli.DB_Mebeli;

  FIB_Query.SelectSQL.Clear;
  FIB_Query.SelectSQL.Add('update prodaja_gotovprod_1_0 set ID_GOTOVPROD_NEW=:ID_GOTOV_PROD where ID_GOTOV_PROD=:OLD_ID_GOTOV_PROD');

  if DM_Mebeli.IBTransaction1.Active then
    DM_Mebeli.IBTransaction1.Rollback;
  DM_Mebeli.IBTransaction1.StartTransaction;
  Excel:=CreateOleObject('Excel.Application');
  OpenDialog1.Filter:='Excel files  |*.XLS;*.XLSX';
  if not OpenDialog1.Execute then exit;
  Excel.Application.WorkBooks.Open(OpenDialog1.FileName,0,true);
  j:=2;
  while Excel.Cells[j, 1].Text<>'' do
    begin
      s:=Excel.Cells[j, 1];
      FIB_Query.ParamByName('OLD_ID_GOTOV_PROD').Value:=s;
      s:=Excel.Cells[j, 2];
      FIB_Query.ParamByName('ID_GOTOV_PROD').Value:=s;
      FIB_Query.ExecSQL;
      Application.ProcessMessages;
      Inc(j);
    end;

  DM_Mebeli.IBTransaction1.Commit;
  ShowMessage('Imported '+IntToStr(j)+' rows');
  FIB_Query.Free;
  OpenDialog1.free;

  Excel.Quit;
  Excel:=Unassigned;
  reopen_tables;
end;

procedure TF_Main.N_GeneralClick(Sender: TObject);
begin
  DM_Mebeli.IBTransaction1.Rollback;
  DM_Mebeli.DB_Mebeli.Close;
  DM_Mebeli.DB_Mebeli.Open;
  F_Reports.ShowModal;
  DM_Mebeli.IB_Zakaz_0.Open;
  F_IB_Zakaz_1.Open;
end;//proc

procedure TF_Main.Button1Click(Sender: TObject);
var HCalc: THojaCalc;
    SaveDialog1: TSaveDialog;
begin
  SaveDialog1:=TSaveDialog.Create(nil);
  HCalc:=THojaCalc.create(thcExcel, false, false);
  SaveDialog1.Execute;
  HCalc.FileName:= SaveDialog1.FileName;
  HCalc.CellText[1,1] := '(1x1) Hello world!  v2';
  HCalc.CellText[1,2] := '(1x2) Hello world!  v2';
  HCalc.Visible:=false;
  HCalc.SaveDoc;
  HCalc.Free;
  SaveDialog1.Free;
end;

procedure TF_Main.N_Get_zakaz_rabotaClick(Sender: TObject);
begin
  id_zakaz:=DM_Mebeli.IB_Zakaz_0.FieldByName('id').AsInteger;
  F_Report_Get_zakaz_rabota.ShowModal;
  reopen_tables;
end;

procedure TF_Main.N_Get_zakaz_ostalosi_sdelatiClick(Sender: TObject);
begin
  id_zakaz:=DM_Mebeli.IB_Zakaz_0.FieldByName('id').AsInteger;
  F_Report_Get_Zakaz_Ostalosi_Sdelati.ShowModal;
  reopen_tables;  
end;

procedure TF_Main.N_materialy_Ostatok_skladClick(Sender: TObject);
begin
  id_zakaz:=DM_Mebeli.IB_Zakaz_0.FieldByName('id').AsInteger;
  F_Report_Ostatok_materialy.ShowModal;
  reopen_tables;
end;

procedure TF_Main.N_Rashod_na_gotovprod_furnituraClick(Sender: TObject);
begin
  id_zakaz:=DM_Mebeli.IB_Zakaz_0.FieldByName('id').AsInteger;
  F_Rashod_na_gotovprod_furnitura.ShowModal;
  reopen_tables;
end;

procedure TF_Main.N_Furnitura_in_NormaClick(Sender: TObject);
begin
  id_zakaz:=DM_Mebeli.IB_Zakaz_0.FieldByName('id').AsInteger;
  F_Print_Furnitura_In_Norma.ShowModal;
  reopen_tables;
end;

procedure TF_Main.N_Detali_in_NormaClick(Sender: TObject);
begin
  id_zakaz:=DM_Mebeli.IB_Zakaz_0.FieldByName('id').AsInteger;
  F_Print_Detali_In_Norma.ShowModal;
  reopen_tables;
end;

procedure TF_Main.N_Rashod_na_gotovprod_pilomatClick(Sender: TObject);
begin
  id_zakaz:=DM_Mebeli.IB_Zakaz_0.FieldByName('id').AsInteger;
  F_Rashod_na_gotovprod_detali.ShowModal;
  reopen_tables;
end;

end.

