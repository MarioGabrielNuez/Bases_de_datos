
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
    <div class="container" style="width:80vw;margin:0 auto">
        <div class="row">
            <div class="col-3">

            </div>
            <div class="col-6">
                <form action="subirarchi.php" enctype="multipart/form-data">
                    <div class="mb-3">
                        <div for="exampleInputEmail1" class="alert alert-primary">Seleciona un archivo</label>
                        <input type="file" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="errase" class="btn btn-primary">Borrar</button>
                </form>
            </div>
             <div class="col-3">
                
            </div>
        </div>
        <div class="row">
            <?php

            $directorio = "./archivos";
            $rdir = opendir($directorio);

            while ($archivo = readdir($rdir)) {
                if ($archivo == "." || $archivo == "..") {
                    echo " ";
                } else {
                    $archivos[] = $archivo;
                }
            }
            sort($archivos, SORT_NATURAL | SORT_FLAG_CASE);

            foreach ($archivos as $archivo) {

                //$extension = pathinfo($archivo, PATHINFO_EXTENSION);
                //$nombre = basename($archivo,'.',$extension);
            // $filename = pathinfo($archivo, PATHINFO_FILENAME);

                echo "  
                        <head>
                            <style>
                                
                                #move{
                                    position: sticky;
                                    overflow: hidden;
                                    transition: 1s; 
                                    width:150px;
                                    height:150px;
                                    float:left;
                                    margin:0.2cm;
                                    box-shadow: 2px 2px 2px;
                                }

                                #move:hover{
                                    width:250px;
                                    height:250px;
                                }
                                img{
                                    position:absolute;
                                    display: flex;
                                    flex-wrap: wrap;
                                }


                            </style>


                        </head>
                        <body>


                        </body>

                        <div id='move'>
                            <img src='".$directorio.'/'.$archivo."' style='width:100%;height:100%;'>
                        </div>
                    ";
            }
            ?>
        </div>
    </div>
</body>
</html>

