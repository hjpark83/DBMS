SELECT m.m_name,
       ROUND(
           (m.m_rating * COALESCE(m.votes, 1) + COALESCE(SUM(ct.rating), 0)) / 
           (COALESCE(m.votes, 1) + COALESCE(COUNT(ct.rating), 0)),
           16
       ) AS recalculated_avg_rating
FROM movie m
LEFT JOIN comment_to ct ON m.m_id = ct.m_id
GROUP BY m.m_id, m.m_name, m.m_rating, m.votes
ORDER BY recalculated_avg_rating DESC;