
INSERT INTO [dbo].[insumosInventario] ([nombre_insumo], [cantidad], [fecha])
VALUES
    ('Cuerda de Colores', 700, '2023-07-01'),
    ('Beads de Plástico', 1500, '2023-07-02'),
    ('Cierre Metálico', 300, '2023-07-03'),
    ('Hilo Elástico', 1000, '2023-07-04'),
    ('Charm Dorado', 250, '2023-07-05'),
    ('Abalorios de Cristal', 400, '2023-07-06'),
    ('Cadena Plateada', 350, '2023-07-07'),
    ('Colgante de Corazón', 90, '2023-07-08'),
    ('Beads de Madera', 800, '2023-07-09'),
    ('Hilo de Seda', 450, '2023-07-10'),
    ('Charm Plateado', 160, '2023-07-11'),
    ('Cierre de Plástico', 500, '2023-07-12'),
    ('Cordón de Cuero', 250, '2023-07-13'),
    ('Beads de Metal', 350, '2023-07-14'),
    ('Abalorios de Cerámica', 280, '2023-07-15'),
    ('Cadena Dorada', 250, '2023-07-16'),
    ('Colgante de Estrella', 100, '2023-07-17'),
    ('Cierre Magnético', 400, '2023-07-18'),
    ('Hilo de Nylon', 550, '2023-07-19'),
    ('Charm de Mariposa', 150, '2023-07-20');


--PruudctosInventario
INSERT INTO [dbo].[productosInventario] ([nombre_producto], [cantidad], [fecha])
VALUES
    ('Pulsera de Cuentas', 60, '2023-07-01'),
    ('Pulsera de Charms', 35, '2023-07-02'),
    ('Pulsera de Cuero', 25, '2023-07-03'),
    ('Pulsera Tejida', 45, '2023-07-04'),
    ('Pulsera de Cadena', 30, '2023-07-05'),
    ('Pulsera con Colgante', 40, '2023-07-06'),
    ('Pulsera Elegante', 20, '2023-07-07'),
    ('Pulsera de Perlas', 15, '2023-07-08'),
    ('Pulsera de Cuerda', 70, '2023-07-09'),
    ('Pulsera de Metal', 50, '2023-07-10'),
    ('Pulsera de Cristal', 60, '2023-07-11'),
    ('Pulsera Bohemia', 32, '2023-07-12'),
    ('Pulsera Minimalista', 22, '2023-07-13'),
    ('Pulsera de Plata', 37, '2023-07-14'),
    ('Pulsera Vintage', 27, '2023-07-15'),
    ('Pulsera de Mariposa', 17, '2023-07-16'),
    ('Pulsera de Estrella', 43, '2023-07-17'),
    ('Pulsera de Amistad', 47, '2023-07-18'),
    ('Pulsera de Piedras Preciosas', 30, '2023-07-19'),
    ('Pulsera de Abalorios', 52, '2023-07-20'),
    ('Pulsera con Dijes', 25, '2023-07-21'),
    ('Pulsera de Tela', 34, '2023-07-22'),
    ('Pulsera de Madera', 42, '2023-07-23'),
    ('Pulsera de Nudo', 23, '2023-07-24'),
    ('Pulsera de Playa', 18, '2023-07-25'),
    ('Pulsera de Moda', 33, '2023-07-26'),
    ('Pulsera de Fiesta', 28, '2023-07-27'),
    ('Pulsera Boho', 31, '2023-07-28'),
    ('Pulsera de Acero Inoxidable', 24, '2023-07-29'),
    ('Pulsera Étnica', 19, '2023-07-30');


--Compras clintes
INSERT INTO [dbo].[rankingClientes] ([nombre_cliente], [numero_compras], [fecha])
VALUES
    ('Juan Hernández', 9, '2023-07-01'),
    ('María Rodríguez', 12, '2023-07-02'),
    ('Miguel nzález', 10, '2023-07-03'),
    ('Ana Martínez', 15, '2023-07-04'),
    ('José López', 12, '2023-07-05');



--Ventas
INSERT INTO [dbo].[venta] ([nombreproducto], [numero_ventas], [recuadado_por_venta], [fecha])
VALUES
    ('Pulsera de Cuentas', 30, 750.00, '2023-07-01'),
    ('Pulsera de Charms', 25, 550.00, '2023-07-02'),
    ('Pulsera de Cuero', 20, 500.00, '2023-07-03'),
    ('Pulsera Tejida', 28, 700.00, '2023-07-04'),
    ('Pulsera de Cadena', 22, 460.00, '2023-07-05'),
    ('Pulsera con Colgante', 27, 620.00, '2023-07-06'),
    ('Pulsera Elegante', 15, 400.00, '2023-07-07'),
    ('Pulsera de Perlas', 10, 300.00, '2023-07-08'),
    ('Pulsera de Cuerda', 35, 880.00, '2023-07-09'),
    ('Pulsera de Metal', 24, 550.00, '2023-07-10');

