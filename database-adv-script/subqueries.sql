--All properties where rating > 4

SELECT name, property_id
FROM Property
WHERE property_id IN (
    SELECT property_id
    FROM Review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
) ORDER BY name;

--Users with more than 3 bookings

SELECT first_name, last_name, user_id
FROM User
WHERE (
	SELECT COUNT(booking_id)
    FROM Booking
    WHERE User.user_id = booking.user_id
) > 3
ORDER BY first_name;