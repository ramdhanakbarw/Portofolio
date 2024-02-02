--- show all data from songs, albums, and artist
SELECT * FROM songs;
SELECT * FROM albums;
SELECT * FROM artist;

--create a view Popular_Song, Where popularity >= 80 very popular, 75-80=popular, <75= average
CREATE VIEW Popular_Song AS
SELECT id, title, genre, popularity,
CASE 
    WHEN popularity >= 85 THEN 'very popular'
    WHEN popularity BETWEEN 81 AND 84 THEN 'popular'
    ELSE 'average'
END as popularity_rate
FROM songs
ORDER BY popularity DESC;

---show the popular songs from 2010 - 2019
---order by their poplarity
SELECT * FROM Popular_Song
WHERE NOT popularity_rate = 'average' AND release_year BETWEEN 2010 AND 2019
ORDER BY popularity_rate DESC ;

---create a view tempo_category
CREATE VIEW tempo_category AS
SELECT id, title, genre, tempo_bpm,
CASE 
    	WHEN tempo_bpm BETWEEN 20 AND 40 THEN 'Grave'
	WHEN tempo_bpm BETWEEN 41 AND 65 THEN 'Lento'
	WHEN tempo_bpm BETWEEN 66 AND 76 THEN 'Adagio'
	WHEN tempo_bpm BETWEEN 77 AND 108 THEN 'Andante'
	WHEN tempo_bpm BETWEEN 109 AND 120 THEN 'Moderato'
	WHEN tempo_bpm BETWEEN 121 AND 168 THEN 'Allegro'
	WHEN tempo_bpm BETWEEN 169 AND 200 THEN 'Presto'
	ELSE 'Prestissimo'
END as tempo_name
FROM songs;

---to show how many song in each tempo name
SELECT tempo_name, count(tempo_name) FROM tempo_category
GROUP BY tempo_name ORDER BY count(tempo_name) DESC ;

--top 10 most sold copies album and the song title
SELECT albums.name, songs.title, sold_copies FROM albums
JOIN songs ON songs.album_id = albums.id
ORDER BY sold_copies DESC LIMIT 10;

--who's the artist who has 120000000 sold copies on the album
SELECT name FROM artists
WHERE id = (
	SELECT artist_id FROM songs
	WHERE album_id = (
		SELECT id FROM albums
		WHERE sold_copies = 120000000
        )
);

-- top 5 the longest song duration and their genre--
SELECT title, duration_s, genre
FROM songs
ORDER BY duration_s DESC, genre LIMIT 5;

--average albums sold
SELECT round(avg(sold_copies)), release_year FROM albums
JOIN songs ON songs.album_id = albums.id
GROUP BY release_year
ORDER BY release_year DESC ;

--count total artist based on their country
SELECT country, count(country) FROM artists
GROUP BY country
ORDER BY count(country) DESC;

--show artist with pop genre who has sold their albums more than 2 million copies
SELECT name, genre, sold_copies FROM artist
JOIN albums ON albums.id = artist.id
WHERE sold_copies > 2000000 AND genre LIKE '%pop%' ;

--show the average of songs tempo from 2000-2019
SELECT release_year, average(tempo_bpm) FROM songs
GROUP BY release_year;

--artist who has the most genre(string)
SELECT name, length(genre) FROM artists
ORDER BY length(genre) DESC LIMIT 1;
