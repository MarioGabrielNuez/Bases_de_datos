<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        //comentario de linea
        
        /*
        comentario multilinea
        */

        //Variable
        $varInsert = "variable insertada en una cadena de texto";

        //variable insertada en una cadena texto
        $contenido = "<del>Mundo $varInsert</del>";
        
        //mostrar
        echo "<h2>hola</h2>";

        //mostrar con variable
        echo "<h1>Hola ".$contenido." </h1>";

        //mostrar lista
        echo "<ul>"
            ."<li>LOL</li>"
            ."<li>hola</li>"
            ."<li>LOL</li>"
            ."</ul>";

        /*
        El punto "." concatena
        */
        
        //tipos de variable 
        $var1 = true; //boolean
        $var2 = 3.45; //double
        $var3 = 3; //Integer
        $var3 = 3; //Integer

        //mostrar tipo variable
        echo gettype($var1)."</br>";
        echo gettype($var2)."</br>";

        //array
        $alumnos[] = "angela";
        $alumnos[] = "sheyla";

        //mosrtrar array
        var_dump($alumnos);

        //constante
        define('usuario', 'miguelito@miguel.mi');

        //mostrar constante
        echo "</br>".usuario."</br>";

        //constante predefinida
        echo PHP_OS."</br>";

        //operadores
        echo (4%2)."</br>";
        echo $var3++."</br>";
        echo $var3--."</br>";
        echo ($var3++)."</br>";
        echo ($var3--)."</br>";
        echo (4+2)."</br>";
        echo (4-2)."</br>";
        echo ($var3/=3)."</br>";

        //variables SUPER GLOBALES globales
        echo $_SERVER['SERVER_SOFTWARE']; //$SUPER GLOBAL["CONSTANTE SUPER GLOBAL"] 
    ?>
</body>
</html>