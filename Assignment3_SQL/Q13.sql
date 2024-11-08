WITH max_commenter AS (
    SELECT c_id
    FROM comment_to
    GROUP BY c_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
SELECT c_id, m_id, rating, comment, write_date
FROM comment_to
WHERE c_id = (SELECT c_id FROM max_commenter)
ORDER BY write_date;