 -- Q4
select Surname, Wname, Clients.City
from Clients, Services, Workers
where Clients.Cnum = Services.Cnum
and Services.Wnum > Workers.Wnum
and Clients.City = Workers.City
order by Clients.City;
