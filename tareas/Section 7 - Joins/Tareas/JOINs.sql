-- UNION -- 
SELECT code, name FROM continent WHERE name LIKE '%America'
UNION
SELECT code, name FROM continent WHERE name NOT LIKE '%America';

-- UNION solo verifica los tipos de variables

SELECT code, name FROM continent WHERE name LIKE '%America'
UNION
SELECT 5, 'cualquiercosa';

--- Union de tablas mediante WHERE ---
-- No es óptimo --
SELECT c.name as country, b.name as continent FROM country c, continent b
WHERE c.continent = b.code;

-- INNER JOIN --
-- Más óptimo
SELECT a.name as country, b.name as continent FROM country a
INNER JOIN continent b
ON a.continent = b.code;

-- OUTER JOINS ---
-- RIGHT OUTER JOIN

SELECT a.name as country, b.name as continent from country  a
RIGHT JOIN continent b 
ON a.continent = b.code
ORDER BY a.name DESC;
-- Aquí vemos el valor nulo.

-- RIGHT OUTER JOIN con exclusión
SELECT a.name as country, b.name as continent from country  a
RIGHT JOIN continent b 
ON a.continent = b.code
WHERE a.name IS NULL
ORDER BY a.name DESC;

-- FULL OUTER JOIN con EXCLUSIÓN

SELECT a.name as country, b.name as continent from country  a
FULL OUTER JOIN continent b 
ON a.continent = b.code
WHERE a.name IS NULL or b.name is NULL
ORDER BY a.name DESC;

-- JOIN with Aggregation

SELECT 
	COUNT(a.code) as total_countries, -- Verify this with a.*, b.* and *.
	b.code as continent_code,
	b.name as continent_name
FROM country a
RIGHT JOIN continent b
	ON a.continent = b.code
GROUP BY b.code
ORDER BY total_countries ASC;


