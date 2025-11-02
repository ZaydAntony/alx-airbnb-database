CREATE INDEX idx_user_id ON User(user_id);
CREATE INDEX idx_user_email ON User(email);

CREATE INDEX idx_property_id ON Property(property_id);
CREATE INDEX idx_price_per_night ON Property(price_per_night);

CREATE INDEX idx_location_id ON Location(location_id);
CREATE INDEX idx_city ON Location(city);
CREATE INDEX idx_country ON Location(country);

CREATE INDEX idx_booking_id ON Booking(booking_id);
CREATE INDEX idx_status ON Booking(status);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);


CREATE INDEX idx_payment_id ON Payment(payment_id);
CREATE INDEX idx_date ON Payment(payment_date);
CREATE INDEX idx_payment_method ON Payment(payment_method);

CREATE INDEX idx_rating ON Review(rating);
CREATE INDEX idx_review_id ON Review(review_id);
CREATE INDEX idx_comment ON Review(comment);