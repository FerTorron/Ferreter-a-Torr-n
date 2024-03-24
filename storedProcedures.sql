-- Procedimiento Almacenado para Ordenar Tabla
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

-- Procedimiento Almacenado para Inserción en la Tabla Producto
DELIMITER $$
CREATE PROCEDURE sp_InsertarProducto(
    IN p_nombre VARCHAR(255),
    IN p_precio DECIMAL(10, 2),
    IN p_stock INT
)
BEGIN
    INSERT INTO Producto (Nombre, Precio, Stock)
    VALUES (p_nombre, p_precio, p_stock);
END $$
DELIMITER ;sp_InsertarProductosp_OrdenarTabla