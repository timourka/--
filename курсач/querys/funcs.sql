-- Active: 1698417979383@@127.0.0.1@5432@Kursach
CREATE OR REPLACE FUNCTION calc_Fulfilment_status(id_contract INTEGER)
RETURNS REAL AS $calc_Fulfilment_status$
DECLARE
    finished_tasks_num DECIMAL;
    tasks_num DECIMAL;
BEGIN
    SELECT sum(W.tasks_num) INTO tasks_num
    FROM works W
    WHERE W.contract_id = id_contract;
    SELECT sum(W.finished_tasks_num) INTO finished_tasks_num
    FROM works W
    WHERE W.contract_id = id_contract;
    IF tasks_num = 0 THEN
        RETURN 1;
    END IF;
    RETURN finished_tasks_num/tasks_num;
END;
$calc_Fulfilment_status$ LANGUAGE plpgsql;

SELECT calc_Fulfilment_status(3);