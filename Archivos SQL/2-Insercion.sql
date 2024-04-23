USE ferreteria;

-- Inserción de datos en la tabla Categoria
INSERT INTO Categoria (Nombre, Descripcion) VALUES
('Herramientas', 'Herramientas básicas para trabajos de construcción y reparación'),
('Electricidad', 'Productos eléctricos para proyectos y reparaciones'),
('Fontanería', 'Productos para sistemas de plomería y fontanería'),
('Pinturas', 'Variedad de pinturas para diferentes superficies y usos');

-- Inserción de datos en la tabla Producto
INSERT INTO Producto (Nombre, Descripcion, Precio, Stock, IDCategoria) VALUES 
('Martillo', 'Martillo de acero forjado con mango de madera', 15.99, 20, 1),
('Destornillador Phillips', 'Destornillador con punta Phillips', 5.49, 30, 1),
('Sierra de mano', 'Sierra manual con hoja de acero templado', 22.79, 15, 1),
('Clavos (paquete de 100)', 'Clavos de acero galvanizado, paquete de 100 unidades', 2.99, 50, 1),
('Tornillos (paquete de 50)', 'Tornillos de acero, paquete de 50 unidades', 3.49, 40, 1),
('Cinta métrica', 'Cinta métrica de 5 metros con carcasa de plástico resistente', 9.99, 25, 1),
('Pintura blanca (1 galón)', 'Pintura acrílica blanca, galón', 25.99, 10, 4),
('Brocha de pintura', 'Brocha de cerdas sintéticas para aplicar pintura', 6.79, 35, 1);

-- Inserción de datos en la tabla Proveedor
INSERT INTO Proveedor (Nombre, Contacto, Direccion, Telefono) VALUES 
('Ferretería Hermanos Pérez', 'Juan Pérez', 'Calle Mayor 123', '123-456-789'),
('Distribuidora Eléctrica Martínez', 'Carlos Martínez', 'Avenida Principal 456', '987-654-321'),
('Fontanería López', 'Pedro López', 'Calle Secundaria 789', '555-123-456'),
('Pinturas Sánchez', 'María Sánchez', 'Calle de la Plaza 123', '111-222-333');

-- Inserción de datos en la tabla Compra
INSERT INTO Compra (Fecha, Total, IDProveedor) VALUES 
('2024-03-20', 50.95, 1),
('2024-03-19', 32.47, 2),
('2024-03-18', 16.98, 3),
('2024-03-17', 32.78, 4);

-- Inserción de datos en la tabla Detalle_Compra
INSERT INTO Detalle_Compra (IDCompra, IDProducto, Cantidad, PrecioUnitario) VALUES 
(1, 1, 2, 15.99),
(1, 3, 1, 22.79),
(2, 2, 3, 5.49),
(3, 5, 2, 3.49),
(4, 7, 1, 25.99),
(4, 8, 1, 6.79);

-- Inserción de datos en la tabla Cliente
INSERT INTO Cliente (Nombre, Email, Telefono) VALUES 
('Juan Pérez', 'juan.perez@example.com', '123-456-789'),
('María López', 'maria.lopez@example.com', '987-654-321'),
('Carlos Rodríguez', 'carlos.rodriguez@example.com', '555-123-456'),
('Ana Martínez', 'ana.martinez@example.com', '111-222-333');

-- Inserción de datos en la tabla Venta
INSERT INTO Venta (Fecha, Total, IDCliente) VALUES 
('2024-03-20', 35.98, 1),
('2024-03-19', 20.47, 2),
('2024-03-18', 50.56, 3),
('2024-03-17', 12.99, 4);

-- Inserción de datos en la tabla Detalle_Venta
INSERT INTO Detalle_Venta (IDVenta, IDProducto, Cantidad, PrecioUnitario) VALUES 
(1, 2, 1, 5.49),
(1, 4, 2, 2.99),
(2, 5, 1, 3.49),
(3, 1, 1, 15.99),
(3, 3, 2, 22.79),
(4, 8, 1, 6.79);
