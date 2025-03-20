-- LENGUAJES OFICIALES POR CONTINENT---
SELECT DISTINCT b.name as language, d.name as continent FROM countrylanguage a
INNER JOIN language b ON a.languagecode = b.code
INNER JOIN country c ON a.countrycode = c.code
INNER JOIN continent d ON c.continent = d.code
WHERE a.isofficial IS TRUE
ORDER BY d.name, b.name;