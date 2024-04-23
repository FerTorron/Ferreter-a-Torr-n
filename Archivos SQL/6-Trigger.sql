USE ferreteria;

-- Creación de la tabla de auditoría
CREATE TABLE IF NOT EXISTS log_auditoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    table_name VARCHAR(255) NOT NULL,
    modification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    action VARCHAR(255)
);

-- Trigger para auditar inserciones en la tabla Producto
DELIMITER //
CREATE TRIGGER trg_AuditarInsercionProducto
AFTER INSERT ON Producto
FOR EACH ROW
BEGIN
    INSERT INTO log_auditoria (user_name, table_name, modification_date, action)
    VALUES (CURRENT_USER(), 'Producto', NOW(), 'insert');
END //
DELIMITER ;

-- Trigger para auditar eliminaciones en la tabla Cliente
DELIMITER //
CREATE TRIGGER trg_AuditarEliminacionCliente
AFTER DELETE ON Cliente
FOR EACH ROW
BEGIN
    INSERT INTO log_auditoria (user_name, table_name, modification_date, action)
    VALUES (CURRENT_USER(), 'Cliente', NOW(), 'delete');
END //
DELIMITER ;

-- Trigger para actualizar el stock de productos después de una compra
DELIMITER //
CREATE TRIGGER trg_ActualizarStockDespuesCompra
AFTER INSERT ON Detalle_Compra
FOR EACH ROW
BEGIN
    UPDATE Producto
    SET Stock = Stock + NEW.Cantidad
    WHERE IDProducto = NEW.IDProducto;
END //
DELIMITER ;