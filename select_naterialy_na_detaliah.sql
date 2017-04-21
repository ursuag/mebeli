select rabota.id_gotov_prod, gotovprod.grupa_name, gotovprod.gotovprod_name, rabota.id_zakaz, rabota.id_vid_rabot, (select name from vidy_rabot where id=rabota.id_vid_rabot), zakaz.kol_vo kolvo_zakaz, rabota.kol_vo rabota, coalesce(prodaja.kol_vo,0) prodaja
from (
select avr0.id_zakaz, avr0.id_vid_rabot, avr1.id_gotov_prod, sum(avr1.kol_vo) kol_vo
from akt_vip_rabot_0 avr0, akt_vip_rabot_1 avr1
where (avr0.nomer=avr1.id_parent) and (avr0.date_a<=:PERIOD_END)
group by 1,2,3) rabota

left join

(select prgp1.id_gotov_prod as id_gotovprod, prgp1.id_zakaz, sum(prgp1.kol_vo) as kol_vo
from PRODAJA_GOTOVPROD_0 as prgp0, PRODAJA_GOTOVPROD_1 as prgp1
where (prgp0.id=prgp1.id_parent) and (prgp0.date_pro<=:PERIOD_END)
group by 1,2) prodaja
on (rabota.id_gotov_prod=prodaja.id_gotovprod) and (rabota.id_zakaz=prodaja.id_zakaz)

left join

(select grupa_name, gotovprod_name, id_gotovprod from
(select gpg.name grupa_name, gp0.name gotovprod_name, gp0.id id_gotovprod from gotov_prod_grupa gpg, gotov_prod_0 gp0 where gpg.id=gp0.id_grupa)) gotovprod
on gotovprod.id_gotovprod=rabota.id_gotov_prod

left join
(select id_parent, id_gotov_prod, kol_vo from zakaz_1) zakaz
on (zakaz.id_parent=rabota.id_zakaz) and (zakaz.id_gotov_prod=rabota.id_gotov_prod)

where (rabota.kol_vo>prodaja.kol_vo) and (rabota.id_zakaz>0)

order by 1,4,5

***********************

select gotovprod.grupa_name, gotovprod.gotovprod_name, rabota.id_vid_rabot, (select name from vidy_rabot where id=rabota.id_vid_rabot), rabota.id_gotov_prod, rabota.kol_vo rabota, coalesce(prodaja.kol_vo,0) prodaja
from (
select avr0.id_vid_rabot, avr1.id_gotov_prod, sum(avr1.kol_vo) kol_vo
from akt_vip_rabot_0 avr0, akt_vip_rabot_1 avr1
where (avr0.nomer=avr1.id_parent) and (avr0.date_a<=:PERIOD_END)
group by 1,2) rabota

left join

(select prgp1.id_gotov_prod as id_gotovprod, sum(prgp1.kol_vo) as kol_vo
from PRODAJA_GOTOVPROD_0 as prgp0, PRODAJA_GOTOVPROD_1 as prgp1
where (prgp0.id=prgp1.id_parent) and (prgp0.date_pro<=:PERIOD_END)
group by 1) prodaja
on (rabota.id_gotov_prod=prodaja.id_gotovprod)

left join

(select grupa_name, gotovprod_name, id_gotovprod from
(select gpg.name grupa_name, gp0.name gotovprod_name, gp0.id id_gotovprod from gotov_prod_grupa gpg, gotov_prod_0 gp0 where gpg.id=gp0.id_grupa)) gotovprod
on gotovprod.id_gotovprod=rabota.id_gotov_prod

where (rabota.kol_vo>prodaja.kol_vo)

order by 1,2,3