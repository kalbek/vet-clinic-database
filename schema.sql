-- reduce performance for first query
SHOW INDEX FROM visits;
DROP INDEX visits_animal_id_idx ON visits;


SELECT vet_id, COUNT(*)
FROM visits
GROUP BY vet_id
HAVING COUNT(*) > 1;


CREATE TABLE temp_visits AS
SELECT DISTINCT ON (vet_id) *
FROM visits
ORDER BY vet_id, visit_date DESC;  


ALTER TABLE visits RENAME TO visits_old;
ALTER TABLE temp_visits RENAME TO visits;
-- DROP TABLE visits_old;

-- add index on email column of owners table to improve performance for third query.
CREATE INDEX idx_owners_email ON owners (email);





