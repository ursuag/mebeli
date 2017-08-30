select iif(pg.article is null, pg.id, pg.article) grupa_article, pg.name grupa_name, pl.name list_name,  list_ostatok.id_list, list_ostatok.kolvo_listov, list_ostatok.area_ostatok, list_ostatok.summa_ostatok
from
(
select id_list, sum(kol_vo) kolvo_listov, cast(sum(area_ostatok) as numeric(15,3)) area_ostatok, cast(sum(summa) as numeric(15,2)) summa_ostatok from (
select id_list, kol_vo, kol_vo*area_m2 area_ostatok, kol_vo*price_m2*area_m2 summa from GET_OSTATOK_PRIHOD_LISTY(null,1,current_date))
group by 1 ) list_ostatok,
pilomat_grupa pg, pilomat_listy pl
where (list_ostatok.id_list=pl.id) and (pl.id_grupa=pg.id)
order by 2,3

**********************
детали

select iif(pg.article is null, pg.id, pg.article) grupa_article, pg.name grupa_name, pd.name list_name,  list_ostatok.id_list, list_ostatok.kolvo_listov, list_ostatok.area_ostatok, list_ostatok.summa_ostatok
from

(
select id_list, sum(kol_vo) kolvo_listov, cast(sum(area_ostatok) as numeric(15,3)) area_ostatok, cast(sum(summa) as numeric(15,2)) summa_ostatok from (
select id_detali id_list, kol_vo, kol_vo*area_m2 area_ostatok, kol_vo*price summa from GET_OSTATOK_PRIHOD_DETALI(null,3,current_date))
group by 1 ) list_ostatok,

pilomat_grupa pg, pilomat_detali pd
where (list_ostatok.id_list=pd.id) and (pd.id_grupa=pg.id)
order by 2,3

*****************************
Группа пиломат

select grupa_article, grupa_name, sum(area_ostatok), sum(summa_ostatok) from
(
select iif(pg.article is null, pg.id, pg.article) grupa_article, pg.name grupa_name, pl.name list_name,  list_ostatok.id_list, list_ostatok.kolvo_listov, list_ostatok.area_ostatok, list_ostatok.summa_ostatok
from
(
select id_list, sum(kol_vo) kolvo_listov, cast(sum(area_ostatok) as numeric(15,3)) area_ostatok, cast(sum(summa) as numeric(15,2)) summa_ostatok from (
select id_list, kol_vo, kol_vo*area_m2 area_ostatok, kol_vo*price_m2*area_m2 summa from GET_OSTATOK_PRIHOD_LISTY(null,1,current_date))
group by 1 ) list_ostatok,
pilomat_grupa pg, pilomat_listy pl
where (list_ostatok.id_list=pl.id) and (pl.id_grupa=pg.id)

union all

select iif(pg.article is null, pg.id, pg.article) grupa_article, pg.name grupa_name, pd.name list_name,  list_ostatok.id_list, list_ostatok.kolvo_listov, list_ostatok.area_ostatok, list_ostatok.summa_ostatok
from

(
select id_list, sum(kol_vo) kolvo_listov, cast(sum(area_ostatok) as numeric(15,3)) area_ostatok, cast(sum(summa) as numeric(15,2)) summa_ostatok from (
select id_detali id_list, kol_vo, kol_vo*area_m2 area_ostatok, kol_vo*price summa from GET_OSTATOK_PRIHOD_DETALI(null,3,current_date))
group by 1 ) list_ostatok,

pilomat_grupa pg, pilomat_detali pd
where (list_ostatok.id_list=pd.id) and (pd.id_grupa=pg.id)
) pilomat_ostat
group by 1,2
order by 1

******************************************

Материалы

select ostat_furn.sklad_name, iif(f.article is null, f.id, f.article) articul, fg.name grupa_name, f.name furnitura_name, ostat_furn.KOL_VO, f.ed_izm, cast(ostat_furn.summa as numeric(15,2)) summa
from (
select 'Сборочный цех' sklad_name, ID_FURNITURA, KOL_VO, KOL_VO*PRICE summa from GET_OSTATOK_PRIHOD_FURNITURA(null,3,current_date)
  union all
select 'Склад-цех', ID_FURNITURA, KOL_VO, KOL_VO*PRICE summa from GET_OSTATOK_PRIHOD_FURNITURA(null,4,current_date)
  union all
select 'Склад-база', ID_FURNITURA, KOL_VO, KOL_VO*PRICE summa from GET_OSTATOK_PRIHOD_FURNITURA(null,5,current_date) ) ostat_furn,
furnitura_grupa fg, furnitura f
where (fg.id=f.id_parent) and (f.id=ostat_furn.ID_FURNITURA)
order by 1,3,4

