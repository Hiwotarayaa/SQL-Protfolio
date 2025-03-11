✅ Use EXPLAIN to Find Slow Queries
To check if your query is slow, run:


EXPLAIN SELECT * FROM orders WHERE total_amount > 200;

📌 It shows:

✅ If indexes are used or missing
✅ How many rows are scanned
✅ Whether the query can be optimized
