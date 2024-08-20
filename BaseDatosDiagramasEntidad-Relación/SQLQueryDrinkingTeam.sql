-- CREAR BASE DE DATOS
CREATE DATABASE DrinkingTeamDB;

-- POSICIONARME EN LA BASE DE DATOS
USE DrinkingTeamDB;
---------------------------------------------------------------------   
-- CREACION DE TABLAS
---------------------------------------------------------------------

-- Tabla Proveedores
CREATE TABLE Proveedores (
    ProveedorID INT IDENTITY(1,1) PRIMARY KEY, 
    Nombre NVARCHAR(50) NOT NULL,  
    NumeroProveedor INT NOT NULL,   
);

-- Tabla Productos
CREATE TABLE Productos (
    ProductoID INT IDENTITY(1,1) PRIMARY KEY,
    Marca NVARCHAR(100) NOT NULL,  
    Nombre NVARCHAR(100) NOT NULL,  
    Volumen NVARCHAR(100) NOT NULL,   
);

-- Tabla Tiendas
CREATE TABLE Tiendas (
    TiendaID INT IDENTITY(1,1) PRIMARY KEY,
    NumeroTienda NVARCHAR(50) NOT NULL,    
	Ciudad NVARCHAR(50) NOT NULL,      
);

-- Tabla Inventario
CREATE TABLE Inventario (
	InventarioID INT IDENTITY(1,1) PRIMARY KEY,
    ProductoID INT NOT NULL,
	TiendaID INT NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL, 
    Fecha DATE NOT NULL,     
	Stock INT NOT NULL,      
);

-- Tabla Ventas
CREATE TABLE Ventas (
    VentaID INT IDENTITY(1,1) PRIMARY KEY,
    InventarioID INT NOT NULL,
	ProveedorID INT NOT NULL,
    CantidadVendida INT NOT NULL,   
    TotalVenta DECIMAL(10, 2) NOT NULL,  
    PrecioVenta DECIMAL(10, 2) NOT NULL,   
    FechaVenta DATE NOT NULL,  
);

-- Tabla Compras
CREATE TABLE Compras (
    ComprasID INT IDENTITY(1,1) PRIMARY KEY,
    InventarioID INT NOT NULL,
    ProveedorID INT NOT NULL,
    NumeroOrdenCompra INT NOT NULL,   
    FechaOrdenCompra DATE NOT NULL, 
    FechaRecibido DATE NOT NULL,   
    FechaFacturado DATE NOT NULL,  
	FechaPagado DATE NOT NULL,  
    PrecioCompra DECIMAL(10, 2) NOT NULL,   
	Cantidad INT NOT NULL,   
	TotalCompra DECIMAL(10, 2) NOT NULL,   
);
-----------------------------------------------------------
-- CREACION DE RELACIONES ENTRE TABLAS
-----------------------------------------------------------

-- RELACION ENTRE LA TABLA INVENTARIO Y PRODUCTOS
ALTER TABLE Inventario
ADD CONSTRAINT Fk_Inventario_Productos -- Conecta las tablas
FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID);

-- RELACION ENTRE LA TABLA INVENTARIO Y TIENDAS
ALTER TABLE Inventario
ADD CONSTRAINT Fk_Inventario_Tiendas -- Conecta las tablas
FOREIGN KEY (TiendaID) REFERENCES Tiendas(TiendaID);

-- RELACION ENTRE LA TABLA DE VENTAS E INVENTARIO
ALTER TABLE Ventas
ADD CONSTRAINT Fk_Ventas_Inventario -- Conecta las tablas
FOREIGN KEY (InventarioID) REFERENCES Inventario(InventarioID);

-- RELACION ENTRE LA TABLA DE VENTAS Y PROVEEDOR
ALTER TABLE Ventas
ADD CONSTRAINT Fk_Ventas_Proveedores -- Conecta las tablas
FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID);

-- RELACION ENTRE LA TABLA DE COMPRAS E INVENTARIO
ALTER TABLE Compras
ADD CONSTRAINT Fk_Compras_Inventario -- Conecta las tablas
FOREIGN KEY (InventarioID) REFERENCES Inventario(InventarioID);

-- RELACION ENTRE LA TABLA DE COMPRAS Y PROVEEDOR
ALTER TABLE Compras
ADD CONSTRAINT Fk_Compras_Proveedores -- Conecta las tablas
FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID);

