-- Join customer, pet and program records for obedience-related sessions.
SELECT CONCAT(c.given_name, ' ', c.family_name) AS customer_name,
       pt.pet_name, p.program_name, r.session_date
FROM reservations AS r
JOIN pets AS pt ON pt.pet_id = r.pet_id
JOIN customers AS c ON c.customer_id = pt.customer_id
JOIN programs AS p ON p.program_id = r.program_id
WHERE p.program_name LIKE '%Obedience%'
ORDER BY c.family_name, r.session_date;
