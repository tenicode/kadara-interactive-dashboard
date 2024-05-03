CREATE VIEW stock2 AS
SELECT 
s3.mat_name,
s3.ordered_weight,
CASE 
        WHEN m.mat_weight IS NOT NULL THEN inv.quantity
        ELSE m.amount*inv.quantity
END AS inv_amount,
		CASE 
            WHEN m.mat_weight IS NOT NULL THEN GREATEST(0, inv.quantity - s3.ordered_weight)
            ELSE GREATEST(0, (m.amount * inv.quantity)- s3.ordered_weight)
        END AS remaining_stock
 FROM (select 
materials_id,
mat_name,
 sum(ordered_weight) as ordered_weight
from stock1
group by mat_name, materials_id) s3
LEFT JOIN inventory inv ON inv.materials_id = s3.materials_id
LEFT JOIN materials m ON m.materials_id = s3.materials_id
;

