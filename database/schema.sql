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
 
-- ===== PASSENGER (E) =====

-- ===== RESERVATION (C/D) =====

-- ===== REPORT QUERIES (F) =====
