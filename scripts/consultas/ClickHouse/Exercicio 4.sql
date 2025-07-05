SELECT
    sumIf(1, tipo_evento = 'Clique' AND utm_campaign = 'campanha_X')      AS total_cliques,
    sumIf(1, tipo_evento = 'Impressão' AND utm_campaign = 'campanha_X')  AS total_impressoes,
    round(
      100.0 * total_cliques / nullIf(total_impressoes, 0),
      2
    )                                                                      AS ctr_percentual
FROM Logs_evento;
