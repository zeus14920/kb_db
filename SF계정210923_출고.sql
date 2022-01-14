select m.mcode as 코드,m.mname as 제품명, m.mprice as 가격, i.iquantity as 입고수량, 
sum(i.iquantity) over(partition by m.mcode order by i.time) 재고수량, i.time as 자재입출고시간 
from import i, warehouse w, material m 
where i.wno = w.wno and w.wno = m.wno;


select m.mcode as 코드,m.mname as 제품명, m.mprice as 가격,
case when i.time<s.time then i.iquantity
     else 0
     end as 입고수량,
case when i.time<s.time then 0
     else s.snum
     end as 출고수량,
case when i.time<s.time then sum(i.iquantity) over(partition by m.mcode order by i.time)
     when i.time>s.time then sum(s.snum) over(partition by m.mcode order by s.time)
     end as 재고수량,
i.time as 자재입출고시간 from import i, warehouse w, material m, shipping s
where i.wno = w.wno and w.wno = m.wno and w.wno=s.wno;

-- ab2 출고 넣고 ab1 입고 넣어 볼 것, 실행 결과 불만족
select m.mcode as 코드,m.mname as 제품명, m.mprice as 가격,i.iquantity as 입고수량, s.snum as 출고수량, i.time as 입고시간, s.time 출고시간
from warehouse w, import i, material m, shipping s
where w.wno=i.wno and w.wno=m.wno and w.wno=s.wno order by i.time,s.time;

-- 시간 순차로 찾아옴, 확인 완료
select m.mcode as 코드,m.mname as 제품명, m.mprice as 가격,i.iquantity as 입고수량, s.snum as 출고수량, 
case when i.time = s.time then i.time
when i.iquantity>0 and s.snum=0 then i.time 
when s.snum>0 and i.iquantity=0 then s.time
ELSE null
end as 입출고시간
from warehouse w, import i, material m, shipping s
where w.wno=i.wno and w.wno=m.wno and w.wno=s.wno and not (i.iquantity != 0 and s.snum != 0) order by 입출고시간;

UPDATE warehouse set inventory=inventory+-500 where wno=(SELECT w.wno from warehouse w, material m where w.wno=m.wno and m.mcode='ab1');

select m.mcode as 코드,m.mname as 제품명, m.mprice as 가격,i.iquantity as 입고수량, s.snum as 출고수량 
    from warehouse w, import i, material m, shipping s
    where w.wno=i.wno and w.wno=m.wno and w.wno=s.wno  and not (i.iquantity != 0 and s.snum != 0);















