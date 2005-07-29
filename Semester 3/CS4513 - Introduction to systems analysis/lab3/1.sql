 -- Q1
select Wname,' in ', City 
from Workers, Services 
where Workers.Wnum = Services.Wnum
and (to_char(Services.ADATE,'D')='7'
or to_char(Services.ADATE,'D')='1');
