DELIMITER $$

CREATE PROCEDURE sp_ventas_por_rango(
    IN fecha_inicio DATE,
    IN fecha_fin DATE
)
BEGIN
    SELECT *
    FROM ventas
    WHERE fecha BETWEEN fecha_inicio AND fecha_fin;
END $$

DELIMITER ;