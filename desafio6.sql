SELECT MIN(pln.valor_plano) AS faturamento_minimo, MAX(pln.valor_plano) AS faturamento_maximo, ROUND(AVG(pln.valor_plano), 2) AS faturamento_medio, ROUND(SUM(pln.valor_plano),2) AS faturamento_total
FROM planos AS pln
  INNER JOIN usuarios AS usr ON pln.plano_id = usr.plano_id;
