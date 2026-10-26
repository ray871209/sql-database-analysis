-- Unify reservation and event attendance activity; preserve separate records with UNION ALL.
SELECT c.customer_id, r.session_date AS activity_date, 'Training session' AS activity_type
FROM customers AS c
JOIN pets AS pt ON pt.customer_id = c.customer_id
JOIN reservations AS r ON r.pet_id = pt.pet_id
UNION ALL
SELECT c.customer_id, e.event_date AS activity_date, 'Community event' AS activity_type
FROM customers AS c
JOIN pets AS pt ON pt.customer_id = c.customer_id
JOIN event_participation AS ep ON ep.pet_id = pt.pet_id
JOIN community_events AS e ON e.event_id = ep.event_id
ORDER BY 1, 2;
