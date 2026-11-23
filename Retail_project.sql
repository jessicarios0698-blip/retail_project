DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre     VARCHAR(100) NOT NULL,
    email      VARCHAR(150) NOT NULL UNIQUE,
    edad       INT CHECK (edad >= 18),
    ciudad     VARCHAR(80)
);

CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre      VARCHAR(100) NOT NULL,
    categoria   VARCHAR(50)  NOT NULL,
    precio      DECIMAL(10,2) NOT NULL CHECK (precio > 0),
    stock       INT NOT NULL CHECK (stock >= 0)
);


CREATE TABLE ventas (
    venta_id    SERIAL PRIMARY KEY,
    cliente_id  INT NOT NULL REFERENCES clientes(cliente_id),
    producto_id INT NOT NULL REFERENCES productos(producto_id),
    cantidad    INT NOT NULL check (cantidad >0),
    fecha_venta DATE NOT NULL
);

BEGIN;

INSERT INTO clientes (nombre, email, edad, ciudad) VALUES
    ('Ana Perez',   'ana@mail.com',   28, 'Buenos Aires'),
    ('Luis Gómez',  'luis@mail.com',  35, 'Córdoba'), 
	('Jessica Rios', 'jess@gmail.com', 20, 'Guernica'),
	('Jose Duran', 'jose@gmail.com', 19, 'Glew'),
	('Mateo Duran', 'Mateo@gmail.com', 19, 'Mar del Plata');
	

	INSERT INTO productos (nombre, categoria, precio, stock) VALUES
    ('Camperas', 'Ropa', 15000.00, 40),
    ('Remeras',      'Ropa',         8000.00, 100),
	('Pantalones',      'Ropa',         9000.00, 50),
	 ('Camisas',      'Ropa',         12000.00, 100),
	  ('Shorts',      'Ropa',         1000.00, 10);

	INSERT INTO ventas (cliente_id, producto_id, cantidad, fecha_venta) VALUES
    (1, 1, 2, '2026-11-01'),
    (2, 2, 1, '2026-11-03'),
	(1, 2, 2, '2026-12-01'),
	(2, 2, 2, '2026-01-02'),
	(2, 1, 1, '2026-05-03');
   

COMMIT;

SELECT * FROM productos WHERE categoria = 'Ropa';
UPDATE productos SET precio = precio * 1.10 WHERE categoria = 'Ropa';

SELECT * FROM ventas WHERE venta_id = 5;
DELETE FROM ventas WHERE venta_id = 5;