-- Verify siderdb:populations on pg

BEGIN;

SELECT id, code, name
FROM superpopulation
WHERE FALSE;

SELECT id, superpopulation_id, igsr_id, code, name, description
FROM population
WHERE FALSE;

ROLLBACK;
