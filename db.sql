-- Database: ClinicManagementSystem
-- Users
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    role ENUM('doctor', 'patient', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Doctors
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(100),
    phone VARCHAR(20),
    FOREIGN KEY (doctor_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Patients
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    FOREIGN KEY (patient_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Services
CREATE TABLE Services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    price DECIMAL(10,2) NOT NULL
);

-- Bookings
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    booking_date DATE NOT NULL,
    status ENUM('pending', 'confirmed', 'cancelled') DEFAULT 'pending',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- BookingDetails (M-M)
CREATE TABLE BookingDetails (
    booking_id INT,
    service_id INT,
    quantity INT DEFAULT 1,
    PRIMARY KEY (booking_id, service_id),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);

-- Appointments
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_time DATETIME NOT NULL,
    notes TEXT,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Sample Data
-- Users
INSERT INTO Users (username, password, email, role) VALUES
('dr_smith', 'password123', 'smith@clinic.com', 'doctor'),
('john_doe', 'pass123', 'john@example.com', 'patient');

-- Doctors
INSERT INTO Doctors (doctor_id, first_name, last_name, specialty, phone) VALUES
(1, 'James', 'Smith', 'Cardiology', '123-456-7890');

-- Patients
INSERT INTO Patients (patient_id, first_name, last_name, date_of_birth, phone, address) VALUES
(2, 'John', 'Doe', '1990-01-01', '987-654-3210', '123 Main St');

-- Services
INSERT INTO Services (name, description, price) VALUES
('General Consultation', 'Basic health checkup and consultation.', 50.00),
('ECG Test', 'Electrocardiogram heart monitoring.', 100.00);

-- Bookings
INSERT INTO Bookings (patient_id, booking_date, status) VALUES
(2, '2025-05-10', 'confirmed');

-- BookingDetails
INSERT INTO BookingDetails (booking_id, service_id, quantity) VALUES
(1, 1, 1),
(1, 2, 1);

-- Appointments
INSERT INTO Appointments (booking_id, doctor_id, appointment_time, notes) VALUES
(1, 1, '2025-05-10 10:00:00', 'Follow-up required');
