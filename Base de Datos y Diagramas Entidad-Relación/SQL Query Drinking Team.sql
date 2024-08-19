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
    Nombre NVARCHAR(50) NOT NULL,  -- En compras_limpio o PurchasesFINAL12312016 Columna "VendorName"
    NumeroProveedor INT NOT NULL,   -- En compras_limpio o PurchasesFINAL12312016 Columna "VendorNumber"
);

-- Tabla Productos
CREATE TABLE Productos (
    ProductoID INT IDENTITY(1,1) PRIMARY KEY,
    Marca NVARCHAR(100) NOT NULL,  -- En ventas_limpio o SalesFINAL12312016 Columna "Brand"
    Nombre NVARCHAR(100) NOT NULL,  -- En ventas_limpio o SalesFINAL12312016 Columna "Description"
    Tamaño NVARCHAR(100) NOT NULL,   -- En ventas_limpio o SalesFINAL12312016 Columna "Volumne"
);

-- Tabla Tiendas
CREATE TABLE Tiendas (
    TiendaID INT IDENTITY(1,1) PRIMARY KEY,
    NumeroTienda NVARCHAR(50) NOT NULL,    -- En Inventario_inicial_limpio o BegInvFINAL12312016 Columna "Store"
	Ciudad NVARCHAR(50) NOT NULL,       -- En Inventario_inicial_limpio o BegInvFINAL12312016 Columna "City"
);

-- Tabla Inventario
CREATE TABLE Inventario (
	InventarioID INT IDENTITY(1,1) PRIMARY KEY,
    ProductoID INT NOT NULL,
	TiendaID INT NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL, -- En Inventario_inicial_limpio o BegInvFINAL12312016 Columna "Price"
    FechaInicial DATE NOT NULL,     -- En Inventario_inicial_limpio o BegInvFINAL12312016 Columna "startDate"
	StockInicial INT NOT NULL,       -- En Inventario_inicial_limpio o BegInvFINAL12312016 Columna "onHand"
	FechaFinal DATE NOT NULL,    -- En Inventario_final_limpio o EndInvFINAL12312016 Columna "startDate"
	StockFinal INT NOT NULL,     -- En Inventario_final_limpio o EndInvFINAL12312016 Columna "onHand"
);

-- Tabla Ventas
CREATE TABLE Ventas (
    VentaID INT IDENTITY(1,1) PRIMARY KEY,
    InventarioID INT NOT NULL,
	ProveedorID INT NOT NULL,
    CantidadVendida INT NOT NULL,   -- En ventas_limpio o SalesFINAL12312016 Columna "SalesQuantity"
    TotalVenta DECIMAL(10, 2) NOT NULL,   -- En ventas_limpio o SalesFINAL12312016 Columna "SalesDollars"
    PrecioVenta DECIMAL(10, 2) NOT NULL,   -- En ventas_limpio o SalesFINAL12312016 Columna "SalesPrice"
    FechaVenta DATE NOT NULL,   -- En ventas_limpio o SalesFINAL12312016 Columna "SalesDate"
);

-- Tabla DetallesCompras
CREATE TABLE DetallesCompras (
    ComprasID INT IDENTITY(1,1) PRIMARY KEY,
    InventarioID INT NOT NULL,
    ProveedorID INT NOT NULL,
    NumeroOrdenCompra INT NOT NULL,   -- En compras_limpio o PurchasesFINAL12312016 Columna "PONumber"
    FechaOrdenCompra DATE NOT NULL, -- En compras_limpio o PurchasesFINAL12312016 Columna "PODate"
    FechaRecibido DATE NOT NULL,   -- En compras_limpio o PurchasesFINAL12312016 Columna "ReceivingDate"
    FechaFacturado DATE NOT NULL,  -- En compras_limpio o PurchasesFINAL12312016 Columna "InvoiceDate"
	FechaPagado DATE NOT NULL,  -- En compras_limpio o PurchasesFINAL12312016 Columna "PayDate"
    PrecioCompra DECIMAL(10, 2) NOT NULL,   -- En compras_limpio o PurchasesFINAL12312016 Columna "PurchasePrice"
	Cantidad INT NOT NULL,   -- En compras_limpio o PurchasesFINAL12312016 Columna "Quantity"
	TotalCompra DECIMAL(10, 2) NOT NULL,   -- En compras_limpio o PurchasesFINAL12312016 Columna "Dollars"
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

-- RELACION ENTRE LA TABLA DE DETALLES COMPRAS E INVENTARIO
ALTER TABLE DetallesCompras
ADD CONSTRAINT Fk_DetallesCompras_Inventario -- Conecta las tablas
FOREIGN KEY (InventarioID) REFERENCES Inventario(InventarioID);

-- RELACION ENTRE LA TABLA DE DETALLES COMPRAS Y PROVEEDOR
ALTER TABLE DetallesCompras
ADD CONSTRAINT Fk_DetallesCompras_Proveedores -- Conecta las tablas
FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID);

