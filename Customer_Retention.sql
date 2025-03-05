# Customer Retention SQL Queries 📊  
This folder contains SQL queries to analyze **repeat customers, retention trends, and loyalty programs**.

## 📌 Queries Included:
- **Basic Repeat Customers Query:** `Customer_Retention.sql`
- **Retention Rate Over Time:** `Customer_Retention_Trend.sql`
- **Identifying Lost Customers:** `Inactive_Customers.sql`
- **Customer Loyalty Tier Analysis:** `Loyalty_Analysis.sql`

🚀 Use these queries for customer analytics, loyalty programs, and churn analysis!





  
# - **Basic Repeat Customers Query:** `Customer_Retention.sql`
  **Basic Query: Customers who made Repeat Purchases, this will counts total purchase per customer by filtering customers who made more than 1 purchase orders results by the most loyal customers first

SELECT 
    customer_id, 
    COUNT(order_id) AS total_orders
FROM 
    orders
GROUP BY 
    customer_id
HAVING 
    COUNT(order_id) > 1
ORDER BY 
    total_orders DESC;






- **Retention Rate Over Time:** `Customer_Retention_Trend.sql`
** Repeat Customers with Names and Emails (using Join) This is better it Joins Customers & Orders tables
to display customer details. It Shows customer name & email for direct marketing or loyalty programs 

SELECT 
    c.customer_id, 
    c.name AS customer_name, 
    c.email, 
    COUNT(o.order_id) AS total_orders
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.name, c.email
HAVING 
    COUNT(o.order_id) > 1
ORDER BY 
    total_orders DESC;






- **Identifying Lost Customers:** `Inactive_Customers.sql`
**Repeat customers with Their First and Last Purchase Date. This is useful to Identifiy 
first vs. last purchases dates to track retention. this is useful for re-engagement campaigns 

SELECT 
    c.customer_id, 
    c.name AS customer_name, 
    COUNT(o.order_id) AS total_orders, 
    MIN(o.order_date) AS first_purchase, 
    MAX(o.order_date) AS last_purchase
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.name
HAVING 
    COUNT(o.order_id) > 1
ORDER BY 
    last_purchase DESC;





***Customer Retention Rate Over Time 
This is important to show monthly retention trends, helps businesses track customer loyalty over time

SELECT 
    YEAR(order_date) AS order_year, 
    MONTH(order_date) AS order_month, 
    COUNT(DISTINCT customer_id) AS repeat_customers
FROM 
    orders
WHERE 
    customer_id IN (
        SELECT customer_id FROM orders 
        GROUP BY customer_id 
        HAVING COUNT(order_id) > 1
    )
GROUP BY 
    YEAR(order_date), MONTH(order_date)
ORDER BY 
    order_year, order_month;






****Identifying customers who haven not purchased in the last 6 months, helps to target
re-engagement campaigns(discounts, emails).

 SELECT 
    c.customer_id, 
    c.name AS customer_name, 
    MAX(o.order_date) AS last_purchase
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.name
HAVING 
    MAX(o.order_date) < DATEADD(MONTH, -6, GETDATE())
ORDER BY 
    last_purchase ASC;






- **Customer Loyalty Tier Analysis:** `Loyalty_Analysis.sql`
****Creating a customer Loyalty score. This query shows a loyalty score based on thier 
number of purchases. It catagorizes customers into loyalty tiers based on purchases.
  it can be used for loyalty programs and personalized offers 


SELECT 
    c.customer_id, 
    c.name AS customer_name, 
    COUNT(o.order_id) AS total_orders,
    CASE 
        WHEN COUNT(o.order_id) >= 10 THEN 'VIP'
        WHEN COUNT(o.order_id) BETWEEN 5 AND 9 THEN 'Frequent Buyer'
        WHEN COUNT(o.order_id) BETWEEN 2 AND 4 THEN 'Occasional Buyer'
        ELSE 'New Customer'
    END AS loyalty_tier
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.name
ORDER BY 
    total_orders DESC;












