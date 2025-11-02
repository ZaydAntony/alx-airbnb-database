-- ============================================
-- Using Aggregations
-- ============================================
SELECT 
    user_id, 
    COUNT(booking_id) AS total_bookings
FROM Booking
GROUP BY user_id;


-- ============================================
-- Using Window Functions
-- ============================================
SELECT 
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY booking_rank;
