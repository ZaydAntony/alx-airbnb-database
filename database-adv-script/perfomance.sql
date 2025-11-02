--before refactoring


EXPLAIN
SELECT b.booking_id, b.property_id, b.user_id, b.total_price, b.status 
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;

--After refactoring


CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);

EXPLAIN
SELECT 
    b.booking_id,
    b.property_id,
    b.user_id,
    b.total_price,
    b.status
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id;