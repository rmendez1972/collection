/*igh
Procedimiento almacenado que guarda movimientos aplicados
en la tabla movedoscta de la base de datos cobranza*/
DROP PROCEDURE IF EXISTS sp_insertaNiveles;
DELIMITER $$
CREATE PROCEDURE sp_insertaNiveles(
    IN descripcion   VARCHAR (50),
    IN privilegios   VARCHAR (80),
    OUT ultimo   INT)
    
BEGIN
    SET ultimo=0;


    insert into niveles (descripcion,privilegios)
    values (descripcion,privilegios);
       
    /*SET ultimo_reg = LAST_ISERT_ID();*/
    /*set ultimo=SELECT DISTINCT LAST_INSERT_ID();*/
    SELECT DISTINCT LAST_INSERT_ID() into ultimo;
    /*SET ultimo_reg= SELECT DISTINCT LAST_INSERT_ID() FROM mov_edoscta ;*/
  
    /*set ultimo_reg=2014;*/

END $$
DELIMITER ;


/*
Prueba:
                                                                                  id_benef,  capital,      interes,       admon,     seguro,      clave_mov,    poliza,     fecha_mov,           recibo,      o_seg,     moratorios,     estatus,  fecha_pol,           id_usuario,  comisiones,     serie, puntual,   clave_b,             tit,      id_catprog,   numcontrato,      id_caja,bonific
http://localhost:8083/cobranza/controladormov_edocta?operacion=aplicaMovedoctaApi&id_benef=1&capital=90.00&interes=201.00&admon=0.00&seguro=50.00&clave_mov=101&poliza=D001&fecha_mov=2018-02-22&recibo=00030&o_seguro=0&moratorios=0.50&estatus=A&fecha_pol=2018-02-28&id_usuario=5&comisiones=0.00&serie=A&puntual=0&clave_b=NUGD19-00001&tit=25.99&id_catprog=10&numcontrato=12345&id_caja=1000&bonific=0
http://localhost:8083/cobranza/controladormov_edocta?operacion=aplicaMovedoctaApi&id_benef=1&capital=90.00&interes=201.00&admon=0.00&seguro=50.00&clave_mov=101&poliza=D001&fecha_corte=2018-02-22&recibo=00030&o_seguro=0&moratorios=0.50&fecha_pol=2018-02-28&id_usuario=5&comisiones=0.00&serie=A&clave_b=NUGD19-00001&tit=25.99&id_catprog=10&numcontrato=12345&id_caja=1000&ultimo_reg=2520
*/