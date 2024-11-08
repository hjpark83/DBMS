SELECT DISTINCT p.p_name
FROM participant p
WHERE p.p_id NOT IN (
    SELECT DISTINCT pa.p_id
    FROM participate pa
    WHERE pa.casting IS NOT NULL
);