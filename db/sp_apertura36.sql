DROP PROCEDURE IF EXISTS sp_apertura36;
DELIMITER $$
CREATE PROCEDURE sp_apertura36(
    IN `id_benef` INT, 
    IN `imp_cap` DECIMAL(11,3), 
    IN `imp_eng` DECIMAL(11,3), 
    IN `poliza` VARCHAR(4), 
    IN `fecha_pol` VARCHAR(11), 
    IN `clave_b` VARCHAR(12), 
    IN `imp_pagos` DECIMAL(11,3), 
    IN `imp_sui` DECIMAL(11,3),
    IN `id_usuario` INT)
BEGIN
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b, id_usuario) values (id_benef,'CAP',imp_cap,poliza,fecha_pol, clave_b, id_usuario);
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b, id_usuario) values (id_benef,'ENG',imp_eng*-1,poliza,fecha_pol, clave_b, id_usuario);
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b, id_usuario) values (id_benef,'PAG',imp_pagos*-1,poliza,fecha_pol, clave_b, id_usuario);
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b, id_usuario) values (id_benef,'SUI',imp_sui*-1,poliza,fecha_pol, clave_b, id_usuario);
END $$
DELIMITER ;