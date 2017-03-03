select 'Выпуск продукции: ', (select name from pilomat_detali where id=rdp.id_pilomat_detali), rdp.summa
from rashod_detali rd, akt_vip_prod_0 avp0, rashod_detali_price rdp
where (rdp.id_parent=rd.id) and (rd.id_akt_vip_prod=avp0.nomer) and (avp0.id_zakaz=:id_zakaz) and (avp0.date_a<=:date_sebest)

union all

select 'Выпуск продукции: ',(select name from furnitura where id=rf.id_furnitura), rfp.summa
from rashod_furnitura rf, akt_vip_prod_0 avp0, rashod_furnitura_price rfp
where (rfp.id_parent=rf.id) and (rf.id_akt_vip_prod=avp0.nomer) and (avp0.id_zakaz=:id_zakaz) and (avp0.date_a<=:date_sebest)

union all

select 'Акт выполн работ: ',(select name from furnitura where id=rashf.id_furnitura), rashf.suma_furnitura
from akt_vip_prod_from_rash_furn rashf, akt_vip_prod_0 avp0, akt_vip_prod_1 avp1
where (rashf.id_akt_vip_prod1=avp1.id) and (avp0.id_zakaz=:id_zakaz) and (avp0.date_a<=:date_sebest) and 

(avp1.id_parent=avp0.nomer)

union all

select 'Списание: ',(select name from furnitura where id=spfp.id_furnitura), spfp.summa
from SPISANIE_FURNITURA_PRICE spfp, spisanie_furnitura spf, spisanie_0 sp0, statyi_rashoda str
where (sp0.date_spis>coalesce((select max(date_doc) from calc_sebest_0 where date_doc<:date_sebest),'2000-01-01'))
and (sp0.id=spf.id_parent) and (spfp.id_parent=spf.id) and (sp0.id_statya_rashoda=str.id) and (str.is_sebestoimosti=1)

union all

select 'Расход ', 'по банку', br.summa
from bank_rashod br, statyi_rashoda str
where (br.date_bank>coalesce((select max(date_doc) from calc_sebest_0 where date_doc<:date_sebest),'2000-01-01'))
and (br.id_statya_rashoda=str.id) and (str.is_sebestoimosti=1)

union all

select 'Расход ', 'по кассе', cr.summa
from cassa_rashod cr, statyi_rashoda str
where (cr.date_cas>coalesce((select max(date_doc) from calc_sebest_0 where date_doc<:date_sebest),'2000-01-01'))
and (cr.id_statya_rashoda=str.id) and (str.is_sebestoimosti=1)
*********************************

select rdp.id_pilomat_detali, rdp.summa
from rashod_detali rd, akt_vip_prod_0 avp0, rashod_detali_price rdp
where (rdp.id_parent=rd.id) and (rd.id_akt_vip_prod=avp0.nomer) and (avp0.id_zakaz=:id_zakaz) and (avp0.date_a<=:date_sebest)

union all

select rf.id_furnitura, rfp.summa
from rashod_furnitura rf, akt_vip_prod_0 avp0, rashod_furnitura_price rfp
where (rfp.id_parent=rf.id) and (rf.id_akt_vip_prod=avp0.nomer) and (avp0.id_zakaz=:id_zakaz) and (avp0.date_a<=:date_sebest)

union all

select rashf.id_furnitura, rashf.suma_furnitura
from akt_vip_prod_from_rash_furn rashf, akt_vip_prod_0 avp0, akt_vip_prod_1 avp1
where (rashf.id_akt_vip_prod1=avp1.id) and (avp0.id_zakaz=:id_zakaz) and (avp0.date_a<=:date_sebest) and (avp1.id_parent=avp0.nomer)

union all

select spfp.id_furnitura, spfp.summa
from SPISANIE_FURNITURA_PRICE spfp, spisanie_furnitura spf, spisanie_0 sp0, statyi_rashoda str
where (sp0.date_spis>coalesce((select max(date_doc) from calc_sebest_0 where date_doc<:date_sebest),'2000-01-01'))
and (sp0.id=spf.id_parent) and (spfp.id_parent=spf.id) and (sp0.id_statya_rashoda=str.id) and (str.is_sebestoimosti=1)

union all

select 'Расход по банку', br.summa
from bank_rashod br, statyi_rashoda str
where (br.date_bank>coalesce((select max(date_doc) from calc_sebest_0 where date_doc<:date_sebest),'2000-01-01'))
and (br.id_statya_rashoda=str.id) and (str.is_sebestoimosti=1)

union all

select 'Расход по кассе', cr.summa
from cassa_rashod cr, statyi_rashoda str
where (cr.date_cas>coalesce((select max(date_doc) from calc_sebest_0 where date_doc<:date_sebest),'2000-01-01'))
and (cr.id_statya_rashoda=str.id) and (str.is_sebestoimosti=1)