-- Crear base de datos
CREATE DATABASE DrinkinTeamDB;

-- Seleccionar base de datos
USE DrinkinTeamDB;

-- Creacion de tablas segun diagrama entidad relacion 

-- Tabla Vendors
CREATE TABLE Provedores (
    id_provedor INT IDENTITY(1,1) PRIMARY KEY,
    nombre_provedor NVARCHAR(50) NOT NULL,
    numero_provedor INT NOT NULL
);
-- Tabla Brands
CREATE TABLE Marcas (
    id_marca INT PRIMARY KEY,
    descripcion NVARCHAR(50) NOT NULL
);
-- Tabla Products
CREATE TABLE Productos (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    id_marca INT NOT NULL,
    descripcion NVARCHAR(100) NOT NULL,
    medida NVARCHAR(20) NOT NULL,
    CONSTRAINT FK_Products_Brands FOREIGN KEY (id_marca) REFERENCES Marcas(id_marca)
);
-- Tabla Stores
CREATE TABLE Tiendas (
    id_tienda INT IDENTITY(1,1) PRIMARY KEY,
    tienda NVARCHAR(50) NOT NULL,
    ciudad NVARCHAR(50) NOT NULL
);
-- Tabla Inventory
CREATE TABLE Inventarios (
    id_inventario INT PRIMARY KEY,
    id_tienda INT NOT NULL,
    id_producto INT NOT NULL,
    id_provedor INT NOT NULL,
    cantidad INT NOT NULL,
    precio_venta DECIMAL(10, 2) NOT NULL,
    fecha_recibido DATE NOT NULL,
    fecha_pedido DATE NOT NULL,
    fecha_pago DATE NOT NULL,
    CONSTRAINT FK_Inventarios_Tiendas FOREIGN KEY (id_tienda) REFERENCES Tiendas(id_tienda),
    CONSTRAINT FK_Inventarios_Productos FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    CONSTRAINT FK_Inventarios_Provedores FOREIGN KEY (id_provedor) REFERENCES Vendedores(id_provedor)

);

-- Tabla PurchaseOrders
CREATE TABLE Ordenes_Compra (
    id_orden_compra INT IDENTITY(1,1) PRIMARY KEY,
    id_provedor INT NOT NULL,
    fecha_orden_compra DATE NOT NULL,
    numero_orden_compra INT NOT NULL,
    CONSTRAINT FK_Ordenes_Compra_Provedor FOREIGN KEY (id_provedor) REFERENCES Vendedores(id_provedor)
);
-- Tabla Sales
CREATE TABLE Ventas (
    id_venta INT IDENTITY(1,1) PRIMARY KEY,
    id_inventario INT NOT NULL,
    cantidad_vendida INT NOT NULL,
    venta_dolares DECIMAL(10, 2) NOT NULL,
    precio_venta DECIMAL(10, 2) NOT NULL,
    fecha_venta DATE NOT NULL,
    impuestos DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_Ventas_Inventarios FOREIGN KEY (id_inventario) REFERENCES Inventarios(id_inventario)
);

