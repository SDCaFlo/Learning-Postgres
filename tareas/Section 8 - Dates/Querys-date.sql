-- Pruebas de funciones --
SELECT now(), 
CURRENT_DATE,  
CURRENT_TIME,
date_part('minutes', now()) as minutes,
date_part('hours', now()) as hours,
date_part('seconds', now()) as seconds,
date_part('year', now()) as years,
date_part('months', now()) as months,
date_part('days', now()) as days,
date_part('quarter', now()) as quarter,
date_part('week', now()) as num_weeks;


SELECT now() as date,
date_part('doy', now()) as day_of_year,
date_part('dow', now()) as day_of_week;

SELECT EXTRACT(EPOCH FROM INTERVAL '24 Hours') / 3600;

-- CONSULTAS --

SELECT * FROM employees;

SELECT first_name, hire_date FROM employees
WHERE hire_date BETWEEN  '1990-01-01' AND DATE('1994-01-01');

SELECT  date_part('year',hire_date) as year, COUNT(*) as total_hires FROM employees
GROUP BY year
ORDER BY YEAR ASC;

-- INTERVALOS --

SELECT  INTERVAL '1 hour';   -- Can specificy day, year, months, weeks, hours, etc

SELECT MAX(hire_date) + INTERVAL '1 YEAR' AS max_hire_date,
MAX(hire_date) + INTERVAL '1 day' + INTERVAL '1 week' as max_hire_date_2  -- concatenamos intervalos
FROM employees;

-- CREAR INTERVALO CONDICIONAL
SELECT MAKE_INTERVAL(DAYS := 2000); -- Creación de intervalo 
SELECT hire_date + MAKE_INTERVAL(DAYS := 2000) AS hire_date FROM employees;
-- intervalo que depende de una columna
SELECT MAKE_INTERVAL(YEARS := date_part('years', hire_date)::INTEGER) FROM employees;
SELECT DATE('2030-01-01') - MAKE_INTERVAL(YEARS := date_part('years', hire_date)::INTEGER) FROM employees;


-- Diferencia de fechas
SELECT date_part('years', now()) - date_part('years', hire_date)
FROM employees; -- Puede ser que no haya cumplido años.

-- Comparativa Extract y date_part. 
SELECT EXTRACT(YEARS from HIRE_DATE)  as year_1,
date_part('years', hire_date) as year_2 FROM employees;

SELECT MAKE_INTERVAL( YEARS := EXTRACT(YEARS FROM now())::integer - EXTRACT(YEARS FROM hire_date)::integer) as tiempo_trabajo
FROM employees;




-- Agregando años

SELECT 
DATE(hire_date + MAKE_INTERVAL(YEARS := EXTRACT(YEARS from NOW())::integer - 2000))
FROM employees;

UPDATE employees
SET hire_date =  DATE(hire_date + MAKE_INTERVAL(YEARS := EXTRACT(YEARS from NOW())::integer - 2000))
;

-- CASE WHEN
select first_name, last_name, hire_date,
DATE_PART('years', AGE(current_date, hire_date)) AS Antigüedad,  -- Aqui usamos la funcion AGE para calcular un intervalo entre dos fechas
CASE
	WHEN hire_date > current_date - INTERVAL '1 YEAR' THEN 'RANK A'
	WHEN hire_date > current_date - INTERVAL '3 YEAR' THEN 'RANK B'
	WHEN hire_date > current_date - INTERVAL '5 YEAR' THEN 'RANK C'
	ELSE 'RANK D'
END as age_rank
from employees;



SELECT DATE_PART('YEARS', AGE(now(), '1994-02-25'));
SELECT EXTRACT(YEAR FROM AGE(now(), '1994-02-25'));

SELECT EXTRACT(YEAR FROM INTERVAL '3 YEARS');




