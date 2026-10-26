-- Create a reusable breed-level booking view and report the highest count.
CREATE VIEW breed_obedience_bookings AS
SELECT pt.breed, COUNT(*) AS booking_count
FROM reservations AS r
JOIN pets AS pt ON pt.pet_id = r.pet_id
JOIN programs AS p ON p.program_id = r.program_id
WHERE p.program_name = 'Advanced Obedience'
GROUP BY pt.breed;

SELECT breed, booking_count
FROM breed_obedience_bookings
WHERE booking_count = (SELECT MAX(booking_count) FROM breed_obedience_bookings)
ORDER BY breed;
