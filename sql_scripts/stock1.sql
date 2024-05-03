CREATE VIEW stock1 AS
select 
s2.item_name,
s2.materials_id,
s2.mat_name,
s2.mat_weight,
s2.amount,
s2.mat_price,
s2.order_quantity,
s2.materials_needed_quantity,
s2.ordered_weight,
s2.unit_cost,
s2.ordered_weight*s2.unit_cost as material_cost
from (select 
s1.item_name,
s1.materials_id,
s1.mat_name,
s1.mat_weight,
s1.amount,
s1.mat_price,
s1.order_quantity,
s1.materials_needed_quantity,
s1.order_quantity*s1.materials_needed_quantity as ordered_weight,
CASE 
        WHEN s1.mat_weight IS NOT NULL THEN s1.mat_price
        ELSE s1.mat_price / s1.amount
END AS unit_cost
 from (SELECT 
o.item_id,
i.sku,
i.item_name,
mi.materials_id,
m.mat_name,
mi.quantity as materials_needed_quantity,
sum(o.quantity) as order_quantity,
m.mat_weight,
m.amount,
m.mat_price
from orders o 
left join items i on o.item_id = i.item_id
left join materials_items mi on i.sku = mi.product_id
left join materials m on m.materials_id = mi.materials_id
group by 
o.item_id, 
i.sku, 
i.item_name,
mi.materials_id,
m.mat_name,
mi.quantity, 
m.mat_weight,
m.amount,
m.mat_price) s1) s2;