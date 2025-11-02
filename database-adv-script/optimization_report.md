# Query Optimization Report

## Objective
To analyze and optimize a complex SQL query that retrieves booking details with user, property, and payment information. The goal was to improve query performance by using `EXPLAIN`, identifying inefficiencies, and applying indexing and query refactoring.

---

## Initial Query

```sql
EXPLAIN
SELECT 
    b.booking_id, 
    b.property_id, 
    b.user_id, 
    b.total_price, 
    b.status 
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;```


## Optimized Query

```EXPLAIN
SELECT 
    b.booking_id,
    b.property_id,
    b.user_id,
    b.total_price,
    b.status
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id;```
