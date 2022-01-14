-- ���̺� ������ ���踦 ����Ͽ� �� ���� �����ص� ������ �߻����� �ʰ� ���ĵǾ����ϴ�.

-- customer_0827 Table Create SQL
CREATE TABLE customer_0827
(
    cid           NUMBER          NOT NULL, 
    name          VARCHAR2(10)    NOT NULL, 
    tel           VARCHAR2(20)    NOT NULL, 
    addr          VARCHAR2(50)    NOT NULL, 
    birth         VARCHAR2(20)    NOT NULL, 
    gender        CHAR(3)         NOT NULL, 
    jupsu_date    VARCHAR2(20)    NOT NULL, 
     PRIMARY KEY (cid)
)
/

CREATE SEQUENCE customer_0827_SEQ
START WITH 1
INCREMENT BY 1;
/

/*
CREATE OR REPLACE TRIGGER customer_0827_AI_TRG
BEFORE INSERT ON customer_0827 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT customer_0827_SEQ.NEXTVAL
    INTO :NEW.cid
    FROM DUAL;
END;
*/
/

--DROP TRIGGER customer_0827_AI_TRG;
/

--DROP SEQUENCE customer_0827_SEQ;
/

COMMENT ON TABLE customer_0827 IS '������'
/

COMMENT ON COLUMN customer_0827.cid IS '��ID'
/

COMMENT ON COLUMN customer_0827.name IS '����'
/

COMMENT ON COLUMN customer_0827.tel IS '��ȭ'
/

COMMENT ON COLUMN customer_0827.addr IS '�ּ�'
/

COMMENT ON COLUMN customer_0827.birth IS '������'
/

COMMENT ON COLUMN customer_0827.gender IS '����'
/

COMMENT ON COLUMN customer_0827.jupsu_date IS '������¥'
/


-- car_0827 Table Create SQL
CREATE TABLE car_0827
(
    carid        NUMBER          NOT NULL, 
    name         VARCHAR2(20)    NOT NULL, 
    color        VARCHAR2(10)    NOT NULL, 
    price        NUMBER          NOT NULL, 
    insu_date    VARCHAR2(20)    NOT NULL, 
     PRIMARY KEY (carid)
)
/

CREATE SEQUENCE car_0827_SEQ
START WITH 1
INCREMENT BY 1;
/

/*
CREATE OR REPLACE TRIGGER car_0827_AI_TRG
BEFORE INSERT ON car_0827 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT car_0827_SEQ.NEXTVAL
    INTO :NEW.carid
    FROM DUAL;
END;
*/
/

--DROP TRIGGER car_0827_AI_TRG;
/

--DROP SEQUENCE car_0827_SEQ;
/

COMMENT ON TABLE car_0827 IS '��������'
/

COMMENT ON COLUMN car_0827.carid IS '��ID'
/

COMMENT ON COLUMN car_0827.name IS '������'
/

COMMENT ON COLUMN car_0827.color IS '����'
/

COMMENT ON COLUMN car_0827.price IS '����'
/

COMMENT ON COLUMN car_0827.insu_date IS '�μ���¥'
/


-- customer_hb_0827 Table Create SQL
CREATE TABLE customer_hb_0827
(
    hid         NUMBER          NOT NULL, 
    health      VARCHAR2(20)    NULL, 
    game        VARCHAR2(20)    NULL, 
    study       VARCHAR2(20)    NULL, 
    drinking    VARCHAR2(20)    NULL, 
    sleeping    VARCHAR2(20)    NULL, 
    bruise      VARCHAR2(20)    NULL, 
    cid         NUMBER          NOT NULL, 
     PRIMARY KEY (hid)
)
/

CREATE SEQUENCE customer_hb_0827_SEQ
START WITH 1
INCREMENT BY 1;
/

/*
CREATE OR REPLACE TRIGGER customer_hb_0827_AI_TRG
BEFORE INSERT ON customer_hb_0827 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT customer_hb_0827_SEQ.NEXTVAL
    INTO :NEW.hid
    FROM DUAL;
END;
*/
/

--DROP TRIGGER customer_hb_0827_AI_TRG;
/

--DROP SEQUENCE customer_hb_0827_SEQ;
/

COMMENT ON TABLE customer_hb_0827 IS '�� ���'
/

COMMENT ON COLUMN customer_hb_0827.hid IS '���ID'
/

COMMENT ON COLUMN customer_hb_0827.health IS '�'
/

COMMENT ON COLUMN customer_hb_0827.game IS '����'
/

COMMENT ON COLUMN customer_hb_0827.study IS '����'
/

COMMENT ON COLUMN customer_hb_0827.drinking IS '�����ñ�'
/

COMMENT ON COLUMN customer_hb_0827.sleeping IS '���ڱ�'
/

COMMENT ON COLUMN customer_hb_0827.bruise IS '�۶�����'
/

COMMENT ON COLUMN customer_hb_0827.cid IS '��ID'
/

ALTER TABLE customer_hb_0827
    ADD CONSTRAINT FK_customer_hb_0827_cid_custom FOREIGN KEY (cid)
        REFERENCES customer_0827 (cid)
/


-- sales_0827 Table Create SQL
CREATE TABLE sales_0827
(
    sid        NUMBER          NOT NULL, 
    cid        NUMBER          NOT NULL, 
    carid      NUMBER          NOT NULL, 
    manager    VARCHAR2(20)    NOT NULL, 
     PRIMARY KEY (sid)
)
/

CREATE SEQUENCE sales_0827_SEQ
START WITH 1
INCREMENT BY 1;
/

/*
CREATE OR REPLACE TRIGGER sales_0827_AI_TRG
BEFORE INSERT ON sales_0827 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT sales_0827_SEQ.NEXTVAL
    INTO :NEW.sid
    FROM DUAL;
END;
*/
/

--DROP TRIGGER sales_0827_AI_TRG;
/

--DROP SEQUENCE sales_0827_SEQ;
/

COMMENT ON TABLE sales_0827 IS '�Ÿ�����'
/

COMMENT ON COLUMN sales_0827.sid IS '�Ÿ�ID'
/

COMMENT ON COLUMN sales_0827.cid IS '��ID'
/

COMMENT ON COLUMN sales_0827.carid IS '��ID'
/

COMMENT ON COLUMN sales_0827.manager IS '�����'
/

ALTER TABLE sales_0827
    ADD CONSTRAINT FK_sales_0827_cid_customer_082 FOREIGN KEY (cid)
        REFERENCES customer_0827 (cid)
/

ALTER TABLE sales_0827
    ADD CONSTRAINT FK_sales_0827_carid_car_0827_c FOREIGN KEY (carid)
        REFERENCES car_0827 (carid)
/


