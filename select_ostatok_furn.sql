execute block
returns (sklad_name varchar(200),
        article integer,
        grupa_name varchar(200),
        furnitura_name varchar(200),
        kol_vo numeric(15,3))
as
declare variable id_sklad integer;

declare sklad_list cursor for (select id, name from sklad);
begin
open sklad_list;
while (1=1) do
    begin
    fetch sklad_list into :id_sklad, :sklad_name;
    if (row_count=0) then leave;
    for
        select :sklad_name, f.article, ost.grupa_name,  ost.FURNITURA_NAME, ost.furnitura_ostatok
        from FURNITURA_OSTATOK(null,:id_sklad,'2017-03-31') ost, furnitura f
        where ost.id_furnitura_out=f.id

        into :sklad_name, :article, :grupa_name, :furnitura_name,  :kol_vo
    do
    suspend;
    end
end

