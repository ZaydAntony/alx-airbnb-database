--Inner join booking and users

SELECT * FROM Booking INNER JOIN User ON Booking.user_id = User.user_id;

--Left join properties and Reviews

SELECT * 
FROM Property 
LEFT JOIN Review 
ON Property.property_id = Review.property_id
ORDER BY Property.property_id;

--Full outer join for All users and all bookings
SELECT *
FROM User
FULL OUTER JOIN Booking
ON User.user_id = Booking.user_id;


"""SELECT *
FROM User
LEFT JOIN Booking
ON User.user_id = Booking.user_id

UNION

SELECT *
FROM User
RIGHT JOIN Booking
ON User.user_id = Booking.user_id;"""