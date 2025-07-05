SELECT 
    TO_CHAR(tf.data_transacao, 'MM-YYYY') AS mes_ano,  -- Formata para mês e ano
    ip.categoria_produto,                               -- Categoria do Produto
    SUM(tf.valor) AS faturamento_total                  -- Soma do faturamento por categoria
FROM 
    Transacoes_Financeiras tf
JOIN 
    Pedidos p ON tf.id_pedido = p.id_pedido
JOIN 
    Itens_de_Pedido ip ON p.id_pedido = ip.id_pedido
GROUP BY 
    mes_ano, ip.categoria_produto
ORDER BY 
    mes_ano DESC, faturamento_total DESC;  -- Ordena por mês (do mais recente) e faturamento (do maior para o menor)