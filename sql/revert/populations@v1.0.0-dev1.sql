-- Revert siderdb:populations from pg

BEGIN;

DROP TABLE population;
DROP TABLE super_population;

COMMIT;
