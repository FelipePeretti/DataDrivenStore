SELECT
    countDistinctIf(id_usuario, tipo_evento = 'Visualização')            AS num_visualizaram,
    countDistinctIf(id_usuario, tipo_evento = 'AdicionouAoCarrinho')     AS num_adicionaram,
    countDistinctIf(id_usuario, tipo_evento = 'Compra')                  AS num_compraram,
    round(
      100.0 * num_adicionaram / nullIf(num_visualizaram, 0),
      2
    )                                                                   AS pct_add_to_cart,
    round(
      100.0 * num_compraram / nullIf(num_adicionaram, 0),
      2
    )                                                                   AS pct_purchase
FROM Logs_evento
WHERE data_evento
    BETWEEN toDateTime('2025-07-01 00:00:00') AND toDateTime('2025-07-04 23:59:59');


Como funciona
- countDistinctIf(…) conta usuários distintos só quando a condição bate.
- As últimas duas colunas calculam a taxa de conversão entre etapas.
- Ajuste o BETWEEN … AND … para o intervalo que quiser.