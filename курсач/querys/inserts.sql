-- Active: 1698417979383@@127.0.0.1@5432@Kursach
INSERT INTO Employees (first_name, last_name, position, adress, email, telephone)
VALUES (
    'Timour',
    'Kouvshinov',
    'senior db engineer',
    'Ouliyanovsk',
    'timourkot@gmail.com',
    '+7-(902)-129-29-10'
);
INSERT INTO Organizations (name_, email, telephone, adress)
VALUES(
    'SuperItCompany',
    'it@milo.global',
    '+7-(777)-777-77-77',
    'Ouliyanovsk'
);
INSERT INTO Contracts (amount, deadline, responsible_performer_id, organization_id)
VALUES (
    100500,
    '27-12-2023',
    1,
    1
);
INSERT INTO Services (title, description_, contract_id)
VALUES (
    'написать бд для учёта контрактов ит компании',
    'траляля',
    1
);
INSERT INTO Reports (title, text_, contract_id)
VALUES (
    'приступил к работе',
    'приступил к работе выполнения контракта 11.12.23, посидел и подумал над реализацией пока был в питере',
    1
);
INSERT INTO Software_products (title, description_, contract_id)
VALUES (
    'database',
    'база данных для ит компании',
    1
);
INSERT INTO Works (title, contract_id )
VALUES (
    'создание бд',
    1
);
INSERT INTO Statuses (title)
VALUES (
    'выполнено'
),
(
    'в процессе'
),
(
    'заморожено'
);
INSERT INTO Tasks (description_, status_id, work_id)
VALUES (
    'придумать структуру',
    2,
    1
),
(
    'придумать чем заполнить данными',
    3,
    1
);

INSERT INTO Organizations (name_, email, telephone, adress)
VALUES(
    'Devochka',
    'vino@milo.ru',
    '+7-(111)-111-11-11',
    'Saint petersbourg'
);
INSERT INTO Contracts (amount, deadline, responsible_performer_id, organization_id)
VALUES (
    2000,
    '22-12-2023',
    1,
    2
);
INSERT INTO Services (title, description_, contract_id)
VALUES (
    'сделать лабораторную HSE',
    'лабораторная на с++ из курса ВШЭ',
    2
);
INSERT INTO Reports (title, text_, contract_id)
VALUES (
    'приступил к работе',
    'приступил к работе выполнения контракта 16.12.23',
    2
),
(
    'работа выполнена',
    'сделал лабораторную и отправил заказчику 18.12.23',
    2
);
INSERT INTO Software_products (title, description_, contract_id)
VALUES (
    'лаба',
    'лабораторная на с++ из курса ВШЭ',
    2
);
INSERT INTO Works (title, contract_id )
VALUES (
    'сделать лабораторную',
    2
);
INSERT INTO Tasks (description_, status_id, work_id)
VALUES (
    'прочитать задание',
    2,
    2
),
(
    'написать код',
    2,
    2
),
(
    'протестировать',
    2,
    2
),
(
    'исправить баги',
    2,
    2
);

