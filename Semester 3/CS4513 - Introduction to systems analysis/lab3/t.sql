 --tables

drop table Services;
drop table Clients;
drop table Workers;


Create Table Clients
(
Cnum varchar2(4) primary key,
Firstname varchar2(16) not null,
Surname varchar2(16) not null,
City varchar2(12) not null
);

Create Table Workers
(
Wnum varchar2(4) primary key,
Wname varchar2(10) not null,
DOB date not null check(DOB < '31-Dec-1990'),
City varchar2(12) not null
);

Create Table Services
(
Cnum varchar2(4) not null,
Wnum varchar2(4) not null,
Adate date not null,
Fee number(4) not null,
Duration number(3) not null check (Duration <= 120),
Constraint PKSer Primary key (Cnum, Wnum, Adate),
Constraint FK1 Foreign key (Cnum) references Clients,
Constraint FK2 Foreign key (Wnum) references Workers
);

 -- create public synonym Clients for Clients;
 -- create public synonym Services for Services;
 -- create public synonym Workers for Workers;



