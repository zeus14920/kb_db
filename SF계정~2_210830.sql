
select * 
    from car_0827 ca, customer_0827 cu, sales_0827 sa
    where sa.carid = ca.carid and sa.cid = cu.cid;
    
select ca.name as 차량명, ca.price as 가격, ca.insu_date as 인수날짜,
    cu.name as 고객명, cu.tel as 연락처, cu.jupsu_date as 접수날짜,
    sa.manager as 담당자
    from car_0827 ca, customer_0827 cu, sales_0827 sa
    where sa.carid = ca.carid and sa.cid = cu.cid;
--##########################################################################
    
create or replace view sales_0827_view as
    select ca.name as 차량명, ca.price as 가격, ca.insu_date as 인수날짜,
    cu.name as 고객명, cu.tel as 연락처, cu.jupsu_date as 접수날짜,
    sa.manager as 담당자
    from car_0827 ca, customer_0827 cu, sales_0827 sa
    where sa.carid = ca.carid and sa.cid = cu.cid;
select*from sales_0827_view;

--##########################################################################

select manager as 담당자,
    (select ca.name from car_0827 ca where ca.carid=sa.sid) as 차량명,
    (select cu.name from customer_0827 cu where cu.cid=sa.sid) as 고객명,
    (select cu.tel from customer_0827 cu where cu.cid=sa.sid) as 차량명
from sales_0827 sa;
    
    
    
    
    
    
    
    
    