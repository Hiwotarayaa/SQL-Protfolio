- Stored Procedure for Year-over-Year Sales Analysis


DELIMITER $$

CREATE PROCEDURE GetYoYSales()
BEGIN
    SELECT 
        YEAR(order_date) AS sales_year,
        SUM(total_amount) AS total_sales,
        LAG(SUM(total_amount)) OVER (ORDER BY YEAR(order_date)) AS prev_year_sales,
        ROUND(
            (SUM(total_amount) - LAG(SUM(total_amount)) OVER (ORDER BY YEAR(order_date))) * 100.0 / 
            LAG(SUM(total_amount)) OVER (ORDER BY YEAR(order_date)), 2
        ) AS yoy_growth_percentage
    FROM 
        orders
    GROUP BY 
        YEAR(order_date)
    ORDER BY 
        sales_year;
END$$

DELIMITER ;


- How to Use It. After creating the stored procedure, run:

CALL GetYoYSales();

- This will generate a year-over-year revenue comparison in one step!
