 -- Q1
select HIREDATE 
from SYS.EMP 
where SAL = (SELECT max(SAL) from SYS.EMP); 

 -- Q2
select JOB 
from SYS.EMP 
where SAL = (SELECT min(SAL) from SYS.EMP);

 -- Q3
select count(*) 
from SYS.EMP 
where SAL > (select avg(SAL) from SYS.EMP);

 -- Q4
select count(*) 
from SYS.EMP 
where SAL > (select avg(SAL)*2 from SYS.EMP);

 -- Q5
select b.DNAME 
from SYS.EMP a, SYS.DEPT b 
where a.DEPTNO = b.DEPTNO 
and SAL = (select min(SAL) from SYS.EMP);

 -- Q6
select b.LOC 
from SYS.EMP a, SYS.DEPT b 
where a.DEPTNO = b.DEPTNO 
and HIREDATE = (select max(HIREDATE) from SYS.EMP);

 -- Q7
select a.DEPTNO 
from SYS.EMP a, SYS.DEPT b 
where a.DEPTNO = b.DEPTNO 
group by a.DEPTNO 
having sum(SAL) = (select max(sum(SAL)) from SYS.EMP group by DEPTNO);

 -- Q8
select LOC as "Biggest Department" 
from SYS.EMP,SYS.DEPT 
where SYS.EMP.DEPTNO = SYS.DEPT.DEPTNO
group by DEPT.LOC 
having count(DEPT.LOC) =
( 
  select max(count) from
  ( 
     select count(*) count, DEPT.LOC from SYS.EMP,SYS.DEPT 
     where SYS.EMP.DEPTNO = SYS.DEPT.DEPTNO 
     group by DEPT.LOC
  )
);

 -- Q9
select MGR as "Most Employees" 
from SYS.EMP
group by EMP.MGR
having count(EMP.MGR) =
( 
  select max(count) from
  ( 
     select count(*) count from SYS.EMP
     group by EMP.MGR
  )
);


 -- Q10
 -- select MGR, ENAME as "Most Employees" 
 -- from SYS.EMP
 -- group by EMP.MGR, ENAME
 -- having count(EMP.MGR) =
 --( 
 -- select max(count) from
 -- ( 
 --    select count(*) count from SYS.EMP
 --    group by EMP.MGR
 -- )
 -- );

 -- select * from SYS.EMP where ENAME not like 'S%' and ENAME not like 'J%';

 -- Q11
select SYS.DEPT.DNAME from SYS.DEPT where SYS.DEPT.DEPTNO not in (select SYS.EMP.DEPTNO from SYS.EMP);
select SYS.DEPT.DNAME from SYS.DEPT where SYS.DEPT.DEPTNO not in (select SYS.EMP.DEPTNO from SYS.EMP);

 -- Q16
select SYS.DEPT.DEPTNO, SYS.DEPT.DNAME from SYS.DEPT join SYS.EMP on SYS.DEPT.DEPTNO = SYS.EMP.DEPTNO where HIREDATE between '01-JAN-82' and '31-DEC-82';

 -- Q17

 -- Q18
select distinct SYS.DEPT.DNAME, SYS.DEPT.LOC from SYS.DEPT join SYS.EMP on SYS.DEPT.DEPTNO = SYS.EMP.DEPTNO where ENAME like 'S%' or ENAME like 'J%';

 
