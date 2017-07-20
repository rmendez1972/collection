DROP PROCEDURE IF EXISTS sp_apertura20;
DELIMITER $$
CREATE PROCEDURE sp_apertura20(IN id_benef int, IN imp_cap decimal(10,3), imp_eng decimal(9,3),IN poliza varchar(4), IN fecha_pol varchar(11), IN clave_b varchar(12),IN id_usuario int)
BEGIN
insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b, id_usuario) values (id_benef,'CAP',imp_cap,poliza,fecha_pol, clave_b, id_usuario);
insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b, id_usuario) values (id_benef,'ENG',imp_eng,poliza,fecha_pol, clave_b, id_usuario);
insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b, id_usuario) values (id_benef,'ENG',imp_eng*-1,poliza,fecha_pol, clave_b, id_usuario);
END $$
