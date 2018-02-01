/*igh*/
DROP PROCEDURE IF EXISTS sp_aplicaMovimientos;
DELIMITER $$
CREATE PROCEDURE sp_aplicaMovimientos(
    IN `clave_b` VARCHAR(12), 
    IN `fecha_mov` VARCHAR(11) 
    )
BEGIN
    insert into mov_edoscta (clave_b,fecha_mov) 
    values (clave_b,fecha_mov);

END $$
DELIMITER ;

