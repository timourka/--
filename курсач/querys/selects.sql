-- Active: 1698417979383@@127.0.0.1@5432@Kursach
SELECT
    C.id, C.amount, C.deadline, calc_fulfilment_status(C.id) AS fulfilment_status,
    format('%s %s', E.first_name, E.last_name) AS responsible_performer_name,
    O.name_ as organization_name,
    S.title as service_title,
    Sp.title as software_product_title,
    W.title as work_title
FROM Contracts C
JOIN Employees E ON C.responsible_performer_id = E.id
JOIN Organizations O ON C.organization_id = O.id
JOIN Services S ON S.contract_id = C.id
JOIN Software_products Sp ON Sp.contract_id = C.id
JOIN Works W ON W.contract_id = C.id
ORDER BY C.id;
SELECT
    W.id, W.title as work_title, T.description_ task, S.title as status
FROM works W
JOIN tasks T ON T.work_id = W.id
JOIN statuses S ON T.status_id = S.id
ORDER BY W.id;
SELECT
    E.id, format('%s %s', E.first_name, E.last_name) AS employe_name, W.title AS work, T.description_ AS task, S.title AS status
FROM Employees E
JOIN contracts C ON C.responsible_performer_id = E.id
JOIN works W ON W.contract_id = C.id
JOIN tasks T ON T.work_id = W.id
JOIN statuses S ON T.status_id = S.id
ORDER BY E.id;
SELECT 'quantity' AS _, T.*, D.*, total-done AS not_done
FROM (
    SELECT count(C.id) AS total
    FROM contracts C
) T, (
    SELECT count(C.id) AS done
    FROM contracts C
    WHERE calc_fulfilment_status(C.id) = 1
) D;
