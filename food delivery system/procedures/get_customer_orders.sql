create or replace PROCEDURE get_customer_orders(
    p_customer_id IN NUMBER
)
IS
BEGIN
    FOR order_rec IN (
        SELECT o.id, m.item_name, r.name as restaurant_name
        FROM orders o
        JOIN menu m ON o.id = m.id
        JOIN restaurants r ON m.restaurant_id = r.restaurant_id
        WHERE o.customer_id = p_customer_id
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('Order ID: ' || order_rec.id || ', Item Name: ' || order_rec.item_name || ', Restaurant Name: ' || order_rec.restaurant_name);
    END LOOP;
END;
/