package api

import (
	"time"
)

type Airline struct {
	AirlineID   string `db:"airline_id"`
	AirlineName string `db:"airline_name"`
	IATACode    string `db:"iata_code"`
	Country     string `db:"country"`
}

type Aircraft struct {
	AircraftID string `db:"aircraft_id"`
	Model      string `db:"model"`
	Capacity   int    `db:"capacity"`
	AirlineID  string `db:"airline_id"`
}

type Airport struct {
	AirportCode string `db:"airport_code"`
	AirportName string `db:"airport_name"`
	City        string `db:"city"`
	Country     string `db:"country"`
}

type Passenger struct {
	ID             string `db:"id"`
	FName          string `db:"f_name"`
	LName          string `db:"l_name"`
	PassportNumber string `db:"passport_number"`
	Email          string `db:"email"`
}

type Pilot struct {
	PilotID       string `db:"pilot_id"`
	FName         string `db:"f_name"`
	LName         string `db:"l_name"`
	LicenseNumber string `db:"license_number"`
	AirlineID     string `db:"airline_id"`
}

type Flight struct {
	ID         string    `db:"id"`
	DTime      time.Time `db:"d_time"` 
	ATime      time.Time `db:"a_time"` 
	OCode      string    `db:"o_code"` 
	ACode      string    `db:"a_code"` 
	AircraftID string    `db:"aircraft_id"`
}

type Baggage struct {
	BagTagNumber string  `db:"bag_tag_number"`
	Weight       float64 `db:"weight"` 
	PassengerID  string  `db:"passenger_id"`
	FlightID     string  `db:"flight_id"`
}

type FlightPilot struct {
	FlightID string `db:"flight_id"`
	PilotID  string `db:"pilot_id"`
}

type PassengerBooking struct {
	PassengerID string    `db:"passenger_id"`
	FlightID    string    `db:"flight_id"`
	BookingDate time.Time `db:"booking_date"`
}

type SeatAssignment struct {
	FlightID    string `db:"flight_id"`
	SeatNumber  string `db:"seat_number"`
	PassengerID string `db:"passenger_id"`
}