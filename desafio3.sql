SELECT usr.usuario_nome AS usuario, 
COUNT(hist.usuario_id) AS qtde_musicas_ouvidas, 
ROUND(SUM(can.duracao_segundos) / 60, 2) AS total_minutos
FROM usuarios AS usr
INNER JOIN historico_de_reproducoes AS hist ON hist.usuario_id = usr.usuario_id
INNER JOIN cancoes AS can ON can.cancao_id = hist.cancao_id
GROUP BY usuario_nome
ORDER BY usuario_nome;
