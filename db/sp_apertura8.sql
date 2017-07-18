DROP PROCEDURE IF EXISTS sp_apertura8;
DELIMITER $$
CREATE PROCEDURE sp_apertura8(
	IN `id_benef` INT, 
    IN `clave_b` VARCHAR(12), 
    IN `fecha_pol` VARCHAR(11),
    IN `poliza` VARCHAR(4),
    IN `imp_cap` DECIMAL,
    IN `imp_eng` DECIMAL,
    IN `imp_pagos` DECIMAL,
    IN `imp_sui` DECIMAL,
    IN `id_usuario` INT)
BEGIN
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b, id_usuario) values (id_benef,'CAP',imp_cap,poliza,fecha_pol, clave_b, id_usuario);
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b, id_usuario) values (id_benef,'ENG',imp_eng*-1,poliza,fecha_pol, clave_b, id_usuario);
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b, id_usuario) values (id_benef,'PAG',imp_pagos*-1,poliza,fecha_pol, clave_b, id_usuario);
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b, id_usuario) values (id_benef,'SUI',imp_sui*-1,poliza,fecha_pol, clave_b, id_usuario);
END $$
DELIMITER ;