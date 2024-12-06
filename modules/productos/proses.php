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
            $t_producto = $_POST['t_producto'];
            $u_medida = $_POST['u_medida'];
            $p_descrip = $_POST['p_descrip'];
            $precio = $_POST['precio'];

            $query = mysqli_query($mysqli, "INSERT INTO producto (cod_producto, cod_tipo_prod, id_u_medida, p_descrip, precio)
            VALUES ($codigo, $t_producto, $u_medida, '$p_descrip',$precio)") or die('Error'.mysqli_error($mysqli));
            
            if($query){
                header("Location: ../../main.php?module=productos&alert=1");
            } else {
                header("Location: ../../main.php?module=productos&alert=4");
            }

        }
    }
    elseif($_GET['act']=='update'){
        if(isset($_POST['Guardar'])){
            if(isset($_POST['codigo'])){
                $codigo = $_POST['codigo'];
                $t_producto = $_POST['t_producto'];
                $u_medida = $_POST['u_medida'];
                $p_descrip = $_POST['p_descrip'];
                $precio = $_POST['precio'];
                
                $query = mysqli_query($mysqli, "UPDATE producto SET p_descrip = '$p_descrip',
                                                                    precio = '$precio',
                                                                    cod_tipo_prod = $t_producto,
                                                                    id_u_medida = $u_medida
                                                                    WHERE cod_producto = $codigo")
                                                                    or die('Error'.mysqli_error($mysqli));

                if($query){
                header("Location: ../../main.php?module=productos&alert=2");
                } else {
                header("Location: ../../main.php?module=productos&alert=4");
                }                                                    
            }
        }

    }
    elseif($_GET['act']=='delete'){
        if(isset($_GET['cod_producto'])){
            $codigo = $_GET['cod_producto'];

            $query = mysqli_query($mysqli, "DELETE FROM producto
                                            WHERE cod_producto = $codigo")
                                            or die('Error'.mysqli_error($mysqli));
            if($query){
                header("Location: ../../main.php?module=productos&alert=3");
            } else {
                header("Location: ../../main.php?module=productos&alert=4");
            }
        }   
    }


}

?>