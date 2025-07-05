BEGIN;

-- 1. Criar o Pedido e obter o id_pedido gerado
WITH ins_pedido AS (
    INSERT INTO Pedidos (id_cliente, data_pedido, status_pedido)
    VALUES (1, NOW(), 'Pendente')
    RETURNING id_pedido
)
-- 2. Inserir Itens de Pedido usando o id_pedido retornado
INSERT INTO Itens_de_Pedido (id_pedido, id_produto, quantidade, preco_unitario)
SELECT id_pedido, 'P123', 2, 150.00 FROM ins_pedido
UNION ALL
SELECT id_pedido, 'P124', 1, 200.00 FROM ins_pedido;

-- 3. Atualizar o Estoque dos Produtos no nosso caso e feito no banco mongodb


-- Se tudo ocorrer bem, faz o commit
COMMIT;