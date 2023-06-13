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

