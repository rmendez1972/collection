/*igh
Procedimiento almacenado que guarda movimientos aplicados
en la tabla movedoscta de la base de datos cobranza*/
DROP PROCEDURE IF EXISTS sp_aplicaMovimientos2;
DELIMITER $$
CREATE PROCEDURE sp_aplicaMovimientos2(  
    IN `clave_b`        VARCHAR(12),
    IN `fecha_mov`      VARCHAR(11),
    IN `capital`        DECIMAL (11,3)
    
      
    )
BEGIN
    insert into mov_edoscta (capital,fecha_mov,clave_b)
    values (capital,fecha_mov,clave_b);

END $$
DELIMITER ;