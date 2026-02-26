🚆 Train Schedule & Reservation Management System
Overview

The Train Schedule and Reservation Management System is a centralized platform developed to manage train schedules, passenger reservations, and seat allocation. The system is designed to provide structured data management, reduce booking errors, and improve operational efficiency.

It allows authorized users to create train schedules, monitor seat availability, process reservations, cancel bookings, and generate basic operational reports.

Project Objectives

Manage train schedules efficiently

Track seat availability automatically

Handle booking and cancellation processes

Maintain structured and consistent data

Support administrative monitoring

System Architecture

The system follows a layered architecture:

Presentation Layer (Flutter – UI development)

Business Logic Layer

Data Access Layer

Relational Database (SQL-based schema)

Database Structure

The database consists of four main tables:

Users

Train

Passenger

Reservation

Foreign keys are used to maintain relationships between reservations and train schedules to ensure data integrity.

All database definitions are stored inside:

/database/schema.sql

Development Methodology

This project follows Agile methodology using Scrum principles:

Feature-based branch workflow

Pull requests before merging

Protected main branch

Incremental sprint development

Each team member works on a separate branch and submits changes through pull requests.

Repository Structure

Train-Reservation-System
│
├── database/
│ └── schema.sql
│
├── flutter_app/
│
└── README.md

Current Status

Sprint 2 – System Design, Database Implementation, and Initial Development.
