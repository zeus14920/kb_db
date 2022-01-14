-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

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

COMMENT ON TABLE Employee IS '사원'
/

COMMENT ON COLUMN Employee.Eno IS '사원번호'
/

COMMENT ON COLUMN Employee.Ename IS '사원이름'
/

COMMENT ON COLUMN Employee.Esex IS '성별'
/

COMMENT ON COLUMN Employee.Etel IS '전화'
/

COMMENT ON COLUMN Employee.Edepar IS '부서'
/

COMMENT ON COLUMN Employee.Erank IS '직급'
/

COMMENT ON COLUMN Employee.Etask IS '업무'
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

COMMENT ON TABLE Material IS '자재'
/

COMMENT ON COLUMN Material.Mno IS '자재번호'
/

COMMENT ON COLUMN Material.Mname IS '자재이름'
/

COMMENT ON COLUMN Material.Mprice IS '자재가격'
/

COMMENT ON COLUMN Material.Minventory IS '자재재고'
/


-- Schedule Table Create SQL
CREATE TABLE Schedule
(
    Schedule    BLOB    NOT NULL
)
/

COMMENT ON TABLE Schedule IS '작업일정표'
/

COMMENT ON COLUMN Schedule.Schedule IS '일정표'
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

COMMENT ON TABLE Import IS '주문'
/

COMMENT ON COLUMN Import.Ino IS '주문번호'
/

COMMENT ON COLUMN Import.Iquantity IS '주문수량'
/

COMMENT ON COLUMN Import.fk_Eno IS '사원참조'
/

COMMENT ON COLUMN Import.fk_Mno IS '자재번호참조'
/

ALTER TABLE Import
    ADD CONSTRAINT FK_Import_fk_Eno_Employee_Eno FOREIGN KEY (fk_Eno)
        REFERENCES Employee (Eno)
/

ALTER TABLE Import
    ADD CONSTRAINT FK_Import_fk_Mno_Material_Mno FOREIGN KEY (fk_Mno)
        REFERENCES Material (Mno)
/


