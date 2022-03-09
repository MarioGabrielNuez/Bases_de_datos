CREATE DEFINER=`root`@`localhost` PROCEDURE `evaluador`()
BEGIN
	/*declare*/
    declare media Double;
    declare n1 Double;
    declare n2 Double;
    declare contador integer;
    declare reg integer;
    
    /*set*/
    set contador = 1;
    set reg = (select max(codigoAlumno) from alumnos);
    
    /*procedure*/
    while contador<=reg do
		set n1 = (select nota1 from alumnos where codigoAlumno = contador);
        set n2 = (select nota2 from alumnos where codigoAlumno = contador);
        set media = (n1+n2)/2;
        
        update alumnos set final=media where codigoAlumno=contador;
        
        set contador = contador + 1;
    end while;
END