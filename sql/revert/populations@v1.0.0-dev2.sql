-- Deploy siderdb:populations to pg

BEGIN;

DROP TABLE population;
DROP TABLE super_population;

CREATE TABLE super_population (
	id SERIAL PRIMARY KEY,
	code CHAR(3) NOT NULL,
	description TEXT NOT NULL,
	timestamp TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE population (
	id SERIAL PRIMARY KEY,
	super_population_id INTEGER NOT NULL,
	code CHAR(3) NOT NULL,
	description TEXT NOT NULL,
	timestamp TIMESTAMPTZ NOT NULL DEFAULT NOW(),
	CONSTRAINT fk_super_population
		FOREIGN KEY (super_population_id)
			REFERENCES super_population(id)
);

COMMIT;
