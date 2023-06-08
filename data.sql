/* Populate database with sample data. */

-- INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
-- VALUES
--     ('Charmander', '2020-02-08', -11, false, 0),
--     ('Plantmon', '2021-11-15', -5.7, true, 2),
--     ('Squirtle', '1993-04-02', -12.13, false, 3),
--     ('Angemon', '2005-06-12', -45.0, true, 1),
--     ('Boarmon', '2005-06-07', 20.4, true, 7),
--     ('Blossom', '1998-10-13', 17, true, 3),
--     ('Ditto', '2022-05-14', 22, true, 4)

-- INSERT INTO owners (full_name, age)
-- VALUES ('Sam Smith', 34),
--        ('Jennifer Orwell', 19),
--        ('Bob', 45),
--        ('Melody Pond', 77),
--        ('Dean Winchester', 14),
--        ('Jodie Whittaker', 38);

--        -- Set the species_id value based on the animal's name
-- UPDATE animals
-- SET species_id = (SELECT id FROM species WHERE name = CASE WHEN name LIKE '%mon' THEN 'Digimon' ELSE 'Pokemon' END);

-- -- Add the foreign key constraint to the species_id column
-- ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id);
-- -- Set the owner_id value based on the animal's owner
-- UPDATE animals
-- SET owner_id = (SELECT id FROM owners WHERE full_name = CASE name
--                                                             WHEN 'Agumon' THEN 'Sam Smith'
--                                                             WHEN 'Gabumon' THEN 'Jennifer Orwell'
--                                                             WHEN 'Pikachu' THEN 'Jennifer Orwell'
--                                                             WHEN 'Devimon' THEN 'Bob'
--                                                             WHEN 'Plantmon' THEN 'Bob'
--                                                             WHEN 'Charmander' THEN 'Melody Pond'
--                                                             WHEN 'Squirtle' THEN 'Melody Pond'
--                                                             WHEN 'Blossom' THEN 'Melody Pond'
--                                                             WHEN 'Angemon' THEN 'Dean Winchester'
--                                                             WHEN 'Boarmon' THEN 'Dean Winchester'
--                                                        END);

-- Add the foreign key constraint to the owner_id column
-- ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY (owner_id) REFERENCES owners(id);

-- Insert data to vets

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');
