-- Active: 1698417979383@@127.0.0.1@5432@laba
CREATE OR REPLACE FUNCTION add_worker_job_department()
    RETURNS trigger AS $add_worker_job_department$
BEGIN
    IF NOT EXISTS (
        SELECT * FROM department D
        WHERE D.name = NEW.department_name
    ) THEN
        INSERT INTO department VALUES (
            nextval('IdsDepartment'),
            NEW.department_name,
            NEW.department_description,
            NEW.head
        );
    END IF;

    IF NOT EXISTS (
        SELECT * FROM job J
        WHERE J.name = NEW.job_name
    ) THEN
        INSERT INTO job VALUES (
            nextval('IdsJob'),
            NEW.job_name,
            NEW.job_description,
            NEW.reqirement,
            (SELECT id FROM department
             WHERE name = NEW.department_name)
        );
    END IF;

    INSERT INTO worker VALUES (
        NEW.id,
        NEW.full_name,
        NEW.date_of_birth,
        NEW.adress,
        NEW.telephone,
        NEW.email,
        (SELECT id FROM job
         WHERE name = NEW.job_name)
    );
    RETURN NEW;
END;
$add_worker_job_department$ LANGUAGE plpgsql;

CREATE TRIGGER add_worker_job_department
INSTEAD OF INSERT ON workerfullview
FOR EACH ROW EXECUTE PROCEDURE add_worker_job_department();

INSERT INTO workerfullview VALUES (
    nextval('IdsWorker'),
    'Екатерина Смирнова',
    '1985-07-15',
    'г. Москва, ул. Примерная, д. 123',
    '+7-(999)-123-45-67',
    'exampleKatuxxa@email.com',
    'Менеджер по продажам',
    'Обеспечение роста продаж и увеличение клиентской базы',
    'Опыт работы в продажах от 2 лет',
    'продажи',
    'Отдел занимается продажами и привлечением клиентов',
    'Иван Иванович'
);

CREATE OR REPLACE FUNCTION check_worker_fields_format()
RETURNS TRIGGER AS $check_worker_fields_format$
BEGIN

    IF NEW.telephone IS NOT NULL AND NEW.telephone NOT LIKE '+7-(___)-___-__-__' THEN
        RAISE EXCEPTION 'Некорректный формат телефона! Формат должен быть: +7-(xxx)-xxx-xx-xx';
    END IF;
    
    RETURN NEW;
END;
$check_worker_fields_format$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER check_worker_fields_trigger
BEFORE INSERT ON worker
FOR EACH ROW EXECUTE FUNCTION check_worker_fields_format();

INSERT INTO workerfullview VALUES (
    nextval('IdsWorker'),
    'Алексей Петров Петрович',
    '1990-03-25',
    'г. Санкт-Петербург, ул. Центральная, д. 50',
    '+7-(111)-222-33-44',
    'exampleAlexPetrov@email.com',
    'Аналитик',
    'Анализ данных и отчетность',
    'Опыт работы в анализе данных от 3 лет',
    'аналитика',
    'Отдел аналитики и статистики',
    'Наталья Сидорова Дмитриевна'
);