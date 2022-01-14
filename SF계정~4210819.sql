CREATE TABLE STUDENTS_T(
    ID NUMBER NOT NULL,
    NAME VARCHAR(20) NOT NULL,
    AGE NUMBER NOT NULL,
    ADDR VARCHAR(80) NOT NULL
    --CONSTRAINT PK_STUDENTS_ID PRIMARY KEY(ID)
);

-- �������� �����Ͽ� ID�� 1000���� 1�� �ڵ����� �����ϵ��� ó��
CREATE SEQUENCE SEQU_ID INCREMENT BY 1 START WITH 1000;

-- ������ ����
DROP SEQUENCE SEQ_ID;

-- SQL ��뿹
INSERT INTO students_T VALUES(SEQU_ID.NEXTVAL, '�ֱ浿', 100, '�뱸 �޼���');

-- 3. ���̺� ���� ����
DESC STUDENTS_T;

-- 4. ���̺� ����
ALTER TABLE STUDENTS_T ADD(NAME2 VARCHAR2(40));         -- ���̺� ���ο� �÷� �߰�
ALTER TABLE STUDENTS_T MODIFY(NAME2 VARCHAR2(50));      -- �÷� ���� ����
ALTER TABLE STUDENTS_T RENAME COLUMN NAME2 TO NAME4;    -- �÷� �̸� ����
ALTER TABLE STUDENTS_T DROP COLUMN NAME4;               -- ���� �߰��� �÷� ����

-- 5. ���̺� ����
DROP TABLE STUDENTS_T;

-- 6. ���̺� ���� �� PRIMARY KEY ����
ALTER TABLE STUDENTS_T ADD CONSTRAINT PK_STUDENTSS_ID PRIMARY KEY(ID);

-- 7. �⺻ ���� ó����

-- ��. ������ �߰�
-- �������� �߰��Ͽ� �ڵ����� ID�� �����ϵ��� ó�� (2. ���̺� ���� ����)
INSERT INTO STUDENTS_T VALUES (SEQU_ID.NEXTVAL, '��浿', 100, '�뱸 �޼���');
INSERT INTO STUDENTS_T VALUES (SEQU_ID.NEXTVAL, '�̼���', 100, '�뱸 ����');
INSERT INTO STUDENTS_T VALUES (SEQU_ID.NEXTVAL, '������', 50, '�뱸 ����');

-- ��. ������ ��� �������� ���� ��ü���� ��������
SELECT COUNT(*) FROM STUDENTS_T;

-- ��. ���̺��� ������ ��������(Ư�� ����)
 SELECT * FROM students_t;
SELECT NAME, AGE FROM students_t WHERE ID=1020;
SELECT NAME, AGE FROM students_t;

-- ��. WHERE �˻� ���� (��� DB���� �˻�)
SELECT * FROM students_t WHERE ID=1000;
SELECT * FROM STUDENTS_T WHERE NAME IS NULL;        -- NULL �� ���
SELECT * FROM STUDENTS_T WHERE NAME IS NOT NULL;    -- NULL �� �ƴ� ���
SELECT * FROM STUDENTS_T WHERE NAME LIKE '%�浿';    -- "�浿"�� �����ϴ� �̸�
SELECT * FROM STUDENTS_T WHERE NAME LIKE '_�浿';    -- 3�ڸ� ���� �̸� �� "�浿"�� �����ϴ� �̸�

-- ��. ������ ����
SELECT * FROM STUDENTS_T ORDER BY NAME;                             -- �⺻������ �������� ����
SELECT * FROM STUDENTS_T ORDER BY NAME ASC;                         -- �⺻������ �������� ����
SELECT * FROM STUDENTS_T ORDER BY NAME DESC;                        -- �������� ����
SELECT * FROM STUDENTS_T ORDER BY NAME ASC, AGE DESC;               -- �̸����� �������� ����, ������ �̸��� ���� �� ���̷� ��������
SELECT * FROM STUDENTS_T WHERE NAME LIKE '%�浿' ORDER BY ID DESC;   -- "�浿"�� �����ϴ� �̸����� ID������������ ����

-- ��. ������ ����
-- DELETE FROM ���̺�� WHERE �ʵ�� ='�˻���';
DELETE FROM STUDENTS_T WHERE ID=1003;

-- ��. ������ ����
UPDATE STUDENTS_T SET NAME='�ڱ浿' WHERE NAME='�ֱ浿';
UPDATE STUDENTS_T SET NAME='�����浿' WHERE NAME LIKE '%�浿';
UPDATE STUDENTS_T SET NAME='�ָ���' WHERE ID=10;
UPDATE STUDENTS_T SET NAME='ȫ����', AGE=11, ADDR='���� ���� ������Ÿ�Ϸ�' WHERE ID=1000;
UPDATE students_t SET AGE=40 WHERE ID=1004;










