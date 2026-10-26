-- Find programs never reserved using a null-safe anti-join.
SELECT p.program_name, p.group_price
FROM programs AS p
WHERE NOT EXISTS (
  SELECT 1 FROM reservations AS r WHERE r.program_id = p.program_id
)
ORDER BY p.program_name;
