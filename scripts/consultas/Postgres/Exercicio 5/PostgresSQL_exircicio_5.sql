SELECT 
    p.id_pedido, 
    p.data_pedido, 
    p.status_pedido, 
    SUM(ip.quantidade * ip.preco_unitario) AS valor_total
FROM 
    Pedidos p
JOIN 
    Itens_de_Pedido ip ON p.id_pedido = ip.id_pedido
JOIN 
    Produtos pr ON ip.id_produto = pr.id_produto
WHERE 
    p.id_cliente = 1
GROUP BY 
    p.id_pedido, p.data_pedido, p.status_pedido
ORDER BY 
    p.data_pedido DESC;
