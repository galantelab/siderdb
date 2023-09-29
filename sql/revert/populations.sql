-- Revert siderdb:populations from pg

BEGIN;

DROP TABLE super_population;
DROP TABLE population;

COMMIT;
