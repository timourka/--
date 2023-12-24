-- Active: 1698417979383@@127.0.0.1@5432@Kursach
CREATE OR REPLACE FUNCTION add_task_triger()
    RETURNS trigger AS $add_task_triger$
BEGIN
    UPDATE works
    SET tasks_num = tasks_num+1
    WHERE id = NEW.work_id;
    RETURN NEW;
END;
    $add_task_triger$ LANGUAGE plpgsql;
CREATE TRIGGER add_task_triger
AFTER INSERT ON tasks
FOR EACH ROW EXECUTE PROCEDURE add_task_triger();
CREATE OR REPLACE FUNCTION del_task_triger()
    RETURNS trigger AS $del_task_triger$
BEGIN
    IF OLD.status_id = 1 THEN
        UPDATE works
        SET finished_tasks_num = finished_tasks_num-1
        WHERE id = OLD.work_id;
    END IF;
    UPDATE works
    SET tasks_num = tasks_num-1
    WHERE id = OLD.work_id;
    RETURN OLD;
END;
    $del_task_triger$ LANGUAGE plpgsql;
CREATE TRIGGER del_task_triger
BEFORE DELETE ON tasks
FOR EACH ROW EXECUTE PROCEDURE del_task_triger();

CREATE OR REPLACE FUNCTION update_task_triger()
    RETURNS trigger AS $update_task_triger$
BEGIN
    IF NEW.status_id = 1 and OLD.status_id <> 1 THEN
        UPDATE works
        SET finished_tasks_num = finished_tasks_num+1
        WHERE id = NEW.work_id;
    END IF;
    IF OLD.status_id = 1 and NEW.status_id <> 1 THEN
        UPDATE works
        SET finished_tasks_num = finished_tasks_num-1
        WHERE id = NEW.work_id;
    END IF;
    RETURN NEW;
END;
    $update_task_triger$ LANGUAGE plpgsql;
CREATE TRIGGER update_task_triger
AFTER UPDATE ON tasks
FOR EACH ROW EXECUTE PROCEDURE update_task_triger();
UPDATE tasks
SET status_id = 1
WHERE work_id = 2;
UPDATE tasks
SET status_id = 2
WHERE work_id = 2;

DELETE FROM tasks
WHERE work_id = 2;

UPDATE tasks
SET status_id = 1
WHERE id = 1;