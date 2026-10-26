-- Synthetic portfolio: monthly booking counts and listed-price estimates.
-- The estimate is NOT actual collected revenue.
SELECT
    YEAR(r.session_date) AS session_year,
    MONTH(r.session_date) AS session_month,
    p.program_name,
    COUNT(*) AS booking_count,
    SUM(p.group_price) AS estimated_list_value
FROM reservations AS r
JOIN programs AS p ON p.program_id = r.program_id
GROUP BY YEAR(r.session_date), MONTH(r.session_date), p.program_id, p.program_name
ORDER BY session_year, session_month, p.program_name;
