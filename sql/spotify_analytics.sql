USE spotify;
-- Hypothesis 1: The most popular songs belong to the Pop genre
-- 1) Examine the average popularity score by genre_group
-- Analyze whether Pop-related genres (e.g., Pop, Dance Pop) have the highest average popularity.
SELECT 
    s.genre_group,
    COUNT(*) AS n_songs,
    AVG(p.popularity_score) AS avg_popularity
FROM Songs AS s
JOIN Popularity AS p
    USING (song_id)
GROUP BY s.genre_group
ORDER BY avg_popularity DESC;

SELECT 
    s.genre_group,
    COUNT(*) AS n_songs_in_top20
FROM Songs AS s
JOIN Popularity AS p
    USING (song_id)
WHERE p.chart_rank <= 20
GROUP BY s.genre_group
ORDER BY n_songs_in_top10 DESC;

-- H2

SELECT 
    CASE
        WHEN s.danceability < 40 THEN 'Low'
        WHEN s.danceability BETWEEN 40 AND 70 THEN 'Medium'
        ELSE 'High'
    END AS danceability_level,
    COUNT(*) AS n_songs,
    AVG(p.popularity_score) AS avg_popularity
FROM Songs AS s
JOIN Popularity AS p
    USING (song_id)
GROUP BY danceability_level
ORDER BY avg_popularity DESC;

SELECT 
    s.track_name,
    s.danceability,
    p.popularity_score,
    s.genre_group
FROM Songs AS s
JOIN Popularity AS p
    USING (song_id)
ORDER BY s.danceability DESC
LIMIT 10;

