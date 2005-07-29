 -- Q1
select HIREDATE 
from SYS.EMP 
where SAL = 
(
  SELECT max(SAL) 
  from SYS.EMP
); 


 -- Q2
select JOB 
from SYS.EMP 
where SAL = 
(
  SELECT min(SAL) 
  from SYS.EMP
);


 -- Q3
select count(*) 
from SYS.EMP 
where SAL > 
(
  select avg(SAL) 
  from SYS.EMP
);


 -- Q4
select count(*) 
from SYS.EMP 
where SAL > 
(
  select avg(SAL)*2 
  from SYS.EMP
);


 -- Q5
select b.DNAME 
from SYS.EMP a, SYS.DEPT b 
where a.DEPTNO = b.DEPTNO 
and SAL = 
(
  select min(SAL) 
  from SYS.EMP
);


 -- Q6
select b.LOC 
from SYS.EMP a, SYS.DEPT b 
where a.DEPTNO = b.DEPTNO 
and HIREDATE = 
(
  select max(HIREDATE) 
  from SYS.EMP
);


 -- Q7
select a.DEPTNO 
from SYS.EMP a, SYS.DEPT b 
where a.DEPTNO = b.DEPTNO 
group by a.DEPTNO 
having sum(SAL) = 
(
  select max(sum(SAL)) 
  from SYS.EMP 
  group by DEPTNO
);


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
select ENAME as "Most Employees"
from SYS.EMP
where EMPNO = 
(
  select MGR 
  from SYS.EMP
  group by EMP.MGR
  having count(EMP.MGR) =
  ( 
   select max(count) from
   ( 
     select count(*) count from SYS.EMP
     group by EMP.MGR
   )
  )
);

 -- Q11 a
select SYS.DEPT.DNAME 
from SYS.DEPT
where SYS.DEPT.DNAME not in 
(
  select b.DNAME 
  from SYS.EMP a, SYS.DEPT b 
  where a.DEPTNO = b.DEPTNO
);


 -- Q11 b
select SYS.DEPT.DNAME 
from SYS.DEPT
where SYS.DEPT.DNAME not in 
(
  select b.DNAME 
  from SYS.EMP a, SYS.DEPT b 
  where a.DEPTNO = b.DEPTNO 
  and a.JOB='SALESMAN'
);


 -- Q11 c
select SYS.DEPT.DNAME 
from SYS.DEPT
where SYS.DEPT.DNAME not in 
(
  select b.DNAME from SYS.EMP a, SYS.DEPT b 
  where a.DEPTNO = b.DEPTNO 
  and a.JOB='ANALYST'
);


 -- Q12
select d.DNAME
from SYS.EMP c, SYS.DEPT d
where c.DEPTNO = d.DEPTNO
group by d.DNAME
having sum(SAL) = 
(
  select max(bestSal) from
  (
    select sum(sal) bestSal 
    from SYS.EMP a, SYS.DEPT b 
    where a.DEPTNO = b.DEPTNO 
    group by a.DEPTNO
  )
);


 -- Q13
select min(COMM) 
from SYS.EMP 
where COMM>0;


 -- Q14
select a.ENAME 
from SYS.EMP a, SYS.DEPT b 
where a.DEPTNO = b.DEPTNO
and a.JOB!='CLERK'
and b.LOC='DALLAS';


-- Q15
select b.ENAME
from SYS.EMP b
where b.JOB!='CLERK'
and b.DEPTNO = 
(
  select c.DEPTNO 
  from SYS.DEPT c 
  where c.LOC='DALLAS'
);


 -- Q16
select b.DNAME, b.DEPTNO
from SYS.DEPT b 
where b.DEPTNO in
(
  select DEPTNO
  from SYS.EMP 
  where HIREDATE 
  between '01-JAN-1982' 
  and '31-DEC-1982'
);


 -- Q17
select b.DNAME, b.DEPTNO
from SYS.EMP a, SYS.DEPT b 
where a.DEPTNO = b.DEPTNO
and HIREDATE 
between '01-JAN-1982' 
and '31-DEC-1982';


 -- Q18
select distinct b.DNAME, b.LOC 
from SYS.EMP a, SYS.DEPT b 
where a.DEPTNO = b.DEPTNO
and a.ENAME 
like 'S%' 
or a.ENAME 
like 'J%';


 -- Q19
select SYS.DEPT.DNAME, SYS.DEPT.LOC 
from SYS.DEPT
where DEPTNO in
(
  select DEPTNO 
  from SYS.EMP 
  where ENAME 
  not like 'S%' 
  or ENAME 
  not like 'J%'
); 


 -- Q20
select DNAME 
from SYS.DEPT
where SYS.DEPT.DEPTNO not in
(
  select DEPTNO 
  from SYS.EMP 
  where ENAME 
  not like 'S%' 
  and ENAME 
  not like 'J%'
); 

