 #오라클 예제
 
 --1번　아래의 내용을 참조하여 EMP_HW 테이블을 생성.
 CREATE TABLE EMP_DDL(
    EMPNO   NUMBER(4),
    ENAME   VARCHAR2(10),
    JOB     VARCHAR2(9),
    MGR     NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    DEPTNO NUMBER(2)
);

DESC EMP_DDL;


--2번
ALTER TABLE EMP_DDL
    ADD BIGO VARCHAR2(20);


--3번 BIGO열의 크기를 30으로 변경
ALTER TABLE EMP_DDL 
    MODIFY BIGO VARCHAR(30);
    
    
--4번 BIGO열 이름을 REMARK로 변경. 
ALTER TABLE EMP_DDL
RENAME COLUMN BIGO TO REMARK;


--5번 아래의 그림과 같이 데이터를 저장. 단 REMARK열은 NULL을 입력.
INSERT INTO EMP_DDL
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO, NULL
FROM EMP;





-----------------------------------------------------------------------------------------------------------------------------------


--1. emp 테이블에서 사원번호가 7902, 7698인 사원을 제외한 사원들의   모든 정보를 출력하는 SQL 작성.
SELECT * FROM EMP 
WHERE EMPNO NOT IN (7902,7698);


--2. emp 테이블에서 20번 부서에 속하는 사원에 대해서  이름의 길이 와 급여의 자릿수를 출력하는 SQL 작성.
SELECT LENGTH(ENAME), LENGTH(SAL)
FROM EMP
WHERE DEPTNO = 20;


--3. emp 테이블에서 10번 부서에 속하는 사원에 대한 급여(sal)를 출력하는  SQL을 작성.( 단, 출력시 $가 급여 앞에 나오도록 한다. 예를 들면 SMITH의 급여가  800 이라면 출력시  $800이 되어야 한다.)
SELECT SAL
FROM EMP
WHERE DEPTNO = 10;


--4. emp 테이블에서 부서별 사원수를 출력하는 SQL 작성.
SELECT E.DEPTNO AS "부서명", D.DNAME AS "부서이름", COUNT(E.EMPNO) AS "사원의 수" FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
GROUP BY E.DEPTNO, D.DNAME;


--5. emp 테이블을 참조하여  사원이름에 세번째 문자가 A인 사원의 이름을  출력하는 SQL을 작성. ( 사원이름만 출력)
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '__A%';


--6. SMITH 사원의 부서명을 출력하는 SQL 작성.    (EMP, DEPT  테이블을 이용 )
select ENAME, DNAME
from EMP, DEPT
where EMP.DEPTNO = DEPT.DEPTNO
AND EMP.ENAME='SMITH';


--7. sales 부서에 속하는 사원의 이름을 출력하는 SQL 작성.    (EMP, DEPT  테이블을 이용 )
SELECT ENAME
FROM EMP
WHERE DNAME = 'SALES';


--8. 커미션(comm)을 받지 않고 급여가 1600 이상인 사원의 사원이름, 부서명을    출력하는 SQL  작성.(EMP, DEPT  테이블을 이용 )
SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL >= 1600;


--9. 근무지별로 근무하는 사원의 수를 출력하는 SQL 작성.    (EMP, DEPT  테이블을 이용 )
SELECT D.LOC, COUNT(E.EMPNO)
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
GROUP BY D.LOC;


--10. MILLER와 같은 부서에 속하는 사원들의 이름과 입사일을 출력하는  SQL 작성. (  만약, MILLER의 정보가 출력이 되면 MILLER는 제외한다.)
 SELECT ENAME, HIREDATE
 FROM EMP
 WHERE DEPTNO = (SELECT DEPTNO 
                    FROM EMP 
                    WHERE ENAME='MILLER');
