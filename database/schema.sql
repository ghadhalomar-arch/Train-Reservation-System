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
-- Sample Data
-- Note: trainId is not inserted manually because it is AUTOINCREMENT
INSERT INTO Train (trainNumber, source, destination, departureTime, arrivalTime, capacity, availableSeats, price)
VALUES ('TR101', 'Riyadh', 'Jeddah', '2026-05-10 08:00', '2026-05-10 12:00', 100, 100, 150.0);

INSERT INTO Train (trainNumber, source, destination, departureTime, arrivalTime, capacity, availableSeats, price)
VALUES ('TR103', 'Jeddah', 'Makkah', '2026-05-10 14:00', '2026-05-10 15:00', 60, 60, 50.0);

-- ===== PASSENGER (E) =====

-- ===== RESERVATION (C/D) =====

-- ===== REPORT QUERIES (F) =====
