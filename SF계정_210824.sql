-- 테이블 복사
create table dept_copy as SELECT * from department;

-- 테이블 구조만 복사(데이터 없이)
create table dept_copy2 as SELECT*FROM department where 0=1;

-- 10번 부서의 지역명을 20번 부서의 지역명으로 변경
UPDATE dept_copy 
    set loc = (SELECT loc from dept_copy where dno =20) 
    where dno=10;

create table emp_copy as select * from employee;

-- sales 부서에서 근무하는 사원 모두 삭제
delete emp_copy 
    where dno = (select dno from department where dname = 'SALES');

-- 날짜 데이터 검색
SELECT *FROM EMPLOYEE 
    WHERE HIREDATE <='1981/01/01';

-- 논리 연산자 활용
SELECT * FROM employee 
    WHERE DNO=10 AND JOB='MANAGER';

-- 1000과 1500 사이의 값 검색
SELECT *FROM  employee 
    WHERE salary BETWEEN 1000 AND 1500;

-- 커미션이 300,500, 1400 값인 직원
SELECT* FROM employee 
    WHERE commission 
    IN (300,500,1400);

-- 그룹 함수
SELECT SUM(SALARY) AS "급여 총액", AVG(SALARY) AS "급여 평균", MAX(SALARY) AS "최대급여", MIN(SALARY) AS "최소급여" 
    FROM EMPLOYEE;

-- COUNT: 행의 갯수를 구하는 함수
SELECT COUNT(*) AS "사원의 수" FROM employee;

-- 특정 컬럼을 기준으로 그룹별로 분류
SELECT DNO AS "부서 번호", AVG(SALARY) AS "평균 급여" 
    FROM employee 
    GROUP BY DNO;

SELECT DNO, JOB, COUNT(*), SUM(SALARY) 
    FROM employee GROUP BY DNO, JOB 
    ORDER BY DNO, JOB; 

-- 날짜 표시
-- TO_CHAR() : 숫자, 날짜를 문자열로 표시
SELECT ENAME, HIREDATE, TO_CHAR(HIREDATE, 'YY-MM'), TO_CHAR(HIREDATE, 'YYYY-MM-DD DAY') 
    FROM EMPLOYEE;

-- 현재 날짜, 시간
-- DUAL : 간단하게 함수를 이용해서 계산 결과값을 확일 할 때 사용하는 테이블(오라클 제공)
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD, HH24:MI:SS') 
    FROM DUAL;

-- 통화 기호
-- L : 지역별 통화 기호
-- 0 : 자리수가 맞지 않으면 '0'으로 채움
-- 9 : 자리수가 맞지 않으면 빈자리로 무시함
SELECT ENAME, TO_CHAR(SALARY, 'L999,999') 
    FROM EMPLOYEE;

-- CASE 를 사용하여 이름, 부서명 출력
-- 그룹화
SELECT ENAME, DNO,
    CASE
        WHEN DNO=10 THEN 'ACCOUNTING'
        WHEN DNO=20 THEN 'RESEATCH'
        WHEN DNO=30 THEN 'SALES'
        WHEN DNO=40 THEN 'OPERATIONS'
        ELSE 'DEFAULT'
    END AS "부서명"
FROM employee ORDER BY DNO;

SELECT DECODE(DNO, 10, 'ACCOUNTING',
                20, 'RESEATCH',
                30, 'SALES',
                40, 'OPERATIONS') AS "부서명",
       DECODE(DNO, 10, 'NEW_YORK',
                20, 'DALLAS',
                30, 'CHICAGO',
                40, 'BOSTON') AS "지역",
       COUNT(*) AS "사원 수",
       ROUND(AVG(SALARY)) AS "평균 급여"
FROM employee GROUP BY DNO;

-- JOIN : 각각의 테이블에서 정보를 가져오기 위해 합치는 것

-- 오라클에서 사용
SELECT E.ENO, E.ENAME, D.DNAME, E.DNO
    FROM employee E, department D
    WHERE E.DNO=D.DNO AND E.ENO=7788;

-- USING 사용(INNER JOIN) 표준사용법
SELECT E.ENO, E.ENAME, D.DNAME, DNO
    FROM employee E JOIN department D
    USING(DNO) WHERE E.ENO=7788;
    
-- ON 사용 표준사용법
SELECT E.ENO, E.ENAME, D.DNAME, E.DNO
    FROM employee E
    JOIN department D
    ON E.DNO = D.DNO WHERE E.ENO=7788;

-- 3개의 테이블 조인
SELECT E.ENAME, D.DNAME, E.SALARY, S.GRADE
    FROM employee E, department D, salgrade S
    WHERE E.DNO = D.DNO AND SALARY
    BETWEEN LOSAL AND HISAL;
    
-- 자연 조인 : 중복 제거(공통 컬럼을 제거하여 조인)
SELECT E.ENO, E.ENAME, D.DNAME, DNO
    FROM employee E NATURAL JOIN department D;

-- LEFT OUTER JOIN : 왼쪽 테이블에 NULL 값 존재
SELECT E.ENAME AS "사원", M.ENAME AS "직속상관"
    FROM employee E
    LEFT OUTER JOIN employee M
    ON E.MANAGER = M.ENO;

/*
A JOIN B (합집합) : A 갯수 X B 갯수
A INNER JOIN B (교집합) : A, B 의 일치하는 값만 가져옴.
A INNER JOIN B (A + 교집합) : B 테이블에 없는 키값에 대해서는 NULL 채움.
A RIGHT JOIN B (교집합 + B) : A 테이블에 없는 키값에 대해서는 NULL 채움.
A UNION ALL B (A ROW + B ROW, WNDQHR ROW 포함)
A UNION B (A ROW + B ROW, 중복 ROW 제외)
*/

SELECT ENAME, HIREDATE 
    FROM (SELECT * FROM employee ORDER BY HIREDATE);

SELECT ENAME, HIREDATE 
    FROM (SELECT * FROM employee ORDER BY HIREDATE)
    WHERE ROWNUM=1;

SELECT ENAME, HIREDATE 
    FROM ( SELECT EMPLOYEE.*, ROW_NUMBER() OVER(ORDER BY HIREDATE) AS RN
            FROM employee)
    WHERE RN=3;




