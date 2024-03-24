USE ferreteria;

-- Función para obtener el nombre del cliente de un pedido:
DELIMITER $$
CREATE FUNCTION obtenerNombreClientePedido(Parametro INT) RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  DECLARE nombreCliente VARCHAR(255);
  SET nombreCliente = (SELECT Nombre FROM Cliente WHERE IDCliente = Parametro);
  RETURN nombreCliente;
END $$

DELIMITER ;
SELECT obtenerNombreClientePedido(1);

-- Función para calcular el total de un pedido (sumando el precio total de todos los productos en ese pedido)
DELIMITER $$
CREATE FUNCTION calcularTotalPedido(Parametro INT) RETURNS DECIMAL(10, 2) READS SQL DATA
BEGIN
  DECLARE total DECIMAL(10, 2);
  SET total = (SELECT SUM(Cantidad * PrecioUnitario) FROM Detalle_Pedido WHERE IDPedido = Parametro);
  RETURN total;
END $$

DELIMITER ;
SELECT calcularTotalPedido(2);