USE ferreteria;

-- Función para obtener el nombre del cliente de una compra:
DELIMITER $$
CREATE FUNCTION obtenerNombreClienteCompra(Parametro INT) RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  DECLARE nombreCliente VARCHAR(255);
  SET nombreCliente = (SELECT Nombre FROM Cliente WHERE IDCliente = Parametro);
  RETURN nombreCliente;
END $$
DELIMITER ;
SELECT obtenerNombreClienteCompra(1);

-- Función para calcular el total de una compra (sumando el precio total de todos los productos en esa compra)
DELIMITER $$
CREATE FUNCTION calcularTotalCompra(Parametro INT) RETURNS DECIMAL(10, 2) READS SQL DATA
BEGIN
  DECLARE total DECIMAL(10, 2);
  SET total = (SELECT SUM(Cantidad * PrecioUnitario) FROM Detalle_Compra WHERE IDCompra = Parametro);
  RETURN total;
END $$
DELIMITER ;
SELECT calcularTotalCompra(2);

-- Función para obtener el nombre del proveedor de una compra:
DELIMITER $$
CREATE FUNCTION obtenerNombreProveedorCompra(Parametro INT) RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
  DECLARE nombreProveedor VARCHAR(100);
  SET nombreProveedor = (SELECT Nombre FROM Proveedor WHERE IDProveedor = Parametro);
  RETURN nombreProveedor;
END $$
DELIMITER ;
SELECT obtenerNombreProveedorCompra(1);