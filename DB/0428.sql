*0428 SQLPLUS 

* SQLPLUS 에서 화면 지우기
SQL> cl scr(<< 화면 지우기)

 * Oracle DB접속
 CMD> sqlplus system/oracle
          >>sqlplus에서 접속하기위해 사용자명 system 암호 oracle 입력.
          
 * Server 와 Clinet
 Service + er = 서버를 제공하는 사람/프로그램
 DB server 데이터베이스 서비스를 제공함.
 Client 네트워킹통해 접속.
 
 1.SQL> create user oraclstudy identified by ORACLE; 사용자생성
                    ---------- ------------- -------
                    사용자이름 암호지정키워드 ORCLSTUDY 사용자의 암호
                    
 2.create user ORCLSTUDY identified by ORACLE; 시스템 사용자로 로그인 한 후 ORCLSTUDY(암호: ORACLE) 사용자 생성
 - 사용자명 정의시 대소문자 구분하지 않음
 - 하지만 사용자 정보가 담긴 데이터 사전에는 대문자로 들어가 있음(주의)
 - 암호는 정의시 사용한 대로 대소문자를 구분함(주의)
 
 3.grant create session to ORCLSTUDY;
 -system 사용자로 로그인 한 후 ORCLSTUDY 사용자에게 DB에 접속할 수 있는 권한부여  (grant)
 -grant는 권한 부여시 사용하는 명령어

 4. SELECT * FROM ALL_USERS WHERE USERNAME='ORCLSTUDY';
 >> ALL_USERS 데이터 사전에 방금 생성한 ORCLSTUDY 사용자가 있는지 확인하는 SQL 쿼리문.
 
 5. 사용자의 암호 변경 ( SYSTEM 사용자로 접속한 후)
 
 >> alter user   orclstudy     identified by   ORCL;
    ----------   ---------     -------------   -----
    사용자 수정    수정대상       암호 설정       암호
    
    ---> orclstudy 사용자의 암호가 ORACLE 에서 ORCL로 변경됨
    
    >> SYSTEM 사용자 암호 복구
    
    CMD> sqlplus sys/as sysdba << 입력
                               << sys 사용자의 암호를 입력하라는 메시지가 나옴
                               이 때 별도의 암호를 입력하지 않고
                               enter 키를 누르면 sys사용자로 접속된다.
                               
    SQL> alter user system identified by 새로운암호
    

    CMD> sqlplus system/oracle
    SQL> create user orclstudy identified by ORACLE;
    SQL> grant create session to orclstudy;
    SQL> conn orclstudy/ORACLE
    SQL> create table temp(a number(2));
         권한이 충분하지 않다라는 영문 메세지가 나옴.
         
         
          
<실습>
1. 다음 조건을 만족하는 SQL문을 작성.
1) SYSTEM 계정으로 접속하여 test1 계정을 생성.
2) 비밀번호는 ORCL로 지정한다. 접속 권한을 부여하고 test1 계정으로 접속이 잘 되는지 확인한다.
SQL> sqlplus system/oracle
SQL> create user test1 identified by orcl;
SQL> grant resource, create session to test1;


8. 부여된 시스템 권한 제거(취소)
SQL> revoke resource, create table from orclstudy;
>> orclstudy 사용자에게 부여된 resource 롤, create table 시스템 권한 제거(취소)


9. 객체권한부여 (객체: 테이블)

SQL> grant select  on  tmep_tt  to  orclstudy;
          -------      -------      ----------
          객체권한      스키마이름    객체권한을 부여받을 대상
          
     >>scott 사용자가
     
     temp_tt 테이블에 대해서 사용자 orclstudy 에게 select 객체 권한을 부여.
SQL> grant insert on tmep    _tt to orclstudy;
     
     >>scott 사용자가
             tmep_tt 테이블에 대해서 사용자 orclstudy에게 insert객체 권한을 부여.

SQL> conn orclstudy/ORACLE
SQL> select * from scott.temp_tt;  << scott이 소유한 temp_tt 테이블 조회
SQL> insert into scott.temp_tt values('1','11');  << scott이 소유한 temp_tt 테이블에 값 입력.


10. 객체 권한취소(제거): scott 사용자가 orclstudy 사용자에게 부여한 권한 취소(제거)

SQL> conn scott/tiger
SQL> revoke  select  on  emp  from  orclstudy;
             ------      ----       ----------
            취소권한   취소대상객체   취소대상사용자
            


<실습>
--1. employees 테이블에서 Steven King의 부서명을 출력하는 SQL 작성.
SELECT E.LAST_NAME, E.FIRST_NAEM, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
AND E.FIRST_NAME = 'Steven' 
AND E.LAST_NAME = 'King';


--2. IT 부서에 근무하고 있는 사원들의 FIRST_NAME을 출력하는 SQL 작성.( 조인 : employees , departments )
SELECT E.LAST_NAME, E.EMPLOYEE_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.DEPARTMENT_NAME = 'IT';


--3. EMPLOYEES 테이블에서 사원번호(EMPLOYEE_ID), 이름(LAST_NAME), 업무(JOB_ID) , 부서번호(DEPARTMENT_ID) 그리고 
--DEPARTMENTS 테이블의  부서번호(DEPARTMENT_ID), 부서명(DEPARTMENT_NAME), 근무지(LOCATION_ID)를 출력하는 SQL 작성.
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.JOB_ID, E.DEPARTMENT_ID, D.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.LOCATION_ID
FROM EMPLOYEES
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID;


--4.EMPLOYEES 테이블에서 left join하여 관리자(매니저)를 출력하고 매니저 아이디(MANAGER_ID)가 없는 사람은 배제하고, 
--급여(SALARY)는 역순으로 출력하는 SQL 작성.( 오라클 조인과 표준 조인 둘 다 사용 해봅니다.)
SELECT A.EMPLOYEE_ID, A.FIRST_NAME, A.MANGER_ID, B.EMPLOYEE_ID, B.FIRST_NAME
FROM EMPLOYEES A, EMPLOYEES B
WHERE A.MANAGER_ID = B.EMPLOYEE_ID(+)
START WITH A.MANAGER_ID IS NOT NULL
CONNECT BY A.MANAGER_ID = PRIOR A.EMPLOYEE_ID
ORDER BY A.SALARY DESC;


--5.EMPLOYEES 테이블에서 가장 많은 사원이 속해 있는 부서번호와 사원수를 출력하는 SQL 작성.
SELECT DEPTNO 부서번호, COUNT(*) 사원수
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(DEPTNO) = (SELECT MAX(COUNT(*))
                        FROM EMP
                        GROUP BY DEPTNO);
