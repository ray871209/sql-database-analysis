-- Compare event popularity across dates and locations.
SELECT e.event_name, COUNT(ep.pet_id) AS attendance_count
FROM community_events AS e
LEFT JOIN event_participation AS ep ON ep.event_id = e.event_id
GROUP BY e.event_name
ORDER BY attendance_count DESC, e.event_name;
