CREATE DEFINER=`root`@`localhost` PROCEDURE `exportExpediente`()
BEGIN
	/*declare*/
    declare contador integer;
    declare reg integer;
    
    /*set*/
	set contador = 1;
    set reg = (select max(codigoAlumno) from alumnos);
    
     /*procedure*/
    while contador<=reg do        
        insert into expediente(codigoAlumno, ApelNomb, notaFinal, codigoExpediente) values (contador, concat((select apellidos from alumnos), (select nombre from alumnos)), (select final from alumnos), (select codigoExpediente from alumnos));
        set contador = contador + 1;
    end while;
END