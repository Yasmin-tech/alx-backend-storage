-- a SQL script that creates a trigger that decreases the quantity of an item 
-- after adding a new order.
DELIMITER $$
CREATE TRIGGER tr_update_items_quantity
AFTER INSERT
ON orders
FOR EACH ROW
BEGIN
    -- IF new.item_name = itmes.name THEN
        UPDATE items SET quantity = quantity - new.number
        WHERE new.item_name = items.name;
    -- END IF;
END $$
DELIMITER ;
    
