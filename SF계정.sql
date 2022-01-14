create table customer(
  cname varchar2(20) not null,   -- 이름, 이름 값이 없으면 안된다
  age number(5),                 -- 나이
  gender char(1),                -- 성별
  reg_date date default sysdate
);

insert into customer (cname, age, gender, reg_date)
values('홍길동',20,'M',sysdate);
insert into customer (cname, age) VALUES('이순신',100);
insert into customer values ('전우치',25,'M',sysdate);
-- not null 속성으로 오류 발생, 이름 값이 없어서 테이블에 삽입 안됨
-- insert into customer (age, gender) values (200,'M'); 
insert into customer (cname, age, gender) VALUES('심사임당',200,'F');

select * from customer; -- *의 의미는 모든 정보를 가지고 온다
select cname from customer; -- customer의 이름 정보만 가지고 온다
select cname, gender from customer; -- customer의 이름, 성별 정보만 가지고 온다 
select cname as "이름", gender as "성별" from customer; -- cname as "이름" cname의 별칭을 이름으로 하겠다