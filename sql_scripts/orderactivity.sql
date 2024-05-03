CREATE VIEW orderactivity AS
SELECT
o.order_id,
i.item_price,
o.quantity,
i.item_cat,
i.item_name,
o.created_at,
a.delivery_address1,
a.delivery_address2,
a.delivery_city,
a.delivery_postcode
FROM orders o 
LEFT JOIN items i on o.item_id = i.item_id
LEFT JOIN address a on o.add_id = a.add_id;