<?php
    $file = $_FILES['file'];
    $name = $file['name'];

    move_uploaded_file($file['tmp_name'], './res/files/'.$name);
    
    echo '<center><h2>EL FICHERO SE HA SUBIDO CORRECTAMENTE</h2></center>';
    header("refresh:15;URL=index.php");
?>