-- Year-over-Year Sales Analysis
SELECT 
    YEAR(order_date) AS sales_year,
    SUM(total_amount) AS total_sales
FROM 
    orders
GROUP BY 
    YEAR(order_date)
ORDER BY 
    sales_year;
