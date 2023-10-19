-- Verify siderdb:populations on pg

BEGIN;

SELECT id, code, description, timestamp
FROM super_population
WHERE FALSE;

SELECT id, super_population_id, code, description, timestamp
FROM population
WHERE FALSE;

ROLLBACK;
