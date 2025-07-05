SELECT
    toDate(data_evento)          AS dia,
    count(*)                     AS total_visualizacoes
FROM Logs_evento
WHERE
    tipo_evento = 'Visualização'
    AND data_evento >= now() - INTERVAL 7 DAY
GROUP BY dia
ORDER BY dia;

nalisar cada parte:

toDate(data_evento) AS dia:
A função toDate converte o valor de data_evento para apenas a parte da data (ignorando a hora) e a atribui ao alias dia. Isso permite que a consulta agrupe os dados por dia, sem considerar o horário exato.

count(*) AS total_visualizacoes:
A função count(*) conta o número total de registros (ou visualizações) para cada dia, onde o tipo de evento é 'Visualização'. O resultado é atribuído ao alias total_visualizacoes, que representa o número de visualizações ocorridas em cada dia.

WHERE tipo_evento = 'Visualização':
Este filtro seleciona apenas os registros onde o tipo de evento é 'Visualização'. Ou seja, a consulta considera apenas os eventos de visualização e ignora outros tipos de eventos que possam existir.

AND data_evento >= now() - INTERVAL 7 DAY:
Esse filtro restringe os resultados para os eventos cujo data_evento ocorreu nos últimos 7 dias. now() retorna a data e hora atual, e INTERVAL 7 DAY subtrai 7 dias dessa data e hora, filtrando os registros a partir dessa data limite.

GROUP BY dia:
A cláusula GROUP BY agrupa os resultados pela coluna dia, ou seja, as visualizações serão agrupadas por data.

ORDER BY dia:
Ordena os resultados pelo campo dia de forma crescente (do mais antigo para o mais recente), ou seja, os dias serão apresentados em ordem cronológica.