DROP TABLE IF EXISTS Booking;
CREATE TABLE Booking (
    booking_id VARCHAR(36) PRIMARY KEY NOT NULL,
    property_id VARCHAR(36),
    user_id VARCHAR(36),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) DEFAULT 0,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Step 3: Query performance test (fetching data by date range)
EXPLAIN
SELECT * FROM Booking
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';

-- Step 4: Check partition usage
SELECT
    PARTITION_NAME, TABLE_ROWS
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 'Booking';