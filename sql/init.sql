CREATE TABLE airlines (
    airline_id VARCHAR(50) PRIMARY KEY,
    airline_name VARCHAR(100) NOT NULL,
    iata_code VARCHAR(10) UNIQUE NOT NULL,
    country VARCHAR(100) NOT NULL
);

CREATE TABLE airports (
    airport_code VARCHAR(10) PRIMARY KEY,
    airport_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);

CREATE TABLE passengers (
    id VARCHAR(50) PRIMARY KEY,
    f_name VARCHAR(50) NOT NULL,
    l_name VARCHAR(50) NOT NULL,
    passport_number VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE pilots (
    pilot_id VARCHAR(50) PRIMARY KEY,
    f_name VARCHAR(50) NOT NULL,
    l_name VARCHAR(50) NOT NULL,
    license_number VARCHAR(50) UNIQUE NOT NULL,
    airline_id VARCHAR(50) NOT NULL REFERENCES airlines(airline_id) ON DELETE CASCADE
);

CREATE TABLE aircrafts (
    aircraft_id VARCHAR(50) PRIMARY KEY,
    model VARCHAR(100) NOT NULL,
    capacity INT NOT NULL,
    airline_id VARCHAR(50) NOT NULL REFERENCES airlines(airline_id) ON DELETE RESTRICT
);

CREATE TABLE flights (
    id VARCHAR(50) PRIMARY KEY,
    d_time TIMESTAMPTZ NOT NULL, 
    a_time TIMESTAMPTZ NOT NULL, 
    o_code VARCHAR(10) NOT NULL REFERENCES airports(airport_code) ON DELETE RESTRICT,
    a_code VARCHAR(10) NOT NULL REFERENCES airports(airport_code) ON DELETE RESTRICT,
    aircraft_id VARCHAR(50) NOT NULL REFERENCES aircrafts(aircraft_id) ON DELETE RESTRICT
);

CREATE TABLE baggage (
    bag_tag_number VARCHAR(50) PRIMARY KEY,
    passenger_id VARCHAR(50) NOT NULL REFERENCES passengers(id) ON DELETE CASCADE,
    flight_id VARCHAR(50) NOT NULL REFERENCES flights(id) ON DELETE CASCADE
);



CREATE TABLE flight_pilots (
    flight_id VARCHAR(50) NOT NULL REFERENCES flights(id) ON DELETE CASCADE,
    pilot_id VARCHAR(50) NOT NULL REFERENCES pilots(id) ON DELETE CASCADE,
    PRIMARY KEY (flight_id, pilot_id) 
);

CREATE TABLE passenger_bookings (
    passenger_id VARCHAR(50) NOT NULL REFERENCES passengers(id) ON DELETE CASCADE,
    flight_id VARCHAR(50) NOT NULL REFERENCES flights(id) ON DELETE CASCADE,
    booking_date TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY (passenger_id, flight_id)
);

CREATE TABLE seat_assignments (
    flight_id VARCHAR(50) NOT NULL REFERENCES flights(id) ON DELETE CASCADE,
    seat_number VARCHAR(10) NOT NULL,
    passenger_id VARCHAR(50) NOT NULL REFERENCES passengers(id) ON DELETE CASCADE,
    PRIMARY KEY (flight_id, seat_number), 
    UNIQUE (flight_id, passenger_id) 
);



CREATE INDEX idx_passengers_email ON passengers(email);
CREATE INDEX idx_aircrafts_airline_id ON aircrafts(airline_id);
CREATE INDEX idx_flights_departure_time ON flights(d_time);
CREATE INDEX idx_baggage_passenger_id ON baggage(passenger_id);
CREATE INDEX idx_baggage_flight_id ON baggage(flight_id);
