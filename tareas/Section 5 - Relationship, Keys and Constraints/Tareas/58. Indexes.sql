
CREATE INDEX "generic_distric_index" ON city (district);

SELECT * FROM city limit 10;

--- try to create new multiindex--
CREATE UNIQUE INDEX "UNIQUE_name_countrycode_district" ON city
(name, countrycode, district);

--- check duplicate values---
SELECT * FROM city
WHERE 
	name = 'Jinzhou' AND
	countrycode  = 'CHN' AND
	district = 'Liaoning';

-- Update duplicate value --- 
UPDATE city 
SET name = 'Jinzhou Old'
WHERE id = 1944;

-- try again to create index --
CREATE UNIQUE INDEX "UNIQUE_name_countrycode_district" ON city
(name, countrycode, district);

-- Verify if we are using the index when consulting -- 
EXPLAIN SELECT * FROM city WHERE 
	name = 'Jinzhou' AND
	countrycode  = 'CHN' AND
	district = 'Liaoning';