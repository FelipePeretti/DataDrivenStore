BEGIN;

-- 1. Criar o Pedido e obter o id_pedido gerado
WITH ins_pedido AS (
    INSERT INTO Pedidos (id_cliente, data_pedido, status_pedido)
    VALUES (1, NOW(), 'Pendente')
    RETURNING id_pedido
)

-- 2. Inserir Itens de Pedido usando o id_pedido retornado
INSERT INTO Itens_do_Pedido (id_pedido, id_produto, quantidade, preco_unitario)
SELECT id_pedido, 101, 2, 150.00 FROM ins_pedido
UNION ALL
SELECT id_pedido, 102, 1, 200.00 FROM ins_pedido;




COMMIT;