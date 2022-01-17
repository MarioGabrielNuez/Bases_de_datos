<?php
    echo "<h2 style='color:".$_POST['color']."'>".$_POST['nombre']."</h2>";
    echo $_POST['apellidos']."</br>";
    echo $_POST['fecha']."</br>";
    echo $_POST['ancho']."</br>";
    echo "<div style='width: ".$_POST['ancho']."vw; background-color:".$_POST['color']."; text-align: center;'>"
        ."holaaa"
        .""
        .""
        ."</div>";
    var_dump($_POST);
?>