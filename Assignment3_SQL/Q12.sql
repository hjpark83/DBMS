SELECT DISTINCT c.c_name
FROM customer c
JOIN watch w ON c.c_id = w.c_id
JOIN classify cl ON w.m_id = cl.m_id
JOIN genre g ON cl.gr_id = g.gr_id
WHERE g.gr_name IN ('Drama', 'Mystery', 'Crime')
GROUP BY c.c_id, c.c_name
HAVING COUNT(DISTINCT g.gr_name) = 3;