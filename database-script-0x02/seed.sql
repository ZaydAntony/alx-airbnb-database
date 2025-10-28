--USERS TABLE 
INSERT INTO User(first_name, last_name, email, password_hash, phone_number, role) VALUES
('John', 'Doe', 'john.doe@example.com', 'hashed_password', '123-456-7890', 'user'),
('Jane', 'Smith', 'janesmith@gmail.com', 'hashed_password', '987-654-3210', 'host');

INSERT INTO Location(address, city, state, country) VALUES
('123 Main St', 'Springfield', 'IL', 'USA'),
('456 Elm St', 'Shelbyville', 'IL', 'USA');

INSERT INTO Property(host_id, location_id, name, description, price_per_night) VALUES
('1', '1', 'Cozy Cottage', 'A cozy cottage in the countryside.', 100.00),
('2', '2', 'Modern Apartment', 'A modern apartment in the city center.', 150.00);

INSERT INTO Booking(property_id, user_id, start_date, end_date, total_price, status) VALUES
('1', '1', '2024-07-01', '2024-07-05', 400.00, 'confirmed'),
('2', '2', '2024-08-10', '2024-08-15', 750.00, 'pending');

INSERT INTO Payment(booking_id, amount, payment_method, status) VALUES
('1', 400.00, 'credit_card', 'completed'),
('2', 750.00, 'paypal', 'pending');
INSERT INTO Review(property_id, user_id, rating, comment) VALUES
('1', '1', 5, 'Amazing stay! Highly recommend.'),
('2', '2', 4, 'Great location, but a bit noisy.');

INSERT INTO Message(sender_id, receiver_id, content) VALUES
('1', '2', 'Hello, I am interested in your property.'),
('2', '1', 'Hi! Feel free to ask any questions you have.');