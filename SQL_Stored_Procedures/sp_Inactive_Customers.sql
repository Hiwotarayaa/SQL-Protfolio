- Stored Procedure for Identifying Inactive Customers

DELIMITER $$

CREATE PROCEDURE GetInactiveCustomers()
BEGIN
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
END$$

DELIMITER ;

- How to Use It, 

CALL GetInactiveCustomers();

- This will generate a list of customers who haven't purchased in 6+ months.
