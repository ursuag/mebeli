select (select name from pilomat_grupa where id=rr1.id_grupa), rr1.id, rr1.name,  rr1.razmer_xy,
rr2.id, rr2.name,  rr2.razmer_xy

from
(select pd0.id_grupa id_grupa, pd0.id id, pd0.name name, cast(pd0.razmer_x as varchar(50))||'x'||cast(pd0.razmer_y as varchar(50)) razmer_xy,
cast(pd0.razmer_y as varchar(50))||'x'||cast(pd0.razmer_x as varchar(50)) razmer_yx
from pilomat_detali pd0) rr1,
(select pd0.id_grupa id_grupa, pd0.id id, pd0.name name, cast(pd0.razmer_x as varchar(50))||'x'||cast(pd0.razmer_y as varchar(50)) razmer_xy,
cast(pd0.razmer_y as varchar(50))||'x'||cast(pd0.razmer_x as varchar(50)) razmer_yx
from pilomat_detali pd0) rr2
where ( (rr1.razmer_xy=rr2.razmer_xy) or (rr1.razmer_yx=rr2.razmer_xy) ) and (rr1.id_grupa=rr2.id_grupa) and (rr1.id<>rr2.id) and (rr1.razmer_xy='300x150')
