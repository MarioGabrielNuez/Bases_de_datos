<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- BootStrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>        
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <!-- Fin BootStrap -->
    <title>Document</title>
</head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-6">
                    <form action="post.php" enctype="multipart/form-data" method="POST">
                        <div class="alert alert-primary">
                            <label for="formFile" class="form-label">Subir archivo</label>
                            <input name="file" class="form-control" type="file" accept="image/jpg,image/png,image/gif" id="formFile">
                        </div>
                        <button type="submit" class="btn btn-primary">Subir</button>
                        <button type="submit" class="btn btn-secondary">Reset</button>
                    </form>
                </div>
                <div class="col-6">
                    
                </div>
                <div class="col-3">
                    
                </div>
            </div>
            <div class="row">
                <?php
                    $dir = "./res/files";
                    $rdir = opendir($dir); //opendir($dir) abre y lee el directorio
                    
                    while($file=readdir($rdir)){
                        if($file == "." || $file == ".."){
                            echo " ";
                        } else {
                            $fileArr[] = $file;
                        }
                    }

                    sort($fileArr, SORT_NATURAL | SORT_FLAG_CASE);

                    foreach($fileArr as $file){
                        $fileName = pathinfo($file, PATHINFO_FILENAME);
                        echo "<div style='width:150px;height: 150px;float:left;margin:0.2cm;'>
                                <img src='".$dir."/".$file."' title='".$fileName."' style='width:100%;height:100%'>
                              </div>
                        ";
                    }
                ?>
            </div>
        </div>
    </body>
</html>