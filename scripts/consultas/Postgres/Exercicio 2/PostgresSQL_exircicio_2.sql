SELECT 
    c.id_cliente,
    c.nome,
    SUM(tf.valor) AS faturamento_total
FROM 
    Clientes c
JOIN 
    Pedidos p ON c.id_cliente = p.id_cliente
JOIN 
    Transacoes_Financeiras tf ON p.id_pedido = tf.id_pedido
WHERE 
    tf.data_transacao >= NOW() - INTERVAL '6 months'
GROUP BY 
    c.id_cliente, c.nome
ORDER BY 
    faturamento_total DESC
LIMIT 5;