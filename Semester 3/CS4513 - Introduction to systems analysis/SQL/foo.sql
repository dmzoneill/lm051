-- EMPNO	NUMBER(4,0)	No	 - 	 -
-- ENAME	VARCHAR2(10)	Yes	- 	-
-- JOB	        VARCHAR2(9)	Yes	- 	-
-- MGR	        NUMBER(4,0)	Yes	- 	-
-- HIREDATE	DATE	        Yes	- 	-
-- SAL	        NUMBER(7,2)	No	- 	-
-- COMM	        NUMBER(7,2)	Yes	- 	-
-- DEPTNO	NUMBER(2,0)	No	- 	- 

 -- Q1
select * from SYS.EMP where JOB='CLERK' or JOB='ANALYST';
select * from SYS.EMP where JOB='CLERK' union select * from SYS.EMP where JOB='ANALYST';
 -- Q2
select * from SYS.EMP where JOB='CLERK' and DEPTNO='30';
select * from SYS.EMP where JOB='CLERK' intersect select * from SYS.EMP where DEPTNO='30';
 -- INTERSECT command will only return distinct values. 
 -- Q3
select SAL from SYS.EMP where JOB='SALESMAN' or JOB='ANALYST';
select SAL from SYS.EMP where JOB='SALESMAN' union select SAL from SYS.EMP where JOB='ANALYST';
 -- Only distinct 'union of sal'
 -- Q4
select DEPTNO from SYS.DEPT minus select distinct DEPTNO from SYS.EMP;
 -- Q5 ??
select distinct EMPNO from SYS.EMP where MGR>0;
 -- Q6
select * from SYS.EMP minus select * from SYS.EMP where MGR>0;
 -- Q7
select count(distinct MGR) from SYS.EMP where MGR>0; 
select count(distinct MGR) from SYS.EMP where JOB='CLERK';
 -- Q8
select count(MGR), MGR from SYS.EMP group by MGR;
 -- Q9
select distinct MGR, DEPTNO, count(MGR) from SYS.EMP group by MGR, DEPTNO order by DEPTNO asc;
 -- Q10
select distinct JOB, avg(SAL) from SYS.EMP where JOB!='MANAGER' and JOB!='PRESIDENT' group by JOB;
 -- Q11
select distinct MGR, avg(SAL) from SYS.EMP group by MGR having count(*)>1;
 -- Q12
 -- a1 (ZERO ROWS)
select distinct ENAME, SAL, MGR, count(MGR) from SYS.EMP group by ENAME, SAL, MGR having count(*)>2 order by SAL desc;
 -- a2 (ZERO ROWS)
select ENAME, SAL, count(distinct MGR) from SYS.EMP group by ENAME, SAL having count(*)>2 order by SAL desc;
 -- Q13
select JOB, count(distinct SAL), count(distinct MGR) from SYS.EMP group by JOB;
 -- Q14
 -- cheated with AS total, order by total DESC
select JOB, count(distinct SAL) as total from SYS.EMP group by JOB having count(*)>1 order by total desc;
 -- Q15
select ENAME, JOB, DEPTNO from SYS.EMP where HIREDATE not between '20-FEB-1981' and '01-MAY-1981' order by DEPTNO asc;
 -- Q16
select ENAME, SAL*2 from SYS.EMP;
 -- Q17
select ENAME, SAL*0.67 from SYS.EMP;
 -- Q18
select sum(SAL)*0.67 from SYS.EMP; 
