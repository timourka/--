-- Active: 1698417979383@@127.0.0.1@5432@laba
SELECT W.id, W.full_name, W.date_of_birth, W.adress, W.telephone, W.email,
 J.name, J.description, J.reqirement,
 D.name, D.description, D.head
FROM worker W JOIN job J ON W.jobid = J.id
JOIN department D ON J.departmentid = D.id
;

SELECT * FROM worker
WHERE jobid in (
    SELECT id FROM job
    WHERE name = 'Менеджер по продажам'
);
