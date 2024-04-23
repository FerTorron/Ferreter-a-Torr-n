-- Consulta inicial sobre la tabla a trabajar
SELECT * FROM Producto;

-- Consulta del estado de autocommit
SELECT @@autocommit;

-- Desactivar el modo de autocommit para poder trabajar con transacciones
SET autocommit = 0;

-- Inicio de la transacción
START TRANSACTION;

-- Punto de guardado 1
SAVEPOINT inicio_transaccion;


-- 2. Agregar un nuevo producto
INSERT INTO Producto (Nombre, Descripcion, Precio, Stock, IDCategoria)
VALUES ('Nuevo Producto', 'Descripción del Nuevo Producto', 10.99, 50, 1);

-- Punto de guardado 3
SAVEPOINT insercion_nuevo_producto;

-- Confirmar las transacciones
COMMIT;

-- Consulta de los resultados después de las transacciones
SELECT * FROM Producto;

-- En caso de error, se pueden revertir partes de la transacción utilizando los siguientes comandos
-- ROLLBACK TO inicio_transaccion; 
-- ROLLBACK TO modificacion_stock;      
-- ROLLBACK TO insercion_nuevo_producto; 
