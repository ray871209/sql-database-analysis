-- Synthetic portfolio: summarize events and bookings separately to avoid join multiplication.
-- MySQL 8: correlated subqueries avoid multiplying records from independent activity tables.
SELECT
    c.customer_id,
    CONCAT(c.given_name, ' ', c.family_name) AS customer_name,
    (SELECT COUNT(*)
       FROM reservations AS r
       JOIN pets AS p ON p.pet_id = r.pet_id
      WHERE p.customer_id = c.customer_id) AS total_reservations,
    (SELECT COUNT(*)
       FROM event_participation AS ep
       JOIN pets AS p ON p.pet_id = ep.pet_id
      WHERE p.customer_id = c.customer_id) AS total_event_attendances
FROM customers AS c
ORDER BY total_reservations DESC, c.customer_id;
