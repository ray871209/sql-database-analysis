-- Find pets participating in events in the current and prior two calendar years.
SELECT DISTINCT pt.pet_name, pt.breed
FROM pets AS pt
JOIN event_participation AS ep ON ep.pet_id = pt.pet_id
JOIN community_events AS e ON e.event_id = ep.event_id
WHERE YEAR(e.event_date) BETWEEN YEAR(CURDATE()) - 2 AND YEAR(CURDATE())
ORDER BY pt.breed, pt.pet_name;
