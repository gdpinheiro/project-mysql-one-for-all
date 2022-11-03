SELECT art.artista_nome AS artista, 
  alb.album_nome AS album, 
  COUNT(seg.usuario_id) AS seguidores
FROM 
  artistas AS art
INNER JOIN 
  albums AS alb ON alb.artista_id = art.artista_id
INNER JOIN
  artistas_seguidos AS seg ON seg.artista_id = art.artista_id
GROUP BY 
  alb.album_nome, art.artista_nome
ORDER BY 
  COUNT(seg.usuario_id) DESC, art.artista_nome, alb.album_nome;