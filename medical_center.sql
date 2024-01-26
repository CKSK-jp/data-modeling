DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctor(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL, 
  last_name TEXT NOT NULL,
  specialization TEXT NOT NULL
);

CREATE TABLE patient(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL, 
  last_name TEXT NOT NULL,
  date_of_birth DATE NOT NULL,
  gender TEXT NOT NULL,
  insurance TEXT
);

CREATE TABLE appointment (
  id SERIAL PRIMARY KEY,
  doctor_id INT REFERENCES doctor(id),
  patient_id INT REFERENCES patient(id),
  appointment_date DATE NOT NULL,
  diagnosis TEXT[]
);



