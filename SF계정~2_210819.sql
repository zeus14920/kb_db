/*
varchar : ���� ���� ���� ������ (1~4000����Ʈ)
varchar2 : ���� ���� ���� ������ (1~4000����Ʈ) --> ����
char : ���� ���� ���� ������ (1~2000����Ʈ)
number : ���� ���� ���� ������
date : ��¥(7����Ʈ�� ����)
clob : ��뷮 ���ڿ� ó��
blob : ���� ���� ��ü(binary), �̹���, ������, ���� ����
*/

create table student_t(
    -- primary key : ������(uique) ���� �����ϴ� �Ӽ�
    id number not null primary key,
    name varchar(20) not null,
    age number not null,
    address VARCHAR2(80) not null
);

-- ������ ����
create sequence seq_id increment by 1 start WITH 111;

insert into student_t (id, name, age, address) VALUES (seq_id.nextval, 'ȫ�浿', 100, '���� �Ѿ� ȫ�밨��'); 
insert into student_t (id, name, age, address) VALUES (seq_id.nextval, '����ġ', 200, '���� ���� �θ޻��');

-- ���̺� ����
-- ���̺� ���ο� �÷� �߰�
alter table student_t add(grade char(5));

SELECT*FROM student_t;
/*
-- ���̺� ����
drop table student_t;

-- ������ ����
drop SEQUENCE seq_id;
*/













