-- database/schema.sql

-- ===== USERS (A) =====
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  role TEXT NOT NULL CHECK(role IN ('Admin','Staff'))
);
-- Sample Data
INSERT INTO users (username, password, role) VALUES ('admin', '1234', 'Admin');
INSERT INTO users (username, password, role) VALUES ('staff', '1234', 'Staff');
-- ===== TRAIN (B) =====
 CREATE TABLE Train (
  trainId INTEGER PRIMARY KEY AUTOINCREMENT,
  trainNumber TEXT NOT NULL,
  source TEXT NOT NULL,
  destination TEXT NOT NULL,
  departureTime TEXT NOT NULL,
  arrivalTime TEXT NOT NULL,
  capacity INTEGER NOT NULL,
  availableSeats INTEGER NOT NULL,
  price REAL NOT NULL
);
-- ===== PASSENGER (E) =====
CREATE TABLE Passenger (
  passenger_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  phone TEXT NOT NULL,
  national_id TEXT NOT NULL UNIQUE,
  email TEXT
);
-- ===== RESERVATION (C/D) =====
CREATE TABLE Reservation (
  reservation_id INTEGER PRIMARY KEY AUTOINCREMENT,
  passenger_id INTEGER NOT NULL,
  train_id INTEGER NOT NULL,
  seat_number TEXT,
  booking_date TEXT,
  status TEXT DEFAULT 'Confirmed',
  FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id),
  FOREIGN KEY (train_id) REFERENCES Train(trainId)
);
-- ===== REPORT QUERIES (F) =====
