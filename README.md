# 🚆 Train Schedule & Reservation Management System

## 📖 Overview
The Train Schedule and Reservation Management System is a centralized software solution designed to manage train schedules, passenger reservations, and ticket allocation.

The system ensures structured data handling, automated seat tracking, and controlled user access through role-based authentication.

---

## 🎯 Project Objectives
- Manage train schedules and routes
- Monitor seat availability automatically
- Process booking and cancellation operations
- Maintain data integrity using a relational database
- Support administrative reporting

---

## 🏗️ System Architecture
The system follows the MVC (Model-View-Controller) architectural pattern:

- Model: Handles data and business logic (SQL database).
- View: Flutter UI for display and user inpu
- Controller: Connects Model and View, processes actions.
  

---

## 🗄️ Database Design
The system database includes the following core tables:

- Users
- Train
- Passenger
- Reservation

Relationships are implemented using foreign keys to ensure referential integrity.

Database schema is maintained in:

```
/database/schema.sql
```

---

## 🔄 Development Methodology
This project follows Agile methodology using Scrum:

- Separate feature branches for each team member
- Pull requests required before merging
- Protected main branch
- Incremental sprint-based development

---

## 📂 Repository Structure

```
Train-Reservation-System
│
├── database/
│   └── schema.sql
│
├── flutter_app/
│
└── README.md
```

---

## 🚧 Current Phase
Sprint 2 – System Modeling, Database Implementation, and Initial Development.

---

## 👥 Team Collaboration Strategy
Each team member works on a dedicated branch.  
All changes are submitted through Pull Requests and reviewed before merging into the main branch.
