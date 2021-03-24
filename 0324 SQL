--1번 10번 부서와 20번 부서에서 근무하고 있는 사원의 이름과 부서번호를 출력. 단 사원의 이름은 영문자순으로 출력.
SELECT ENAME, EMPNO
FROM EMP
WHERE DEPTNO IN (10,20)
ORDER BY ENAME;

--2번 emp테이블에서 각 부서별로 인원수, 급여의 평균,최저급여,최고급여, 급여의 합을 구하여 급여의 합이 많은 순으로 출력.
SELECT DEPTNO, AVG(SAL), COUNT(*)
FROM EMP
GROUP BY DEPTNO;

--3번 emp테이블에서 급여가 최대3000이상인 부서에 대해서 부서번호, 평균급여, 급여의 합을 구하여 출력.
SELECT DEPTNO, AVG(SAL), SUM(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING MAX(SAL) >= 3000;

--4번 research 부서에 근무하고 있는 사원의 이름 부서번호, 부서이름을 출력
SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND D.DNAME = 'RESEARCH';

--5번 업무JOB이 MANAGER인 사원의 정보를 이름, 업무, 부서명 , 근무지 순으로 출력 (emp, dept)
SELECT  E.ENAME, JOB, D.DNAME, LOC
FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
 AND JOB = 'MANAGER';
 
--6번 커미션(comm)을 받고 급여가 1,600이상인 사원의 사원이름, 부서명,근무지를 출력(emp, dept)
SELECT  E.ENAME, D.DNAME, LOC
FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
 AND SAL >= 1600
 AND COMM IS NOT NULL;
 
 
 --서브쿼리문
 SELECT * FROM EMP
 WHERE SAL > (SELECT SAL 
                FROM EMP 
                WHERE ENAME = 'SMITH'); --SMITH가 제일 급여가 낮음ㅋㅋ
                

SELECT * FROM EMP
WHERE HIREDATE < (SELECT HIREDATE
                    FROM EMP
                    WHERE ENAME = 'MARTIN');

                
--7번 10번 부서에서 급여를 가장 적게 받는 사원과 동일한 급여를 받는 사원의 이름과 급여를 출력하는 SQL작성
SELECT ENAME, SAL
FROM EMP
WHERE SAL = (SELECT MIN(SAL) 
                FROM EMP
                WHERE DEPTNO='10');
                    
                    
--8번 평균 급여보다 많은 급여를 받는 사원들의 사원번호, 사원이름, 급여를 출력하는 SQL작성.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL IN (SELECT SAL
                FROM EMP
                WHERE SAL > AVG(SAL));
                
                
--9번 BLAKE와 같은 부서에 있는 사원들의 이름과 입사일을 출력하는 SQL문을 작성.
SELECT ENAME, HIREDATE
 FROM EMP
 WHERE DEPTNO IN ( SELECT DEPTNO
                    FROM EMP
                    WHERE ENAME = 'BLAKE');

--9-1번 BLAKE와 같은 부서에 있는 사원들의 이름과 입사일을 출력하는 SQL문을 작성. 단 BLAKE는 제외.                    
SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO IN ( SELECT DEPTNO
                    FROM EMP
                    WHERE ENAME = 'BLAKE') AND ENAME != 'BLAKE';
                    
                    
                    
--10번 직속상사(MGR >> 해당 사원의 직속상사에 대한 사원번호)가 KING인 모든 사원의 이름과 급여를 출력하는 SQL작성.(서브쿼리)
SELECT ENAME, SAL
FROM EMP
WHERE MGR = (SELECT EMPNO
                    FROM EMP
                    WHERE ENAME = 'KING');
                    
                    
--11번 CHICAGO지역 (DEPT 테이블의 LOC 컬럼)에서 근무하는 사원의 평균 급여 보다 높은 급여를 받는 사원의 사원이름, 급여, 지역명을 출력하는 SQL작성.
SELECT E.ENAME, E.SAL, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL > (SELECT FLOOR(AVG(E.SAL))
                FROM EMP E, DEPT D
                WHERE E.DEPTNO = D.DEPTNO
                GROUP BY D.LOC
                HAVING D.LOC = 'CHICAGO');
    
    
--12번 emp 테이블에서 평균 급여보다 적은 급여를 받는 사원들의 사원이름, 급여를 출력하는 SQL작성.
SELECT ENAME, SAL
FROM EMP
WHERE SAL < (SELECT FLOOR(AVG(SAL))FROM EMP);


--13번 emp테이블에서 가장 많은 사원이 속해 있는 부서의 부서번호와 사원 수를 출력하는 SQL작성.
SELECT DEPTNO, COUNT(DEPTNO)
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(DEPTNO) = (SELECT MAX(COUNT(DEPTNO))
                        FROM EMP
                        GROUP BY DEPTNO);


--14번 각 부서별 사원의 수를 출력하는 SQL작성.
SELECT DEPTNO AS 부서번호, COUNT(*) AS 사원수
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*)>2
ORDER BY DEPTNO ASC;


--15번 emp 테이블에서 10번 부서의 최소 급여를 받는 사원보다 많은 급여를 받는 사원번호, 사원이름을 출력하는 SQL작성.
SELECT E.EMPNO, E.ENAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL > (SELECT FLOOR(MIN(E.SAL))
               FROM EMP E, DEPT D
                WHERE E.DEPTNO = D.DEPTNO);
                
--16번 사원수가 3명이 넘는 부서의 부서명과 사원수를 출력하는 SQL작성.
SELECT D.DNAME, COUNT(*) 사원수
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
GROUP BY D.DNAME
HAVING COUNT(*)>3;

--17번 JAMES보다 일찍 입사한 사원의 이름과 입사일을  출력하는 SQL작성.
SELECT * FROM EMP
WHERE HIREDATE < (SELECT HIREDATE
                    FROM EMP
                    WHERE ENAME = 'JAMES');

--18번 총 급여가 평균 급여보다 많은 사원의 사원이름, 총급여를 출력하는 SQL작성( 총급여는 SAL+COMM 임. NVL()사용)
SELECT ENAME, SAL+COMM
FROM EMP
WHERE SAL+COMM > (SELECT FLOOR(AVG(SAL)) 
                    FROM EMP);                    
