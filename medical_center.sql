DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  speciality TEXT NOT NULL
);
CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  birthday DATE
);
CREATE TABLE diseases
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT
);
CREATE TABLE visits
(
  id SERIAL PRIMARY KEY,
  patient_id INTEGER NOT NULL REFERENCES patients,
  doctor_id INTEGER NOT NULL REFERENCES doctors,
  date DATE NOT NULL
);

CREATE TABLE diagnoses
(
  id SERIAL PRIMARY KEY,
  visit_id INTEGER NOT NULL REFERENCES visits,
  disease_id INTEGER NOT NULL REFERENCES diseases,
  treatment TEXT
);

INSERT INTO doctors
  (name, speciality)
VALUES 
('Liberman J', 'cardiologist'),
('Johnson D', 'oncologist'),
('Rabinovich B', 'physician');

INSERT INTO patients
  (name, birthday)
VALUES 
('Watts R', '12-1-1980'),
('Pham P', '4-3-1995'),
('Sharma D', '8-25-1990');

INSERT INTO diseases (name)
VALUES 
('Arrhythmia'),
('Cancer'),
('Muscle pain');

INSERT INTO visits (patient_id, doctor_id, date)
VALUES 
(1,3,'1-1-2023'),
(2,1,'1-15-2023'),
(3,2,'2-20-2023');

INSERT INTO diagnoses (visit_id, disease_id, treatment)
VALUES 
(1,3,'painkiller'),
(2,2,'surgery'),
(3,1,'surgery');