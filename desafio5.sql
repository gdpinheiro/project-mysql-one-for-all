SELECT can.cancao_nome AS cancao,
  COUNT(hist.cancao_id) AS reproducoes
FROM cancoes AS can
  INNER JOIN historico_de_reproducoes AS hist ON can.cancao_id = hist.cancao_id
GROUP BY cancao_nome
ORDER BY reproducoes DESC, cancao_nome ASC
LIMIT 2;
