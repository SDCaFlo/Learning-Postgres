-- Remover checks de country --
ALTER TABLE country
DROP CONSTRAINT country_continent_check;

-- Verificamos el update a realizar --

SELECT c.name, c.continent,
 (SELECT b.code FROM continent b WHERE b.name = c.continent LIMIT 1)
from country c;

-- Realizamos el update -- 

UPDATE country c
SET  continent = (SELECT b.code FROM continent b WHERE b.name = c.continent LIMIT 1);

SELECT name, continent FROM country;

-- Modificamos el tipo de dato -- 
ALTER TABLE country
ALTER COLUMN continent TYPE int4
USING continent::integer;

-- Agregamos un foreign key --

ALTER TABLE country 
ADD CONSTRAINT fk_continent
FOREIGN KEY (continent)
REFERENCES continent(code);

-- Verificamos la funcionalidad del constraint --

SELECT * FROM continent;  

UPDATE continent
SET code = 99 WHERE code = 1;

