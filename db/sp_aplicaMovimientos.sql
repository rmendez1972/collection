/*igh
Procedimiento almacenado que guarda movimientos aplicados
en la tabla movedoscta de la base de datos cobranza*/
DROP PROCEDURE IF EXISTS sp_aplicaMovimientos;
DELIMITER $$
CREATE PROCEDURE sp_aplicaMovimientos(
    IN id_benef       INT,
    IN capital        DECIMAL (11,3),
    IN interes        DECIMAL (11,3),
    IN admon          DECIMAL (11,3),
    IN seguro         DECIMAL (11,3),
    IN clave_mov      VARCHAR(3),
    IN poliza         VARCHAR(6),
    IN fecha_mov      VARCHAR(11),
    IN recibo         INT,
    IN o_seg          DECIMAL (11,3),
    IN moratorios     DECIMAL (11,3),
    IN estatus        VARCHAR(1),
    IN fecha_pol      VARCHAR(11),
    IN id_usuario     INT,
    IN comisiones     DECIMAL (11,3),
    IN serie          VARCHAR(1),
    IN puntual        INT,
    IN clave_b        VARCHAR(12),
    IN tit            DECIMAL (11,3),
    IN id_catprog     INT,
    IN numcontrato    VARCHAR(5),
    IN id_caja        INT,
    IN bonific        INT,
    INOUT ultimo    INT)
    

BEGIN
    insert into mov_edoscta (id_benef,capital,interes,admon,seguro,clave_mov,poliza,fecha_mov,recibo,
                o_seg,moratorios,estatus,fecha_pol,id_usuario,comisiones,
                serie,puntual,clave_b,tit,id_catprog,numcontrato,id_caja,bonific)
    
    values (id_benef,capital*-1,interes*-1,admon*-1,seguro*-1,clave_mov,poliza,fecha_mov,recibo,
            o_seg*-1,moratorios*-1,estatus,fecha_pol,id_usuario,comisiones*-1,
            serie,puntual,clave_b,tit*-1,id_catprog,numcontrato,id_caja,bonific);
    /*SET x=SELECT DISTINCT LAST_INSERT_ID(); 
    SET ultimo=x;
    SELECT ultimo;*/  
    SELECT DISTINCT LAST_INSERT_ID() into ultimo;


END $$

DELIMITER ;

/*CREATE PROCEDURE demoSp(IN inputParam VARCHAR(255), INOUT inOutParam INT)
BEGIN
    DECLARE z INT;
    SET z = inOutParam + 1;
    SET inOutParam = z;
 
    SELECT inputParam;*/
/*
Prueba:
                                                                                  id_benef,  capital,      interes,       admon,     seguro,      clave_mov,    poliza,     fecha_mov,           recibo,      o_seg,     moratorios,     estatus,  fecha_pol,           id_usuario,  comisiones,     serie, puntual,   clave_b,             tit,      id_catprog,   numcontrato,      id_caja,bonific
http://localhost:8083/cobranza/controladormov_edocta?operacion=aplicaMovedoctaApi&id_benef=1&capital=90.00&interes=201.00&admon=0.00&seguro=50.00&clave_mov=101&poliza=D001&fecha_mov=2018-02-22&recibo=00030&o_seguro=0&moratorios=0.50&estatus=A&fecha_pol=2018-02-28&id_usuario=5&comisiones=0.00&serie=A&puntual=0&clave_b=NUGD19-00001&tit=25.99&id_catprog=10&numcontrato=12345&id_caja=1000&bonific=0
http://localhost:8083/cobranza/controladormov_edocta?operacion=aplicaMovedoctaApi&id_benef=1&capital=90.00&interes=201.00&admon=0.00&seguro=50.00&clave_mov=101&poliza=D001&fecha_corte=2018-02-22&recibo=00030&o_seguro=0&moratorios=0.50&fecha_pol=2018-02-28&id_usuario=5&comisiones=0.00&serie=A&clave_b=NUGD19-00001&tit=25.99&id_catprog=10&numcontrato=12345&id_caja=1000&ultimo_reg=2520
http://localhost:8083/cobranza/controladormov_edocta?operacion=aplicaMovedoctaApi&id_benef=1&capital=90.00&interes=201.00&admon=0.00&seguro=50.00&clave_mov=101&poliza=D001&fecha_corte=2018-03-01&recibo=00030&o_seguro=0&moratorios=0.50&fecha_pol=2018-02-28&id_usuario=5&comisiones=0.00&serie=A&clave_b=NUGD19-00001&tit=25.99&id_catprog=10&numcontrato=12345&id_caja=250
*/