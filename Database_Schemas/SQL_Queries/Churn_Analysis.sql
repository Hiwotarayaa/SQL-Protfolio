✅ Identifying Inactive Customers (No Purchases in Last 6 Months)


SELECT 
    c.customer_id, 
    c.name AS customer_name, 
    MAX(o.order_date) AS last_purchase
FROM 
    customers c
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.name
HAVING 
    MAX(o.order_date) < DATEADD(MONTH, -6, GETDATE())
ORDER BY 
    last_purchase ASC;


✅ Why This Matters:

Helps identify customers at risk of churning.
Can be used to target re-engagement campaigns.
