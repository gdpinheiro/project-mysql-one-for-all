SELECT usr.usuario_nome AS usuario,
  IF(
    MAX(hist.data_reproducao)
    LIKE '2021%',
    'Usuário ativo',
    'Usuário inativo'
  ) AS condicao_usuario

FROM
  usuarios AS usr
  INNER JOIN historico_de_reproducoes AS hist ON usr.usuario_id = hist.usuario_id

GROUP BY usr.usuario_id

ORDER BY usr.usuario_nome;
