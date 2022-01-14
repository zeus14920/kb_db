insert into car_0827 values (CAR_0827_SEQ.nextval, '그랜저', '진주색', 3800, '2021년8월31일');

insert into sales_0827 values (SALES_0827_SEQ.nextval, SALES_0827_SEQ.currval, SALES_0827_SEQ.currval, '박부장');

insert all 
    into customer_0827 values (customer_0827_seq.nextval, '이순신', '01012345678', '대구시 동구 신천4동', '1990년8월1일', '남', '2021년8월30일')
    into customer_hb_0827 VALUES (CUSTOMER_HB_0827_SEQ.nextval, '잠자기', '게임하기', '', '', '', '', CUSTOMER_HB_0827_SEQ.currval)
    into car_0827 values (CAR_0827_SEQ.nextval, '그랜저', '진주색', 3800, '2021년8월31일')
    into sales_0827 values (SALES_0827_SEQ.nextval, SALES_0827_SEQ.currval, SALES_0827_SEQ.currval, '박부장')
select*from dual;