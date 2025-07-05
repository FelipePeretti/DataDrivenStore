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


 consulta:

1. countDistinctIf(id_usuario, tipo_evento = 'Visualização') AS num_visualizaram:
countDistinctIf(id_usuario, tipo_evento = 'Visualização'): Conta o número distinto de usuários (id_usuario) que realizaram o evento do tipo 'Visualização'. O countDistinctIf é usado para contar os usuários distintos que atenderam à condição tipo_evento = 'Visualização'. O resultado é dado como num_visualizaram, ou seja, o número de usuários que visualizaram os produtos ou páginas.

2. countDistinctIf(id_usuario, tipo_evento = 'AdicionouAoCarrinho') AS num_adicionaram:
countDistinctIf(id_usuario, tipo_evento = 'AdicionouAoCarrinho'): Conta o número distinto de usuários que realizaram o evento de adicionar um item ao carrinho (tipo_evento = 'AdicionouAoCarrinho'). O resultado é atribuído ao alias num_adicionaram, representando o número de usuários que adicionaram produtos ao carrinho.

3. countDistinctIf(id_usuario, tipo_evento = 'Compra') AS num_compraram:
countDistinctIf(id_usuario, tipo_evento = 'Compra'): Conta o número distinto de usuários que realizaram o evento de compra (tipo_evento = 'Compra'). O resultado é atribuído ao alias num_compraram, representando o número de usuários que efetivamente compraram produtos.

4. round(100.0 * num_adicionaram / nullIf(num_visualizaram, 0), 2) AS pct_add_to_cart:
100.0 * num_adicionaram / nullIf(num_visualizaram, 0): Calcula a taxa de conversão de visualização para adicionar ao carrinho (Add to Cart). A fórmula é a razão entre o número de usuários que adicionaram produtos ao carrinho (num_adicionaram) e o número de usuários que visualizaram os produtos (num_visualizaram), multiplicada por 100 para obter a porcentagem.

nullIf(num_visualizaram, 0): O nullIf é usado para evitar a divisão por zero. Se o número de usuários que visualizaram for zero, o valor será tratado como NULL e a divisão não ocorrerá.

round(..., 2): Arredonda o resultado para duas casas decimais. O alias pct_add_to_cart representa a taxa de conversão de visualizações para adições ao carrinho em porcentagem.

5. round(100.0 * num_compraram / nullIf(num_adicionaram, 0), 2) AS pct_purchase:
100.0 * num_compraram / nullIf(num_adicionaram, 0): Calcula a taxa de conversão de adição ao carrinho para compra. A fórmula é a razão entre o número de usuários que realizaram uma compra (num_compraram) e o número de usuários que adicionaram itens ao carrinho (num_adicionaram), multiplicada por 100 para obter a porcentagem.

nullIf(num_adicionaram, 0): Evita a divisão por zero, tratando como NULL se o número de usuários que adicionaram ao carrinho for zero.

round(..., 2): Arredonda o resultado para duas casas decimais. O alias pct_purchase representa a taxa de conversão de adições ao carrinho para compras em porcentagem.

6. WHERE data_evento BETWEEN toDateTime('2025-07-01 00:00:00') AND toDateTime('2025-07-04 23:59:59'):
O filtro restringe os dados ao intervalo de 1º de julho de 2025 a 4 de julho de 2025. A função toDateTime converte as strings de data/hora em formatos compatíveis com o tipo DateTime do ClickHouse. O filtro garante que a análise ocorra dentro desse período específico.

Resumo do que a consulta faz:
A consulta retorna os seguintes dados para o período entre 1º de julho e 4 de julho de 2025:

num_visualizaram: Número de usuários distintos que visualizaram produtos.

num_adicionaram: Número de usuários distintos que adicionaram itens ao carrinho.

num_compraram: Número de usuários distintos que realizaram uma compra.

pct_add_to_cart: Taxa de conversão de visualizações para adições ao carrinho.

pct_purchase: Taxa de conversão de adições ao carrinho para compras.