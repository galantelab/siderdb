-- Verify siderdb:populations on pg

BEGIN;

SELECT code, description
FROM super_population
WHERE FALSE;

SELECT code, super_population_code, description
FROM population
WHERE FALSE;

ROLLBACK;
