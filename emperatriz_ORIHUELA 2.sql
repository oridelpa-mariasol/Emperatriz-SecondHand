ALTER TABLE ventas ADD COLUMN id_sucursal INT,
ADD CONSTRAINT fk_sucursal FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal);

INSERT INTO clientes