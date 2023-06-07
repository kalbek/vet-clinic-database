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

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    age INTEGER NOT NULL
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Drop the species column
ALTER TABLE animals DROP COLUMN species;

-- Add the species_id column as a foreign key referencing the species table
ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);

-- Add the owner_id column as a foreign key referencing the owners table
ALTER TABLE animals ADD COLUMN owner_id INTEGER REFERENCES owners(id);

-- Set the id column as auto-incremented primary key
ALTER TABLE animals ALTER COLUMN id SET DEFAULT nextval('animals_id_seq');
ALTER TABLE animals ADD PRIMARY KEY (id);



