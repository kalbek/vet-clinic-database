CREATE TABLE patients (
  id SERIAL PRIMARY INTEGER,
  name VARCHAR(255),
  date_of_table DATE
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

CREATE TABLE medical_histories (
  id SERIAL PRIMARY INTEGER,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR (50) ,
 );

 CREATE TABLE treatments (
  id SERIAL PRIMARY INTEGER,
  type VARCHAR (50),
  name VARCHAR (40)
);