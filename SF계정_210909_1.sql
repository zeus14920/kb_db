select * from(select * from line_env_data_t order by time desc) where rownum<=5;

INSERT ALL
INTO material VALUES('ab1', '����1', 1000, 0)
INTO IMPORT(INO, IQUANTITY) VALUES(IMPORT_SEQ.nextval, 100)
SELECT * FROM DUAL;

INSERT INTO employee VALUES (4, '�̼���', '��', '010','����2��', '���', '����');

INSERT ALL
INTO material VALUES(MATERIAL_SEQ.nextval, 'ab1', '����1', 1000)
INTO IMPORT VALUES(IMPORT_SEQ.nextval, 100, 
    (select eno from employee where ename='����ġ'), IMPORT_SEQ.currval)
SELECT * FROM DUAL;

select eno from employee where eno=11111;

SELECT M.MCODE AS �ڵ�, M.MNAME AS ��ǰ��, M.MPRICE AS ����, I.IQUANTITY AS �԰����, sum(i.iquantity) AS ������
FROM IMPORT I, MATERIAL M, WAREHOUSE W WHERE w.wno=i.wno and w.wno=m.wno GROUP by m.mcode, m.mname, m.mprice, i.iquantity;

insert into warehouse(wma) select iquantity from import;

insert into material(mcode, mname, mprice) values('ab1', '����1', 1000);
insert into material(mcode, mname, mprice) values('ab2', '����2', 2000);
insert into material(mcode, mname, mprice) values('ab3', '����3', 3000);

insert all
into warehouse values (WAREHOUSE_SEQ.nextval, 0)
into material VALUES ('ab3', '����3', 3000, WAREHOUSE_SEQ.nextval)
SELECT* from dual;

select mcode, mname, mprice from material where mcode='ab2';

select*from material;

UPDATE warehouse set inventory=100 where wno=1; 

INSERT into import values (IMPORT_SEQ.nextval, 1000, (SELECT w.wno from warehouse w, material m where w.wno=m.wno and m.mcode='ab1'));

INSERT ALL
INTO IMPORT VALUES (IMPORT_SEQ.nextval, 1000,(select w.wno from warehouse w, material m where w.wno= m.wno and m.wno=1))
SELECT *FROM DUAL;

UPDATE warehouse set inventory=inventory+100 where wno=(SELECT w.wno from warehouse w, material m where w.wno=m.wno and m.mcode='ab1');

SELECT w.wno from warehouse w, material m where w.wno=m.wno and m.mcode='ab1';

select m.mcode as �ڵ�, m.mname as ��ǰ��, m.mprice as ����, i.iquantity as �԰�, 
sum((select iquantity from import where ino=1)+(select iquantity from import where ino=1)) as ���
from(select * from)import i, material m, warehouse w
where i.wno=w.wno and w.wno=m.wno group by m.mcode, m.mname, m.mprice, i.iquantity order by m.mcode;

select iquantity from import where ino=1 and ino=2;

select * from material;

UPDATE warehouse set inventory= 1000 where wno=(SELECT w.wno from warehouse w, material m where w.wno=m.wno and m.mcode='{1}');

select sum(inventory) from warehouse where wno=1;

INSERT into import values (IMPORT_SEQ.nextval, 100, 
(SELECT w.wno from warehouse w, material m where w.wno=m.wno and m.mcode='ab1'), TO_char(sysdate,'YYYY.MM.DD HH24:MI:SS'));

SELECT wno, iquantity from (select i.*, row_number() over(partition by i.wno order by i.wno) from import i) order by time DESC;

SELECT i.iquantity from (select im.*, row_number() over(partition by wno order by wno) from import im) , import i, material m 
where i.wno=m.wno and m.mcode='ab1' order by i.time DESC;

SELECT m.mcode, i.iquantity 
from (select i.ino, row_number() over(partition by i.wno order by i.wno) from import i), material m, warehouse w, import i
where w.wno = m.wno and i.wno=w.wno
order by time DESC;

SELECT row_number() over(partition by i.wno order by i.time) row_num, i.* from import i order by i.time DESC;





























