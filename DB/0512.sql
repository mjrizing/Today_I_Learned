## **시스템 계정을 잊어버렸을경우(암호 재설정)**
-- cmd> sqlplus system/ as sysdba
-- 위와 같이 입력하면 system 계정의 암호를 물어본다.
-- 암호를 입력하지 않고 그냥 엔터키를 누르면 SYS계정으로 접속이 됨.
-- sqlplus> show user --> 접속한 사용자 확인 : SYS가 화면에 출력됨
-- sqlplus> alter user system identified by 새로운암호;

## **VIEW(뷰)**
--반복되는 쿼리의 ( join, subquery 등 ) 결과를 하나의 테이블로 생성.
--가상의 테이블.
--뷰의 장점: 편리성, 보안성, 논리적데이터독립성이 있다.
--편리성: 여러 테이블에서 데이터를 가져와 하나의 테이블로 정의함으로써 질의 작성이 간단하게 된다.
           미리 작성된 질의를 뷰로 정의해 두면 질의 재사용이 가능하다.
--보안성: 원본 테이블에서 보안이 필요한 속성을 제외하고 새로운 테이블을 정의하여 사용자에게 
           제공함으로써 데이터 보안성을 높인다.
--논리적데이터독립성:뷰를 정의하여 응용 프로그램이 사용하게 하면 개념스키마에 정의된 테이블
                               구조가 변경되어도 응용프로그램의 변경을 막아 주기 때문에 논리적 데이터
                               독립성을 제공한다.

```sql
CREATE OR REPLACE VIEW J_EMP 
  AS SELECT EMPNO, ENAME, JOB, MGR, E.DEPTNO, DNAME 
      FROM EMP E , DEPT D 
      WHERE E.DEPTNO = D.DEPTNO;

 SELECT  *  FROM  J_EMP;
```



### 실습 ###
--1.  emp 테이블에서 모든 사원의 급여(sal)가 10% 인상된 결과를 출력하는 SQL을 작성.( 출력 컬럼은 사원번호, 사원이름, 인상된급여로 출력되도록 한다. 급여에서 추가수당은 제외한다.)
SELECT EMPNO,ENAME,JOB,SAL,SAL*1.1 
AS "NEW SALARY" 
FROM EMP;

--2.emp 테이블에서 30번 부서에 근무하면 월 2000 이하를 받는 81년 5월 1일 이전에 입사한 사원의 이름, 급여, 부서번호,입사일을 출력하는 SQL을 작성.
SELECT ENAME, SAL, DEPTNO, HIREDATE
FROM EMP
WHERE DEPTNO = 30 AND SAL <= 2000 AND HIREDATE <= '81.05.01';

--3.emp 테이블에서 업무가 SALESMAN 또는 MANAGER이면서  급여가 1,600, 2,975 또는 2,850이 아닌 모든 사원의 이름, 업무 및 급여를 출력하는 SQL 작성.
SELECT ENAME, JOB, SAL
FROM EMP
WHERE JOB = 'SALESMAN' OR JOB = 'MANAGER' AND SAL NOT IN('1600','2975','2850');

--4.emp 테이블에서 이름에 A와 E가 포함되지 않는 사원의 이름을 출력하는 SQL 작성.
SELECT ENAME
FROM EMP
WHERE ENAME NOT LIKE '%A%'
AND ENAME NOT LIKE '%E%';

--5.emp 테이블에서 커미션(comm)항목이 입력된 사원들의 사원이름과, 급여, 커미션을 출력하는 SQL 작성
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM IS NOT NULL;

--6.emp 테이블에서 10번 부서에 속하는 사원들의 모든 정보를 출력하는 SQL을 작성.(단, 급여 출력시 급여 금액 앞에 "$"를 붙이고 3자리마다 ","를 출력되도록 한다.)
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, TO_CHAR(SAL, '$999,999,999')AS SAL, COMM, DEPTNO
FROM EMP
WHERE DEPTNO = '10';

--7.emp 테이블에서 이름의 세번째 문자가 A인 모든 사원의 이름을 출력하는 SQL을 작성.
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '__A%';

--8.employees 테이블에서 입사일자가 2006년 1월 1일 이후에 입사한 사원의 정보를 출력하는 SQL을 작성.( 출력 컬럼은 사원번호(employee_id), 담당업무(job_id), 급여(salary), 입사일자(hire_date)가 출력되도록 한다.)
SELECT * FROM EMP
WHERE HIREDATE <= '06.01.01';

--9.employees 테이블에서 먼저 입사한 순으로 사원번호, 입사일을 출력하는 SQL을 작성.
SELECT EMPNO, HIREDATE
FROM EMP
ORDER BY HIREDATE ASC;

--10.employees 테이블에서 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 구하여 출력하는 SQL 작성.
SELECT DEPTNO, COUNT(*), SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) > 4;

--11.employees 테이블에서 업무별 급여의 평균이 10000 이상인 업무에 대해서 업무명, 평균 급여, 급여의 합을 구하여 출력하는 SQL 작성.
SELECT JOB, AVG(SAL), SUM(SAL)
FROM EMP
GROUP BY JOB
HAVING AVG(SAL) >= 10000;

--12.employees 테이블에서 급여가 10000을 초과하는 각 업무에 대해서 업무와 월급여 합계를 출력하라. (단, 판매원은 제외하고  급여 합계로 정렬(내림차순) 한다. 판매원은 JOB_ID 컬럼의 값이 "SA_"로 시작한다.)
SELECT JOB, SUM(SAL)
FROM EMP
WHERE JOB NOT LIKE 'SA_%'
GROUP BY JOB
HAVING SUM(SAL) > 10000
ORDER BY SUM(SAL) DESC;
