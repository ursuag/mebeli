unit mebeli_dm;

interface

uses
  SysUtils, Classes, IBDatabase, DB, DBClient, DBLocal,
  IBCustomDataSet, IBQuery, IBTable, Dialogs, IBServices;

type
  TDM_Mebeli = class(TDataModule)
    DB_Mebeli: TIBDatabase;
    IBTransaction1: TIBTransaction;
    DS_Sklad: TDataSource;
    DS_Sotrudniki: TDataSource;
    DS_Vidy_rabot: TDataSource;
    DS_Pilomat_grupa: TDataSource;
    DS_Pilomat_grupa_vidrabot: TDataSource;
    DS_Pilomat_listy: TDataSource;
    DS_Pilomat_detali: TDataSource;
    DS_Gotov_prod_0: TDataSource;
    DS_Gotov_prod_1: TDataSource;
    DS_Zakaz_0: TDataSource;
    DS_Zakaz_1: TDataSource;
    DS_Akt_vip_rabot_0: TDataSource;
    DS_Akt_vip_prod_0: TDataSource;
    DS_Akt_vip_rabot_1: TDataSource;
    DS_Akt_vip_prod_1: TDataSource;
    SQL_Report_vipusk_prod: TIBQuery;
    DS_Akt_raspil: TDataSource;
    DS_Akt_raspil_listy: TDataSource;
    DS_Akt_raspil_detali: TDataSource;
    DS_Prihod_listy_0: TDataSource;
    DS_Prihod_listy_1: TDataSource;
    DS_Prihod_detali_0: TDataSource;
    DS_Prihod_detali_1: TDataSource;
    DS_Prihod_furnitura_0: TDataSource;
    DS_Prihod_furnitura_1: TDataSource;
    IB_Sklad: TIBDataSet;
    IB_Sotrudniki: TIBDataSet;
    IB_Vidy_rabot: TIBDataSet;
    IB_Pilomat_grupa: TIBDataSet;
    IB_Pilomat_grupa_vidrabot: TIBDataSet;
    IB_Pilomat_detali: TIBDataSet;
    IB_Gotov_prod_0: TIBDataSet;
    IB_Gotov_prod_1: TIBDataSet;
    IB_Zakaz_0: TIBDataSet;
    IB_Zakaz_1: TIBDataSet;
    IB_Akt_vip_rabot_1: TIBDataSet;
    IB_Akt_vip_prod_1: TIBDataSet;
    IB_Akt_raspil_listy: TIBDataSet;
    IB_Akt_raspil_detali: TIBDataSet;
    IB_Prihod_listy_0: TIBDataSet;
    IB_Prihod_listy_1: TIBDataSet;
    IB_Prihod_detali_0: TIBDataSet;
    IB_Prihod_detali_1: TIBDataSet;
    IB_Prihod_furnitura_1: TIBDataSet;
    IB_Prihod_furnitura_0: TIBDataSet;
    IB_Pilomat_grupa_vidrabotID_GRUPA: TIntegerField;
    IB_Pilomat_grupa_vidrabotID_VID_RABOT: TIntegerField;
    IB_Pilomat_grupa_vidrabotVid_rabot: TStringField;
    IB_Gotov_prod_2: TIBDataSet;
    DS_Gotov_Prod_2: TDataSource;
    IB_Gotov_prod_1ID_PARENT: TIntegerField;
    IB_Gotov_prod_1ID_DETALI: TIntegerField;
    IB_Gotov_prod_1KOL_VO: TIntegerField;
    IB_Gotov_prod_1DETALI_NAME: TStringField;
    IB_Gotov_prod_2ID_PARENT: TIntegerField;
    IB_Gotov_prod_2ID_FURNITURA: TIntegerField;
    IB_Gotov_prod_2FURNITURA_NAME: TStringField;
    IB_Gotov_prod_2ED_IZM: TStringField;
    IB_Gotov_prod_2KOL_VO: TIBBCDField;
    IB_Zakaz_1ID_PARENT: TIntegerField;
    IB_Zakaz_1ID_GOTOV_PROD: TIntegerField;
    IB_Zakaz_1KOL_VO: TIntegerField;
    IB_Zakaz_1PRIORITET: TIntegerField;
    IB_Zakaz_1GOTPROD_NAME: TStringField;
    IB_Akt_raspil_listyID_PARENT: TIntegerField;
    IB_Akt_raspil_listyID_PILOMAT_LISTY: TIntegerField;
    IB_Akt_raspil_listyKOL_VO: TIntegerField;
    IB_Akt_raspil: TIBDataSet;
    IB_Akt_raspilID: TIntegerField;
    IB_Akt_raspilDATE_R: TDateField;
    IB_Akt_vip_rabot_1ID_PARENT: TIntegerField;
    IB_Akt_vip_rabot_1ID_GOTOV_PROD: TIntegerField;
    IB_Akt_vip_rabot_1KOL_VO: TIntegerField;
    IB_Akt_vip_rabot_1Got_prod_name: TStringField;
    IB_Akt_vip_prod_1ID_PARENT: TIntegerField;
    IB_Akt_vip_prod_1ID_GOTOV_PROD: TIntegerField;
    IB_Prihod_furnitura_1ID_PARENT: TIntegerField;
    IB_Prihod_furnitura_1ID_FURNITURA: TIntegerField;
    IB_Prihod_detali_1ID_PARENT: TIntegerField;
    IB_Prihod_detali_1ID_PILOMAT_DETALI: TIntegerField;
    IB_Prihod_detali_1KOL_VO: TIntegerField;
    IB_Prihod_detali_1DETALI_NAME: TStringField;
    IB_Prihod_listy_1ID_PARENT: TIntegerField;
    IB_Prihod_listy_1ID_LISTY: TIntegerField;
    IB_Prihod_listy_1KOL_VO: TIntegerField;
    IB_Prihod_detali_0ID: TIntegerField;
    IB_Prihod_detali_0DATE_P: TDateField;
    IB_Prihod_detali_0ID_SKLAD: TIntegerField;
    IB_Prihod_detali_0ID_VID_RABOT: TIntegerField;
    IB_Peremeschenie_0: TIBDataSet;
    DS_Peremeschenie_0: TDataSource;
    IB_Akt_vip_rabot_0: TIBDataSet;
    IB_Akt_vip_rabot_0NOMER: TIntegerField;
    IB_Akt_vip_rabot_0DATE_A: TDateField;
    IB_Akt_vip_rabot_0ID_SOTRUDNIK: TIntegerField;
    IB_Akt_vip_rabot_0ID_ZAKAZ: TIntegerField;
    IB_Akt_vip_rabot_0ID_VID_RABOT: TIntegerField;
    IB_Akt_vip_rabot_0SOTRUDNIK_FIO: TStringField;
    IB_Akt_vip_rabot_0VIDRABOT_NAME: TStringField;
    IB_Prihod_detali_0VID_RABOT_NAME: TStringField;
    IB_Prihod_detali_0SKLAD_NAME: TStringField;
    IB_Prihod_detali_0ID_AKT_RASPIL: TIntegerField;
    IB_Rashod_detali: TIBDataSet;
    DS_Rashod_detali: TDataSource;
    IB_Rashod_furnitura: TIBDataSet;
    DS_Rashod_furnitura: TDataSource;
    IB_Akt_vip_prod_0: TIBDataSet;
    IB_Akt_vip_prod_0NOMER: TIntegerField;
    IB_Akt_vip_prod_0DATE_A: TDateField;
    IB_Akt_vip_prod_0ID_SKLAD_OTKUDA: TIntegerField;
    IB_Akt_vip_prod_0ID_SKLAD_KUDA: TIntegerField;
    IB_Akt_vip_prod_0ID_ZAKAZ: TIntegerField;
    IB_Akt_vip_prod_0SKLAD_OTKUDA: TStringField;
    IB_Akt_vip_prod_0SKLAD_KUDA: TStringField;
    IB_Prihod_listy_0ID: TIntegerField;
    IB_Prihod_listy_0DATE_P: TDateField;
    IB_Prihod_listy_0ID_SKLAD: TIntegerField;
    IB_Prihod_listy_0SKLAD_NAME: TStringField;
    IB_Prihod_furnitura_0ID: TIntegerField;
    IB_Prihod_furnitura_0DATE_P: TDateField;
    IB_Prihod_furnitura_0ID_SKLAD: TIntegerField;
    IB_Prihod_furnitura_0SKLAD_NAME: TStringField;
    IB_Rashod_detaliID: TIntegerField;
    IB_Rashod_detaliID_PILOMAT_DETALI: TIntegerField;
    IB_Rashod_detaliKOL_VO: TIntegerField;
    IB_Rashod_detaliDATE_R: TDateField;
    IB_Rashod_detaliID_AKT_VIP_PROD: TIntegerField;
    IB_Akt_raspil_ostatok: TIBDataSet;
    DS_Akt_raspil_ostatok: TDataSource;
    IB_Akt_raspil_ostatokID: TIntegerField;
    IB_Akt_raspil_ostatokID_PARENT: TIntegerField;
    IB_Akt_raspil_ostatokNAME: TIBStringField;
    IB_Akt_raspil_ostatokRAZMER_X: TIBBCDField;
    IB_Akt_raspil_ostatokRAZMER_Y: TIBBCDField;
    IB_Akt_raspil_ostatokID_PILOMAT_LISTY: TIntegerField;
    IB_Furnitura_grupa: TIBDataSet;
    DS_Furnitura_grupa: TDataSource;
    DS_Furnitura: TDataSource;
    IB_Furnitura: TIBDataSet;
    IB_Rashod_detaliDETALI_NAME: TStringField;
    IB_Furnitura_grupaVID_RABOT: TStringField;
    IB_Furnitura_grupaID: TIntegerField;
    IB_Furnitura_grupaNAME: TIBStringField;
    IB_Furnitura_grupaID_VID_RABOT: TIntegerField;
    IB_Rashod_detaliID_GOTOV_PROD: TIntegerField;
    DS_Vidy_rabot_stoimosti: TDataSource;
    IB_Vidy_rabot_stoimosti: TIBDataSet;
    IB_Akt_vip_rabot_1STOIMOSTI_RABOTI: TIBBCDField;
    IB_Prihod_furnitura_1FURNITURA_NAME: TStringField;
    IB_Prihod_furnitura_1FURNITURA_EDIZM: TStringField;
    IB_Gotov_prod_grupa: TIBDataSet;
    DS_Gotov_prod_grupa: TDataSource;
    IB_Peremeschenie_0ID: TIntegerField;
    IB_Peremeschenie_0DATE_PER: TDateField;
    IB_Peremeschenie_0ID_SKLAD_OTKUDA: TIntegerField;
    IB_Peremeschenie_0ID_SKLAD_KUDA: TIntegerField;
    IB_Peremeschenie_0SKLAD_OTKUDA_NAME: TStringField;
    IB_Peremeschenie_0SKLAD_KUDA_NAME: TStringField;
    IB_Peremeschenie_detali: TIBDataSet;
    DS_Peremeschenie_detali: TDataSource;
    IB_Peremeschenie_furnitura: TIBDataSet;
    DS_Peremeschenie_furnitura: TDataSource;
    IB_Peremeschenie_listy: TIBDataSet;
    DS_Peremeschenie_listy: TDataSource;
    IB_Peremeschenie_furnituraID_PARENT: TIntegerField;
    IB_Peremeschenie_furnituraID_FURNITURA: TIntegerField;
    IB_Peremeschenie_furnituraKOL_VO: TIBBCDField;
    IB_Peremeschenie_detaliID_PARENT: TIntegerField;
    IB_Peremeschenie_detaliID_PILOMAT_DETALI: TIntegerField;
    IB_Peremeschenie_detaliKOL_VO: TIntegerField;
    IB_Peremeschenie_detaliDETALI_NAME: TStringField;
    IB_Peremeschenie_furnituraFURNITURA_NAME: TStringField;
    IB_Peremeschenie_furnituraEDIZM_NAME: TStringField;
    IB_Peremeschenie_listyID_PARENT: TIntegerField;
    IB_Peremeschenie_listyID_PILOMAT_LISTY: TIntegerField;
    IB_Peremeschenie_listyKOL_VO: TIntegerField;
    IB_Peremeschenie_listyLISTY_NAME: TStringField;
    IB_Peremeschenie_detaliID_VID_RABOT: TIntegerField;
    IB_Peremeschenie_detaliVIDRABOT_NAME: TStringField;
    IB_Gotov_prod_0ID: TIntegerField;
    IB_Gotov_prod_0NAME: TIBStringField;
    IB_Gotov_prod_0ID_GRUPA: TIntegerField;
    IB_Spisanie_0: TIBDataSet;
    DS_Spisanie_0: TDataSource;
    IB_Spisanie_detali: TIBDataSet;
    DS_Spisanie_detali: TDataSource;
    IB_Spisanie_furnitura: TIBDataSet;
    DS_Spisanie_furnitura: TDataSource;
    IB_Spisanie_listy: TIBDataSet;
    DS_Spisanie_listy: TDataSource;
    IB_Spisanie_detaliID_PARENT: TIntegerField;
    IB_Spisanie_detaliID_PILOMAT_DETALI: TIntegerField;
    IB_Spisanie_detaliKOL_VO: TIntegerField;
    IB_Spisanie_detaliID_VID_RABOT: TIntegerField;
    IB_Spisanie_detaliVIDRBOT_NAME: TStringField;
    IB_Spisanie_furnituraID_PARENT: TIntegerField;
    IB_Spisanie_furnituraID_FURNITURA: TIntegerField;
    IB_Spisanie_furnituraKOL_VO: TIBBCDField;
    IB_Spisanie_furnituraFURNITURA_NAME: TStringField;
    IB_Spisanie_furnituraFURNITURA_EDIZM: TStringField;
    IB_Spisanie_listyID_PARENT: TIntegerField;
    IB_Spisanie_listyID_PILOMAT_LISTY: TIntegerField;
    IB_Spisanie_listyKOL_VO: TIntegerField;
    IB_Spisanie_listyLISTY_NAME: TStringField;
    IB_Spisanie_0ID: TIntegerField;
    IB_Spisanie_0DATE_SPIS: TDateField;
    IB_Spisanie_0ID_SKLAD: TIntegerField;
    IB_Spisanie_0SKLAD_NAME: TStringField;
    IB_Spisanie_detaliOPLATA: TSmallintField;
    IB_Spisanie_detaliOPLATA_NAME: TStringField;
    IB_Prihod_furnitura_1KOL_VO: TIBBCDField;
    IB_Ostatki: TIBDataSet;
    IB_Akt_vip_rabot_0PRIMECHANIE: TIBStringField;
    IB_Akt_vip_prod_0PRIMECHANIE: TIBStringField;
    IB_Prihod_listy_0ID_AKT_RASPIL: TIntegerField;
    IB_Prihod_listy_0PRIMECHANIE: TIBStringField;
    IB_Prihod_detali_0PRIMECHANIE: TIBStringField;
    IB_Prihod_furnitura_0PRIMECHANIE: TIBStringField;
    IB_Peremeschenie_0PRIMECHANIE: TIBStringField;
    IB_Spisanie_0PRIMECHANIE: TIBStringField;
    IB_Akt_raspilOSTATOK: TIntegerField;
    IB_Akt_raspil_listyID: TIntegerField;
    IB_Akt_vip_rabot_detali: TIBDataSet;
    DS_Akt_vip_rabot_detali: TDataSource;
    IB_OstatkiID: TIntegerField;
    IB_OstatkiSKLAD: TIBStringField;
    IB_OstatkiID_SKLAD: TIntegerField;
    IB_OstatkiGRUPA: TIBStringField;
    IB_OstatkiID_GRUPA: TIntegerField;
    IB_OstatkiNAME: TIBStringField;
    IB_OstatkiED_IZM: TIBStringField;
    IB_OstatkiKOL_VO: TIBBCDField;
    IB_OstatkiAREA: TIBBCDField;
    IB_OstatkiTIP_MATERIALA: TIntegerField;
    IB_OSTATOK_DETALI_VIDRABOT: TIBDataSet;
    DS_OSTATOK_DETALI_VIDRABOT: TDataSource;
    IB_OSTATOK_DETALI_VIDRABOTID: TIntegerField;
    IB_OSTATOK_DETALI_VIDRABOTID_PILOMAT_DETALI: TIntegerField;
    IB_OSTATOK_DETALI_VIDRABOTID_VID_RABOT: TIntegerField;
    IB_OSTATOK_DETALI_VIDRABOTID_SKLAD: TIntegerField;
    IB_OSTATOK_DETALI_VIDRABOTDATE_OST: TDateField;
    IB_OSTATOK_DETALI_VIDRABOTKOL_VO: TIntegerField;
    IB_OSTATOK_DETALI_VIDRABOTDETALI_NAME: TStringField;
    IB_OSTATOK_DETALI_VIDRABOTVIDRABOT_NAME: TStringField;
    IB_OSTATOK_DETALI_VIDRABOTNEW_OSTATOK: TIntegerField;
    IB_Akt_raspilPRIMECHANIE: TIBStringField;
    DS_Pilomat_detali_furn: TDataSource;
    IB_Pilomat_detali_furn: TIBDataSet;
    IB_Pilomat_detali_furnID: TIntegerField;
    IB_Pilomat_detali_furnID_DETALI: TIntegerField;
    IB_Pilomat_detali_furnID_FURNITURA: TIntegerField;
    IB_Pilomat_detali_furnKOL_VO: TIBBCDField;
    IB_Pilomat_detali_furnFurnitura_name: TStringField;
    IB_Pilomat_detali_furnID_VID_RABOT: TIntegerField;
    IB_Pilomat_detali_furnVID_RABOT_NAME: TStringField;
    IB_Prihod_listy_1ID_GRUPA: TIntegerField;
    IB_Akt_raspil_detaliID_PARENT: TIntegerField;
    IB_Akt_raspil_detaliID_PILOMAT_DETALI: TIntegerField;
    IB_Akt_raspil_detaliID_SKLAD: TIntegerField;
    IB_Akt_raspil_detaliDETALI_NAME: TStringField;
    IB_Akt_raspil_detaliGRUPA_NAME: TStringField;
    IB_Akt_raspil_detaliSKLAD_NAME: TStringField;
    IB_Rashod_detaliAREA: TIntegerField;
    IB_Rashod_furnituraGRUPA_NAME: TIBStringField;
    IB_Rashod_furnituraFURNITURA_NAME: TIBStringField;
    IB_Rashod_furnituraID: TIntegerField;
    IB_Rashod_furnituraID_FURNITURA: TIntegerField;
    IB_Rashod_furnituraKOL_VO: TIBBCDField;
    IB_Rashod_furnituraDATE_R: TDateField;
    IB_Rashod_furnituraID_AKT_VIP_PROD: TIntegerField;
    IB_Rashod_furnituraID_AKT_VIP_RABOT: TIntegerField;
    IB_Rashod_furnituraID_GOTOV_PROD: TIntegerField;
    IB_Rashod_furnituraED_IZM: TIBStringField;
    IB_Pilomat_listy: TIBDataSet;
    IB_Akt_raspil_listyLISTY_NAME: TStringField;
    IB_Akt_raspil_listyGRUPA_NAME: TStringField;
    IB_Akt_raspilID_ZAKAZ: TIntegerField;
    IB_Pilomat_listyID: TIntegerField;
    IB_Pilomat_listyID_GRUPA: TIntegerField;
    IB_Pilomat_listyRAZMER_X: TIntegerField;
    IB_Pilomat_listyRAZMER_Y: TIntegerField;
    IB_Pilomat_listyAREA: TIntegerField;
    IB_Pilomat_detaliID: TIntegerField;
    IB_Pilomat_detaliRAZMER_X: TIntegerField;
    IB_Pilomat_detaliRAZMER_Y: TIntegerField;
    IB_Pilomat_detaliAREA: TIntegerField;
    IB_Pilomat_detaliID_GRUPA: TIntegerField;
    IB_Akt_vip_rabot_1ID: TIntegerField;
    IB_Akt_vip_rabot_1GRUPA_NAME: TStringField;
    IB_Vidy_rabotID: TIntegerField;
    IB_Vidy_rabotNAME: TIBStringField;
    IB_GOTOV_PROD_CATEGORIES: TIBDataSet;
    DS_GOTOV_PROD_CATEGORIES: TDataSource;
    IB_Gotov_prod_0ID_CATEGORY: TIntegerField;
    IB_Gotov_prod_0CATEGORY_NAME: TStringField;
    IB_Pilomat_listyISLIST: TSmallintField;
    IB_Pilomat_grupaID: TIntegerField;
    IB_Akt_raspilID_SOTRUDNIK_1: TIntegerField;
    IB_Akt_raspilID_SOTRUDNIK_2: TIntegerField;
    IB_Akt_raspilSOTRUDNIK1_NAME: TStringField;
    IB_Akt_raspilSOTRUDNIK2_NAME: TStringField;
    IB_Akt_vip_rabot_0ID_SOTRUDNIK2: TIntegerField;
    IB_Akt_vip_rabot_0SOTRUDNIK2_FIO: TStringField;
    IB_FurnituraID: TIntegerField;
    IB_FurnituraED_IZM: TIBStringField;
    IB_FurnituraID_PARENT: TIntegerField;
    IB_GOTOV_PROD_grupa_name: TIBDataSet;
    IB_Gotov_prod_0GRUPA_NAME: TStringField;
    IB_Akt_vip_prod_1ID: TIntegerField;
    IB_Akt_raspil_ostatokKOL_VO: TIntegerField;
    IB_GOTOV_PROD_VIDRABOT: TIBDataSet;
    DS_GOTOV_PROD_VIDRABOT: TDataSource;
    IB_GOTOV_PROD_VIDRABOTID: TIntegerField;
    IB_GOTOV_PROD_VIDRABOTID_GOTOV_PROD: TIntegerField;
    IB_GOTOV_PROD_VIDRABOTID_VID_RABOT: TIntegerField;
    IB_GOTOV_PROD_VIDRABOTVid_rabot: TStringField;
    IB_Furnitura_vidrabot: TIBDataSet;
    DS_Furnitura_vidrabot: TDataSource;
    IB_Furnitura_vidrabotID: TIntegerField;
    IB_Furnitura_vidrabotID_FURNITURA: TIntegerField;
    IB_Furnitura_vidrabotID_VID_RABOT: TIntegerField;
    IB_Furnitura_vidrabotVIDRABOT_NAME: TStringField;
    IB_Prihod_detali_0ID_ZAKAZ: TIntegerField;
    IB_Spisanie_detaliDETALI_NAME: TStringField;
    IB_Spisanie_detaliGRUPA_NAME: TStringField;
    IB_Constanty: TIBDataSet;
    DS_Constanty: TDataSource;
    IB_Prihod_furnitura_1GRUPA_NAME: TStringField;
    IB_Peremeschenie_furnituraID_SOTRUDNIK: TIntegerField;
    IB_Peremeschenie_furnituraSOTRUDNIK_NAME: TStringField;
    IB_Prihod_listy_1ID: TIntegerField;
    IB_Prihod_listy_1SUMMA: TIBBCDField;
    IB_Prihod_detali_1ID: TIntegerField;
    IB_Prihod_furnitura_1ID: TIntegerField;
    IB_Prihod_furnitura_1SUMMA: TIBBCDField;
    IB_Prihod_listy_0ID_CONTRAGENT: TIntegerField;
    IB_Prihod_furnitura_0ID_CONTRAGENT: TIntegerField;
    IB_Prihod_listy_0contragent_name: TStringField;
    IB_Prihod_furnitura_0CONTRAGENT_NAME: TStringField;
    DS_Statyi_Rashoda: TDataSource;
    IB_Statyi_Rashoda: TIBDataSet;
    IB_Spisanie_0ID_STATYA_RASHODA: TIntegerField;
    IB_Spisanie_0STATYA_NAME: TStringField;
    IB_Prihod_listy_0ID_STATYA_DOHODA: TIntegerField;
    IB_Statyi_Dohoda: TIBDataSet;
    DS_Statyi_Dohoda: TDataSource;
    IB_Prihod_listy_0STATYA_DOHODA: TStringField;
    IB_Zakaz_1GRUPA_NAME: TStringField;
    IB_Gotov_prod_0VES: TIBBCDField;
    IB_Akt_raspilOTHOD_SUMMA: TIBBCDField;
    IB_Akt_raspilOTHOD_M2: TIBBCDField;
    IB_Prihod_listy_0NOMER_TTN: TIBStringField;
    IB_Prihod_furnitura_0ID_STATYA_DOHODA: TIntegerField;
    IB_Prihod_furnitura_0NOMER_TTN: TIBStringField;
    IB_Akt_raspil_detaliKOL_VO: TIntegerField;
    IB_Akt_raspil_detaliID: TIntegerField;
    IB_Rashod_furnituraKOLVO_NORMA: TIBBCDField;
    IB_Prihod_detali_1SUMMA: TIBBCDField;
    IB_FurnituraMANUFACTURER_NAME: TIBStringField;
    IB_FurnituraARTICLE: TIntegerField;
    IB_Pilomat_grupaARTICLE: TIntegerField;
    IB_Gotov_prod_0ID_LINKED_GOTOVPROD: TIntegerField;
    IB_Gotov_prod_0ARTICLE: TIntegerField;
    IB_Peremeschenie_furnituraGRUPA_NAME: TStringField;
    IB_Prihod_listy_1LISTY_NAME: TStringField;
    IB_Prihod_listy_1GRUPA_NAME: TStringField;
    DB_Images: TIBDatabase;
    Transaction_Images: TIBTransaction;
    IB_Spisanie_detaliID: TIntegerField;
    IB_Spisanie_furnituraID: TIntegerField;
    IB_Spisanie_listyID: TIntegerField;
    IB_Spisanie_listySUMMA: TIBBCDField;
    IB_Spisanie_listyID_PRIHOD_LISTY: TIntegerField;
    IB_FurnituraNAME: TIBStringField;
    IB_FurnituraMANUFACTURER_CODE: TIBStringField;
    IB_Pilomat_grupaNAME: TIBStringField;
    IB_Pilomat_grupaMANUFACTURER_CODE: TIBStringField;
    IB_Pilomat_listyNAME: TIBStringField;
    IB_Pilomat_detaliNAME: TIBStringField;
    IB_Akt_vip_prod_1KOL_VO: TIntegerField;
    IB_Akt_vip_prod_1GOTOVPROD_NAME: TStringField;
    IB_Akt_vip_prod_1GRUPA_NAME: TStringField;
    IB_Akt_vip_prod_1ARTICLE: TIntegerField;
    IB_Akt_raspilOTHOD_PRC: TIBBCDField;
    IB_Contragenty_0: TIBDataSet;
    DS_Contragenty_0: TDataSource;
    DS_Contragenty_1: TDataSource;
    IB_Contragenty_1: TIBDataSet;
    IB_Contragenty_1ID: TIntegerField;
    IB_Contragenty_1ID_PARENT: TIntegerField;
    IB_Contragenty_1NAME: TIBStringField;
    IB_Contragenty_1CODFISCAL: TIBStringField;
    IB_Pilomat_grupaIS_ZERKALO: TSmallintField;
    IB_Pilomat_grupaMAX_OTHOD_PRC: TSmallintField;
    IB_Zakaz_0ID: TIntegerField;
    IB_Zakaz_0DATE_Z: TDateField;
    IB_Zakaz_0PRIMECHANIE: TIBStringField;
    IB_Zakaz_0GOTOVPROD_VSEGO: TLargeintField;
    IB_Zakaz_0ZAKAZ_PRC: TIBBCDField;
    IB_Akt_vip_prod_1SUMMA: TIBBCDField;
    IB_Akt_vip_prod_1PRICE: TIBBCDField;
    procedure IB_Pilomat_grupa_vidrabotNewRecord(DataSet: TDataSet);
    procedure IB_Pilomat_listyBeforePost(DataSet: TDataSet);
    procedure IB_Pilomat_detaliBeforePost(DataSet: TDataSet);
    procedure IB_Gotov_prod_1NewRecord(DataSet: TDataSet);
    procedure IB_Gotov_prod_2NewRecord(DataSet: TDataSet);
    procedure IB_Zakaz_1NewRecord(DataSet: TDataSet);
    procedure IB_Akt_raspil_listyNewRecord(DataSet: TDataSet);
    procedure IB_Akt_raspil_detaliNewRecord(DataSet: TDataSet);
    procedure IB_Akt_vip_rabot_1NewRecord(DataSet: TDataSet);
    procedure IB_Prihod_detali_1NewRecord(DataSet: TDataSet);
    procedure IB_Akt_vip_rabot_1BeforeEdit(DataSet: TDataSet);
    procedure IB_Akt_vip_prod_NewRecord(DataSet: TDataSet);
    procedure IB_Akt_vip_prod_1NewRecord(DataSet: TDataSet);
    procedure IB_Vidy_rabotAfterPost(DataSet: TDataSet);
    procedure IB_Pilomat_grupa_vidrabotPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Prihod_listy_1NewRecord(DataSet: TDataSet);
    procedure IB_Prihod_furnitura_1NewRecord(DataSet: TDataSet);
    procedure IB_Akt_raspil_ostatokNewRecord(DataSet: TDataSet);
    procedure IB_FurnituraNewRecord(DataSet: TDataSet);
    procedure IB_Furnitura_grupaDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_FurnituraDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure IB_Vidy_rabot_stoimostiNewRecord(DataSet: TDataSet);
    procedure IB_Gotov_prod_0NewRecord(DataSet: TDataSet);
    procedure IB_Peremeschenie_detaliNewRecord(DataSet: TDataSet);
    procedure IB_Peremeschenie_furnituraNewRecord(DataSet: TDataSet);
    procedure IB_Peremeschenie_listyNewRecord(DataSet: TDataSet);
    procedure IB_Spisanie_detaliCalcFields(DataSet: TDataSet);
    procedure IB_Spisanie_detaliNewRecord(DataSet: TDataSet);
    procedure IB_Spisanie_furnituraNewRecord(DataSet: TDataSet);
    procedure IB_Spisanie_listyNewRecord(DataSet: TDataSet);
    procedure IB_Pilomat_listyDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Akt_raspil_ostatokDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Akt_raspilDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Peremeschenie_furnituraBeforePost(DataSet: TDataSet);
    procedure IB_Spisanie_listyBeforePost(DataSet: TDataSet);
    procedure IB_Peremeschenie_listyBeforePost(DataSet: TDataSet);
    procedure IB_OSTATOK_DETALI_VIDRABOTCalcFields(DataSet: TDataSet);
    procedure IB_OSTATOK_DETALI_VIDRABOTAfterInsert(DataSet: TDataSet);
    procedure IB_Pilomat_detali_furnNewRecord(DataSet: TDataSet);
    procedure IB_Akt_vip_rabot_1CalcFields(DataSet: TDataSet);
    procedure IB_Contragenty_1NewRecord(DataSet: TDataSet);
    procedure IB_Akt_raspil_listyPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_GOTOV_PROD_VIDRABOTNewRecord(DataSet: TDataSet);
    procedure IB_Pilomat_detaliDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Spisanie_0PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure IB_Spisanie_0DeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Spisanie_detaliPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Spisanie_listyPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Rashod_detaliPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Akt_vip_prod_0PostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Rashod_furnituraPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Peremeschenie_furnituraPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Peremeschenie_detaliPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Prihod_furnitura_1PostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Prihod_furnitura_0PostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Prihod_detali_1PostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Prihod_detali_0PostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Akt_vip_rabot_0PostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Akt_vip_rabot_detaliPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Prihod_furnitura_1CalcFields(DataSet: TDataSet);
    procedure IB_Spisanie_furnituraPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Peremeschenie_listyPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure IB_Peremeschenie_furnituraCalcFields(DataSet: TDataSet);
    procedure IB_Akt_raspil_ostatokBeforePost(DataSet: TDataSet);
    procedure IB_Prihod_furnitura_1AfterPost(DataSet: TDataSet);
    procedure IB_Prihod_listy_1AfterPost(DataSet: TDataSet);
    procedure IB_Prihod_listy_1CalcFields(DataSet: TDataSet);
    procedure IB_Akt_vip_prod_1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure trigger_error (error: string);
    procedure get_gotovprod_name(id_gotovprod:integer;var article:integer; var gotovprod_name: string; var grupa_name: string);
  end;

var
                   DM_Mebeli: TDM_Mebeli;
          prev_kolvo_gotprod: integer;
  gotprod_vipusk_before_edit: integer;
implementation

uses main_f, Akt_raspil_edit_f, prihod_furnitura_edit_f,
  prihod_listy_edit_f;

{$R *.dfm}

procedure TDM_Mebeli.get_gotovprod_name(id_gotovprod:integer;var article:integer; var gotovprod_name: string; var grupa_name: string);
var ib_tmp:TIBDataSet;
begin
  ib_tmp:=TIBDataSet.Create(nil);
  ib_tmp.Database:=IB_Sklad.Database;
  ib_tmp.SelectSQL.Add('select gp.article article, gpg.name grupa_name, gp.name gotovprod_name from gotov_prod_grupa gpg, gotov_prod_0 gp where (gpg.id=gp.id_grupa) and (gp.id= :id_gotovprod)');
  ib_tmp.ParamByName('id_gotovprod').Value:=id_gotovprod;
  ib_tmp.open;
  article:=ib_tmp.FieldByName('article').AsInteger;
  gotovprod_name:=ib_tmp.FieldByName('gotovprod_name').AsString;
  grupa_name:=ib_tmp.FieldByName('grupa_name').AsString;
  ib_tmp.close;
  ib_tmp.Free;
end;//proc


procedure TDM_Mebeli.trigger_error (error: string);
var errmsg: string;
begin
  errmsg:=error;
  if Pos('~',error)>0 then
    begin
      errmsg:=Copy(error,Pos('~',error)+1,Length(error)-Pos('~',error));
      errmsg:=Copy(errmsg,1,Pos('~',errmsg)-1);
    end;
  ShowMessage(errmsg);
end;//proc

procedure TDM_Mebeli.IB_Pilomat_grupa_vidrabotNewRecord(DataSet: TDataSet);
begin
  IB_Pilomat_grupa_vidrabot.FieldByName('ID_GRUPA').Value:=IB_Pilomat_grupa.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Pilomat_listyBeforePost(DataSet: TDataSet);
begin
  DM_Mebeli.IB_Pilomat_listy.FieldByName('AREA').Value:=DM_Mebeli.IB_Pilomat_listy.FieldByName('Razmer_X').AsInteger*DM_Mebeli.IB_Pilomat_listy.FieldByName('Razmer_Y').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Pilomat_detaliBeforePost(DataSet: TDataSet);
begin
  DM_Mebeli.IB_Pilomat_detali.FieldByName('AREA').Value:=DM_Mebeli.IB_Pilomat_detali.FieldByName('Razmer_X').AsInteger*DM_Mebeli.IB_Pilomat_detali.FieldByName('Razmer_Y').AsInteger;
  IB_Pilomat_detali.FieldByName('ID_GRUPA').Value:=IB_Pilomat_grupa.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Gotov_prod_1NewRecord(DataSet: TDataSet);
begin
  IB_gotov_prod_1.FieldByName('ID_PARENT').Value:=IB_gotov_prod_0.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Gotov_prod_2NewRecord(DataSet: TDataSet);
begin
  IB_gotov_prod_2.FieldByName('ID_PARENT').Value:=IB_gotov_prod_0.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Zakaz_1NewRecord(DataSet: TDataSet);
begin
  IB_Zakaz_1.FieldByName('ID_PARENT').Value:=IB_Zakaz_0.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Akt_raspil_listyNewRecord(DataSet: TDataSet);
begin
  IB_Akt_raspil_listy.FieldByName('ID_PARENT').Value:=IB_Akt_raspil.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Akt_raspil_detaliNewRecord(DataSet: TDataSet);
begin
  IB_Akt_raspil_detali.FieldByName('ID_PARENT').Value:=IB_Akt_raspil.FieldByName('ID').AsInteger;
  IB_Akt_raspil_detali.FieldByName('ID_SKLAD').Value:=sklad_detali;
end;//proc

procedure TDM_Mebeli.IB_Akt_vip_rabot_1NewRecord(DataSet: TDataSet);
begin
  IB_Akt_vip_rabot_1.FieldByName('ID_PARENT').Value:=IB_Akt_vip_rabot_0.FieldByName('NOMER').AsInteger;
  prev_kolvo_gotprod:=0;
end;//proc

procedure TDM_Mebeli.IB_Prihod_detali_1NewRecord(DataSet: TDataSet);
begin
  IB_Prihod_detali_1.FieldByName('ID_PARENT').Value:=IB_Prihod_detali_0.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Akt_vip_rabot_1BeforeEdit(DataSet: TDataSet);
begin
  prev_kolvo_gotprod:=IB_Akt_vip_rabot_1.FieldByName('KOL_VO').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Akt_vip_prod_NewRecord(DataSet: TDataSet);
begin
  IB_Akt_vip_prod_1.FieldByName('ID_PARENT').Value:=IB_Akt_vip_prod_0.FieldByName('NOMER').AsInteger;
  gotprod_vipusk_before_edit:=0;
end;//proc

procedure TDM_Mebeli.IB_Akt_vip_prod_1NewRecord(DataSet: TDataSet);
begin
  IB_Akt_vip_prod_1.FieldByName('ID_PARENT').Value:=IB_Akt_vip_prod_0.FieldByName('NOMER').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Vidy_rabotAfterPost(DataSet: TDataSet);
begin
  IB_Vidy_rabot.Last;
  Last_vid_rabot:=IB_Vidy_rabot.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Pilomat_grupa_vidrabotPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  ShowMessage('Такой вид работ уже есть!');
  Action:=daAbort;
end;//proc

procedure TDM_Mebeli.IB_Prihod_listy_1NewRecord(DataSet: TDataSet);
begin
  IB_Prihod_listy_1.FieldByName('ID_PARENT').Value:=IB_Prihod_listy_0.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Prihod_furnitura_1NewRecord(DataSet: TDataSet);
begin
  IB_Prihod_furnitura_1.FieldByName('ID_PARENT').Value:=IB_Prihod_furnitura_0.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Akt_raspil_ostatokNewRecord(DataSet: TDataSet);
begin
  IB_Akt_raspil_ostatok.FieldByName('ID_PARENT').Value:=IB_Akt_raspil.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_FurnituraNewRecord(DataSet: TDataSet);
begin
  IB_Furnitura_vidrabot.FieldByName('ID_FURNITURA').Value:=IB_Furnitura.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Furnitura_grupaDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  IF Pos('null',E.Message)>0 Then
    begin
      ShowMessage('Элементы, входящие в группу, используются в других документах');
      action:=daAbort;
    end;//if
end;//proc

procedure TDM_Mebeli.IB_FurnituraDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  IF Pos('null',E.Message)>0 Then
    begin
      ShowMessage('Элемент используется в других документах');
      action:=daAbort;
    end;//if
end;//proc

procedure TDM_Mebeli.IB_Vidy_rabot_stoimostiNewRecord(DataSet: TDataSet);
begin
  IB_Vidy_rabot_stoimosti.FieldByName('ID_VID_RABOT').Value:=IB_Vidy_rabot.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Gotov_prod_0NewRecord(DataSet: TDataSet);
begin
  IB_Gotov_prod_0.FieldByName('ID_GRUPA').Value:=IB_Gotov_prod_grupa.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Peremeschenie_detaliNewRecord(DataSet: TDataSet);
begin
  IB_Peremeschenie_detali.FieldByName('ID_PARENT').Value:=IB_Peremeschenie_0.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Peremeschenie_furnituraNewRecord(
  DataSet: TDataSet);
begin
  IB_Peremeschenie_furnitura.FieldByName('ID_PARENT').Value:=IB_Peremeschenie_0.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Peremeschenie_listyNewRecord(DataSet: TDataSet);
begin
  IB_Peremeschenie_listy.FieldByName('ID_PARENT').Value:=IB_Peremeschenie_0.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Spisanie_detaliCalcFields(DataSet: TDataSet);
begin
  IF IB_Spisanie_detali.FieldByName('OPLATA').AsInteger=0 Then
    IB_Spisanie_detali.FieldByName('OPLATA_NAME').Value:='НЕТ'
  ELSE
    IB_Spisanie_detali.FieldByName('OPLATA_NAME').Value:='ДА'
end;//proc

procedure TDM_Mebeli.IB_Spisanie_detaliNewRecord(DataSet: TDataSet);
begin
  IB_Spisanie_detali.FieldByName('ID_PARENT').Value:=IB_Spisanie_0.FieldByName('ID').AsInteger;
  IB_Spisanie_detali.FieldByName('OPLATA').Value:=0;
end;//proc

procedure TDM_Mebeli.IB_Spisanie_furnituraNewRecord(DataSet: TDataSet);
begin
  IB_Spisanie_furnitura.FieldByName('ID_PARENT').Value:=IB_Spisanie_0.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Spisanie_listyNewRecord(DataSet: TDataSet);
begin
  IB_Spisanie_listy.FieldByName('ID_PARENT').Value:=IB_Spisanie_0.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Pilomat_listyDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  ShowMessage('Удалить нельзя! Запись используется в других документах');
end;//proc

procedure TDM_Mebeli.IB_Akt_raspil_ostatokDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  ShowMessage('Удалить нельзя! Запись используется в других документах');
end;//proc

procedure TDM_Mebeli.IB_Akt_raspilDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  ShowMessage('Удалить нельзя! Запись используется в других документах');
end;//proc

procedure TDM_Mebeli.IB_Peremeschenie_furnituraBeforePost(
  DataSet: TDataSet);
var
  kolvo_furnitura: double;
begin
  F_Main.IBQuery1.Close;
  F_Main.IBQuery1.SQL.Clear;
  F_Main.IBQuery1.SQL.Add('select FURNITURA_OSTATOK from FURNITURA_OSTATOK(:id_furnitura, :id_sklad, :period_end)');
  F_Main.IBQuery1.ParamByName('id_furnitura').Value:=IB_Peremeschenie_furnitura.FieldByName('id_furnitura').AsInteger;
  F_Main.IBQuery1.ParamByName('id_sklad').Value:=IB_Peremeschenie_0.FieldByName('id_sklad_otkuda').AsInteger;
  F_Main.IBQuery1.ParamByName('period_end').Value:=Date;
  F_Main.IBQuery1.Open;
  IF IB_Peremeschenie_furnitura.FieldByName('id_furnitura').AsInteger=IB_Peremeschenie_furnitura.FieldByName('id_furnitura').OldValue Then
    kolvo_furnitura:=IB_Peremeschenie_furnitura.FieldByName('kol_vo').OldValue+F_Main.IBQuery1.FieldByName('furnitura_ostatok').AsFloat
  ELSE
    kolvo_furnitura:=F_Main.IBQuery1.FieldByName('furnitura_ostatok').AsFloat;
  IF IB_Peremeschenie_furnitura.FieldByName('kol_vo').AsFloat> kolvo_furnitura Then
    begin
      ShowMessage('На складе не хватает комплектующих. В наличии только '+FloatToStr(kolvo_furnitura));
      Abort;
    end;
end;//proc

procedure TDM_Mebeli.IB_Spisanie_listyBeforePost(DataSet: TDataSet);
var kolvo_listy: integer;
begin
  kolvo_listy:=F_Main.Kolvo_listov_na_sklade(IB_Spisanie_listy.FieldByName('id_pilomat_listy').AsInteger, IB_Spisanie_0.fieldByName('date_spis').AsDateTime, IB_Spisanie_0.fieldByName('id_sklad').AsInteger);
  IF IB_Spisanie_listy.FieldByName('kol_vo').AsInteger > kolvo_listy Then
    begin
      ShowMessage('На складе не хватает листов. В наличии только '+FloatToStr(kolvo_listy));
      Abort;
    end;//IF
end;//proc

procedure TDM_Mebeli.IB_Peremeschenie_listyBeforePost(DataSet: TDataSet);
var kolvo_listy: integer;
begin
  kolvo_listy:=F_Main.Kolvo_listov_na_sklade(IB_peremeschenie_listy.FieldByName('id_pilomat_listy').AsInteger, IB_peremeschenie_0.fieldByName('date_per').AsDateTime, IB_peremeschenie_0.fieldByName('id_sklad_otkuda').AsInteger);
  IF IB_Spisanie_listy.FieldByName('kol_vo').AsInteger > kolvo_listy Then
    begin
      ShowMessage('На складе не хватает листов. В наличии только '+FloatToStr(kolvo_listy));
      Abort;
    end;//IF
end;//proc


procedure TDM_Mebeli.IB_OSTATOK_DETALI_VIDRABOTCalcFields(
  DataSet: TDataSet);
begin
IF IB_OSTATOK_DETALI_VIDRABOT.FieldByName('ID_VID_RABOT').IsNull or IB_OSTATOK_DETALI_VIDRABOT.FieldByName('ID_PILOMAT_DETALI').IsNull Then
  IB_OSTATOK_DETALI_VIDRABOT.FieldByName('NEW_OSTATOK').Value:=0
ELSE
  IB_OSTATOK_DETALI_VIDRABOT.FieldByName('NEW_OSTATOK').Value:=F_Main.Kolvo_detali_na_etape(IB_OSTATOK_DETALI_VIDRABOT.FieldValues['ID_VID_RABOT'], IB_OSTATOK_DETALI_VIDRABOT.FieldValues['ID_PILOMAT_DETALI'], DateToStr(Date), false);
end;

procedure TDM_Mebeli.IB_OSTATOK_DETALI_VIDRABOTAfterInsert(
  DataSet: TDataSet);
begin
  IB_OSTATOK_DETALI_VIDRABOT.FieldByName('DATE_OST').Value:='01.01.2000';
  IB_OSTATOK_DETALI_VIDRABOT.FieldByName('ID_SKLAD').Value:=sklad_detali;
end;

procedure TDM_Mebeli.IB_Pilomat_detali_furnNewRecord(DataSet: TDataSet);
begin
  IB_Pilomat_detali_furn.FieldByName('ID_DETALI').Value:=IB_Pilomat_detali.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Akt_vip_rabot_1CalcFields(DataSet: TDataSet);
var ib_tmp:TIBDataSet;
begin
  IF IB_Akt_vip_rabot_1.FieldByName('ID_GOTOV_PROD').IsNull Then exit;
  ib_tmp:=TIBDataSet.Create(nil);
  ib_tmp.Database:=IB_Sklad.Database;
  ib_tmp.SelectSQL.Add('select gpg.name as name from gotov_prod_grupa as gpg, gotov_prod_0 as gp0 where (gpg.id=gp0.id_grupa) and (gp0.id='+IB_Akt_vip_rabot_1.FieldByName('id_gotov_prod').AsString+')');
  ib_tmp.open;
  IB_Akt_vip_rabot_1.FieldByName('GRUPA_NAME').Value:=ib_tmp.FieldByName('name').AsString;
  ib_tmp.Close;
  ib_tmp.Free;
end;//proc

procedure TDM_Mebeli.IB_Contragenty_1NewRecord(DataSet: TDataSet);
begin
  IB_Contragenty_1.FieldByName('id_parent').Value:=IB_Contragenty_0.FieldByName('id').AsInteger;
end;

procedure TDM_Mebeli.IB_Akt_raspil_listyPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  trigger_error(E.Message);
  Action:=daAbort;
end;//proc

procedure TDM_Mebeli.IB_GOTOV_PROD_VIDRABOTNewRecord(DataSet: TDataSet);
begin
  IB_Gotov_prod_vidrabot.FieldByName('ID_GOTOV_PROD').Value:=IB_Gotov_prod_0.FieldByName('ID').AsInteger;
end;//proc

procedure TDM_Mebeli.IB_Pilomat_detaliDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  IF (Pos('FOREIGN KEY',E.Message)>0) or (Pos('null',E.Message)>0) Then
    begin
      ShowMessage('Удалить нельзя! Используется в других документах');
      Action:=daAbort;
    end;
end;//proc
procedure TDM_Mebeli.IB_Spisanie_0PostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  trigger_error(E.Message);
  Action:=daAbort;
end;//proc

procedure TDM_Mebeli.IB_Spisanie_0DeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  trigger_error(E.Message);
  Action:=daAbort;
end;//proc

procedure TDM_Mebeli.IB_Spisanie_detaliPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  trigger_error(E.Message);
  Action:=daAbort;
end;//proc

procedure TDM_Mebeli.IB_Spisanie_listyPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  trigger_error(E.Message);
  Action:=daAbort;
end;//proc

procedure TDM_Mebeli.IB_Rashod_detaliPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  trigger_error(E.Message);
  Action:=daAbort;
end;//proc

procedure TDM_Mebeli.IB_Akt_vip_prod_0PostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  trigger_error(E.Message);
  Action:=daAbort;
end;//proc

procedure TDM_Mebeli.IB_Rashod_furnituraPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  trigger_error(E.Message);
  Action:=daAbort;
end;//proc

procedure TDM_Mebeli.IB_Peremeschenie_furnituraPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  trigger_error(E.Message);
  Action:=daAbort;
end;//proc


procedure TDM_Mebeli.IB_Peremeschenie_detaliPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  trigger_error(E.Message);
  Action:=daAbort;
end;//proc

procedure TDM_Mebeli.IB_Prihod_furnitura_1PostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  trigger_error(E.Message);
  Action:=daAbort;
end;//proc

procedure TDM_Mebeli.IB_Prihod_furnitura_0PostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  trigger_error(E.Message);
  Action:=daAbort;
end;

procedure TDM_Mebeli.IB_Prihod_detali_1PostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  trigger_error(E.Message);
  Action:=daAbort;
end;

procedure TDM_Mebeli.IB_Prihod_detali_0PostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  trigger_error(E.Message);
  Action:=daAbort;
end;

procedure TDM_Mebeli.IB_Akt_vip_rabot_0PostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  trigger_error(E.Message);
  Action:=daAbort;
end;

procedure TDM_Mebeli.IB_Akt_vip_rabot_detaliPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  trigger_error(E.Message);
  Action:=daAbort;
end;

procedure TDM_Mebeli.IB_Prihod_furnitura_1CalcFields(DataSet: TDataSet);
var ib_tmp:TIBDataSet;
begin
  IF IB_Prihod_furnitura_1.FieldByName('ID_FURNITURA').IsNull Then exit;
  ib_tmp:=TIBDataSet.Create(nil);
  ib_tmp.Database:=IB_Sklad.Database;
  ib_tmp.SelectSQL.Add('select name from furnitura_grupa where id=(select id_parent from furnitura where id=:id_furnitura)');
  ib_tmp.ParamByName('id_furnitura').Value:=IB_Prihod_furnitura_1.FieldByname('id_furnitura').AsInteger;
  ib_tmp.open;
  IB_Prihod_furnitura_1.FieldByName('GRUPA_NAME').Value:=ib_tmp.FieldByName('name').AsString;
  ib_tmp.Free;
end;//proc

procedure TDM_Mebeli.IB_Spisanie_furnituraPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  trigger_error(E.Message);
end;

procedure TDM_Mebeli.IB_Peremeschenie_listyPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  trigger_error(E.Message);
  Action:=daAbort;
end;

procedure TDM_Mebeli.IB_Peremeschenie_furnituraCalcFields(
  DataSet: TDataSet);
var ib_tmp:TIBDataSet;
begin
  IF IB_Peremeschenie_furnitura.FieldByName('ID_FURNITURA').IsNull Then exit;
  ib_tmp:=TIBDataSet.Create(nil);
  ib_tmp.Database:=IB_Sklad.Database;
  ib_tmp.SelectSQL.Add('select name from furnitura_grupa where id=(select id_parent from furnitura where id=:id_furnitura)');
  ib_tmp.ParamByName('id_furnitura').Value:=IB_Peremeschenie_furnitura.FieldByname('id_furnitura').AsInteger;
  ib_tmp.open;
  IB_Peremeschenie_furnitura.FieldByName('GRUPA_NAME').Value:=ib_tmp.FieldByName('name').AsString;
  ib_tmp.Free;
end;//proc

procedure TDM_Mebeli.IB_Akt_raspil_ostatokBeforePost(DataSet: TDataSet);
begin
  if IB_Akt_raspil_ostatok.FieldByName('Razmer_X').IsNull then
    exit;
  IB_Akt_raspil_ostatok.FieldByName('name').Value:=F_Akt_raspil_edit.IB_Akt_raspil_listy.FieldByName('grupa_name').AsString+' '+IB_Akt_raspil_ostatok.FieldByName('Razmer_X').AsString+
    'x'+IB_Akt_raspil_ostatok.FieldByName('Razmer_Y').AsString;
end;

procedure TDM_Mebeli.IB_Prihod_furnitura_1AfterPost(DataSet: TDataSet);
begin
  F_Main.IBQuery1.Close;
  F_Main.IBQuery1.SQL.Clear;
  F_Main.IBQuery1.SQL.Add('select sum(summa) summa from prihod_furnitura_1 where id_parent='+DM_Mebeli.IB_prihod_furnitura_0.FieldByName('id').AsString);
  F_Main.IBQuery1.Open;
  F_prihod_furnitura_edit.E_Itogo.Text:=F_Main.IBQuery1.FieldByName('summa').AsString;
  F_Main.IBQuery1.Close;
end;

procedure TDM_Mebeli.IB_Prihod_listy_1AfterPost(DataSet: TDataSet);
begin
  F_Main.IBQuery1.Close;
  F_Main.IBQuery1.SQL.Clear;
  F_Main.IBQuery1.SQL.Add('select sum(summa) summa from prihod_listy_1 where id_parent='+DM_Mebeli.IB_prihod_listy_0.FieldByName('id').AsString);
  F_Main.IBQuery1.Open;
  F_Prihod_listy_edit.E_Itogo.Text:=F_Main.IBQuery1.FieldByName('summa').AsString;
  F_Main.IBQuery1.Close;
end;

procedure TDM_Mebeli.IB_Prihod_listy_1CalcFields(DataSet: TDataSet);
var ib_tmp:TIBDataSet;
begin
  IF IB_Prihod_listy_1.FieldByName('ID_LISTY').IsNull Then exit;
  ib_tmp:=TIBDataSet.Create(nil);
  ib_tmp.Database:=IB_Sklad.Database;
  ib_tmp.SelectSQL.Add('select pg.name as grupa_name, pl.name listy_name from pilomat_grupa pg, pilomat_listy pl where (pg.id=pl.id_grupa) and (pl.id= :id_listy)');
  ib_tmp.ParamByName('id_listy').Value:=IB_Prihod_listy_1.FieldByName('ID_LISTY').AsInteger;
  ib_tmp.open;
  IB_Prihod_listy_1.FieldByName('GRUPA_NAME').Value:=ib_tmp.FieldByName('grupa_name').AsString;
  IB_Prihod_listy_1.FieldByName('LISTY_NAME').Value:=ib_tmp.FieldByName('listy_name').AsString;
  ib_tmp.close;
  ib_tmp.Free;
end;//proc

procedure TDM_Mebeli.IB_Akt_vip_prod_1CalcFields(DataSet: TDataSet);
var
         article: integer;
  gotovprod_name: string;
      grupa_name: string;
begin
  get_gotovprod_name(IB_Akt_vip_prod_1.FieldByname('id_gotov_prod').AsInteger, article, gotovprod_name, grupa_name);
  IB_Akt_vip_prod_1.FieldByname('article').Value:=article;
  IB_Akt_vip_prod_1.FieldByname('gotovprod_name').Value:=gotovprod_name;
  IB_Akt_vip_prod_1.FieldByname('grupa_name').Value:=grupa_name;
end;

end.
