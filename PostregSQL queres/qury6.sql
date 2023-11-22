-- Active: 1698417979383@@127.0.0.1@5432@laba
CREATE OR REPLACE PROCEDURE increase_salary(worker_name VARCHAR(255), increase_amount INT)
LANGUAGE plpgsql AS $increase_salary$
BEGIN
    UPDATE contract
    SET salary = salary + increase_amount
    WHERE id = (
        SELECT id FROM worker
        WHERE full_name = worker_name
    );

    COMMIT;
END;
$increase_salary$;

CALL increase_salary('Иван Петров Александрович', 500);

CREATE OR REPLACE FUNCTION calculate_total_salary()
RETURNS DECIMAL AS $calculate_total_salary$
DECLARE
    total_salary DECIMAL;
BEGIN
    SELECT SUM(salary) INTO total_salary
    FROM contract;

    RETURN total_salary;
END;
$calculate_total_salary$
LANGUAGE plpgsql;

SELECT calculate_total_salary();