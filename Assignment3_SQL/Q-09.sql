SELECT DISTINCT c.c_name
FROM customer c
WHERE c.c_id NOT IN (
    SELECT p.c_id
    FROM prefer p
    JOIN genre g ON p.gr_id = g.gr_id
    WHERE g.gr_name = 'Drama'
);