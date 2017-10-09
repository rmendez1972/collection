DROP PROCEDURE IF EXISTS sp_apertura40;
DELIMITER $$
CREATE PROCEDURE sp_apertura40(
    IN `id_benef` INT,
	IN `id_usuario` INT,
    IN `id_catprog` INT,
    IN `imp_cap` DECIMAL(11,3), 
    IN `imp_eng` DECIMAL(11,3),
    IN `imp_sui` DECIMAL(11,3),
    IN `imp_pag` DECIMAL(11,3),
    IN `imp_int` DECIMAL(11,3),
    IN `imp_adm` DECIMAL(11,3),
    IN `imp_seg` DECIMAL(11,3),
    IN `imp_osg` DECIMAL(11,3),
    IN `poliza` VARCHAR(6), 
    IN `fecha_pol` VARCHAR(11), 
    IN `clave_b` VARCHAR(12), 
    IN `numcontrato` VARCHAR(5)
    )
BEGIN
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato) 
    values (id_benef,'CAP',imp_cap,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);
    
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato) 
    values (id_benef,'ENG',imp_eng*-1,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);

    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato) 
    values (id_benef,'PAG',imp_pag*-1,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);

    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato) 
    values (id_benef,'SUI',imp_sui*-1,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);
    
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato) 
    values (id_benef,'INT',imp_int,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);
    
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato) 
    values (id_benef,'ADM',imp_adm,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);
    
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato) 
    values (id_benef,'SEG',imp_seg,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);
    
    insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato) 
    values (id_benef,'OSG',imp_osg,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);
    
END $$
DELIMITER ;