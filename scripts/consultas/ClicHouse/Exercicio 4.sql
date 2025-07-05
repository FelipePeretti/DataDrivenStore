SELECT
    sumIf(1, tipo_evento = 'Clique' AND utm_campaign = 'campanha_X')      AS total_cliques,
    sumIf(1, tipo_evento = 'Impressão' AND utm_campaign = 'campanha_X')  AS total_impressoes,
    round(
      100.0 * total_cliques / nullIf(total_impressoes, 0),
      2
    )                                                                      AS ctr_percentual
FROM Logs_evento;


sumIf(1, tipo_evento = 'Clique' AND utm_campaign = 'campanha_X'):
A função sumIf soma o valor 1 para cada linha onde a condição especificada for verdadeira. No caso, a condição é que o evento seja do tipo "Clique" e a campanha seja "campanha_X". Então, isso calcula o total de cliques para a campanha "campanha_X".

sumIf(1, tipo_evento = 'Impressão' AND utm_campaign = 'campanha_X'):
Similar à expressão anterior, mas aqui a condição é que o evento seja do tipo "Impressão" e a campanha seja "campanha_X". Isso calcula o total de impressões para a campanha "campanha_X".

round(100.0 * total_cliques / nullIf(total_impressoes, 0), 2):
Este cálculo calcula a taxa de cliques (CTR) da campanha, que é dada pela razão entre o total de cliques e o total de impressões. Para evitar a divisão por zero, o nullIf(total_impressoes, 0) garante que, se o total de impressões for zero, o valor será tratado como NULL, evitando um erro de divisão. O resultado é multiplicado por 100 para obter a porcentagem, e o round(..., 2) arredonda o valor para duas casas decimais.