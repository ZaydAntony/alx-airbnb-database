CREATE TABLE User(
    user_id UUID PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL UNIQUE,
    password_hash VARCHAR NOT NULL,
    phone_number VARCHAR,
    role VARCHAR NOT NULL ENUM('guest', 'host', 'admin'),
    created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP
)

CREATE TABLE Location(
    location_id UUID PRIMARY KEY,
    address VARCHAR NOT NULL,
    city VARCHAR NOT NULL,
    state VARCHAR NOT NULL,
    country VARCHAR NOT NULL,
)

CREATE TABLE Property(
    property_id UUID PRIMARY KEY,
    host_id UUID FOREIGN KEY REFERENCES User(user_id),
    location_id UUID  FOREIGN KEY REFERENCES Location(location_id),
    name VARCHAR NOT NULL,
    description TEXT,
    price_per_night DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP,
    updated_at TIMESTAMP DEFAULT ON UPDATED CURRENT TIMESTAMP
)

CREATE TABLE Booking(
    booking_id PRIMARY KEY UUID Index,
    property_id FOREIGN KEY REFERENCES Property(property_id),
    user_id OREIGN KEY  REFERENCES User(user_id),
    start_date DATE NOT NULL,
    end_date  DATE NOT NULL,
    total_price DECIMAL DEFAULT 0,
    status VARCHAR NOT NULL ENUM('pending', 'confirmed', 'canceled'),
    created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP
)

CREATE TABLE Payment(
    payment_id UUID PRIMARY KEY Index,
    booking_id UUID FOREIGN KEY REFERENCES Booking(booking_id),
    amount DECIMAL NOT NULL,
    payment_method VARCHAR NOT NULL ENUM('credit_card', 'paypal', 'bank_transfer', 'stripe'),
    payment_date TIMESTAMP DEFAULT CURRENT TIMESTAMP,
    status VARCHAR NOT NULL ENUM('pending', 'completed', 'failed')
)

CREATE TABLE Review(
    review_id UUID PRIMARY KEY Index,
    property_id UUID FOREIGN KEY REFERENCES Property(property_id),
    user_id UUID FOREIGN KEY REFERENCES User(user_id),
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT TIMESTAMP
)

CREATE TABLE Message(
    message_id UUID PRIMARY KEY Index,
    sender_id UUID FOREIGN KEY REFERENCES User(user_id),
    receiver_id UUID FOREIGN KEY REFERENCES User(user_id),
    content TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT TIMESTAMP
)