# Database Performance Monitoring and Refinement Report

## Monitoring the performance of my db.

---

## Tools Used
- **EXPLAIN ANALYZE** — Shows how MySQL executes a query and how long each step takes.  
- **SHOW PROFILE** — Displays detailed profiling information such as CPU usage, block I/O, and parsing time.  
- **Performance Schema** — Tracks slow queries and resource usage over time.

---


### 1️⃣ Query: Retrieve confirmed bookings and their users
```sql
EXPLAIN ANALYZE
SELECT b.booking_id, b.total_price, u.first_name, u.last_name
FROM Booking b
JOIN User u ON b.user_id = u.user_id
WHERE b.status = 'confirmed';
Observation:

Type: ALL on Booking

Filtered rows: high (full table scan)

Cause: Missing index on status column.

2️⃣ Query: Retrieve properties and their reviews
sql
Copy code
EXPLAIN ANALYZE
SELECT p.name, r.rating, r.comment
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id;
Observation:

The join on Review.property_id uses a full table scan.

Cause: Review.property_id column not indexed.

3️⃣ Query: Count payments by payment method
sql
Copy code
EXPLAIN ANALYZE
SELECT payment_method, COUNT(*) AS total_payments
FROM Payment
GROUP BY payment_method;