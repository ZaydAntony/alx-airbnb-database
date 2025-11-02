-- ============================================
-- PERFORMANCE MONITORING: Booking Query Analysis
-- ============================================

-- Before Refactoring
EXPLAIN
SELECT 
    b.booking_id, 
    b.property_id, 
    b.user_id, 
    b.total_price, 
    b.status, 
    u.first_name, 
    u.last_name, 
    p.name AS property_name, 
    pay.payment_method, 
    pay.amount
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;


-- ============================================
-- Index Optimization
-- ============================================
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);


-- ============================================
-- After Refactoring
-- ============================================
EXPLAIN
SELECT 
    b.booking_id, 
    b.property_id, 
    b.user_id, 
    b.total_price, 
    b.status, 
    u.first_name, 
    u.last_name, 
    p.name AS property_name, 
    pay.payment_method, 
    pay.amount
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;
