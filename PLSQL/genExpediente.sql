CREATE DEFINER=`root`@`localhost` PROCEDURE `genExpediente`()
BEGIN
	/*declare*/
    declare contador integer;
    declare reg integer;
    
    /*set*/
	set contador = 1;
    set reg = (select max(codigoAlumno) from alumnos);
    
     /*procedure*/
    while contador<=reg do        
        update alumnos set codigoExpediente = concat_ws('-', substring(nombre, 1, 2), left(apellidos,2), year(fechaNacimiento)) where codigoAlumno = contador;
        set contador = contador + 1;
    end while;
END