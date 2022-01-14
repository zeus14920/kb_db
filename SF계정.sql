create table customer(
  cname varchar2(20) not null,   -- �̸�, �̸� ���� ������ �ȵȴ�
  age number(5),                 -- ����
  gender char(1),                -- ����
  reg_date date default sysdate
);

insert into customer (cname, age, gender, reg_date)
values('ȫ�浿',20,'M',sysdate);
insert into customer (cname, age) VALUES('�̼���',100);
insert into customer values ('����ġ',25,'M',sysdate);
-- not null �Ӽ����� ���� �߻�, �̸� ���� ��� ���̺� ���� �ȵ�
-- insert into customer (age, gender) values (200,'M'); 
insert into customer (cname, age, gender) VALUES('�ɻ��Ӵ�',200,'F');

select * from customer; -- *�� �ǹ̴� ��� ������ ������ �´�
select cname from customer; -- customer�� �̸� ������ ������ �´�
select cname, gender from customer; -- customer�� �̸�, ���� ������ ������ �´� 
select cname as "�̸�", gender as "����" from customer; -- cname as "�̸�" cname�� ��Ī�� �̸����� �ϰڴ�