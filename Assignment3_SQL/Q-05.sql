SELECT w.m_id, w.c_id, w.watch_date, w.pause_time
FROM watch w
JOIN (
    SELECT c_id
    FROM watch
    GROUP BY c_id
    HAVING COUNT(DISTINCT m_id) >= 2
) AS multiple_watchers ON w.c_id = multiple_watchers.c_id
ORDER BY w.c_id, w.watch_date;