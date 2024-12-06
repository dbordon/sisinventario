<?php 
session_start();

require_once '../../config/database.php';

if(empty($_SESSION['username']) && empty($_SESSION['password'])){
    echo "<meta http-equiv='refresh' content='0; url=index.php?alert=alert=3'>";
}
else{
    if($_GET['act']=='update'){
        if(isset($_POST['Guardar'])){
            //Cabecera
            $fecha = $_POST['fecha'];
            $hora = $_POST['hora'];   
            $user=$_POST['user'];

            $deposito= $_POST['deposito'];
            $seccion = $_POST['seccion'];
            $estante = $_POST['estante'];
            $producto=$_POST['producto'];
            $cantidad=$_POST['cantidad'];
            //actualizar
            $query = mysqli_query($mysqli, "UPDATE stock SET cod_deposito = $deposito,
                                                            cod_producto = $producto,
                                                            cantidad = $cantidad,
                                                            cod_seccion = $seccion,
                                                            cod_estante = $estante,
                                                            id_user = $user WHERE cod_producto=$producto")
            or die('Error'.mysqli_error($mysqli));

            echo $query;

            if($query){
                header("Location: ../../main.php?module=movimientos&alert=1");
            } else {
                header("Location: ../../main.php?module=movimientos&alert=3");
            }
        }
    }

   
}
?>