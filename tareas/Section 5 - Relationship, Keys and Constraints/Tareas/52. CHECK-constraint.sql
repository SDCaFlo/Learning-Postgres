SELECT * FROM country;

ALTER TABLE country
ADD PRIMARY KEY (code);

SELECT * FROM country WHERE code = 'NLD';

DELETE FROM country WHERE code = 'NLD' and code2 = 'NA';

ALTER TABLE country
ADD PRIMARY KEY (code);

-- CONSTRAINT - CHECK --

SELECT code, name, surfacearea FROM country;
-- surface area should be always >= 0 

-- agregamos una sentencia check
ALTER TABLE country 
ADD CHECK (surfacearea >=0);

-- tratamos de violar el check, no lo dejará.
UPDATE  country
SET  surfacearea = -1
WHERE code = 'NLD';


-- CONSTRAINT - CHECK - MULTIPLE STRINGS --

-- Observamos los distintos valores de continentes en la tabla
SELECT DISTINCT continent FROM country;

-- Queremos evitar que se agregen otros valores inválidos.
ALTER TABLE country 
ADD CHECK (continent IN 
	('Asia'::text, 
	'South America'::text, 
	'North America'::text, 
	'Oceania'::text, 
	'Antarctica'::text, 
	'Africa'::text, 
	'Europe'::text) 
	);

-- Este pais deberia ser de central america
SELECT * FROM country WHERE name = 'Panama';

UPDATE country SET continent = 'Central America' WHERE name = 'Panama'; --constraint violation.

-- alteramos el check, agregando Central America
ALTER TABLE country 
ADD CHECK (continent IN 
	('Asia'::text, 
	'South America'::text, 
	'North America'::text, 
	'Oceania'::text, 
	'Antarctica'::text, 
	'Africa'::text, 
	'Europe'::text,
	'Central America'::text) 
	);

-- Observación: Se encontraron repeticiones de CHECK constraints, fue necesario borrar las anteriores.
-- Modificamos
UPDATE country SET continent = 'Central America' WHERE name = 'Panama';


