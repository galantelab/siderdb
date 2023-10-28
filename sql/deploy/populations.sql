-- Deploy siderdb:populations to pg

BEGIN;

DROP TABLE population;
DROP TABLE super_population;

CREATE TABLE superpopulation (
	id INTEGER PRIMARY KEY,
	code TEXT UNIQUE DEFAULT NULL,
	name TEXT NOT NULL
);

CREATE TABLE population (
	id INTEGER PRIMARY KEY,
	superpopulation_id INTEGER NOT NULL,
	igsr_id TEXT UNIQUE DEFAULT NULL,
	code TEXT UNIQUE DEFAULT NULL,
	name TEXT NOT NULL,
	description TEXT NOT NULL,
	CONSTRAINT superpopulation_fkey
		FOREIGN KEY (superpopulation_id)
			REFERENCES superpopulation(id)
			ON DELETE CASCADE
			ON UPDATE CASCADE
);

COMMIT;
