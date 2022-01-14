/*
varchar : 가변 길이 문자 데이터 (1~4000바이트)
varchar2 : 가변 길이 문자 데이터 (1~4000바이트) --> 권장
char : 고정 길이 문자 데이터 (1~2000바이트)
number : 숫자 가변 길이 데이터
date : 날짜(7바이트로 저장)
clob : 대용량 문자열 처리
blob : 이진 대형 객체(binary), 이미지, 동영상, 사운드 파일
*/

create table student_t(
    -- primary key : 고유한(uique) 값을 보장하는 속성
    id number not null primary key,
    name varchar(20) not null,
    age number not null,
    address VARCHAR2(80) not null
);

-- 시퀸스 생성
create sequence seq_id increment by 1 start WITH 111;

insert into student_t (id, name, age, address) VALUES (seq_id.nextval, '홍길동', 100, '조선 한양 홍대감댁'); 
insert into student_t (id, name, age, address) VALUES (seq_id.nextval, '전우치', 200, '조선 강원 두메산골');

-- 테이블 수정
-- 테이블에 새로운 컬럼 추가
alter table student_t add(grade char(5));

SELECT*FROM student_t;
/*
-- 테이블 삭제
drop table student_t;

-- 시퀸스 삭제
drop SEQUENCE seq_id;
*/













