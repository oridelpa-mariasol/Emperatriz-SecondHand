USE emperatriz_second_hand;

CREATE TABLE marcas (
    id_marca INT NOT NULL AUTO_INCREMENT,
    nombre_marca VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_marca)
);

CREATE TABLE talles (
    id_talle INT NOT NULL AUTO_INCREMENT,
    descripcion_talle VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_talle)
);

CREATE TABLE temporadas (
    id_temporada INT NOT NULL AUTO_INCREMENT,
    nombre_temporada VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_temporada)
);

CREATE TABLE categorias (
    id_categoria INT NOT NULL AUTO_INCREMENT,
    nombre_categoria VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_categoria)
);

CREATE TABLE metodos_pago (
    id_metodo INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_metodo)
);

CREATE TABLE estados_pago (
    id_estado INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_estado)
);

CREATE TABLE estado_prenda (
    id_estado_fisico INT NOT NULL AUTO_INCREMENT,
    descripcion VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_estado_fisico)
);

CREATE TABLE sucursales (
    id_sucursal INT NOT NULL AUTO_INCREMENT,
    nombre_sucursal VARCHAR(50),
    PRIMARY KEY (id_sucursal)
);

-- Tablas de Personas
CREATE TABLE proveedores (
    id_proveedor INT NOT NULL AUTO_INCREMENT,
    cedula VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    PRIMARY KEY (id_proveedor)
);

CREATE TABLE clientes (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    PRIMARY KEY (id_cliente)
);

-- UNIDAD 4: Tablas con Relaciones (Claves Foráneas - FK)
-- Estas tablas "miran" a las maestras para funcionar.

CREATE TABLE productos (
    id_producto INT NOT NULL AUTO_INCREMENT,
    codigo VARCHAR(50) NOT NULL,
    descripcion TEXT,
    precio_venta DECIMAL(10,2),
    id_marca INT,
    id_talle INT,
    id_temporada INT,
    id_categoria INT,
    id_proveedor INT,
    id_estado_fisico INT,
    PRIMARY KEY (id_producto),
    -- Relaciones de integridad
    FOREIGN KEY (id_marca) REFERENCES marcas(id_marca),
    FOREIGN KEY (id_talle) REFERENCES talles(id_talle),
    FOREIGN KEY (id_temporada) REFERENCES temporadas(id_temporada),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor),
    FOREIGN KEY (id_estado_fisico) REFERENCES estado_prenda(id_estado_fisico)
);

CREATE TABLE ventas (
    id_venta INT NOT NULL AUTO_INCREMENT,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_cliente INT,
    total DECIMAL(10,2),
    id_metodo_pago INT,
    PRIMARY KEY (id_venta),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_metodo_pago) REFERENCES metodos_pago(id_metodo)
);

CREATE TABLE detalle_ventas (
    id_detalle INT NOT NULL AUTO_INCREMENT,
    id_venta INT,
    id_producto INT,
    PRIMARY KEY (id_detalle),
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE pagos_proveedores (
    id_pago INT NOT NULL AUTO_INCREMENT,
    id_proveedor INT,
    monto_total DECIMAL(10,2),
    fecha_pago DATE,
    id_estado INT,
    PRIMARY KEY (id_pago),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor),
    FOREIGN KEY (id_estado) REFERENCES estados_pago(id_estado)
);
