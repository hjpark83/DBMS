SELECT COUNT(DISTINCT c_id) AS user_count
FROM (
    SELECT c_id
    FROM comment_to
    GROUP BY c_id
    HAVING MAX(write_date)-MIN(write_date) >= INTERVAL '3 days'
) AS calculate_gap;