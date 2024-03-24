USE ferreteria;

CREATE TABLE IF NOT EXISTS Registro_Productos (
    IDRegistro INT AUTO_INCREMENT PRIMARY KEY,
    IDProducto INT,
    FechaHoraInsercion DATETIME,
    FOREIGN KEY (IDProducto) REFERENCES Producto(IDProducto)
);

DELIMITER $$
CREATE TRIGGER trg_AgregarRegistroProducto
AFTER INSERT ON Producto
FOR EACH ROW
BEGIN
    INSERT INTO Registro_Productos (IDProducto, FechaHoraInsercion)
    VALUES (NEW.IDProducto, NOW());
END $$
DELIMITER ;
