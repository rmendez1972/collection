DROP PROCEDURE IF EXISTS sp_apertura38;
DELIMITER $$
CREATE PROCEDURE sp_apertura38(
	IN id_benef INT,
	IN clave_b VARCHAR(12),
    IN fecha_pol VARCHAR(11), 
    IN poliza VARCHAR(4),
    IN imp_cap DECIMAL(10,3),
    IN imp_eng DECIMAL(9,3),
    IN imp_pagos DECIMAL(9,2),
    IN imp_sui DECIMAL(9,3),
    IN imp_admon DECIMAL(7,2),
    IN comision DECIMAL(9,3),
    IN id_usuario INT)
BEGIN

    insert into mov_edoscta (id_benef,clave_b,clave_mov,fecha_pol,poliza,capital,id_usuario) 
    values (id_benef,clave_b,'CAP',fecha_pol,poliza,imp_cap,id_usuario);
    
    insert into mov_edoscta (id_benef,clave_b,clave_mov,fecha_pol,poliza,capital,id_usuario) 
    values (id_benef,clave_b,'ENG',fecha_pol,poliza,imp_eng*-1,id_usuario);
    
	insert into mov_edoscta (id_benef,clave_b,clave_mov,fecha_pol,poliza,capital,id_usuario)
    values (id_benef,clave_b,'PAG',fecha_pol,poliza,imp_pagos*-1,id_usuario);
    
    insert into mov_edoscta (id_benef,clave_b,clave_mov,fecha_pol,poliza,capital,id_usuario) 
    values (id_benef,clave_b,'SUI',fecha_pol,poliza,imp_sui*-1,id_usuario);
	
    insert into mov_edoscta (id_benef,clave_b,clave_mov,fecha_pol,poliza,capital,id_usuario) 
    values (id_benef,clave_b,'ADM',fecha_pol,poliza,imp_admon,id_usuario);
    
    insert into mov_edoscta (id_benef,clave_b,clave_mov,fecha_pol,poliza,capital,id_usuario) 
    values (id_benef,clave_b,'COM',fecha_pol,poliza,comision,id_usuario);
    
END $$
DELIMITER ;