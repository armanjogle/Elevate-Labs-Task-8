DELIMITER //

CREATE PROCEDURE get_orders_by_customer1(IN cust_id INT)
BEGIN
    SELECT * FROM `Order` WHERE customer_id = cust_id;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION product_count_in_category1(cat_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE prod_count INT;
    SELECT COUNT(*) INTO prod_count FROM Product WHERE category_id = cat_id;
    RETURN prod_count;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE check_customer_orders(IN cust_id INT)
BEGIN
    IF (SELECT COUNT(*) FROM `Order` WHERE customer_id = cust_id) > 0 THEN
        SELECT 'Customer has orders';
    ELSE
        SELECT 'No orders found';
    END IF;
END //

DELIMITER ;
