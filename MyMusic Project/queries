--- show all data from songs, albums, and artist
SELECT * FROM project.songs;
SELECT * FROM project.albums;
SELECT * FROM project.artist;

--show the popular song from 2010 - 2019
--order by their popularity number
-->= 80 very popular, 75-80=popular, <75= average
SELECT id, title, genre, popularity,
CASE 
    WHEN popularity >= 85 THEN 'very popular'
    WHEN popularity BETWEEN 81 AND 84 THEN 'popular'
    ELSE 'average'
END as popularity_rate
FROM project.songs
WHERE release_year BETWEEN 2010 AND 2019
ORDER BY popularity_rate DESC;

--top 10 most sold copies album and the song title
SELECT 'project.albums'.name, 'project.songs'.title, sold_copies FROM project.albums
JOIN 'project.songs' ON 'project.songs'.'album_id' = 'project.albums'.'id'
ORDER BY sold_copies DESC LIMIT 10;

--who's the artist who has 120000000 sold copies on the album
SELECT name FROM artists
WHERE id = (
	SELECT artist_id FROM project.songs
	WHERE album_id = (
		SELECT id FROM project.albums
		WHERE sold_copies = 120000000
        )
);


-- top 5 the longest song duration and their genre--
SELECT title, duration_s, genre
FROM project.songs
ORDER BY duration_s DESC, genre LIMIT 5;


--average albums sold
SELECT round(avg(sold_copies)), release_year FROM albums
JOIN songs ON songs.album_id = albums.id
GROUP BY release_year
ORDER BY release_year DESC ;


--count total artist based on their country
SELECT country, count(country) FROM project.artists
GROUP BY country
ORDER BY count(country) DESC;

--show artist with pop genre who has sold their albums more than 2 million copies
SELECT name, genre, sold_copies FROM project.artist
JOIN 'project.albums' ON 'project.albums'.'id' = 'project.artist'.'id'
WHERE sold_copies > 2000000 AND genre LIKE '%pop%' ;

--show the average of songs tempo from 2000-2019
SELECT release_year, average(tempo_bpm) FROM project.songs
GROUP BY release_year;

--artist who has the most genre(string)
SELECT name, length(genre) FROM project.artists
ORDER BY length(genre) DESC LIMIT 1;
