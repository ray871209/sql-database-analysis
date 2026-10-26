-- Count reservations by instructor, including those with zero bookings.
SELECT i.instructor_id, CONCAT(i.given_name, ' ', i.family_name) AS instructor_name,
       l.suburb, COUNT(r.reservation_id) AS session_count
FROM instructors AS i
JOIN locations AS l ON l.location_id = i.location_id
LEFT JOIN reservations AS r ON r.instructor_id = i.instructor_id
GROUP BY i.instructor_id, i.given_name, i.family_name, l.suburb
ORDER BY session_count DESC, instructor_name;
