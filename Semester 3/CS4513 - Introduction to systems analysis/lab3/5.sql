 -- Q5
select Surname, Wname
from Clients, Services, Workers
where Clients.Cnum = Services.Cnum
and Services.Wnum = Workers.Wnum
and Services.Adate != Services.Adate;

