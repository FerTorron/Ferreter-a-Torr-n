USE ferreteria;

-- VISTA DE PRODUCTOS AGOTADOS
CREATE OR REPLACE VIEW vista_productos_agotados AS
SELECT Nombre, Precio
FROM Producto
WHERE Stock = 0;

-- VISTA DE COMPRAS RECIENTES
CREATE OR REPLACE VIEW vista_compras_recientes AS
SELECT IDCompra, Fecha, Total
FROM Compra
WHERE Fecha >= CURDATE() - INTERVAL 30 DAY;

-- VISTA DE DETALLES DE COMPRAS POR PRODUCTO
CREATE OR REPLACE VIEW vista_detalles_compras_producto AS
SELECT dc.IDDetalleCompra, c.IDCompra, p.Nombre AS NombreProducto, dc.Cantidad, dc.PrecioUnitario
FROM Detalle_Compra dc
JOIN Producto p ON dc.IDProducto = p.IDProducto
JOIN Compra c ON dc.IDCompra = c.IDCompra;

-- VISTA DE VENTAS RECIENTES
CREATE OR REPLACE VIEW vista_ventas_recientes AS
SELECT IDVenta, Fecha, Total
FROM Venta
WHERE Fecha >= CURDATE() - INTERVAL 30 DAY;

-- VISTA DE DETALLES DE VENTAS POR PRODUCTO
CREATE OR REPLACE VIEW vista_detalles_ventas_producto AS
SELECT dv.IDDetalleVenta, v.IDVenta, p.Nombre AS NombreProducto, dv.Cantidad, dv.PrecioUnitario
FROM Detalle_Venta dv
JOIN Producto p ON dv.IDProducto = p.IDProducto
JOIN Venta v ON dv.IDVenta = v.IDVenta;
