CREATE DATABASE hospital_system;
USE hospital_system;

CREATE TABLE doctors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    office_number VARCHAR(10),
    specialization ENUM('Личен лекар', 'Очен лекар', 'Уши нос гърло', 'Кардиолог', 'Ортопед', 'Невролог') NOT NULL,
    works_with_nhif BOOLEAN DEFAULT TRUE,
    phone VARCHAR(20),
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE patients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    egn CHAR(10) UNIQUE NOT NULL,
    date_of_birth DATE NOT NULL
);

CREATE TABLE appointments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    diagnosis TEXT NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES doctors(id) ON DELETE CASCADE
);

CREATE TABLE treatments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    prescribed_medicine TEXT NOT NULL,
    treatment_period VARCHAR(50),
    FOREIGN KEY (appointment_id) REFERENCES appointments(id) ON DELETE CASCADE
);

CREATE TABLE fraud_cases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT NOT NULL,
    fraud_description TEXT NOT NULL,
    amount_stolen DECIMAL(10,2) NOT NULL,
    date_detected DATE NOT NULL,
    reported_by VARCHAR(255),
    FOREIGN KEY (doctor_id) REFERENCES doctors(id) ON DELETE CASCADE
);

