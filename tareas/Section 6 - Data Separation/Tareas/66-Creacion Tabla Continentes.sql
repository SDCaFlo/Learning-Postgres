-- CREAMOS LA TABLA CONTINENTE --
DROP TABLE IF EXISTS continent; 

CREATE TABLE continent (
	code SERIAL,
	name TEXT
);

--ALTER TABLE continent
--ALTER COLUMN code TYPE serial ;

ALTER TABLE continent
ADD PRIMARY KEY (code);

-- CHEQUEAMOS LOS VALORES QUE VAMOS A AGREGAR -- 
SELECT DISTINCT continent FROM country ORDER BY continent ASC;

-- INSERTAMOS EN NUEVA TABLA --

INSERT INTO continent (name)
SELECT DISTINCT continent FROM country ORDER BY continent ASC;

-- VERIFICAMOS VALORES --

SELECT * FROM continent;