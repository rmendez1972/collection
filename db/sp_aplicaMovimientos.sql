/*igh
Procedimiento almacenado que guarda movimientos aplicados
en la tabla movedoscta de la base de datos cobranza*/
DROP PROCEDURE IF EXISTS sp_aplicaMovimientos;
DELIMITER $$
CREATE PROCEDURE sp_aplicaMovimientos(
    IN `id_benef`       INT,
    IN `capital`        DECIMAL (11,3),
    IN `interes`        DECIMAL (11,3),
    IN `admon`          DECIMAL (11,3),
    IN `seguro`         DECIMAL (11,3),
    IN `clave_mov`      VARCHAR(3),
    IN `poliza`         VARCHAR(6),
    IN `fecha_mov`      VARCHAR(11),
    IN `recibo`         INT,
    IN `o_seg`          DECIMAL (11,3),
    IN `moratorios`     DECIMAL (11,3),
    IN `estatus`        VARCHAR(1),
    IN `fecha_pol`      VARCHAR(11),
    IN `id_usuario`     INT,
    IN `id_bonific`     INT,
    IN `comisiones`     DECIMAL (11,3),
    IN `serie`          VARCHAR(1),
    IN `puntual`        INT,
    IN `clave_b`        VARCHAR(12),
    IN `tit`            DECIMAL (11,3),
    IN `id_catprog`     INT,
    IN `numcontrato`    VARCHAR(5),
    IN `id_caja`        INT,
    IN `bonific`        INT    
    )

BEGIN
    insert into mov_edoscta (id_benef,capital,interes,admon,seguro,clave_mov,poliza,fecha_mov,recibo,
                o_seg,moratorios,estatus,fecha_pol,id_usuario,id_bonific,comisiones,
                serie,puntual,clave_b,tit,id_catprog,numcontrato,id_caja,bonific)

    values (id_benef,capital,interes,admon,seguro,clave_mov,poliza,fecha_mov,recibo,
            o_seg,moratorios,estatus,fecha_pol,id_usuario,id_bonific,comisiones,
            serie,puntual,clave_b,tit,id_catprog,numcontrato,id_caja,bonific);

END $$
DELIMITER ;


/*
http://localhost:8083/cobranza/controladormov_edocta?operacion=aplicaMovedoctaApi&id_benef=1&capital=25.00&interes=200.00&admon=0.00&seguro=50.00&clave_mov=100&poliza=D001&fecha_corte=2018-02-20&recibo=00025&o_seguro=0&moratorios=.45&estatus=A&fecha_pol=2018-02-20&id_usuario=5&id_bonific=1&comisiones=0.00&serie=A&clave_b=NUGD19-00001&tit=25.99&id_catprog=10&numcontrato=12345&id_caja=1
//id_benef=1,capital,interes,admon,seguro,clave_mov,poliza,fecha_corte,recibo,o_seguro,moratorios,estatus,fecha_pol,id_usuario,id_bonific,comisiones,serie,clave_b,tit,id_catprog,numcontrato,caja
*/