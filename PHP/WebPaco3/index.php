<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        body{
            background: lightgray;
        }
        .container{
            margin-top: 5vw;
            width:50vw;
        }
    </style>
    <title>Document</title>
</head>
<body>
    <div class="container" id="contenedor">
        <form method="POST" action="post.php">
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" class="form-control" id="textInput" name="nom" required placeholder="Pon tu nombre">
            </div>
            <div class="mb-3">
                <label for="apellidos" class="form-label">Apellidos</label>
                <input type="text" class="form-control" id="textInput" name="apel" required placeholder="Pon tus Apellidos">
            </div>
            <div class="mb-3">
                <label for="fnacim" class="form-label">Apellidos</label>
                <input type="date" class="form-control" id="dateInput" name="fnacim" required placeholder="Pon tus Apellidos">
            </div>
            <div class="mb-3">
                <label for="colorInput" class="form-label">Color Favorito</label>
                <input type="color" class="form-control form-control-color" id="colorInput" name="color" required value="#563d7c" title="escoje un color">
            </div>
            <button type="submit" class="btn btn-dark">Insertar</button>
        </form>
    </div>
</body>
</html>