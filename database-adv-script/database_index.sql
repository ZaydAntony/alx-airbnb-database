-- ============================================
-- Index Creation for High-Usage Columns
-- ============================================

-- User table indexes
CREATE INDEX idx_user_id ON User(user_id);
CREATE INDEX idx_user_email ON User(email);

-- Property table indexes
CREATE INDEX idx_property_id ON Property(property_id);
CREATE INDEX idx_price_per_night ON Property(price_per_night);

-- Location table indexes
CREATE INDEX idx_location_id ON Location(location_id);
CREATE INDEX idx_city ON Location(city);
CREATE INDEX idx_country ON Location(country);

-- Booking table indexes
CREATE INDEX idx_booking_id ON Booking(booking_id);
CREATE INDEX idx_status ON Booking(status);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Payment table indexes
CREATE INDEX idx_payment_id ON Payment(payment_id);
CREATE INDEX idx_date ON Payment(payment_date);
CREATE INDEX idx_payment_method ON Payment(payment_method);

-- Review table indexes
CREATE INDEX idx_rating ON Review(rating);
CREATE INDEX idx_review_id ON Review(review_id);
CREATE INDEX idx_comment ON Review(comment);


-- ============================================
-- Measuring Query Performance Before and After Indexes
-- ============================================

-- Before adding indexes
EXPLAIN ANALYZE 
SELECT * 
FROM Booking
WHERE status = 'confirmed';

-- After adding indexes
EXPLAIN ANALYZE 
SELECT * 
FROM Booking
WHERE status = 'confirmed';


-- Example using a JOIN query
EXPLAIN ANALYZE 
SELECT 
    b.booking_id, 
    u.first_name, 
    p.name AS property_name
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.status = 'confirmed';
