-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- Warehouse Table Create SQL
CREATE TABLE Warehouse
(
    Wno          NUMBER    NOT NULL, 
    inventory    NUMBER    NOT NULL, 
    CONSTRAINT PK_Warehouse PRIMARY KEY (Wno)
)
/

CREATE SEQUENCE Warehouse_SEQ
START WITH 1
INCREMENT BY 1;
/
/*
CREATE OR REPLACE TRIGGER Warehouse_AI_TRG
BEFORE INSERT ON Warehouse 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Warehouse_SEQ.NEXTVAL
    INTO :NEW.Wno
    FROM DUAL;
END;
/
*/
--DROP TRIGGER Warehouse_AI_TRG;
/

--DROP SEQUENCE Warehouse_SEQ;
/

COMMENT ON TABLE Warehouse IS '창고'
/

COMMENT ON COLUMN Warehouse.Wno IS '창고번호'
/

COMMENT ON COLUMN Warehouse.inventory IS '재고'
/


-- Employee Table Create SQL
CREATE TABLE Employee
(
    Eno       NUMBER          NOT NULL, 
    Ename     VARCHAR2(20)    NOT NULL, 
    Esex      CHAR(3)         NOT NULL, 
    Etel      VARCHAR2(20)    NOT NULL, 
    Edepar    VARCHAR2(20)    NOT NULL, 
    Erank     VARCHAR2(20)    NOT NULL, 
    Etask     VARCHAR2(20)    NOT NULL, 
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


-- Schedule Table Create SQL
CREATE TABLE Schedule
(
    Schedule    BLOB    NULL   
)
/

COMMENT ON TABLE Schedule IS '작업일정표'
/

COMMENT ON COLUMN Schedule.Schedule IS '일정표'
/


-- Material Table Create SQL
CREATE TABLE Material
(
    Mcode     VARCHAR2(20)    NOT NULL, 
    Mname     VARCHAR2(20)    NOT NULL, 
    Mprice    NUMBER          NOT NULL, 
    Wno       NUMBER          NULL, 
    CONSTRAINT PK_Material PRIMARY KEY (Mcode)
)
/

COMMENT ON TABLE Material IS '자재'
/

COMMENT ON COLUMN Material.Mcode IS '자재코드'
/

COMMENT ON COLUMN Material.Mname IS '자재이름'
/

COMMENT ON COLUMN Material.Mprice IS '자재가격'
/

COMMENT ON COLUMN Material.Wno IS '보관번호'
/

ALTER TABLE Material
    ADD CONSTRAINT FK_Material_Wno_Warehouse_Wno FOREIGN KEY (Wno)
        REFERENCES Warehouse (Wno)
/


-- Import Table Create SQL
CREATE TABLE Import
(
    Ino          NUMBER          NOT NULL, 
    Iquantity    NUMBER          NOT NULL, 
    Wno          NUMBER          NOT NULL, 
    time         VARCHAR2(20)    NULL, 
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

COMMENT ON COLUMN Import.Wno IS '보관번호'
/

COMMENT ON COLUMN Import.time IS '주문시간'
/

ALTER TABLE Import
    ADD CONSTRAINT FK_Import_Wno_Warehouse_Wno FOREIGN KEY (Wno)
        REFERENCES Warehouse (Wno)
/


-- Line_Env_Data_T Table Create SQL
CREATE TABLE Line_Env_Data_T
(
    Line_Env_no    NUMBER          NOT NULL, 
    time           VARCHAR2(30)    NULL, 
    temp1          VARCHAR2(20)    NULL, 
    humi1          VARCHAR2(20)    NULL, 
    dust1          VARCHAR2(20)    NULL, 
    CONSTRAINT PK_Line_Env_Data_T PRIMARY KEY (Line_Env_no)
)
/

CREATE SEQUENCE Line_Env_Data_T_SEQ
START WITH 1
INCREMENT BY 1;
/
/*
CREATE OR REPLACE TRIGGER Line_Env_Data_T_AI_TRG
BEFORE INSERT ON Line_Env_Data_T 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Line_Env_Data_T_SEQ.NEXTVAL
    INTO :NEW.Line_Env_no
    FROM DUAL;
END;
/
*/
--DROP TRIGGER Line_Env_Data_T_AI_TRG;
/

--DROP SEQUENCE Line_Env_Data_T_SEQ;
/

COMMENT ON TABLE Line_Env_Data_T IS '라인1센서정보'
/

COMMENT ON COLUMN Line_Env_Data_T.Line_Env_no IS '라인1센서정보번호'
/

COMMENT ON COLUMN Line_Env_Data_T.time IS '측정시간'
/

COMMENT ON COLUMN Line_Env_Data_T.temp1 IS '라인1온도'
/

COMMENT ON COLUMN Line_Env_Data_T.humi1 IS '라인1습도'
/

COMMENT ON COLUMN Line_Env_Data_T.dust1 IS '라인1미세먼지'
/


-- Line_Manag_Data_T Table Create SQL
CREATE TABLE Line_Manag_Data_T
(
    Line_Manag_no    NUMBER          NOT NULL, 
    time             VARCHAR2(30)    NULL, 
    finished         VARCHAR2(20)    NULL, 
    Defective        VARCHAR2(20)    NULL, 
    CONSTRAINT PK_Line_Manag_Data_T PRIMARY KEY (Line_Manag_no)
)
/

CREATE SEQUENCE Line_Manag_Data_T_SEQ
START WITH 1
INCREMENT BY 1;
/
/*
CREATE OR REPLACE TRIGGER Line_Manag_Data_T_AI_TRG
BEFORE INSERT ON Line_Manag_Data_T 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT Line_Manag_Data_T_SEQ.NEXTVAL
    INTO :NEW.Line_Manag_no
    FROM DUAL;
END;
/
*/
--DROP TRIGGER Line_Manag_Data_T_AI_TRG;
/

--DROP SEQUENCE Line_Manag_Data_T_SEQ;
/

COMMENT ON TABLE Line_Manag_Data_T IS '생산제품'
/

COMMENT ON COLUMN Line_Manag_Data_T.Line_Manag_no IS '생산제품번호'
/

COMMENT ON COLUMN Line_Manag_Data_T.time IS '작업시간'
/

COMMENT ON COLUMN Line_Manag_Data_T.finished IS '양품'
/

COMMENT ON COLUMN Line_Manag_Data_T.Defective IS '불량품'
/


-- shipping Table Create SQL
CREATE TABLE shipping
(
    Sno     NUMBER          NOT NULL, 
    Snum    NUMBER          NOT NULL, 
    Wno     NUMBER          NOT NULL, 
    time    VARCHAR2(20)    NULL, 
     PRIMARY KEY (Sno)
)
/

CREATE SEQUENCE shipping_SEQ
START WITH 1
INCREMENT BY 1;
/
/*
CREATE OR REPLACE TRIGGER shipping_AI_TRG
BEFORE INSERT ON shipping 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT shipping_SEQ.NEXTVAL
    INTO :NEW.Sno
    FROM DUAL;
END;
/
*/
--DROP TRIGGER shipping_AI_TRG;
/

--DROP SEQUENCE shipping_SEQ;
/

COMMENT ON TABLE shipping IS '출고'
/

COMMENT ON COLUMN shipping.Sno IS '출고번호'
/

COMMENT ON COLUMN shipping.Snum IS '출고수량'
/

COMMENT ON COLUMN shipping.Wno IS '보관번호'
/

COMMENT ON COLUMN shipping.time IS '출고시간'
/

ALTER TABLE shipping
    ADD CONSTRAINT FK_shipping_Wno_Warehouse_Wno FOREIGN KEY (Wno)
        REFERENCES Warehouse (Wno)
/


