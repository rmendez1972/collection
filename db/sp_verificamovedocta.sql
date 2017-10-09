DROP PROCEDURE IF EXISTS sp_verificamovedocta;
DELIMITER $$
CREATE PROCEDURE sp_verificamovedocta(
	IN benef INT, 
    IN clave VARCHAR(12),
    OUT numero INT)
BEGIN
	
	SET numero = (SELECT COUNT(*) FROM mov_edoscta WHERE id_benef=benef AND clave_b=clave);
END $$
DELIMITER ;