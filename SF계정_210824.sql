-- ���̺� ����
create table dept_copy as SELECT * from department;

-- ���̺� ������ ����(������ ����)
create table dept_copy2 as SELECT*FROM department where 0=1;

-- 10�� �μ��� �������� 20�� �μ��� ���������� ����
UPDATE dept_copy 
    set loc = (SELECT loc from dept_copy where dno =20) 
    where dno=10;

create table emp_copy as select * from employee;

-- sales �μ����� �ٹ��ϴ� ��� ��� ����
delete emp_copy 
    where dno = (select dno from department where dname = 'SALES');

-- ��¥ ������ �˻�
SELECT *FROM EMPLOYEE 
    WHERE HIREDATE <='1981/01/01';

-- �� ������ Ȱ��
SELECT * FROM employee 
    WHERE DNO=10 AND JOB='MANAGER';

-- 1000�� 1500 ������ �� �˻�
SELECT *FROM  employee 
    WHERE salary BETWEEN 1000 AND 1500;

-- Ŀ�̼��� 300,500, 1400 ���� ����
SELECT* FROM employee 
    WHERE commission 
    IN (300,500,1400);

-- �׷� �Լ�
SELECT SUM(SALARY) AS "�޿� �Ѿ�", AVG(SALARY) AS "�޿� ���", MAX(SALARY) AS "�ִ�޿�", MIN(SALARY) AS "�ּұ޿�" 
    FROM EMPLOYEE;

-- COUNT: ���� ������ ���ϴ� �Լ�
SELECT COUNT(*) AS "����� ��" FROM employee;

-- Ư�� �÷��� �������� �׷캰�� �з�
SELECT DNO AS "�μ� ��ȣ", AVG(SALARY) AS "��� �޿�" 
    FROM employee 
    GROUP BY DNO;

SELECT DNO, JOB, COUNT(*), SUM(SALARY) 
    FROM employee GROUP BY DNO, JOB 
    ORDER BY DNO, JOB; 

-- ��¥ ǥ��
-- TO_CHAR() : ����, ��¥�� ���ڿ��� ǥ��
SELECT ENAME, HIREDATE, TO_CHAR(HIREDATE, 'YY-MM'), TO_CHAR(HIREDATE, 'YYYY-MM-DD DAY') 
    FROM EMPLOYEE;

-- ���� ��¥, �ð�
-- DUAL : �����ϰ� �Լ��� �̿��ؼ� ��� ������� Ȯ�� �� �� ����ϴ� ���̺�(����Ŭ ����)
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD, HH24:MI:SS') 
    FROM DUAL;

-- ��ȭ ��ȣ
-- L : ������ ��ȭ ��ȣ
-- 0 : �ڸ����� ���� ������ '0'���� ä��
-- 9 : �ڸ����� ���� ������ ���ڸ��� ������
SELECT ENAME, TO_CHAR(SALARY, 'L999,999') 
    FROM EMPLOYEE;

-- CASE �� ����Ͽ� �̸�, �μ��� ���
-- �׷�ȭ
SELECT ENAME, DNO,
    CASE
        WHEN DNO=10 THEN 'ACCOUNTING'
        WHEN DNO=20 THEN 'RESEATCH'
        WHEN DNO=30 THEN 'SALES'
        WHEN DNO=40 THEN 'OPERATIONS'
        ELSE 'DEFAULT'
    END AS "�μ���"
FROM employee ORDER BY DNO;

SELECT DECODE(DNO, 10, 'ACCOUNTING',
                20, 'RESEATCH',
                30, 'SALES',
                40, 'OPERATIONS') AS "�μ���",
       DECODE(DNO, 10, 'NEW_YORK',
                20, 'DALLAS',
                30, 'CHICAGO',
                40, 'BOSTON') AS "����",
       COUNT(*) AS "��� ��",
       ROUND(AVG(SALARY)) AS "��� �޿�"
FROM employee GROUP BY DNO;

-- JOIN : ������ ���̺��� ������ �������� ���� ��ġ�� ��

-- ����Ŭ���� ���
SELECT E.ENO, E.ENAME, D.DNAME, E.DNO
    FROM employee E, department D
    WHERE E.DNO=D.DNO AND E.ENO=7788;

-- USING ���(INNER JOIN) ǥ�ػ���
SELECT E.ENO, E.ENAME, D.DNAME, DNO
    FROM employee E JOIN department D
    USING(DNO) WHERE E.ENO=7788;
    
-- ON ��� ǥ�ػ���
SELECT E.ENO, E.ENAME, D.DNAME, E.DNO
    FROM employee E
    JOIN department D
    ON E.DNO = D.DNO WHERE E.ENO=7788;

-- 3���� ���̺� ����
SELECT E.ENAME, D.DNAME, E.SALARY, S.GRADE
    FROM employee E, department D, salgrade S
    WHERE E.DNO = D.DNO AND SALARY
    BETWEEN LOSAL AND HISAL;
    
-- �ڿ� ���� : �ߺ� ����(���� �÷��� �����Ͽ� ����)
SELECT E.ENO, E.ENAME, D.DNAME, DNO
    FROM employee E NATURAL JOIN department D;

-- LEFT OUTER JOIN : ���� ���̺� NULL �� ����
SELECT E.ENAME AS "���", M.ENAME AS "���ӻ��"
    FROM employee E
    LEFT OUTER JOIN employee M
    ON E.MANAGER = M.ENO;

/*
A JOIN B (������) : A ���� X B ����
A INNER JOIN B (������) : A, B �� ��ġ�ϴ� ���� ������.
A INNER JOIN B (A + ������) : B ���̺� ���� Ű���� ���ؼ��� NULL ä��.
A RIGHT JOIN B (������ + B) : A ���̺� ���� Ű���� ���ؼ��� NULL ä��.
A UNION ALL B (A ROW + B ROW, WNDQHR ROW ����)
A UNION B (A ROW + B ROW, �ߺ� ROW ����)
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




