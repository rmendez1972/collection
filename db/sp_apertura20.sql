DROP PROCEDURE sp_apertura20;
delimiter //
CREATE PROCEDURE sp_apertura20 (IN id_benef int, IN imp_cap decimal, imp_eng decimal,IN poliza varchar(4), IN fecha_pol varchar(11), IN clave_b varchar(12))
BEGIN
DECLARE imp_eng2 decimal;
SET imp_eng2 = imp_eng*-1;
insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b) values (id_benef,'CAP',imp_cap,poliza,fecha_pol, clave_b);
insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b) values (id_benef,'ENG',imp_eng,poliza,fecha_pol, clave_b);
insert into mov_edoscta (id_benef,clave_mov,capital, poliza,fecha_pol, clave_b) values (id_benef,'ENG',imp_eng2,poliza,fecha_pol, clave_b);
END//