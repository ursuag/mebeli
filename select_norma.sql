//Старая программа
execute block
returns (gotovprod_name varchar(200),
        material_name varchar(200),
        kol_vo numeric(15,3),
        tip_materiala varchar(50) )
as
declare variable idgotovprod integer;
declare got_prod cursor for (select id from gotov_prod_0);
begin
open got_prod;
while (1=1) do
    begin
    fetch got_prod into :idgotovprod;
    if (row_count=0) then leave;
    for
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
        into :gotovprod_name, :material_name, :kol_vo, :tip_materiala
    do
    suspend;
    end
end