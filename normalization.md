## Normalization concept
-As of now the data is fully normalized to the 3NF
-Adding the location table on its own to ensure more integrity and stabilty.

-- Users
CREATE TABLE "User" (
  user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  email VARCHAR NOT NULL UNIQUE,
  password_hash VARCHAR NOT NULL,
  phone_number VARCHAR,
  role VARCHAR NOT NULL CHECK (role IN ('guest','host','admin')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Optional: Location table for normalized address components
CREATE TABLE Location (
  location_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  country VARCHAR NOT NULL,
  city VARCHAR,
  area VARCHAR,
  address_line TEXT,
  postal_code VARCHAR
);

-- Properties
CREATE TABLE Property (
  property_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  host_id UUID NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
  name VARCHAR NOT NULL,
  description TEXT NOT NULL,
  location_id UUID REFERENCES Location(location_id),
  pricepernight DECIMAL NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Bookings
-- We snapshot the nightly rate and number of nights so the booking total is an immutable record.
CREATE TABLE Booking (
  booking_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  property_id UUID NOT NULL REFERENCES Property(property_id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  nights INT NOT NULL CHECK (nights >= 1),
  night_rate_snapshot DECIMAL NOT NULL,            -- price per night at booking time
  discount_amount DECIMAL DEFAULT 0,               -- any discount applied
  tax_amount DECIMAL DEFAULT 0,                    -- tax amount applied
  total_price DECIMAL NOT NULL,                    -- storing immutable snapshot (night_rate_snapshot * nights - discount + tax)
  status VARCHAR NOT NULL CHECK (status IN ('pending','confirmed','canceled')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Payments
CREATE TABLE Payment (
  payment_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  booking_id UUID NOT NULL REFERENCES Booking(booking_id) ON DELETE CASCADE,
  amount DECIMAL NOT NULL,
  payment_date TIMESTAMP WITH TIME ZONE DEFAULT now(),
  payment_method VARCHAR NOT NULL CHECK (payment_method IN ('credit_card','paypal','stripe'))
);

-- Reviews
CREATE TABLE Review (
  review_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  property_id UUID NOT NULL REFERENCES Property(property_id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
  rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
  comment TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- Messages
CREATE TABLE Message (
  message_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  sender_id UUID NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
  recipient_id UUID NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE,
  message_body TEXT NOT NULL,
  sent_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);
