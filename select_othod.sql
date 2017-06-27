execute block
as
declare variable id_raspil integer;
declare variable othody_m2 numeric(18,4);
declare variable summa numeric(15,2);
declare variable othod_prc numeric(15,2);
declare akty_raspila cursor for (select id from akt_raspil);
begin
open akty_raspila;
while (1=1) do
    begin
    fetch akty_raspila into :id_raspil;
    if (row_count=0) then leave;
    for
        select (sum(area_listy)-sum(area_detali))/1000000.000 othody_m2,
        (sum(area_listy)-sum(area_detali))/1000000.000* (

        select cast(sum(summa)/sum(area) as numeric(15,3)) from (
        select l.area*arlp.kol_vo/1000000.000 area, arlp.summa summa
        from AKT_RASPIL_listy_price as arlp, pilomat_grupa as g, pilomat_listy as l
        where (arlp.id_pilomat_listy=l.id) and (l.id_grupa=g.id) and ((select id_parent from akt_raspil_listy where id=arlp.id_parent)=:id_raspil)
        order by l.name )


        ) as summa,
        cast((sum(area_listy)-sum(area_detali)) as numeric(15,3))/cast(sum(area_listy) as numeric(15,3))*100 othod_prc
        from (
        select arl.id_pilomat_listy, arl.kol_vo, (select area from pilomat_listy where id=arl.id_pilomat_listy)*arl.kol_vo area_listy, 0 area_detali
        from akt_raspil_listy arl
        where arl.id_parent=:id_raspil

        union all

        select ard.id_pilomat_detali, ard.kol_vo, 0 area_listy, (select area from pilomat_detali where id=ard.id_pilomat_detali)*ard.kol_vo area_detali
        from akt_raspil_detali ard
        where ard.id_parent=:id_raspil

        union all

        select aro.id_pilomat_listy, aro.kol_vo, 0 area_listy, (select area from pilomat_listy where id=aro.id_pilomat_listy)*aro.kol_vo area_detali
        from akt_raspil_ostatok aro
        where aro.id_parent=:id_raspil)

         into :othody_m2, :summa, :othod_prc
    do
        update akt_raspil
        set othod=:othod_prc, othod_summa=:summa, othod_m2=:othody_m2 where id=:id_raspil;
    end
        suspend;
end