WITH movie_genre_count AS (
  SELECT m.m_name, COUNT(c.gr_id) AS genre_count
  FROM movie m
  JOIN classify c ON m.m_id = c.m_id
  GROUP BY m.m_id, m.m_name
)
SELECT m_name, genre_count
FROM movie_genre_count
WHERE genre_count = (SELECT MAX(genre_count) FROM movie_genre_count)
ORDER BY m_name;