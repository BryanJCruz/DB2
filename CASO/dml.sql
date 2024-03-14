

USE taller_vistas;

/* Creación de Tablas*/
CREATE TABLE proveedor (
 	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
 	proveedor VARCHAR(100),
 	status INT,
 	ciudad VARCHAR(150)
);

/* Insertar información en de Tablas*/
INSERT INTO proveedor VALUES(null,"Hola S.A",1,"Darien");


SELECT id, proveedor AS "Nombre", status AS "Estado"
FROM proveedor
GROUP BY proveedor
ORDER BY proveedor;


/* 
 * 1. Vistas
 * */

CREATE  VIEW vListadoDeProvedores
AS SELECT id, proveedor AS "Nombre", status AS "Estado"
FROM proveedor
GROUP BY proveedor
ORDER BY proveedor;

/* Vista de los nombres de proveedores, que se llame Reporte_Proveedor */

CREATE VIEW Reporte_Proveedor
AS SELECT id, proveedor AS "Nombre Proveedor", status AS "Estado"
FROM proveedor;

/* Consultar una vista */
SELECT * FROM Reporte_Proveedor;

SELECT COUNT(*) AS "TOTAL DE PROVEEDORES" FROM Reporte_Proveedor;

SELECT COUNT(*) AS "TOTAL DE PROVEEDORES" INTO @total FROM vListadoDeProvedores;

SELECT @total

CREATE VIEW v_vista_de_la_vista 
AS 
SELECT "Nombre Proveedor" FROM Reporte_Proveedor;

SELECT * FROM v_vista_de_la_vista;

/* 
 * 2. Procedimiento Almacenados 
 * */
SELECT *
   	FROM proveedor p
   	WHERE p.proveedor = "desarrollo S.A" AND p.ciudad = "Cocle" AND p.status = 1;

DELIMITER //

CREATE OR REPLACE PROCEDURE AddProveedor(IN p_nombre VARCHAR(100),IN p_status int, IN p_ciudad VARCHAR(150), OUT p_id INT)
BEGIN
    INSERT INTO proveedor (id,proveedor,status,ciudad) VALUES (null,p_nombre,p_status, p_ciudad);
   	SELECT id 
   	INTO p_id 
   	FROM proveedor p
   	WHERE p.proveedor = p_nombre AND p.ciudad = p_ciudad AND p.status = p_status;
END

//

DELIMITER ;

CALL AddProveedor('Pricemart Tumba Muerto', 1, 'chitre', @resultado);

SELECT @resultado;

CALL AddProveedor('soluprime',1, 'Panamá', @resultado);
CALL AddProveedor('super 99',1, 'Vacamonte',@resultado );
CALL AddProveedor('Vegetales sa',1, 'Boquete',@resultado );

/* 
 * CASOS DE USO
 * 
 * PARTE LABORATORIO
 * 
 * */

USE taller_vistas;


CREATE table partes(
id int primary key auto_increment not null,
partes varchar(150),
color varchar(50),
peso decimal,
ciudad varchar(200)
);

INSERT  INTO partes VALUES(null, "llantas", "negro", 10.5, "Panamá City"),(null, "rines", "planteado", 35, "Panamá City"),
(null, "Asientos", "azul", 56.7, "Chitre City");

SELECT * FROM partes;

create view vPartes
as select partes as "Nombre partes",
color, peso
from partes;

select * from vPartes;


CREATE TABLE proveedor_partes(
	code VARCHAR(36) PRIMARY KEY NOT NULL,
	proveedor_id INT,
	partes_id INT,
	cantidad INT NOT NULL,
	FOREIGN KEY (proveedor_id) REFERENCES proveedor(id),
	CONSTRAINT FK_partesId FOREIGN KEY (partes_id) REFERENCES partes(id), 
	CHECK(cantidad > 0)
);
/* DROP TABLE proveedor_partes; */

INSERT INTO proveedor_partes VALUES("P0001", 1,1,10000),("P0002", 2,1,900),("P0003", 1,2,10000),("P0004", 2,2,900),
("P0005", 3,1,10000),("P0006", 1,3,3729),("P0007", 4,2,2312),("P0008", 4,1,999),("P0009", 4,3,883);

SELECT * FROM proveedor_partes;

SELECT 
	y.code, v.proveedor as "nombreProveedor", p.partes as "nombreParte" ,
	y.cantidad
FROM proveedor_partes y 
INNER JOIN proveedor v ON  v.id = y.proveedor_id 
INNER JOIN partes p ON p.id = y.partes_id;

/* VISTA relacional */ 
CREATE OR REPLACE VIEW vReporteAlmacen
AS 
SELECT 
	y.code, v.proveedor as "nombreProveedor", p.partes as "nombreParte" ,
	y.cantidad,
	((y.cantidad * 1.07) + 2.50) as "precioDental",
	((y.cantidad * 1.07) + 1.75) as "precioXmayor"
FROM proveedor_partes y 
INNER JOIN proveedor v ON  v.id = y.proveedor_id 
INNER JOIN partes p ON p.id = y.partes_id;


SELECT * from vReporteAlmacen;
