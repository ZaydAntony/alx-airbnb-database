# Partitioning Performance Report

## Objective
To optimize query performance on the large `Booking` table by implementing **table partitioning** based on the `start_date` column.

---

## Partitioning Strategy

We used **RANGE partitioning** by `YEAR(start_date)` to divide the data into yearly partitions:

```sql
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);```
