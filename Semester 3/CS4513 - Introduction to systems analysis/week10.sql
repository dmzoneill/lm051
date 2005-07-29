 -- Q1
select SYS.EMP.JOB 
from SYS.EMP 
where SAL<=ALL 
(
  select SAL 
  FROM SYS.EMP 
);


 -- Q2
select a.DEPTNO 
from SYS.EMP a, SYS.DEPT b 
where a.DEPTNO = b.DEPTNO 
group by a.DEPTNO 
having sum(SAL) >= ALL 
(
  select sum(SAL)
  from SYS.EMP 
  group by DEPTNO
);


 -- Q3 job(s) ??
select JOB
from SYS.EMP
where SAL >= ALL
(
  select SAL
  from SYS.EMP
);


 -- Q4
select MGR 
from SYS.EMP
group by EMP.MGR
having count(EMP.MGR) >= ALL
( 
  select count(*) 
  from SYS.EMP
  group by EMP.MGR
);


 -- Q5 a
select a.ENAME, a.JOB
from SYS.EMP a, SYS.DEPT b
where a.DEPTNO = b.DEPTNO
and MGR = ANY
(
    select MGR 
    from SYS.EMP
    where JOB='CLERK' 
);


 -- Q5 b
select ENAME, JOB
from SYS.EMP 
where EMPNO in
(
  select EMPNO
  from SYS.EMP
  where MGR in
  (
    select MGR
    from SYS.EMP
    where JOB='CLERK' 
  )
);


 -- Q6 a & b
select a.ENAME, b.LOC
from SYS.EMP a, SYS.DEPT b
where a.DEPTNO = b.DEPTNO
and MGR in
(
  select MGR 
  from SYS.EMP
  where JOB='CLERK'
  or JOB='SALESMAN'
);


 -- Q6 c
select a.ENAME, b.LOC
from SYS.EMP a, SYS.DEPT b
where a.DEPTNO = b.DEPTNO
and (JOB='CLERK' or JOB='SALESMAN')
and exists
(
  select MGR 
  from SYS.EMP
  where JOB='CLERK'
  or JOB='SALESMAN'
);


 -- Q7
select EMPNO 
from SYS.EMP 
where SAL in 
(
  select min(SAL) 
  from SYS.EMP 
  group by DEPTNO
);


 --Q8
select ENAME, JOB, SAL 
from SYS.EMP 
where SAL in 
(
  select max(SAL) 
  from SYS.EMP 
  group by JOB
);
