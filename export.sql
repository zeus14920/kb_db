--------------------------------------------------------
--  파일이 생성됨 - 화요일-8월-31-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence STUDENT_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SCOTT"."STUDENT_T_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table STUDENT_T
--------------------------------------------------------

  CREATE TABLE "SCOTT"."STUDENT_T" 
   (	"ID" CHAR(5 BYTE), 
	"NAME" VARCHAR2(10 BYTE), 
	"TEL" VARCHAR2(20 BYTE), 
	"AGE" NUMBER(3,0), 
	"GENDER" CHAR(3 BYTE), 
	"GRADE" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View SALES_0827_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SCOTT"."SALES_0827_VIEW" ("차량명", "가격", "인수날짜", "고객명", "연락처", "접수날짜", "담당자") AS 
  select ca.name as 차량명, ca.price as 가격, ca.insu_date as 인수날짜,
    cu.name as 고객명, cu.tel as 연락처, cu.jupsu_date as 접수날짜,
    sa.manager as 담당자
    from car_0827 ca, customer_0827 cu, sales_0827 sa
    where sa.carid = ca.carid and sa.cid = cu.cid
;
REM INSERTING into SCOTT.STUDENT_T
SET DEFINE OFF;
Insert into SCOTT.STUDENT_T (ID,NAME,TEL,AGE,GENDER,GRADE) values ('6    ','홍길동','01012341234',20,'남','4학년');
--------------------------------------------------------
--  DDL for Index SYS_C008271
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C008271" ON "SCOTT"."STUDENT_T" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table STUDENT_T
--------------------------------------------------------

  ALTER TABLE "SCOTT"."STUDENT_T" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."STUDENT_T" MODIFY ("TEL" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."STUDENT_T" MODIFY ("AGE" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."STUDENT_T" MODIFY ("GENDER" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."STUDENT_T" MODIFY ("GRADE" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."STUDENT_T" ADD CONSTRAINT "AGE_CHK2" CHECK (AGE>=19) ENABLE;
  ALTER TABLE "SCOTT"."STUDENT_T" ADD CONSTRAINT "GENDER_CHK2" CHECK (GENDER IN('남','여')) ENABLE;
  ALTER TABLE "SCOTT"."STUDENT_T" ADD CONSTRAINT "GRADE_CHK2" CHECK (GRADE IN('1학년','2학년','3학년','4학년')) ENABLE;
  ALTER TABLE "SCOTT"."STUDENT_T" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
