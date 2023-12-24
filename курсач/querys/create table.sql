-- Active: 1698417979383@@127.0.0.1@5432@Kursach
DROP TABLE Employees;
CREATE TABLE Employees(
    ID SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    position VARCHAR(255) NOT NULL,
    adress VARCHAR(255),
    email VARCHAR(255) NOT NULL,
    telephone VARCHAR(20) CHECK(telephone LIKE '+7-(___)-___-__-__')
);
DROP TABLE Organizations;
CREATE TABLE Organizations(
    ID SERIAL PRIMARY KEY,
    name_ VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    telephone VARCHAR(20) CHECK(telephone LIKE '+7-(___)-___-__-__'),
    adress VARCHAR(255)
);
DROP TABLE Contracts;
CREATE TABLE Contracts(
    id SERIAL PRIMARY key,
    contract_amount NUMERIC(19, 2) NOT NULL,
    deadline DATE NOT NULL,
    responsible_performer_id SERIAL NOT NULL,
    organization_id SERIAL NOT NULL,
    FOREIGN KEY (responsible_performer_id) REFERENCES employees (id) ON DELETE NO ACTION,
    FOREIGN KEY (organization_id) REFERENCES organizations (id) ON DELETE NO ACTION
);
DROP TABLE Services;
CREATE TABLE Services(
    id SERIAL PRIMARY key,
    title VARCHAR(255) NOT NULL,
    description_ VARCHAR(255),
    contract_id SERIAL,
    FOREIGN KEY (contract_id) REFERENCES contracts (id) ON DELETE NO ACTION
);
DROP TABLE Reports;
CREATE TABLE Reports(
    id SERIAL PRIMARY key,
    title VARCHAR(255) NOT NULL,
    text_ VARCHAR(4000),
    contract_id SERIAL,
    FOREIGN KEY (contract_id) REFERENCES contracts (id) ON DELETE NO ACTION
);
DROP TABLE Sofware_products;
CREATE TABLE Sofware_products(
    id SERIAL PRIMARY key,
    title VARCHAR(255) NOT NULL,
    description_ VARCHAR(255),
    contract_id SERIAL,
    FOREIGN KEY (contract_id) REFERENCES contracts (id) ON DELETE NO ACTION
);
DROP TABLE works;
CREATE TABLE Works(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    contract_id SERIAL NOT NULL,
    finished_tasks_num INT NOT NULL check(finished_tasks_num <= tasks_num) DEFAULT 0,
    tasks_num INT NOT NULL DEFAULT 0,
    FOREIGN KEY (contract_id) REFERENCES contracts (id) ON DELETE NO ACTION
);
DROP TABLE Statuses;
CREATE TABLE Statuses(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);
DROP TABLE Tasks;
CREATE TABLE Tasks(
    id SERIAL PRIMARY KEY,
    description_ VARCHAR(255) NOT NULL,
    status_id SERIAL REFERENCES statuses ON DELETE NO ACTION,
    work_id SERIAL REFERENCES works ON DELETE NO ACTION
);

