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
            $descrip = $_POST['descrip'];
            $direccion = $_POST['direccion'];


            $query = mysqli_query($mysqli, "INSERT INTO deposito (cod_deposito,  descrip, direccion)
            VALUES ($codigo, '$descrip', '$direccion')") or die('Error'.mysqli_error($mysqli));
            
            if($query){
                header("Location: ../../main.php?module=deposito&alert=1");
            } else {
                header("Location: ../../main.php?module=deposito&alert=4");
            }

        }
    }
    elseif($_GET['act']=='update'){
        if(isset($_POST['Guardar'])){
            if(isset($_POST['codigo'])){
                $codigo = $_POST['codigo'];
                $descrip = $_POST['descrip'];
                $direccion = $_POST['direccion'];

                $query = mysqli_query($mysqli, "UPDATE deposito SET descrip = '$descrip', direccion ='$direccion'
                                                                    WHERE cod_deposito = $codigo")
                                                                    or die('Error'.mysqli_error($mysqli));

                if($query){
                header("Location: ../../main.php?module=deposito&alert=2");
                } else {
                header("Location: ../../main.php?module=deposito&alert=4");
                }                                                    
            }
        }

    }
    elseif($_GET['act']=='delete'){
        if(isset($_GET['cod_deposito'])){
            $codigo = $_GET['cod_deposito'];

            $query = mysqli_query($mysqli, "DELETE FROM deposito
                                            WHERE cod_deposito = $codigo")
                                            or die('Error'.mysqli_error($mysqli));
            if($query){
                header("Location: ../../main.php?module=deposito&alert=3");
            } else {
                header("Location: ../../main.php?module=deposito&alert=4");
            }
        }
    }


}

?>