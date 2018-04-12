/*MEGH
Procedimiento almacenado que guarda movimientos aplicados
en la tabla mov_diversos de la base de datos cobranza*/
DROP PROCEDURE IF EXISTS sp_aplicaMovimientosDiv;
DELIMITER $$
CREATE PROCEDURE sp_aplicaMovimientosDiv(
    IN id_bendiv       INT,
    IN clave_div	VARCHAR(3),
    IN fecha_div	VARCHAR(11),
    IN poliza		VARCHAR(6),
	IN recibo		INT,
    IN abono		DECIMAL (12,2),
    IN moratorios	DECIMAL (12,2),
    IN otros 		DECIMAL (12,2),
    IN estatus		VARCHAR(1),
    IN descripcion 	VARCHAR(120),
    IN id_catprog 	INT,
    IN serie		VARCHAR(1),
    IN clave_b		VARCHAR(12),
    IN numcontrato 	VARCHAR(5),
    IN bonific      INT,
    IN id_caja		INT,
    IN id_usuario	INT,
    INOUT ultimo    INT)
    

BEGIN
    insert into mov_diversos (id_bendiv, clave_div, fecha_div, poliza,recibo, abono, moratorios, 
			otros,estatus, descripcion, id_catprog, serie, clave_b,numcontrato, bonific, id_caja, id_usuario, cargo)
    
    values (id_bendiv, clave_div, fecha_div, poliza,recibo, abono*-1, moratorios, 
			otros,estatus, descripcion, id_catprog, serie, clave_b,numcontrato, bonific, id_caja, id_usuario, 0);
    /*SET x=SELECT DISTINCT LAST_INSERT_ID(); 
    SET ultimo=x;
    SELECT ultimo;*/  
    SELECT DISTINCT LAST_INSERT_ID() into ultimo;


END $$

DELIMITER ;