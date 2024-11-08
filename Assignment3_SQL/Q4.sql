SELECT DISTINCT c.c_name
FROM customer c
JOIN watch w ON c.c_id = w.c_id
GROUP BY c.c_id, c.c_name
HAVING COUNT(DISTINCT w.m_id) >= 2;