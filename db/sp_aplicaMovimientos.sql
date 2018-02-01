/*igh
Procedimiento almacenado que guarda movimientos aplicados
en la tabla movedoscta de la base de datos cobranza*/
DROP PROCEDURE IF EXISTS sp_aplicaMovimientos;
DELIMITER $$
CREATE PROCEDURE sp_aplicaMovimientos(
    IN `id_movedoscta`  INT, 
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
    IN `otrosm`         DECIMAL (11,3),
    IN `com_fona`       DECIMAL (11,3),
    IN `com_info`       DECIMAL (11,3),
    IN `fecha_pol`      VARCHAR(11),
    IN `id_usuario`     INT,
    IN `prepago`        VARCHAR(1),
    IN `fecha`          VARCHAR(11),
    IN `id_bonific`     INT,
    IN `comisiones`     DECIMAL (11,3),
    IN `serie`          VARCHAR(1),
    IN `puntual`        INT,
    IN `clave_b`        VARCHAR(12),
    IN `tit`            DECIMAL (11,3),
    IN `id_catprog`     INT,
    IN `numcontrato`    VARCHAR(1),
    IN `id_caja`        INT,
    IN `bonific`        INT    
    )

BEGIN
    insert in to mov_edoscta (id_movedoscta,id_benef,capital,interes,admon,seguro,clave_mov,poliza,fecha_mov,recibo,
                o_seg,moratorios,estatus,otrosm,com_fona,com_info,fecha_pol,id_usuario,prepago,fecha,
                id_bonific,comisiones,serie,puntual,clave_b,tit,id_catprog,numcontrato,id_caja,bonific)

    values (id_movedoscta,id_benef,capital,interes,admon,seguro,clave_mov,poliza,fecha_mov,recibo,
            o_seg,moratorios,estatus,otrosm,com_fona,com_info,fecha_pol,id_usuario,prepago,fecha,
            id_bonific,comisiones,serie,puntual,clave_b,tit,id_catprog,numcontrato,id_caja,bonific);

END $$
DELIMITER ;