✅ SQL Performance Optimization Techniques
✅ Add Indexes for Faster Queries
✅ Indexes speed up searches by reducing the number of rows scanned.


CREATE INDEX idx_order_date ON orders(order_date);
CREATE INDEX idx_customer_id ON customers(customer_id);

✅ Optimize Joins with Proper Indexing
Instead of:

SELECT * FROM orders o JOIN customers c ON o.customer_id = c.customer_id;

✅ Use indexed joins:

SELECT o.order_id, c.name, o.total_amount
FROM orders o
INNER JOIN customers c 
ON o.customer_id = c.customer_id
WHERE o.order_date >= '2023-01-01';

📌 Why?
✅ Uses indexes on customer_id
✅ Filters old data, reducing query size
