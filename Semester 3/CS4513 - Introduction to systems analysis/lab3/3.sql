 -- Q3
select round(max(avg(Fee)),2) from 
Services, Clients
where Clients.Cnum = Services.Cnum
group by City;
