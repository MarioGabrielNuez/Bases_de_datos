<?php

    $conex = mysqli_connect('localhost:3316','root','','cocina') or die ('LA CONEXION A FALLADO');
    $sql = 'select * from recetas' or die ('pa tu casa');

    

    echo "<div style='width:80vw;height:100vh;background:red;margin:0 auto'>";
    echo "<h1 align='center'>Recetas Chulis</h1>";
    if($resultado = mysqli_query($conex,$sql)){
        while ($registro = mysqli_fetch_row($resultado)){
            echo "<div style='width:50%;height:350px;float:left;background:green;border-radius:50px'>";
            echo $registro[0].'<br>';
            echo '<H1>'.$registro[1].'</H1><br>';
            echo $registro[2].'<br>';
            echo $registro[3].'<br>';
            echo $registro[4].'<br>';
            echo $registro[5].'<br>';
            echo $registro[6].'<br>';
            echo $registro[7].'<br>';
            echo $registro[8].'<br>';
            echo '</div>';
        }
        mysqli_free_result($resultado);
    };
    mysqli_close($conex);
    echo "</div>";
?>