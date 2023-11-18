-- Active: 1698417979383@@127.0.0.1@5432@laba
CREATE VIEW workerfullView AS
SELECT W.id, W.full_name, W.date_of_birth, W.adress, W.telephone, W.email,
 J.name as job_name, J.description as job_description, J.reqirement,
 D.name as department_name, D.description as department_description, D.head
FROM worker W JOIN job J ON W.jobid = J.id
JOIN department D ON J.departmentid = D.id
;
SELECT * FROM workerfullView;

create VIEW WorkerView AS
SELECT full_name, job_name, department_name
FROM workerfullView
;
SELECT * FROM WorkerView;