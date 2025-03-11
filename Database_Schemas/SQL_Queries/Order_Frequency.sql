Average Time Between Orders
sql

  
SELECT 
    customer_id, 
    ROUND(AVG(DATEDIFF(DAY, prev_order, order_date)), 2) AS avg_days_between_orders
FROM (
    SELECT 
        customer_id,
        order_date,
        LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS prev_order
    FROM 
        orders
) subquery
WHERE prev_order IS NOT NULL
GROUP BY customer_id
ORDER BY avg_days_between_orders ASC;


Helps track customer purchasing patterns.
Useful for predicting repeat purchases.
