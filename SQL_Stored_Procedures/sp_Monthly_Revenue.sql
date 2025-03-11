- Stored Procedure for Monthly Revenue Report

DELIMITER $$

CREATE PROCEDURE GetMonthlyRevenue()
BEGIN
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
END$$

DELIMITER ;


- How to Use It

CALL GetMonthlyRevenue();

- This automates monthly revenue tracking.
