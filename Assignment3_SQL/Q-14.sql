SELECT c_id, AVG(rating) AS average_rating
FROM comment_to
WHERE c_id IN (
    SELECT c_id
    FROM watch
    GROUP BY c_id
    HAVING COUNT(DISTINCT m_id) >= 2
)
GROUP BY c_id;