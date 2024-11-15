SELECT DISTINCT m.m_name
FROM movie m
JOIN classify c ON m.m_id = c.m_id
JOIN genre g ON c.gr_id = g.gr_id
WHERE g.gr_name = 'Drama'