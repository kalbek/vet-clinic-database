CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  date_of_birth DATE
);

CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id INT REFERENCES patients(id),
  status VARCHAR (50) 
 );

CREATE TABLE invoices (
  id SERIAL PRIMARY INTEGER,
  totat_amount DECIMAL(10,2),
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT
);

CREATE TABLE invoice_items (
  id SERIAL PRIMARY INTEGER,
  unit_price DECIMAL(10,2),
  quantity INT,
  invoice_id INT,
  treatment_id INT
);


 CREATE TABLE treatments (
  id SERIAL PRIMARY INTEGER,
  type VARCHAR (50),
  name VARCHAR (40)
);