-- create database kadara;
-- use kadara;

-- CREATE TABLE `orders` (
--     `row_id` int  NOT NULL ,
--     `order_id` varchar(10)  NOT NULL ,
--     `created_at` datetime  NOT NULL ,
--     `item_id` int  NOT NULL ,
--     `quantity` int  NOT NULL ,
--     `cust_id` int  NOT NULL ,
--     `add_id` int  NOT NULL ,
--     PRIMARY KEY (
--         `row_id`
--     )
-- );

-- CREATE TABLE `customers` (
--     `cust_id` int  NOT NULL ,
--     `cust_firstname` varchar(50)  NOT NULL ,
--     `cust_lastname` varchar(50)  NOT NULL ,
--     PRIMARY KEY (
--         `cust_id`
--     )
-- );

-- CREATE TABLE `address` (
--     `add_id` int  NOT NULL ,
--     `delivery_address1` varchar(250)  NOT NULL ,
--     `delivery_address2` varchar(250)  NULL ,
--     `delivery_city` varchar(50)  NOT NULL ,
--     `delivery_postcode` varchar(50)  NOT NULL ,
--     PRIMARY KEY (
--         `add_id`
--     )
-- );

-- CREATE TABLE `items` (
--     `item_id` int  NOT NULL ,
--     `sku` varchar(100)  NOT NULL ,
--     `item_name` varchar(250)  NOT NULL ,
--     `item_cat` varchar(250)  NOT NULL ,
--     `item_size` varchar(50)  NOT NULL ,
--     `item_price` decimal(10,2)  NOT NULL ,
--     PRIMARY KEY (
--         `item_id`
--     )
-- );

-- CREATE TABLE `materials` (
--     `materials_id` int  NOT NULL ,
--     `mat_name` varchar(200)   NULL ,
--     `mat_weight` int   NULL ,
--     `mat_meas` varchar(50)   NULL ,
--     `amount` decimal(5,2)   NULL ,
--     `mat_price` decimal(5,2)  NOT NULL ,
--     PRIMARY KEY (
--         `materials_id`
--     )
-- );

-- CREATE TABLE `materials_items` (
--     `mi_id` varchar(10)  NOT NULL ,
--     `product_id` varchar(100)  NOT NULL ,
--     `materials_id` int  NOT NULL ,
--     `quantity` int  NOT NULL ,
--     PRIMARY KEY (
--         `mi_id`
--     )
-- );

-- CREATE TABLE `inventory` (
--     `inv_id` int  NOT NULL ,
--     `materials_id` int  NOT NULL ,
--     `quantity` int  NOT NULL ,
--     PRIMARY KEY (
--         `inv_id`
--     )
-- );

-- ALTER TABLE `customers` ADD CONSTRAINT `fk_customers_cust_id` FOREIGN KEY(`cust_id`)
-- REFERENCES `orders` (`cust_id`);

-- ALTER TABLE `address` ADD CONSTRAINT `fk_address_add_id` FOREIGN KEY(`add_id`)
-- REFERENCES `orders` (`add_id`);

-- ALTER TABLE `items` ADD CONSTRAINT `fk_items_item_id` FOREIGN KEY(`item_id`)
-- REFERENCES `orders` (`item_id`);

-- ALTER TABLE `materials` ADD CONSTRAINT `fk_materials_materials_id` FOREIGN KEY(`materials_id`)
-- REFERENCES `materials_items` (`materials_id`);

-- ALTER TABLE `materials_items` ADD CONSTRAINT `fk_materials_items_product_id` FOREIGN KEY(`product_id`)
-- REFERENCES `items` (`sku`);

-- ALTER TABLE `inventory` ADD CONSTRAINT `fk_inventory_materials_id` FOREIGN KEY(`materials_id`)
-- REFERENCES `materials_items` (`materials_id`);
