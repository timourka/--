-- Active: 1698417979383@@127.0.0.1@5432@laba

DROP TABLE department;

CREATE TABLE department(
    ID SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(1000) NOT NULL,
    head VARCHAR(255)
);

DROP TABLE job;

CREATE Table job(
    ID SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(1000) NOT NULL,
    reqirement VARCHAR(1000) NOT NULL,
    departmentId SERIAL NOT NULL,
    FOREIGN KEY (departmentId) REFERENCES department (id) ON DELETE CASCADE
);

drop table worker;

CREATE TABLE worker(
    ID SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    adress VARCHAR(255),
    telephone VARCHAR(20),
    email VARCHAR(255),
    jobId SERIAL,
    FOREIGN KEY (jobId) REFERENCES job (ID) ON DELETE SET NULL
);

CREATE TABLE vacation_type(
    id serial PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

drop table vacation;

CREATE Table vacation(
    ID SERIAL PRIMARY KEY,
    date_of_start DATE NOT NULL,
    date_of_end DATE NOT NULL,
    vacation_type SERIAL NOT NULL,
    workerId SERIAL NOT NULL,
    FOREIGN KEY (vacation_type) REFERENCES vacation_type (ID) ON DELETE CASCADE,
    FOREIGN KEY (workerId) REFERENCES worker (ID) ON DELETE CASCADE
);

CREATE Table contract_type(
    id serial PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

drop TABLE contract;

CREATE Table contract(
    ID SERIAL PRIMARY KEY,
    date_of_start DATE NOT NULL,
    date_of_end DATE NOT NULL,
    contract_type SERIAL,
    salary INTEGER NOT NULL,
    workerId SERIAL NOT NULL,    
    FOREIGN KEY (contract_type) REFERENCES contract_type (ID) ON DELETE SET NULL,
    FOREIGN KEY (workerId) REFERENCES worker (ID) ON DELETE CASCADE
)

CREATE SEQUENCE IdsDepartment START 1 MINVALUE 1;
CREATE SEQUENCE IdsJob START 1 MINVALUE 1;
CREATE SEQUENCE IdsWorker START 1 MINVALUE 1;
CREATE SEQUENCE IdsVacation START 1 MINVALUE 1;
CREATE SEQUENCE IdsVacation_type START 1 MINVALUE 1;
CREATE SEQUENCE IdsContract START 1 MINVALUE 1; 
CREATE SEQUENCE IdsContract_type START 1 MINVALUE 1; 

DROP SEQUENCE IdsDepartment;
DROP SEQUENCE IdsJob;
DROP SEQUENCE IdsWorker;
DROP SEQUENCE IdsVacation;
DROP SEQUENCE IdsContract;

INSERT INTO department VALUES (nextval('IdsDepartment'), 'продажи', 'отдел занимается продажами и клиентским обслуживаием', 'Анна Иванова');
INSERT INTO job VALUES (
    nextval('IdsJob'),
    'Менеджер по продажам',
    'Управление командой продаж, ведение клиентских баз данных',
    'исполнительность, умение работы с ПК',
    1
);
INSERT INTO job VALUES (
    nextval('IdsJob'),
    'Начальник отдела продаж',
    'Управление отделом продаж, разработка стратегии продаж',
    'управленческие навыки',
    1
);
INSERT into worker VALUES(
    nextval('IdsWorker'),
    'Иван Петров Александрович',
    '1985-03-15',
    'ул. Ленина, 123',
    '+7-(123)-456-78-90',
    'ivan.petrov@example.com',
    1
);
INSERT into worker VALUES(
    nextval('IdsWorker'),
    'Анна Ивановна Анатольевна',
    '1990-07-20',
    'ул.Гагарина, 45',
    '+7-(908)-765-43-21',
    'anna.ivanova@example.com',
    2
);
INSERT INTO vacation_type VALUES(
    nextval('IdsVacation_type'),
    'Отпуск по собственному желанию'
);
INSERT INTO vacation VALUES(
    nextval('IdsVacation'),
    '2023-08-01',
    '2023-08-15',
    1,
    1
);

INSERT INTO contract_type VALUES(
    nextval('IdsContract_type'),
    'бессрочный'
)

INSERT INTO contract VALUES(
    nextval('IdsContract'),
    '2021-05-10',
    '2024-05-10',
    1,
    50000,
    1
)

INSERT INTO contract VALUES(
    nextval('IdsContract'),
    '2019-03-15',
    '2024-03-15',
    1,
    80000,
    2
)

INSERT into worker VALUES(
    nextval('IdsWorker'),
    'Антон Григорьев Григорьевич',
    '1987-07-21',
    'ул.Гагарина, 10',
    '+7-(908)-767-34-61',
    'anton@example.com',
    1
);

UPDATE worker
SET full_name = 'Пётр Григорьев Григорьевич'
WHERE full_name = 'Антон Григорьев Григорьевич';