SELECT 
    SUM(total_amount) AS total_revenue
FROM 
    orders;


- Shows overall business revenue. 
- can be used in Power BI dashboards

MONTHLY REVENUE TRENDS 

SELECT 
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    SUM(total_amount) AS monthly_revenue
FROM 
    orders
GROUP BY 
    YEAR(order_date), MONTH(order_date)
ORDER BY 
    sales_year, sales_month;


- Helps identify high and low revenue months 
- Useful for seasonal sales analysis 
