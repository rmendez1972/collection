/*igh*/
DROP PROCEDURE IF EXISTS sp_apertura36;
DELIMITER $$
CREATE PROCEDURE sp_apertura36(
    IN `id_benef` INT, 
    IN `imp_cap` DECIMAL(11,3), 
    IN `imp_eng` DECIMAL(11,3), 
    IN `poliza` VARCHAR(6), 
    IN `fecha_pol` VARCHAR(11), 
    IN `clave_b` VARCHAR(12), 
    IN `imp_pagos` DECIMAL(11,3), 
    IN `imp_sui` DECIMAL(11,3),
    IN `id_usuario` INT,
    IN `id_catprog` INT,
    IN `numcontrato` VARCHAR(5)
    )
BEGIN
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato) 
    values (id_benef,'CAP',imp_cap,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);
    
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato) 
    values (id_benef,'ENG',imp_eng*-1,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);

    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato) 
    values (id_benef,'PAG',imp_pagos*-1,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);

    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato) 
    values (id_benef,'SUI',imp_sui*-1,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);
END $$
DELIMITER ;