-- BEGIN;
-- -- set the species column to unspecified
-- UPDATE animals SET species = 'unspecified';

-- -- Verify that the change was made
-- SELECT * FROM animals;

-- -- Roll back the change
-- ROLLBACK;

-- -- Verify that the species column went back to its state before the transaction
-- SELECT * FROM animals;

-- -- Update the animals table by setting the species column to 'digimon' for all animals that have a name ending in 'mon'
-- BEGIN;
-- UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
-- -- Update the animals table by setting the species column to 'pokemon' for all animals that don't have species already set.
-- UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
-- -- Verify that changes were made.
-- SELECT * FROM animals;
-- -- Commit the transaction.
-- COMMIT;
-- -- Verify that changes persist after commit.
-- SELECT * FROM animals;

-- -- Start a transaction
-- BEGIN;

-- -- Delete all records in the animals table.
-- DELETE FROM animals;

-- -- Confirm all animals are deleted.
-- SELECT * FROM animals;

-- -- Roll back the transaction.
-- ROLLBACK;

-- -- Verify if all records in the animals table still exist.
-- SELECT * FROM animals;

-- -- Start a new transaction
-- BEGIN;

-- -- Delete all animals born after Jan 1st, 2022.
-- DELETE FROM animals WHERE date_of_birth > '2022-01-01';

-- -- Create a savepoint for the transaction.
-- SAVEPOINT my_savepoint;

-- -- Update all animals' weight to be their weight multiplied by -1.
-- UPDATE animals SET weight_kg = weight_kg * -1;

-- -- Rollback to the savepoint.
-- ROLLBACK TO my_savepoint;

-- -- Update all animals' weights that are negative to be their weight multiplied by -1.
-- UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

-- -- Commit transaction.
-- COMMIT;
-- SELECT * FROM animals;

-- -- Count number of animals
-- SELECT COUNT(*) FROM animals;

-- -- Count number of animals that have never tried to escape before
-- SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

-- -- Avg weight of animals
-- SELECT AVG(weight_kg) FROM animals;

-- -- Who escaped the most
-- SELECT neutered, COUNT(*) FROM animals WHERE escape_attempts > 0 GROUP BY neutered;

-- -- Min and Max weight of each type of animals
-- SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

-- -- Avg number of escape attempts
-- SELECT name, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY name;

-- What animals belong to Melody Pond?
SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don’t own any animal.
SELECT owners.full_name, animals.name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT species.name, COUNT(animals.id) AS count
FROM species
LEFT JOIN animals ON species.id = animals.species_id
GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
JOIN owners ON animals.owner_id = owners.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

-- List all animals owned by Dean Winchester that haven’t tried to escape.
SELECT *
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND escaped IS NULL;

-- Who owns the most animals?
SELECT owners.full_name, COUNT(animals.id) AS count
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY count DESC LIMIT 1;






