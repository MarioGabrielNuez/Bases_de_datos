<?php
    class ciudadano
    {
        public function __construct() {
            $nombre; 
            $sexo;
            $dni;
            $direccion;
            $residencia;
            $cp;
        }
    }

    class policia extends ciudadano
    {
        public function __construct() {
            $numPlaca; 
            $categoria;
            $departato;
            $distrito;
            $comisaria;
        }
    }
    
    class tendero extends ciudadano
    {
        public function __construct() {
            $numLicencia; 
            $apendiceRegistrado;
        }
    }

    class concejal extends ciudadano
    {
        public function __construct() {
            $numeroEscaño; 
            $partido;
        }
    }
?>