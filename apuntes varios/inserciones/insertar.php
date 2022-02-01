<?php

    $con = mysqli_connect("localhost","root","","personas");
    $con -> set_charset('utf8');

    $sql = "insert into alumnos (nombre, apellidos,fnaci,colorf) values
    ('".$_POST['nom']."','".$_POST['apel']."','".$_POST['fecha']."','".$_POST['color']."')";

    if(mysqli_connect_error()){
        echo "HA HABIDO EL FALLO - TIPO ERROR: ".mysqli_connect_errno();
    };

    mysqli_query($con,$sql);

    mysqli_close($con);



?>