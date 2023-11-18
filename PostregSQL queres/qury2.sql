-- Active: 1698417979383@@127.0.0.1@5432@laba
SELECT * FROM CONTRACT
WHERE contract_type = 1;

SELECT * FROM worker
ORDER BY date_of_birth ASC;

SELECT * FROM worker
ORDER BY date_of_birth DESC;

SELECT jobid, COUNT(jobid) FROM worker
GROUP BY jobid;

SELECT UPPER(full_name) from worker;

SELECT SUBSTRING(telephone FROM 14 FOR 18) from worker;

SELECT REPLACE(telephone, '+7', '8') from worker;

SELECT EXTRACT(YEAR FROM date_of_birth) from worker;

SELECT date_of_end - date_of_start from vacation;

SELECT TO_CHAR(date_of_birth, 'DD.MM.YYYY') from worker;
