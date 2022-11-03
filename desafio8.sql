SELECT art.artista_nome AS artista, alb.album_nome AS album
FROM artistas AS art
INNER JOIN albums AS alb ON alb.artista_id = art.artista_id
WHERE art.artista_nome = 'Walter Phoenix'
ORDER BY alb.album_nome;