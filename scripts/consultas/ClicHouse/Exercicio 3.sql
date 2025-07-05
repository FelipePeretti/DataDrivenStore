SELECT
    replaceOne(descricao_evento, 'Pesquisa sobre ', '') AS termo,
    count(*)                                          AS ocorrencias
FROM Logs_evento
WHERE tipo_evento = 'Pesquisa'
GROUP BY termo
ORDER BY ocorrencias DESC
LIMIT 10;
