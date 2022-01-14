-- ���̺� ������ ���踦 ����Ͽ� �� ���� �����ص� ������ �߻����� �ʰ� ���ĵǾ����ϴ�.

-- Employee Table Create SQL
CREATE TABLE Employee
(
    Eno       NUMBER          NULL, 
    Ename     VARCHAR2(20)    NULL, 
    Esex      CHAR(3)         NULL, 
    Etel      VARCHAR2(20)    NULL, 
    Edepar    VARCHAR2(20)    NULL, 
    Erank     VARCHAR2(20)    NULL, 
    Etask     VARCHAR2(20)    NULL, 
    CONSTRAINT PK_Employee PRIMARY KEY (Eno)
)
/

CREATE SEQUENCE Employee_SEQ
START WITH 1
INCREMENT BY 1;
/
/*
CREATE OR REPLACE TRIGGER Employee_AI_TRG
BEFORE INSERT ON Employee 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Employee_SEQ.NEXTVAL
    INTO :NEW.Eno
    FROM DUAL;
END;
/
*/
--DROP TRIGGER Employee_AI_TRG;
/

--DROP SEQUENCE Employee_SEQ;
/

COMMENT ON TABLE Employee IS '���'
/

COMMENT ON COLUMN Employee.Eno IS '�����ȣ'
/

COMMENT ON COLUMN Employee.Ename IS '����̸�'
/

COMMENT ON COLUMN Employee.Esex IS '����'
/

COMMENT ON COLUMN Employee.Etel IS '��ȭ'
/

COMMENT ON COLUMN Employee.Edepar IS '�μ�'
/

COMMENT ON COLUMN Employee.Erank IS '����'
/

COMMENT ON COLUMN Employee.Etask IS '����'
/


-- Material Table Create SQL
CREATE TABLE Material
(
    Mno           VARCHAR2(20)    NOT NULL, 
    Mname         VARCHAR2(20)    NULL, 
    Mprice        NUMBER          NULL, 
    Minventory    NUMBER          NULL, 
    CONSTRAINT PK_Material PRIMARY KEY (Mno)
)
/

COMMENT ON TABLE Material IS '����'
/

COMMENT ON COLUMN Material.Mno IS '�����ȣ'
/

COMMENT ON COLUMN Material.Mname IS '�����̸�'
/

COMMENT ON COLUMN Material.Mprice IS '���簡��'
/

COMMENT ON COLUMN Material.Minventory IS '�������'
/


-- Schedule Table Create SQL
CREATE TABLE Schedule
(
    Schedule    BLOB    NOT NULL
)
/

COMMENT ON TABLE Schedule IS '�۾�����ǥ'
/

COMMENT ON COLUMN Schedule.Schedule IS '����ǥ'
/


-- Import Table Create SQL
CREATE TABLE Import
(
    Ino          NUMBER          NOT NULL, 
    Iquantity    NUMBER          NULL, 
    fk_Eno       NUMBER          NULL, 
    fk_Mno       VARCHAR2(20)    NULL, 
    CONSTRAINT PK_Import PRIMARY KEY (Ino)
)
/

CREATE SEQUENCE Import_SEQ
START WITH 1
INCREMENT BY 1;
/
/*
CREATE OR REPLACE TRIGGER Import_AI_TRG
BEFORE INSERT ON Import 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Import_SEQ.NEXTVAL
    INTO :NEW.Ino
    FROM DUAL;
END;
/
*/
--DROP TRIGGER Import_AI_TRG;
/

--DROP SEQUENCE Import_SEQ;
/

COMMENT ON TABLE Import IS '�ֹ�'
/

COMMENT ON COLUMN Import.Ino IS '�ֹ���ȣ'
/

COMMENT ON COLUMN Import.Iquantity IS '�ֹ�����'
/

COMMENT ON COLUMN Import.fk_Eno IS '�������'
/

COMMENT ON COLUMN Import.fk_Mno IS '�����ȣ����'
/

ALTER TABLE Import
    ADD CONSTRAINT FK_Import_fk_Eno_Employee_Eno FOREIGN KEY (fk_Eno)
        REFERENCES Employee (Eno)
/

ALTER TABLE Import
    ADD CONSTRAINT FK_Import_fk_Mno_Material_Mno FOREIGN KEY (fk_Mno)
        REFERENCES Material (Mno)
/


