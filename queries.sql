
-- Update the animals table by setting the species column to 'digimon' for all animals that have a name ending in 'mon'
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
-- Update the animals table by setting the species column to 'pokemon' for all animals that don't have species already set.
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
-- Verify that changes were made.
SELECT * FROM animals;
-- Commit the transaction.
COMMIT;
-- Verify that changes persist after commit.
SELECT * FROM animals;



