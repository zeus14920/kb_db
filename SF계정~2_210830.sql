
select * 
    from car_0827 ca, customer_0827 cu, sales_0827 sa
    where sa.carid = ca.carid and sa.cid = cu.cid;
    
select ca.name as ������, ca.price as ����, ca.insu_date as �μ���¥,
    cu.name as ����, cu.tel as ����ó, cu.jupsu_date as ������¥,
    sa.manager as �����
    from car_0827 ca, customer_0827 cu, sales_0827 sa
    where sa.carid = ca.carid and sa.cid = cu.cid;
--##########################################################################
    
create or replace view sales_0827_view as
    select ca.name as ������, ca.price as ����, ca.insu_date as �μ���¥,
    cu.name as ����, cu.tel as ����ó, cu.jupsu_date as ������¥,
    sa.manager as �����
    from car_0827 ca, customer_0827 cu, sales_0827 sa
    where sa.carid = ca.carid and sa.cid = cu.cid;
select*from sales_0827_view;

--##########################################################################

select manager as �����,
    (select ca.name from car_0827 ca where ca.carid=sa.sid) as ������,
    (select cu.name from customer_0827 cu where cu.cid=sa.sid) as ����,
    (select cu.tel from customer_0827 cu where cu.cid=sa.sid) as ������
from sales_0827 sa;
    
    
    
    
    
    
    
    
    