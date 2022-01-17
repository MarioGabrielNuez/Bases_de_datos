<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Mario Gabriel Núñez Alcázar de Velasco">
    <title>Formulario</title>
</head>
<body>
    <!--creamos formulario con metodo 'POST' enviar y acion llamada a ./recibir.php -->
    <form method="POST" action="recibir.php">
        <p>
            <label for="nombre">nombre</label>
            <input type="text" name="nombre">
        </p>
        <p>
            <label for="apellidos">apellidos</label>
            <input type="text" name="apellidos">
        </p>
        <p>
            <label for="fecha">nacimiento</label>
            <input type="date" name="fecha">
        </p>
        <p>
            <label for="color">color</label>
            <input type="color" name="color">
        </p>
        <p>
            <label for="ancho">ancho</label>
            <input type="number" name="ancho">
        </p>
        <input type="submit" value="REGISTRO">
        <input type="reset" value="BORRAR">
    </form>
</body>
</html>