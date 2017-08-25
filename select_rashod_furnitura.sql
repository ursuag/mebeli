select (select article from gotov_prod_0 where id=rf.id_gotov_prod) article,
(select name from gotov_prod_0 where id=rf.id_gotov_prod) gotovprod_name,
kolvo_furn,
(select coalesce(kol_vo,0) from GET_PRODAJA_GOTOVPROP_SIGN(rf.id_gotov_prod,:period_start,:period_end)) kolvo_otgruzka,
(select coalesce(sum(kol_vo),0) from zakaz_1 where id_gotov_prod=rf.id_gotov_prod) -
(select coalesce(kol_vo,0) from GET_PRODAJA_GOTOVPROP_SIGN(rf.id_gotov_prod,:period_start,:period_end)) zakaz_ostatok

from
(
select id_gotov_prod, sum(kol_vo) kolvo_furn
from rashod_furnitura
where (date_r>=:period_start) and (date_r<=:period_end) and (id_furnitura=:idfurnitura)
group by id_gotov_prod ) rf
order by gotovprod_name