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
            $seccion = $_POST['seccion'];
            $estante = $_POST['descrip_estante'];

            $query = mysqli_query($mysqli, "INSERT INTO estante (cod_estante, cod_seccion, descrip_estante)
            VALUES ($codigo, $seccion, '$estante')") or die('Error'.mysqli_error($mysqli));
            
            if($query){
                header("Location: ../../main.php?module=estante&alert=1");
            } else {
                header("Location: ../../main.php?module=estante&alert=4");
            }

        }
    }
    elseif($_GET['act']=='update'){
        if(isset($_POST['Guardar'])){
            if(isset($_POST['codigo'])){
                $codigo = $_POST['codigo'];
                $seccion = $_POST['seccion'];
                $estante = $_POST['descrip_estante'];
                
                $query = mysqli_query($mysqli, "UPDATE estante SET descrip_estante = '$estante',
                                                                    cod_seccion = $seccion
                                                                    WHERE cod_estante = $codigo")
                                                                    or die('Error'.mysqli_error($mysqli));

                if($query){
                header("Location: ../../main.php?module=estante&alert=2");
                } else {
                header("Location: ../../main.php?module=estante&alert=4");
                }                                                    
            }
        }

    }
    elseif($_GET['act']=='delete'){
        if(isset($_GET['cod_estante'])){
            $codigo = $_GET['cod_estante'];

            $query = mysqli_query($mysqli, "DELETE FROM estante
                                            WHERE cod_estante = $codigo")
                                            or die('Error'.mysqli_error($mysqli));
            if($query){
                header("Location: ../../main.php?module=estante&alert=3");
            } else {
                header("Location: ../../main.php?module=estante&alert=4");
            }
        }
    }


}

?>