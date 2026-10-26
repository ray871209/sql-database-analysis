-- Estimate booked group-session revenue by year; not actual collected revenue.
SELECT YEAR(r.session_date) AS calendar_year,
       p.program_name, COUNT(*) AS booking_count,
       SUM(p.group_price) AS estimated_revenue
FROM reservations AS r
JOIN programs AS p ON p.program_id = r.program_id
GROUP BY YEAR(r.session_date), p.program_name
ORDER BY calendar_year, estimated_revenue DESC;
