SELECT COUNT(DISTINCT cancao_id) AS cancoes, COUNT(DISTINCT art.artista_id) AS artistas, COUNT(DISTINCT album_id) AS albuns
FROM cancoes
INNER JOIN artistas as art;