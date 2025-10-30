CREATE DATABASE alx_airbnb_database;

CREATE TABLE User (
    user_id VARCHAR(36) PRIMARY KEY NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Location(
    location_id VARCHAR(36) PRIMARY KEY NOT NULL,
    address VARCHAR(100) NOT NULL,
    city VARCHAR (100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);

CREATE TABLE Property (
    property_id VARCHAR(36) PRIMARY KEY NOT NULL,
    host_id VARCHAR(36),
    location_id VARCHAR(36),
    name VARCHAR(150) NOT NULL,
    description TEXT,
    price_per_night DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES User(user_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);


CREATE TABLE Booking(
    booking_id VARCHAR(36) PRIMARY KEY NOT NULL,
    property_id VARCHAR(36),
    user_id VARCHAR(36),
    start_date DATE NOT NULL,
    end_date  DATE NOT NULL,
    total_price DECIMAL DEFAULT 0,
    status  ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Payment(
    payment_id VARCHAR(36) PRIMARY KEY NOT NULL,
    booking_id VARCHAR(36),
    amount DECIMAL(10,2) NOT NULL,
    payment_method ENUM('credit_card', 'paypal', 'bank_transfer', 'stripe') NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'completed', 'failed') NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

CREATE TABLE Review(
    review_id VARCHAR(36) PRIMARY KEY NOT NULL,
    property_id VARCHAR(36),
    user_id VARCHAR(36),
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE Message(
    message_id VARCHAR(36) PRIMARY KEY NOT NULL,
    sender_id VARCHAR(36),
    receiver_id VARCHAR(36),
    content TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES User(user_id),
    FOREIGN KEY (receiver_id) REFERENCES User(user_id)
);