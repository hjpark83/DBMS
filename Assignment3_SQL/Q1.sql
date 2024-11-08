SELECT c_name
FROM customer
WHERE c_id IN (
    SELECT c_id
    FROM watch
    WHERE m_id = (
        SELECT m_id
        FROM movie
        WHERE m_name = 'Gukyeongi'
    )
);