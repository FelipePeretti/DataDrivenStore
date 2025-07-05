SELECT DISTINCT
    e.id_usuario
FROM Logs_evento AS e
WHERE
    e.utm_source = 'facebook'
    AND e.id_usuario IN (
        SELECT id_usuario
        FROM Logs_evento
        WHERE tipo_evento = 'Compra'
    );

Aqui está o que cada parte faz:

SELECT DISTINCT e.id_usuario:
A consulta retorna os identificadores únicos de usuários (id_usuario) que atendem aos critérios.

FROM Logs_evento AS e:
A tabela principal consultada é chamada Logs_evento, e o alias e é atribuído a ela.

WHERE e.utm_source = 'facebook':
A consulta filtra os registros para que apenas eventos com a fonte de tráfego "facebook" sejam considerados.

AND e.id_usuario IN (...):
Esse critério verifica se o id_usuario de cada evento da primeira parte está presente na lista de usuários que realizaram uma "Compra". Ou seja, os usuários com fonte "facebook" devem também estar na lista dos que realizaram uma compra.

Subconsulta:
Dentro do IN, há uma subconsulta que retorna os ids dos usuários que têm eventos do tipo "Compra" (tipo_evento = 'Compra').