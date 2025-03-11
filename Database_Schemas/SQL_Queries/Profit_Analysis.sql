Profit Margin Calculation (Requires Product Table)
If you have a products table, you can calculate profit margins.


SELECT 
    p.product_name,
    SUM(o.total_amount) AS total_revenue,
    SUM(p.cost_price * oi.quantity) AS total_cost,
    SUM(o.total_amount - (p.cost_price * oi.quantity)) AS total_profit,
    ROUND(AVG((o.total_amount - (p.cost_price * oi.quantity)) / o.total_amount) * 100, 2) AS profit_margin
FROM 
    orders o
JOIN 
    order_items oi ON o.order_id = oi.order_id
JOIN 
    products p ON oi.product_id = p.product_id
GROUP BY 
    p.product_name
ORDER BY 
    total_profit DESC;


Helps analyze profitability per product.
Useful for pricing strategy adjustments.
