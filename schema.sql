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

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
       ('Jennifer Orwell', 19),
       ('Bob', 45),
       ('Melody Pond', 77),
       ('Dean Winchester', 14),
       ('Jodie Whittaker', 38);

       -- Set the species_id value based on the animal's name
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = CASE WHEN name LIKE '%mon' THEN 'Digimon' ELSE 'Pokemon' END);

-- Add the foreign key constraint to the species_id column
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id);
-- Set the owner_id value based on the animal's owner
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = CASE name
                                                            WHEN 'Agumon' THEN 'Sam Smith'
                                                            WHEN 'Gabumon' THEN 'Jennifer Orwell'
                                                            WHEN 'Pikachu' THEN 'Jennifer Orwell'
                                                            WHEN 'Devimon' THEN 'Bob'
                                                            WHEN 'Plantmon' THEN 'Bob'
                                                            WHEN 'Charmander' THEN 'Melody Pond'
                                                            WHEN 'Squirtle' THEN 'Melody Pond'
                                                            WHEN 'Blossom' THEN 'Melody Pond'
                                                            WHEN 'Angemon' THEN 'Dean Winchester'
                                                            WHEN 'Boarmon' THEN 'Dean Winchester'
                                                       END);

-- Add the foreign key constraint to the owner_id column
-- ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY (owner_id) REFERENCES owners(id);


