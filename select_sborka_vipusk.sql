select akt_rabota.id_zakaz, akt_rabota.id_gotov_prod, akt_rabota.kolvo_sborka, akt_vipusk.kol_vo_vipusk
from (
select avr0.id_zakaz, avr0.id_vid_rabot, avr1.id_gotov_prod, sum(avr1.kol_vo) kolvo_sborka
from akt_vip_rabot_0 avr0, akt_vip_rabot_1 avr1
where (avr0.nomer=avr1.id_parent) and (avr0.id_vid_rabot=12)
group by avr0.id_zakaz, avr0.id_vid_rabot, avr1.id_gotov_prod
) akt_rabota

left join

(select * from (
select avp0.id_zakaz, avp1.id.gotov_prod, sum(avp1.kol_vo) kol_vo_vipusk
from akt_vip_prod_0 avp0, akt_vip_prod_1 avp1
where (avp0.nomer=avp1.id_parent)
group by 1,2)) akt_vipusk

on (akt_rabota.id_zakaz=akt_vipusk.id_zakaz) and (akt_rabota.id_gotov_prod=akt_vipusk.id.gotov_prod)

where coalesce(akt_rabota.kolvo_sborka,0)<coalesce(akt_vipusk.kol_vo_vipusk,0)