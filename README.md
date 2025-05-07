
# Clinic Booking System

## Overview

The **Clinic Booking System** is a relational database designed to manage clinic operations efficiently. It handles user roles, patient and doctor information, services offered, bookings, and appointments.

## Features

- **User Management**: Handles different user roles—patients, doctors, and admins.
- **Doctor and Patient Profiles**: Stores detailed information about doctors and patients.
- **Service Catalog**: Maintains a list of services offered by the clinic.
- **Booking System**: Allows patients to book services.
- **Appointment Scheduling**: Assigns doctors to bookings and schedules appointments.

## Database Schema

The database consists of the following tables:

1. **Users**: Stores login credentials and role information.
2. **Doctors**: Contains doctor-specific details.
3. **Patients**: Contains patient-specific details.
4. **Services**: Lists services offered by the clinic.
5. **Bookings**: Records patient bookings.
6. **BookingDetails**: Associates services with bookings.
7. **Appointments**: Schedules appointments between patients and doctors.

## Entity-Relationship Diagram (ERD)

Below is the ERD representing the database schema:

![Clinic Booking System ERD](https://dbdiagram.io/d/Clinic-Booking-Database-681b355d5b2fc4582f93f7c8)

## Sample Data

The database includes sample data for demonstration purposes:

- **Users**: Two users—one doctor and one patient.
- **Doctors**: Dr. James Smith, a cardiologist.
- **Patients**: John Doe, a patient.
- **Services**: General Consultation and ECG Test.
- **Bookings**: John Doe books both services.
- **Appointments**: Dr. Smith is assigned to John Doe's booking.

## Getting Started

1. **Import the SQL File**: Use the provided `clinic_booking_system.sql` file to create the database and populate it with sample data.
2. **Database Connection**: Connect to the database using your preferred MySQL client.
3. **Explore the Data**: Run queries to explore the tables and relationships.

## Usage

This database can be integrated into a larger application to manage clinic operations, including:

- Patient registration and management
- Doctor scheduling
- Service management
- Appointment booking and tracking
