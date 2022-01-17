<?php
    $conex = mysqli_connect('localhost:3316','root','','personas') or die ('LA CONEXIÓN A FALLADO');
    $conex -> set_charset('utf8');

    if(mysqli_connect_errno()){
        echo "Error: ".mysqli_connect_error();
    };

    $sql = 'INSERT INTO ALUMNOS (NOMBRE, APELLIDOS, FNACI, COLOR) VALUES ("'.$_POST['nom'].'", "'.$_POST['apel'].'", "'.$_POST['fnacim'].'", "'.$_POST['color'].'");' or die ('Error: en la inserccion');

    if(!mysqli_query($conex, $sql)){
        echo "insertado correctamente";
    };

    mysqli_close($conex);
?>