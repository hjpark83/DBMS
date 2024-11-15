SELECT m.m_name, COUNT(DISTINCT c.gr_id) AS genre_count
FROM movie m
LEFT JOIN classify c ON m.m_id = c.m_id
GROUP BY m.m_id, m.m_name
ORDER BY m.m_name;