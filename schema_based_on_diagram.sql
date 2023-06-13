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

 CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  type VARCHAR (50),
  name VARCHAR (40)
);

CREATE TABLE medical_history_treatments (
    id SERIAL PRIMARY KEY,
    medical_history_id INT REFERENCES medical_histories(id),
    treatment_id INT REFERENCES treatments(id)
);

CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  totat_amount DECIMAL(10,2),
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT UNIQUE REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL(10,2),
  quantity INT,
  invoice_id INT REFERENCES invoices(id),
  treatment_id INT REFERENCES treatments(id)
);

CREATE INDEX medical_histories_patient_id_idx ON medical_histories (patient_id);
CREATE INDEX medical_history_treatments_medical_history_id_idx ON medical_history_treatments (medical_history_id);
CREATE INDEX medical_history_treatments_treatment_id_idx ON medical_history_treatments (treatment_id);
CREATE INDEX invoices_medical_history_id_idx ON invoices (medical_history_id);
CREATE INDEX invoice_items_invoice_id_idx ON invoice_items (invoice_id);
CREATE INDEX invoice_items_treatment_id_idx ON invoice_items (treatment_id);




