select m.mcode as �ڵ�,m.mname as ��ǰ��, m.mprice as ����, i.iquantity as �԰����, 
sum(i.iquantity) over(partition by m.mcode order by i.time) ������, i.time as ���������ð� 
from import i, warehouse w, material m 
where i.wno = w.wno and w.wno = m.wno;


select m.mcode as �ڵ�,m.mname as ��ǰ��, m.mprice as ����,
case when i.time<s.time then i.iquantity
     else 0
     end as �԰����,
case when i.time<s.time then 0
     else s.snum
     end as ������,
case when i.time<s.time then sum(i.iquantity) over(partition by m.mcode order by i.time)
     when i.time>s.time then sum(s.snum) over(partition by m.mcode order by s.time)
     end as ������,
i.time as ���������ð� from import i, warehouse w, material m, shipping s
where i.wno = w.wno and w.wno = m.wno and w.wno=s.wno;

-- ab2 ��� �ְ� ab1 �԰� �־� �� ��, ���� ��� �Ҹ���
select m.mcode as �ڵ�,m.mname as ��ǰ��, m.mprice as ����,i.iquantity as �԰����, s.snum as ������, i.time as �԰�ð�, s.time ���ð�
from warehouse w, import i, material m, shipping s
where w.wno=i.wno and w.wno=m.wno and w.wno=s.wno order by i.time,s.time;

-- �ð� ������ ã�ƿ�, Ȯ�� �Ϸ�
select m.mcode as �ڵ�,m.mname as ��ǰ��, m.mprice as ����,i.iquantity as �԰����, s.snum as ������, 
case when i.time = s.time then i.time
when i.iquantity>0 and s.snum=0 then i.time 
when s.snum>0 and i.iquantity=0 then s.time
ELSE null
end as �����ð�
from warehouse w, import i, material m, shipping s
where w.wno=i.wno and w.wno=m.wno and w.wno=s.wno and not (i.iquantity != 0 and s.snum != 0) order by �����ð�;

UPDATE warehouse set inventory=inventory+-500 where wno=(SELECT w.wno from warehouse w, material m where w.wno=m.wno and m.mcode='ab1');

select m.mcode as �ڵ�,m.mname as ��ǰ��, m.mprice as ����,i.iquantity as �԰����, s.snum as ������ 
    from warehouse w, import i, material m, shipping s
    where w.wno=i.wno and w.wno=m.wno and w.wno=s.wno  and not (i.iquantity != 0 and s.snum != 0);















