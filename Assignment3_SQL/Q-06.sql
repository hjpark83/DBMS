SELECT DISTINCT m.m_id, m.m_name
FROM movie m
JOIN classify c1 ON m.m_id = c1.m_id
JOIN genre g1 ON c1.gr_id = g1.gr_id
JOIN classify c2 ON m.m_id = c2.m_id
JOIN genre g2 ON c2.gr_id = g2.gr_id
WHERE g1.gr_name = 'Comedy'
  AND g2.gr_name = 'Action';