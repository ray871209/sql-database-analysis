-- List events with their venue and date, sorted by suburb and date.
SELECT l.suburb, l.location_name, e.event_name, e.event_date
FROM community_events AS e
JOIN locations AS l ON l.location_id = e.location_id
ORDER BY l.suburb, e.event_date;
