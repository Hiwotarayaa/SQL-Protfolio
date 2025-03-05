# Sales Trends SQL Queries 📊  
This folder contains SQL queries to analyze **year-over-year (YoY) sales growth, seasonal trends, and rolling averages**.

## 📌 Queries Included:
- **Year-over-Year Sales Growth:** `Year_Over_Year_Growth.sql`
- **Monthly Sales Trends:** `Monthly_Sales_Analysis.sql`
- **Quarterly Sales Trends:** `Quarterly_Sales_Trends.sql`
- **Rolling 12-Month Sales Trends:** `Rolling_12_Month_Sales.sql`
- **Peak & Low Sales Periods:** `Peak_Low_Sales.sql`

🚀 Use these queries to analyze business performance and make data-driven decisions!







- **Year-over-Year Sales Growth:** `Year_Over_Year_Growth.sql`
***(YoY) this query compares total sales for each year and calculates the percentage 
change from the previous year. Computes year-over-year growth percentage 

SELECT 
    YEAR(order_date) AS sales_year,
    SUM(total_amount) AS total_sales,
    LAG(SUM(total_amount)) OVER (ORDER BY YEAR(order_date)) AS prev_year_sales,
    ROUND(
        (SUM(total_amount) - LAG(SUM(total_amount))
  OVER (ORDER BY YEAR(order_date))) * 100.0 / 
        LAG(SUM(total_amount)) OVER (ORDER BY YEAR(order_date)), 2
    ) AS yoy_growth_percentage
FROM 
    orders
GROUP BY 
    YEAR(order_date)
ORDER BY 
    sales_year;








- **Monthly Sales Trends:** `Monthly_Sales_Analysis.sql`
****Compares monthly sales trends across different years to analyze seasonal patterns.
  it helps identify seasonal trends (eg. Peak sales/Months). can be visiulized in Power BI 

SELECT 
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    SUM(total_amount) AS monthly_sales
FROM 
    orders
GROUP BY 
    YEAR(order_date), MONTH(order_date)
ORDER BY 
    sales_year, sales_month;






****Monthly Sales Growth Compared to previous year. 
  ****Compares the samee months sales across different years to track growth. 
  It groups sales by month and year. Uses LAG() to get previous years sales for the same month.
  It calculates YoY monthly growth percentage 


  SELECT 
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    SUM(total_amount) AS monthly_sales,
    LAG(SUM(total_amount)) OVER (PARTITION 
  BY MONTH(order_date) ORDER BY YEAR(order_date)) AS prev_year_sales,
    ROUND(
        (SUM(total_amount) - LAG(SUM(total_amount))
  OVER (PARTITION BY MONTH(order_date) ORDER BY YEAR(order_date))) * 100.0 / 
        LAG(SUM(total_amount)) OVER (PARTITION BY MONTH(order_date) 
  ORDER BY YEAR(order_date)), 2
    ) AS yoy_monthly_growth
FROM 
    orders
GROUP BY 
    YEAR(order_date), MONTH(order_date)
ORDER BY 
    sales_month, sales_year;







- **Quarterly Sales Trends:** `Quarterly_Sales_Trends.sql`
****Breaks down sales by quarter to track business performance. 
This matters to helps track quarterly revenue performance and Identifies the strongest 
and weakest quarters 


SELECT 
    YEAR(order_date) AS sales_year,
    QUARTER(order_date) AS sales_quarter,
    SUM(total_amount) AS total_sales
FROM 
    orders
GROUP BY 
    YEAR(order_date), QUARTER(order_date)
ORDER BY 
    sales_year, sales_quarter;





- **Rolling 12-Month Sales Trends:** `Rolling_12_Month_Sales.sql`
****Analyzes the total sales over a rolling 12-month period to smooth out fluctuations.
  ***it helps analize long-term sales trends and useful for forcasting and demand planning 


SELECT 
    order_date,
    SUM(total_amount) 
  OVER (ORDER BY order_date ROWS BETWEEN 11 PRECEDING AND CURRENT ROW) 
  AS rolling_12_month_sales
FROM 
    orders;






- **Peak & Low Sales Periods:** `Peak_Low_Sales.sql`
****Identifying Peak & Low Sales Periods. It finds the highest and lowest sales 
months for the business. this query helps identify high and low demand periods. It is useful 
for inventory planning and marketing strategies 


SELECT 
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    SUM(total_amount) AS total_sales
FROM 
    orders
GROUP BY 
    YEAR(order_date), MONTH(order_date)
ORDER BY 
    total_sales DESC
LIMIT 5;  -- Shows top 5 peak sales months










  
