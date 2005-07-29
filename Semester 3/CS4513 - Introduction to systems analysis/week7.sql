 -- Q1
select * from SYS.DEPT, SYS.EMP;
 -- Q2 not sure if it should be DNAME, or LOC 'place of work'
select SYS.EMP.ENAME, SYS.EMP.EMPNO, SYS.DEPT.LOC from SYS.DEPT, SYS.EMP where SYS.DEPT.DEPTNO = SYS.EMP.DEPTNO;
 -- Q3
select SYS.EMP.ENAME, SYS.DEPT.LOC from SYS.DEPT, SYS.EMP where SYS.DEPT.DEPTNO = SYS.EMP.DEPTNO and SYS.DEPT.LOC='NEW YORK';
 -- Q4
select SYS.EMP.ENAME, SYS.DEPT.LOC from SYS.DEPT, SYS.EMP where SYS.DEPT.DEPTNO = SYS.EMP.DEPTNO and (SYS.DEPT.LOC='NEW YORK' or SYS.DEPT.LOC='DALLAS');
 -- Q5
select distinct JOB from SYS.DEPT, SYS.EMP where SYS.DEPT.DEPTNO = SYS.EMP.DEPTNO and SYS.DEPT.LOC='DALLAS';
 -- Q6
select count(*) from SYS.DEPT, SYS.EMP where SYS.DEPT.DEPTNO = SYS.EMP.DEPTNO and SYS.DEPT.LOC='CHICAGO' and JOB='SALESMAN';
 -- Q7
select sum(SAL) from SYS.DEPT, SYS.EMP where SYS.DEPT.DEPTNO = SYS.EMP.DEPTNO and DNAME='RESEARCH';
 -- Q8
select distinct LOC, sum(sal) from SYS.DEPT, SYS.EMP where SYS.DEPT.DEPTNO = SYS.EMP.DEPTNO group by LOC;
 -- Q9
select ENAME, DNAME || ' ' || JOB from SYS.DEPT, SYS.EMP  where SYS.DEPT.DEPTNO = SYS.EMP.DEPTNO;
 -- Q10
select round(avg(SAL),2) from SYS.EMP;
 -- Q11 norah you put 'like' up on the black board
select distinct DNAME from SYS.DEPT, SYS.EMP  where SYS.DEPT.DEPTNO = SYS.EMP.DEPTNO and HIREDATE like '%80';
 -- Q12
select round(avg(SAL)*0.89,2) from SYS.DEPT, SYS.EMP where SYS.DEPT.DEPTNO = SYS.EMP.DEPTNO and DNAME='SALES';
 -- Q13
select DNAME, round(avg(SAL)*1.1,0) from SYS.DEPT, SYS.EMP where SYS.DEPT.DEPTNO = SYS.EMP.DEPTNO group by DNAME;


