-- DIM_FECHA
CREATE TABLE Dim_Fecha (
    id_fecha INT PRIMARY KEY,
    fecha DATE,
    dia INT,
    mes INT,
    anio INT
);

-- DIM_PRODUCTO
CREATE TABLE Dim_Producto (
    id_producto VARCHAR(10) PRIMARY KEY,
    nombre NVARCHAR(100),
    marca NVARCHAR(50),
    categoria NVARCHAR(50)
);

-- DIM_CLIENTE
CREATE TABLE Dim_Cliente (
    id_cliente VARCHAR(10) PRIMARY KEY,
    nombre NVARCHAR(100),
    tipo_cliente NVARCHAR(20) -- Minorista / Mayorista
);

-- DIM_VENDEDOR
CREATE TABLE Dim_Vendedor (
    id_vendedor VARCHAR(10) PRIMARY KEY,
    nombre NVARCHAR(100)
);

-- DIM_PROVEEDOR
CREATE TABLE Dim_Proveedor (
    id_proveedor VARCHAR(10) PRIMARY KEY,
    nombre NVARCHAR(100),
    contacto NVARCHAR(100)
);

-- DIM_SUCURSAL
CREATE TABLE Dim_Sucursal (
    id_sucursal VARCHAR(10) PRIMARY KEY,
    nombre NVARCHAR(100),
    departamento NVARCHAR(50),
    region NVARCHAR(50)
);

-- HECHO VENTAS
CREATE TABLE Hecho_Ventas (
    id_venta INT IDENTITY(1,1) PRIMARY KEY,
    id_fecha INT,
    id_producto VARCHAR(10),
    id_cliente VARCHAR(10),
    id_vendedor VARCHAR(10),
    id_sucursal VARCHAR(10),
    unidades INT,
    precio_total DECIMAL(12, 2),

    FOREIGN KEY (id_fecha) REFERENCES Dim_Fecha(id_fecha),
    FOREIGN KEY (id_producto) REFERENCES Dim_Producto(id_producto),
    FOREIGN KEY (id_cliente) REFERENCES Dim_Cliente(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES Dim_Vendedor(id_vendedor),
    FOREIGN KEY (id_sucursal) REFERENCES Dim_Sucursal(id_sucursal)
);

-- HECHO COMPRAS
CREATE TABLE Hecho_Compras (
    id_compra INT IDENTITY(1,1) PRIMARY KEY,
    id_fecha INT,
    id_producto VARCHAR(10),
    id_proveedor VARCHAR(10),
    id_sucursal VARCHAR(10),
    unidades INT,
    costo_total DECIMAL(12, 2),

    FOREIGN KEY (id_fecha) REFERENCES Dim_Fecha(id_fecha),
    FOREIGN KEY (id_producto) REFERENCES Dim_Producto(id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES Dim_Proveedor(id_proveedor),
    FOREIGN KEY (id_sucursal) REFERENCES Dim_Sucursal(id_sucursal)
);
