/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES
    ('Charmander', '2020-02-08', -11, false, 0),
    ('Plantmon', '2021-11-15', -5.7, true, 2),
    ('Squirtle', '1993-04-02', -12.13, false, 3),
    ('Angemon', '2005-06-12', -45.0, true, 1),
    ('Boarmon', '2005-06-07', 20.4, true, 7),
    ('Blossom', '1998-10-13', 17, true, 3),
    ('Ditto', '2022-05-14', 22, true, 4);

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
       ('Jennifer Orwell', 19),
       ('Bob', 45),
       ('Melody Pond', 77),
       ('Dean Winchester', 14),
       ('Jodie Whittaker', 38);
--    Insert the following data into the species table:
INSERT INTO species (name)
VALUES ('Pokemon'),
        ('Digimon');

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
ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY (owner_id) REFERENCES owners(id);

-- Insert data to vets
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

-- Insert data to specialities
INSERT INTO specializations (vet_id, species_id) VALUES ((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM species WHERE name = 'Pokemon'));
INSERT INTO specializations (vet_id, species_id) VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Digimon'));
INSERT INTO specializations (vet_id, species_id) VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Pokemon'));
INSERT INTO specializations (vet_id, species_id) VALUES ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM species WHERE name = 'Digimon'));

-- Insert data for visits table
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM animals WHERE name = 'Agumon'), '2020-05-24');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE name = 'Agumon'), '2020-07-22');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM animals WHERE name = 'Gabumon'), '2021-02-02');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Pikachu'), '2020-01-05');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Pikachu'), '2020-03-08');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Pikachu'), '2020-05-14');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE name = 'Devimon'), '2021-05-04');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM animals WHERE name = 'Charmander'), '2021-02-24');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Plantmon'), '2019-12-21');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM animals WHERE name = 'Plantmon'), '2020-08-10');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Plantmon'), '2021-04-07');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE name = 'Squirtle'), '2019-09-29');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM animals WHERE name = 'Angemon'), '2020-10-03');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM animals WHERE name = 'Angemon'), '2020-11-04');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Boarmon'), '2019-01-24');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Boarmon'), '2019-05-15');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Boarmon'), '2020-02-27');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Maisy Smith'), (SELECT id FROM animals WHERE name = 'Boarmon'), 	'2020-08-03');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),(SELECT id FROM animals WHERE name = 'Blossom'), '2020-05-24');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'William Tatcher'),(SELECT id FROM animals WHERE name = 'Blossom'), '2021-01-11');
