SELECT
    toDate(data_evento)          AS dia,
    count(*)                     AS total_visualizacoes
FROM Logs_evento
WHERE
    tipo_evento = 'Visualização'
    AND data_evento >= now() - INTERVAL 7 DAY
GROUP BY dia
ORDER BY dia;
