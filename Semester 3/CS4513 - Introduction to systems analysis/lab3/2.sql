 -- Q2
select Wname AS "MJ Providers"
from Workers
where Wnum in
(
  select Wnum 
  from Clients, Services
  where Clients.Cnum = Services.Cnum
  and Firstname = 'Michael'
  and Surname = 'Jackson'
) 
order by Wname;





