CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_apertura48`(
	IN `id_benef` INT,
	IN `poliza` VARCHAR(6),
	IN `clave_b` VARCHAR(12),
	IN `id_usuario` INT,
	IN `id_catprog` INT,
	IN `numcontrato` VARCHAR(5),
	IN `fecha_pol` VARCHAR(11),
	IN `imp_cap` DECIMAL(10,3),
	IN `imp_int` DECIMAL(11,3)


,
	IN `imp_svida` DECIMAL(11,3),
	IN `imp_admon` DECIMAL(11,3),
	IN `imp_tit` DECIMAL(11,3),
	IN `imp_eng` DECIMAL(11,3),
	IN `imp_sui` DECIMAL(11,3),
	IN `imp_sin` DECIMAL(11,3),
	IN `imp_pag` DECIMAL(11,3)









)
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
BEGIN
insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato)  
values (id_benef,'CAP',imp_cap,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);
    
insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato) 
values (id_benef,'INT',imp_int,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);

insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato) 
values (id_benef,'ADM',imp_admon,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);

insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato) 
values (id_benef,'SEG',imp_svida,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);

insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato) 
values (id_benef,'TIT',imp_tit,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);

insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato) 
values (id_benef,'ENG',imp_eng*-1,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);

insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato) 
values (id_benef,'SUI',imp_sui*-1,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);

insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato) 
values (id_benef,'SIN',imp_sin*-1,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);

insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_mov, clave_b, id_usuario, id_catprog, numcontrato) 
values (id_benef,'PAG',imp_pag*-1,poliza,fecha_pol, clave_b, id_usuario, id_catprog, numcontrato);

END