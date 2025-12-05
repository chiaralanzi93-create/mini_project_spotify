-- Hypothesis 1: The most popular songs belong to Pop-related genres.
-- Compute average popularity by genre_group
-- Examine genre representation within the Top 20 songs


-- Top 20 songs' genres 
select a.artist_name, s.song_id, s.track_name, s.genre_group, avg(p.popularity_score) as avg_popularity
from spotify_schema.artists as a
join spotify_schema.songs as s
on a.artist_id = s.artist_id -- first join 
join spotify_schema.popularity as p
on s.song_id = p.song_id
group by a.artist_name, s.song_id, s.track_name, s.genre_group
order by avg_popularity desc
limit 20;

-- Distribution of Genres
SELECT s.genre_group, COUNT(*) AS song_count
FROM  spotify_schema.songs as s
GROUP BY s.genre_group
ORDER BY song_count DESC;






