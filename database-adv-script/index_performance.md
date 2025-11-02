# 📊 Database Index Optimization

## 🎯 Objective
The goal of this task is to identify high-usage columns and create indexes to improve query performance across frequently used tables such as **User**, **Property**, and **Booking**.

Indexes help the database quickly locate data without scanning the entire table, significantly improving query execution time.

---

## 🧠 Step 1: Identify High-Usage Columns

We analyzed queries that often appear in `WHERE`, `JOIN`, and `ORDER BY` clauses.

| Table | High-Usage Columns | Reason |
|--------|--------------------|--------|
| **User** | `email`, `user_id` | Commonly used for authentication and joins |
| **Property** | `host_id`, `price_per_night`, `name` | Used for filtering, sorting, and search |
| **Booking** | `user_id`, `property_id`, `start_date` | Used in joins, analytics, and availability queries |
| **Location** | `city` | Used in filtering for city-based searches |

---

## ⚙️ Step 2: Create Indexes

The following indexes were created in `database_index.sql`:

```sql
-- User Table
CREATE INDEX idx_user_email ON User(email);

-- Property Table
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_price ON Property(price_per_night);
CREATE INDEX idx_property_name ON Property(name);

-- Booking Table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Location Table
CREATE INDEX idx_city ON Location(city);
```

--ANALYZING QUERY

EXPLAIN SELECT * 
FROM Location 
WHERE city = 'Nairobi';


--BEFORE
id | select_type | table     | type | possible_keys | key  | rows | filtered
1  | SIMPLE       | Location  | ALL  | NULL           | NULL | 10   | 100.00


--AFTER
id | select_type | table     | type | possible_keys | key       | len  | ref   | rows | filtered
1  | SIMPLE       | Location  | ref  | idx_city       | idx_city  | 402  | const | 1    | 100.00
