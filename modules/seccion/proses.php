<?php 

session_start();
require_once "../../config/database.php";

if(empty($_SESSION['username']) && empty($_SESSION['password'])){
    echo "<meta http-equiv='refresh' content='0; url=index.php?alert=alert=3>";
}
else {
    if($_GET['act']=='insert'){
        if(isset($_POST['Guardar'])){
            $codigo = $_POST['codigo'];
            $deposito = $_POST['deposito'];
            $descrip_seccion = $_POST['descrip_seccion'];

            $query = mysqli_query($mysqli, "INSERT INTO seccion (cod_seccion, cod_deposito, descrip_seccion)
            VALUES ($codigo, $deposito, '$descrip_seccion')") or die('Error'.mysqli_error($mysqli));
            
            if($query){
                header("Location: ../../main.php?module=seccion&alert=1");
            } else {
                header("Location: ../../main.php?module=seccion&alert=4");
            }

        }
    }
    elseif($_GET['act']=='update'){
        if(isset($_POST['Guardar'])){
            if(isset($_POST['codigo'])){
                $codigo = $_POST['codigo'];
                $deposito = $_POST['cod_deposito'];
                $descrip_seccion = $_POST['descrip_seccion'];
                
                $query = mysqli_query($mysqli, "UPDATE seccion SET descrip_seccion = '$descrip_seccion',
                                                                    cod_deposito = $deposito
                                                                    WHERE cod_seccion = $codigo")
                                                                    or die('Error'.mysqli_error($mysqli));

                if($query){
                header("Location: ../../main.php?module=seccion&alert=2");
                } else {
                header("Location: ../../main.php?module=seccion&alert=4");
                }                                                    
            }
        }

    }
    elseif($_GET['act']=='delete'){
        if(isset($_GET['cod_seccion'])){
            $codigo = $_GET['cod_seccion'];

            $query = mysqli_query($mysqli, "DELETE FROM seccion
                                            WHERE cod_seccion = $codigo")
                                            or die('Error'.mysqli_error($mysqli));
            if($query){
                header("Location: ../../main.php?module=secccion&alert=3");
            } else {
                header("Location: ../../main.php?module=secccion&alert=4");
            }
        }
    }


}

?>