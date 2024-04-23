-- Procedimiento Almacenado para Ordenar una Tabla
DELIMITER $$
CREATE PROCEDURE sp_OrdenarTabla(
    IN nombreTabla VARCHAR(100),
    IN campoOrdenamiento VARCHAR(100),
    IN orden VARCHAR(10)
)
BEGIN
    SET @query = CONCAT('SELECT * FROM ', nombreTabla, ' ORDER BY ', campoOrdenamiento, ' ', orden);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END $$
DELIMITER ;

-- Procedimiento Almacenado para Manejar Estilos de Producto
DELIMITER $$
CREATE PROCEDURE sp_ManageStyle(
    IN action INT,
    IN style_id INT,
    IN style_name VARCHAR(25),
    IN style_description TEXT
)
BEGIN
    IF action = 1 THEN
        INSERT INTO `style` (`name`, `description`)
        VALUES (style_name, style_description);
    ELSEIF action = 2 THEN
        DELETE FROM `style`
        WHERE `id_style` = style_id;
    ELSE
        SELECT 'Selección no válida. Elija 1 para insertar o 2 para eliminar un registro.';
    END IF;
END $$
DELIMITER ;