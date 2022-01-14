CREATE TABLE STUDENTS_T(
    ID NUMBER NOT NULL,
    NAME VARCHAR(20) NOT NULL,
    AGE NUMBER NOT NULL,
    ADDR VARCHAR(80) NOT NULL
    --CONSTRAINT PK_STUDENTS_ID PRIMARY KEY(ID)
);

-- 시퀸스를 생성하여 ID를 1000부터 1씩 자동으로 증가하도록 처리
CREATE SEQUENCE SEQU_ID INCREMENT BY 1 START WITH 1000;

-- 시퀸스 삭제
DROP SEQUENCE SEQ_ID;

-- SQL 사용예
INSERT INTO students_T VALUES(SEQU_ID.NEXTVAL, '최길동', 100, '대구 달서구');

-- 3. 테이블 정보 보기
DESC STUDENTS_T;

-- 4. 테이블 수정
ALTER TABLE STUDENTS_T ADD(NAME2 VARCHAR2(40));         -- 테이블에 새로운 컬럼 추가
ALTER TABLE STUDENTS_T MODIFY(NAME2 VARCHAR2(50));      -- 컬럼 정보 수정
ALTER TABLE STUDENTS_T RENAME COLUMN NAME2 TO NAME4;    -- 컬럼 이름 변경
ALTER TABLE STUDENTS_T DROP COLUMN NAME4;               -- 새로 추가한 컬럼 삭제

-- 5. 테이블 삭제
DROP TABLE STUDENTS_T;

-- 6. 테이블 생성 후 PRIMARY KEY 지정
ALTER TABLE STUDENTS_T ADD CONSTRAINT PK_STUDENTSS_ID PRIMARY KEY(ID);

-- 7. 기본 쿼리 처리문

-- ㄱ. 데이터 추가
-- 시퀀스를 추가하여 자동으로 ID값 증가하도록 처리 (2. 테이블 생성 참고)
INSERT INTO STUDENTS_T VALUES (SEQU_ID.NEXTVAL, '김길동', 100, '대구 달서구');
INSERT INTO STUDENTS_T VALUES (SEQU_ID.NEXTVAL, '이순신', 100, '대구 서구');
INSERT INTO STUDENTS_T VALUES (SEQU_ID.NEXTVAL, '유관순', 50, '대구 동구');

-- ㄴ. 생성된 모든 데이터의 행의 전체갯수 가져오기
SELECT COUNT(*) FROM STUDENTS_T;

-- ㄷ. 테이블에서 데이터 가져오기(특정 조건)
 SELECT * FROM students_t;
SELECT NAME, AGE FROM students_t WHERE ID=1020;
SELECT NAME, AGE FROM students_t;

-- ㄹ. WHERE 검색 조건 (모든 DB에서 검색)
SELECT * FROM students_t WHERE ID=1000;
SELECT * FROM STUDENTS_T WHERE NAME IS NULL;        -- NULL 일 경우
SELECT * FROM STUDENTS_T WHERE NAME IS NOT NULL;    -- NULL 이 아닌 경우
SELECT * FROM STUDENTS_T WHERE NAME LIKE '%길동';    -- "길동"을 포함하는 이름
SELECT * FROM STUDENTS_T WHERE NAME LIKE '_길동';    -- 3자리 길이 이름 중 "길동"을 포함하는 이름

-- ㅁ. 데이터 정렬
SELECT * FROM STUDENTS_T ORDER BY NAME;                             -- 기본적으로 오름차순 정렬
SELECT * FROM STUDENTS_T ORDER BY NAME ASC;                         -- 기본적으로 오름차순 정렬
SELECT * FROM STUDENTS_T ORDER BY NAME DESC;                        -- 내림차순 정렬
SELECT * FROM STUDENTS_T ORDER BY NAME ASC, AGE DESC;               -- 이름으로 오름차순 정령, 동일한 이름이 있을 시 나이로 내림차순
SELECT * FROM STUDENTS_T WHERE NAME LIKE '%길동' ORDER BY ID DESC;   -- "길동"을 포함하는 이름들을 ID내림차순으로 정렬

-- ㅂ. 데이터 삭제
-- DELETE FROM 테이블명 WHERE 필드명 ='검색어';
DELETE FROM STUDENTS_T WHERE ID=1003;

-- ㅅ. 데이터 수정
UPDATE STUDENTS_T SET NAME='박길동' WHERE NAME='최길동';
UPDATE STUDENTS_T SET NAME='가나길동' WHERE NAME LIKE '%길동';
UPDATE STUDENTS_T SET NAME='최만두' WHERE ID=10;
UPDATE STUDENTS_T SET NAME='홍만두', AGE=11, ADDR='서울 강남 강남스타일로' WHERE ID=1000;
UPDATE students_t SET AGE=40 WHERE ID=1004;










