DROP PROCEDURE IF EXISTS sp_apertura10;
DELIMITER $$
CREATE PROCEDURE sp_apertura10(
    IN `id_benef` INT, 
    IN `imp_cap` DECIMAL, 
    IN `imp_eng` DECIMAL, 
    IN `poliza` VARCHAR(4), 
    IN `fecha_pol` VARCHAR(11), 
    IN `clave_b` VARCHAR(12), 
    IN `imp_interes` DECIMAL, 
    IN `imp_admon` DECIMAL, 
    IN `imp_svida` DECIMAL, 
    IN `imp_pagos` DECIMAL, 
    IN `imp_sui` DECIMAL,
    IN `id_usuario` INT)
BEGIN
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b, id_usuario) values (id_benef,'CAP',imp_cap,poliza,fecha_pol, clave_b, id_usuario);
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b, id_usuario) values (id_benef,'ENG',imp_eng*-1,poliza,fecha_pol, clave_b, id_usuario);
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b, id_usuario) values (id_benef,'INT',imp_interes,poliza,fecha_pol, clave_b, id_usuario);
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b, id_usuario) values (id_benef,'ADM',imp_admon,poliza,fecha_pol, clave_b, id_usuario);
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b, id_usuario) values (id_benef,'SEG',imp_svida,poliza,fecha_pol, clave_b, id_usuario);
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b, id_usuario) values (id_benef,'PAG',imp_pagos*-1,poliza,fecha_pol, clave_b, id_usuario);
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b, id_usuario) values (id_benef,'SUI',imp_sui,poliza,fecha_pol, clave_b, id_usuario);
END $$
DELIMITER ;