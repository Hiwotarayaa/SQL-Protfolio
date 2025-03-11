Customers Who Have Only Made One Purchase (One-Time Buyers)

SELECT 
    c.customer_id, 
    c.name AS customer_name, 
    COUNT(o.order_id) AS total_orders
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.name
HAVING 
    COUNT(o.order_id) = 1;


-Identifies one-time buyers who need a customer retention strategy.
