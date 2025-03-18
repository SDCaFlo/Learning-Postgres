-- Tratamos de crear una foreign key en la tabla CITY - columna countrycode
-- referencia a la tabla COUNTRY columna code.
ALTER TABLE city
ADD CONSTRAINT fk_countrycode
FOREIGN KEY (countrycode)
REFERENCES country(code);
-- Aqui tenemos una falla pq el valor 'AFG' no está presente en COUNTRY - CODE

SELECT count(*) FROM country WHERE code= 'AFG';

-- Insertamos pais faltante
INSERT INTO country
		values('AFG', 'Afghanistan', 'Asia', 'Southern Asia', 652860, 1919, 40000000, 62, 69000000, NULL, 'Afghanistan', 'Totalitarian', NULL, NULL, 'AF');


-- Volvemos a intentar agregar el FOREIGN KEY:
ALTER TABLE city
ADD CONSTRAINT fk_countrycode
FOREIGN KEY (countrycode)
REFERENCES country(code);  -- otros comandos: ON UPDATE , ON DELETE 


--- COUNTRYLANGUAGE ---
SELECT * FROM countrylanguage LIMIT 10 ;

ALTER TABLE countrylanguage 
ADD CONSTRAINT fk_countrycode
FOREIGN KEY (countrycode)
REFERENCES country(code);

