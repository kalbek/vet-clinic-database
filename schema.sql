/* Database schema to keep the structure of entire database. */

-- CREATE TABLE animals (
--    id SERIAL PRIMARY KEY,
--    name VARCHAR(255),
--    date_of_birth DATE,
--    escape_attempts INT,
--    neutered BOOLEAN,
--    weight_kg DECIMAL(5,2)
-- );
-- ALTER TABLE animals ADD COLUMN species VARCHAR(255);

-- CREATE TABLE owners (
--     id SERIAL PRIMARY KEY,
--     full_name VARCHAR(255) NOT NULL,
--     age INTEGER
-- );

-- CREATE TABLE species (
--     id SERIAL PRIMARY KEY,
--     name VARCHAR(255) NOT NULL
-- );

-- -- Drop the species column
-- ALTER TABLE animals DROP COLUMN species;

-- -- Add the species_id column as a foreign key referencing the species table
-- ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);

-- -- Add the owner_id column as a foreign key referencing the owners table
-- ALTER TABLE animals ADD COLUMN owner_id INTEGER REFERENCES owners(id);

-- -- Set the id column as auto-incremented primary key
-- -- ALTER TABLE animals ALTER COLUMN id SET DEFAULT nextval('animals_id_seq');
-- -- ALTER TABLE animals ADD PRIMARY KEY (id);

-- CREATE TABLE vets (
--   id SERIAL PRIMARY KEY,
--   name VARCHAR(255),
--   age INTEGER,
--   date_of_graduation DATE
-- );

-- CREATE TABLE specializations (
--   vet_id INTEGER REFERENCES vets(id),
--   species_id INTEGER REFERENCES species(id),
--   PRIMARY KEY (vet_id, species_id)
-- );

-- CREATE TABLE visits (
--   id INT GENERATED BY DEFAULT AS IDENTITY,
--   animal_id INTEGER REFERENCES animals(id),
--   vet_id INTEGER REFERENCES vets(id),
--   visit_date DATE,
-- --   PRIMARY KEY (vet_id, animal_id)
--   PRIMARY KEY (id)
-- );

-- CREATE TABLE visits(
--   id INT GENERATED BY DEFAULT AS IDENTITY,
--   animal_id INT REFERENCES animals(id),
--   vet_id INT REFERENCES vets(id),
--   date DATE,
--   PRIMARY KEY (id)
-- );

-- Add an email column to your owners table
-- ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.);
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';