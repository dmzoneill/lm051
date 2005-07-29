 -- 0
select * from Workers;
select * from Clients;
select * from Services;

insert into Workers values ('W987','Patricia','21-Dec-1974','London');
insert into Services values ('C123','W987','21-Nov-2009',1000,100);

insert into Workers values ('W923','Dave','18-Jul-1973','Cork');
insert into Clients values ('C125','Norah','Power','Limerick');
insert into Services values ('C125','W923','22-Sep-2009',3000,110);
