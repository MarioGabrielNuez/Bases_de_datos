<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <title>INSERCIONES</title>
    <style>

    </style>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col">
                <form action="insertar.php" method="POST">
                    <div class="mb-3">
                        <label class="form-label">Nombre</label>
                        <input type="text" class="form-control" required placeholder="Pon tu nombre" name="nom">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Apellidos</label>
                        <input type="text" class="form-control" required placeholder="Tus apellidos" name="apel">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Fecha nacimiento</label>
                        <input type="date" class="form-control" required placeholder="Fecha" name="fecha">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Color favorito</label>
                        <input type="color" class="form-control" name="color">
                    </div>          
                    <button type="submit" class="btn btn-primary">Insertar</button>
                    <button type="reset" class="btn btn-secondary">Borrar</button>                </form>
            </div>
            <div class="col">
                <p>Este formulario es una prueba de inserción en la base de datos</p>
            </div>
        </div>
     </div>
</body>

</html>