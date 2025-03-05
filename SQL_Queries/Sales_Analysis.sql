-- Total Sales by Region  
SELECT region, SUM(sales) AS total_sales  
FROM sales_data  
GROUP BY region  
ORDER BY total_sales DESC;  
