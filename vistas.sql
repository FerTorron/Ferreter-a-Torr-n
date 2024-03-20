USE ferreteria;

-- VISTA DE PRODUCTOS AGOTADOS
CREATE OR REPLACE VIEW vista_productos_agotados AS
SELECT Nombre, Precio
FROM Producto
WHERE Stock = 0;

-- VISTA DE PEDIDOS RECIENTES
CREATE OR REPLACE VIEW vista_pedidos_recientes AS
SELECT IDPedido, IDCliente, Fecha
FROM Pedido
WHERE Fecha >= CURDATE() - INTERVAL 30 DAY;

-- VISTA DE DETALLES DE PEDIDOS AGRUPADOS POR CLIENTE
CREATE OR REPLACE VIEW vista_detalles_pedidos_cliente AS
SELECT p.IDPedido, c.Nombre AS NombreCliente, SUM(dp.Cantidad) AS TotalCantidad, SUM(dp.PrecioUnitario) AS TotalPrecio
FROM Pedido p
JOIN Cliente c ON p.IDCliente = c.IDCliente
JOIN Detalle_Pedido dp ON p.IDPedido = dp.IDPedido
GROUP BY p.IDPedido, c.Nombre;

-- VISTA DE PRODUCTOS AGRUPADOS POR PRECIO
CREATE OR REPLACE VIEW vista_productos_agrupados_precio AS
SELECT Nombre, Precio, Stock
FROM Producto
ORDER BY Precio DESC;

-- VISTA DE DETALLES DE PEDIDOS COMBINADA
CREATE OR REPLACE VIEW vista_detalles_pedidos_combinada AS
SELECT p.IDPedido, c.Nombre AS NombreCliente, pr.Nombre AS NombreProducto, dp.Cantidad, dp.PrecioUnitario
FROM Pedido p
JOIN Cliente c ON p.IDCliente = c.IDCliente
JOIN Detalle_Pedido dp ON p.IDPedido = dp.IDPedido
JOIN Producto pr ON dp.IDProducto = pr.IDProducto
ORDER BY p.IDPedido ASC, dp.Cantidad DESC
LIMIT 20;