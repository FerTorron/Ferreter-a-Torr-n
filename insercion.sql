-- Insertar datos en la tabla Producto
INSERT INTO Producto (Nombre, Precio, Stock) VALUES 
('Martillo', 15.99, 20),
('Destornillador Phillips', 5.49, 30),
('Sierra de mano', 22.79, 15),
('Clavos (paquete de 100)', 2.99, 50),
('Tornillos (paquete de 50)', 3.49, 40),
('Cinta métrica', 9.99, 25),
('Pintura blanca (1 galón)', 25.99, 10),
('Brocha de pintura', 6.79, 35);

-- Insertar datos en la tabla Cliente
INSERT INTO Cliente (Nombre, Email) VALUES 
('Juan Pérez', 'juan.perez@example.com'),
('María López', 'maria.lopez@example.com'),
('Carlos Rodríguez', 'carlos.rodriguez@example.com'),
('Ana Martínez', 'ana.martinez@example.com');

-- Insertar datos en la tabla Pedido
INSERT INTO Pedido (IDCliente, Fecha) VALUES 
(1, '2024-03-20'),
(2, '2024-03-19'),
(3, '2024-03-18'),
(4, '2024-03-17');

-- Insertar datos en la tabla Detalle_Pedido
INSERT INTO Detalle_Pedido (IDPedido, IDProducto, Cantidad, PrecioUnitario) VALUES 
(1, 1, 2, 15.99),
(1, 3, 1, 22.79),
(2, 2, 3, 5.49),
(3, 5, 2, 3.49),
(4, 7, 1, 25.99),
(4, 8, 1, 6.79);
