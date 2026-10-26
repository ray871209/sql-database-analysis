-- Original portfolio examples: diagnostic queries for the synthetic database.
-- For MySQL 8, after loading schema/schema.sql and data/sample_data.sql.

-- 1. Identify instructors who have no reservations.
SELECT i.instructor_id, i.given_name, i.family_name, l.suburb
FROM instructors AS i
JOIN locations AS l ON l.location_id = i.location_id
LEFT JOIN reservations AS r ON r.instructor_id = i.instructor_id
WHERE r.reservation_id IS NULL
ORDER BY i.instructor_id;

-- 2. Find duplicated customer/pet names for manual review.
-- Names are not unique identifiers; this is a screening query, not a deduplication action.
SELECT c.given_name, c.family_name, p.pet_name, COUNT(*) AS name_occurrences
FROM customers AS c
JOIN pets AS p ON p.customer_id = c.customer_id
GROUP BY c.given_name, c.family_name, p.pet_name
HAVING COUNT(*) > 1;

-- 3. Count appointments by program including zero-reservation programs.
SELECT p.program_id, p.program_name, COUNT(r.reservation_id) AS booking_count
FROM programs AS p
LEFT JOIN reservations AS r ON r.program_id = p.program_id
GROUP BY p.program_id, p.program_name
ORDER BY booking_count DESC, p.program_name;
