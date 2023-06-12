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
-- SELECT animals.name
-- FROM animals
-- JOIN owners ON animals.owner_id = owners.id
-- WHERE owners.full_name = 'Melody Pond';

-- -- List of all animals that are pokemon (their type is Pokemon).
-- SELECT animals.name
-- FROM animals
-- JOIN species ON animals.species_id = species.id
-- WHERE species.name = 'Pokemon';

-- -- List all owners and their animals, remember to include those that don’t own any animal.
-- SELECT owners.full_name, animals.name
-- FROM owners
-- LEFT JOIN animals ON owners.id = animals.owner_id;

-- -- How many animals are there per species?
-- SELECT species.name, COUNT(animals.id) AS count
-- FROM species
-- LEFT JOIN animals ON species.id = animals.species_id
-- GROUP BY species.name;

-- -- List all Digimon owned by Jennifer Orwell.
-- SELECT animals.name
-- FROM animals
-- JOIN species ON animals.species_id = species.id
-- JOIN owners ON animals.owner_id = owners.id
-- WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

-- -- List all animals owned by Dean Winchester that haven’t tried to escape.
-- SELECT *
-- FROM animals
-- JOIN owners ON animals.owner_id = owners.id
-- WHERE owners.full_name = 'Dean Winchester' AND escaped IS NULL;

-- -- Who owns the most animals?
-- SELECT owners.full_name, COUNT(animals.id) AS count
-- FROM owners
-- LEFT JOIN animals ON owners.id = animals.owner_id
-- GROUP BY owners.full_name
-- ORDER BY count DESC LIMIT 1;



-- -- Who was the last animal seen by William Tatcher?
-- SELECT animals.name AS animal_name
-- FROM visits
-- JOIN animals ON visits.animal_id = animals.id
-- WHERE visits.vet_id = (SELECT id FROM vets WHERE name = 'William Tatcher')
-- ORDER BY visits.visit_date DESC
-- LIMIT 1;


-- -- How many different animals did Stephanie Mendez see?
-- SELECT COUNT(DISTINCT animal_id) FROM visits JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Stephanie Mendez';

-- -- List all vets and their specialties, including vets with no specialties.
-- SELECT vets.name AS vet_name, species.name AS specialty_name
-- FROM vets
-- LEFT JOIN specializations ON vets.id = specializations.vet_id
-- LEFT JOIN species ON specializations.species_id = species.id;

-- -- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
-- SELECT animals.name FROM visits JOIN vets ON visits.vet_id = vets.id JOIN animals ON visits.animal_id = animals.id WHERE vets.name = 'Stephanie Mendez' AND visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

-- -- What animal has the most visits to vets?
-- SELECT animals.name, COUNT(*) AS visit_count FROM visits JOIN animals ON visits.animal_id = animals.id GROUP BY animals.name ORDER BY visit_count DESC LIMIT 1;

-- -- Who was Maisy Smith’s first visit?
-- SELECT vets.name FROM visits JOIN vets ON visits.vet_id = vets.id JOIN animals ON visits.animal_id = animals.id WHERE animals.name = 'Maisy Smith' ORDER BY visits.visit_date ASC LIMIT 1;

-- -- Details for most recent visit: animal information, vet information, and date of visit.
-- SELECT animals.name AS animal_name, vets.name AS vet_name, visits.visit_date FROM visits JOIN animals ON visits.animal_id = animals.id JOIN vets ON visits.vet_id = vets.id ORDER BY visit_date DESC LIMIT 1;

-- -- How many visits were with a vet that did not specialize in that animal’s species?
-- SELECT COUNT(*) FROM visits JOIN vets ON visits.vet_id = vets.id JOIN animals ON visits.animal_id = animals.id LEFT JOIN specializations ON (vets.id = specializations.vet_id AND animals.species_id != specializations.species_id) WHERE specializations.species_id IS NULL;

-- -- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
-- SELECT species.name FROM ( SELECT specializations.species_id FROM specializations JOIN vets ON specializations.vet_id = vets.id WHERE vets.name = 'Maisy Smith' GROUP BY species_id ORDER BY COUNT(*) DESC LIMIT 1 ) AS most_common_species JOIN species ON species.id = most_common_species.species_id;

--The following queries are taking too much time (1 sec = 1000ms can be considered as too much time for database query). Try them on your machine to confirm it:
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vets_id = 2;
EXPLAIN ANALYSE SELECT * FROM owners where email = 'owners_18327@mail.com';


-- query to check performance
explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;



