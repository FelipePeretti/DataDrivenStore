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
