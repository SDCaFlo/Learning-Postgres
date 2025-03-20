
(SELECT COUNT(a.name) as total_countries, b.name as continent_name FROM country a
JOIN continent b
ON a.continent = b.code
WHERE b.name NOT LIKE '%America%'
GROUP BY continent_name)
UNION
(SELECT COUNT(a.name) as total_countries, 'America' as continent_name FROM country a
JOIN continent b
ON a.continent = b.code
WHERE b.name LIKE '%America%')
ORDER BY total_countries ASC;