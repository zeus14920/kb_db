insert into car_0827 values (CAR_0827_SEQ.nextval, '�׷���', '���ֻ�', 3800, '2021��8��31��');

insert into sales_0827 values (SALES_0827_SEQ.nextval, SALES_0827_SEQ.currval, SALES_0827_SEQ.currval, '�ں���');

insert all 
    into customer_0827 values (customer_0827_seq.nextval, '�̼���', '01012345678', '�뱸�� ���� ��õ4��', '1990��8��1��', '��', '2021��8��30��')
    into customer_hb_0827 VALUES (CUSTOMER_HB_0827_SEQ.nextval, '���ڱ�', '�����ϱ�', '', '', '', '', CUSTOMER_HB_0827_SEQ.currval)
    into car_0827 values (CAR_0827_SEQ.nextval, '�׷���', '���ֻ�', 3800, '2021��8��31��')
    into sales_0827 values (SALES_0827_SEQ.nextval, SALES_0827_SEQ.currval, SALES_0827_SEQ.currval, '�ں���')
select*from dual;