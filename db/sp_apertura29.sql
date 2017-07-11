CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_apertura29`(IN id_benef int, IN imp_cap decimal, imp_eng decimal,IN poliza varchar(4), IN fecha_pol varchar(11), IN clave_b varchar(12),IN id_usuario int)
BEGIN
insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b, id_usuario) values (id_benef,'CAP',imp_cap,poliza,fecha_pol, clave_b, id_usuario);
insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b, id_usuario) values (id_benef,'ENG',imp_eng,poliza,fecha_pol, clave_b, id_usuario);
END