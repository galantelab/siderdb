-- Deploy siderdb:populations to pg

BEGIN;

DROP TABLE population;
DROP TABLE super_population;

CREATE TABLE super_population (
	code CHAR(3) PRIMARY KEY,
	description TEXT NOT NULL
);

CREATE TABLE population (
	code CHAR(3) PRIMARY KEY,
	super_population_code CHAR(3) NOT NULL,
	description TEXT NOT NULL,
	CONSTRAINT super_population_fkey
		FOREIGN KEY (super_population_code)
			REFERENCES super_population(code)
			ON DELETE CASCADE
			ON UPDATE CASCADE
);

COMMIT;
