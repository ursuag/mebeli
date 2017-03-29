select vip_prod.id_gotov_prod, vip_prod.kol_vo, sebest_suma.summa summa_materialy
from (
select avp1.id_gotov_prod, avp1.kol_vo
from akt_vip_prod_0 avp0, akt_vip_prod_1 avp1
where (avp0.date_a>coalesce((select max(date_doc) from calc_sebest_0 where date_doc<:date_sebest),'2000-01-01'))
and (avp0.nomer=avp1.id_parent)) vip_prod
left join
(select sebest.id_gotovprod id_gotovprod, sum(sebest.summa) summa
from GET_SUMMA_FOR_SEBEST(current_date) sebest
where sebest.id_statya_rashoda is null
group by sebest.id_gotovprod) sebest_suma
on sebest_suma.id_gotovprod=vip_prod.id_gotov_prod


*******

select first 1 prl0.id_contragent id_contragent, coalesce(prl1.summa,0)/(prl1.kol_vo*pl.area/1000000.000) as tsena_m2
from prihod_listy_0 prl0, prihod_listy_1 prl1, pilomat_listy pl
where (prl0.id=prl1.id_parent) and (prl1.id_listy=pl.id)
and (prl1.id_listy=
( select first 1 arl.id_pilomat_listy
from akt_raspil_listy arl, pilomat_listy pl
where (arl.id_parent=:id_raspil) and (pl.id=arl.id_pilomat_listy)
order by pl.islist desc ) )
and (prl0.date_p<=(select date_r from akt_raspil where id=:id_raspil))
order by prl0.date_p desc


select 3 as TIP_MATERIALA, grupa_name||' / '||furnitura_name as name, FURNITURA_OSTATOK +
(select FURNITURA_OSTATOK as kol_vo
from FURNITURA_OSTATOK(:id_furnitura,4,:period_end)) as kol_vo
from FURNITURA_OSTATOK(:id_furnitura,3,:period_end)

//***********

select id_grupa, name_tovar,  sum(kol_vo) from (
select g.id id_grupa, g.name name_tovar, sum((select coalesce(LIST_OSTATOK,0) from OSTATOK_LIST(l.id,1,:period_end))*l.area/1000000.000) as kol_vo
from pilomat_grupa g, pilomat_listy l
where (g.id=l.id_grupa)
group by 1,2
having sum((select coalesce(LIST_OSTATOK,0) from OSTATOK_LIST(l.id,1,:period_end))*l.area/1000000.000)>0

union all

select g.id id_grupa, g.name name_tovae, sum((select coalesce(LIST_OSTATOK,0) from OSTATOK_LIST(l.id,2,:period_end))*l.area/1000000.000) as kol_vo
from pilomat_grupa g, pilomat_listy l
where (g.id=l.id_grupa)
group by 1,2
having sum((select coalesce(LIST_OSTATOK,0) from OSTATOK_LIST(l.id,2,:period_end))*l.area/1000000.000)>0

union all

select g.id id_grupa, g.name name_tovar, sum((select coalesce(LIST_OSTATOK,0) from OSTATOK_LIST(l.id,3,:period_end))*l.area/1000000.000) as kol_vo
from pilomat_grupa g, pilomat_listy l
where (g.id=l.id_grupa)
group by 1,2
having sum((select coalesce(LIST_OSTATOK,0) from OSTATOK_LIST(l.id,3,:period_end))*l.area/1000000.000)>0
)
group by id_grupa, name_tovar

//*****************
select g0.name, pd.name detali_name, g1.kol_vo as detali_kolvo, 'Detali'
from gotov_prod_0 g0, gotov_prod_1 g1, pilomat_detali pd
where (g0.id=:idgotovprod) and (g1.id_parent=g0.id) and (g1.id_detali=pd.id)

union all

select g0.name, f.name furnitura_name, g2.kol_vo as furnitura_kolvo, 'Furnitura'
from gotov_prod_0 g0, gotov_prod_2 g2, furnitura f
where (g0.id=:idgotovprod) and (g2.id_parent=g0.id) and (g2.id_furnitura=f.id)

union all

select g0.name, vr.name vidrabot_name, '0' as kolvo, 'Rabota'
from gotov_prod_0 g0, GOTOV_PROD_VIDRABOT gv, vidy_rabot vr
where (g0.id=:idgotovprod) and (gv.id_gotov_prod=g0.id) and (gv.id_vid_rabot=vr.id)