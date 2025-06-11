<?php 
session_start();

require_once '../../config/database.php';

if(empty($_SESSION['username']) && empty($_SESSION['password'])){
    echo "<meta http-equiv='refresh' content='0; url=index.php?alert=alert=3'>";
}
else{
    if($_GET['act']=='insert'){
        if(isset($_POST['Guardar'])){
            $codigo = $_POST['codigo'];
            $codigo_deposito= $_POST['codigo_deposito'];
            //Insertar detalle de compra
            $sql=mysqli_query($mysqli, "SELECT * FROM producto, tmp WHERE producto.cod_producto=tmp.id_producto");
            while($row = mysqli_fetch_array($sql)){
                $codigo_producto= $row['id_producto'];
                $precio= $row['precio_tmp'];
                $cantidad= $row['cantidad_tmp'];
                $insert_detalle = mysqli_query($mysqli, "INSERT INTO det_venta (cod_producto, cod_venta, cod_deposito,
                det_precio_unit, det_cantidad) VALUES ($codigo_producto, $codigo, $codigo_deposito, $precio, $cantidad)")
                or die('Error'.mysqli_error($mysqli));

                //Insertar stock
                $query = mysqli_query($mysqli, "SELECT * FROM stock WHERE cod_producto=$codigo_producto
                AND cod_deposito=$codigo_deposito") 
                or die('Error'.mysqli_error($mysqli));
                if($count = mysqli_num_rows($query)==0){
                    //Insertar
                    $cod_seccion=1;
                    $cod_estante=1;
                    $insertar_stock = mysqli_query($mysqli, "INSERT INTO stock (cod_deposito, cod_producto, cantidad, cod_seccion, cod_estante)
                    VALUES ($codigo_deposito, $codigo_producto,$cantidad,$cod_seccion,$cod_estante )")
                    or die('Error'.mysqli_error($mysqli));
                }else {
                    $actualizar_stock = mysqli_query($mysqli, "UPDATE stock SET cantidad = cantidad - $cantidad
                    WHERE cod_producto=$codigo_producto
                    AND cod_deposito=$codigo_deposito ")
                    or die('Error'.mysqli_error($mysqli));
                }
            }
            //Insertar cabecera de compra
            //Definir variables
            $cod_venta = $_POST['codigo'];
            $id_cliente = $_POST['id_cliente'];
            $fecha = $_POST['fecha'];
            $hora = $_POST['hora'];
            $nro_factura = $_POST['nro_factura'];
            $suma_total=$_POST['suma_total'];
            $estado='activo';
           // $usuario = $_SESSION['id_user'];
            //insertar
            $query = mysqli_query($mysqli, "INSERT INTO venta (cod_venta, id_cliente, cod_deposito,
            nro_factura, fecha, hora, estado, total_venta)
            VALUES ($codigo, $id_cliente, $codigo_deposito,
            '$nro_factura', '$fecha', '$hora', '$estado', $suma_total)")
            or die('Error'.mysqli_error($mysqli));

            if($query){
                header("Location: ../../main.php?module=ventas&alert=1");
            } else {
                header("Location: ../../main.php?module=ventas&alert=3");
            }
        }
    }

    elseif($_GET['act']=='anular'){
        if(isset($_GET['cod_compra'])){
            $codigo = $_GET['cod_compra'];
            //Anular cabecera de compra (cambiar estado a anulado)
            $query = mysqli_query($mysqli, "UPDATE compra SET estado='anulado' WHERE cod_compra=$codigo")
            or die('Error'.mysqli_error($mysqli));

            //Consultar detalle de compra con el código que llegó por get
            $sql = mysqli_query($mysqli, "SELECT * FROM detalle_compra WHERE cod_compra=$codigo");
            while($row = mysqli_fetch_array($sql)){
                $codigo_producto = $row['cod_producto'];
                $codigo_deposito = $row['cod_deposito'];
                $cantidad = $row['cantidad'];

                $actualizar_stock = mysqli_query($mysqli, "UPDATE stock set cantidad = cantidad - $cantidad
                WHERE cod_producto=$codigo_producto
                AND cod_deposito=$codigo_deposito")
                or die('Error'.mysqli_error($mysqli));
            }
            if($query){
                header("Location: ../../main.php?module=compras&alert=2");
            } else {
                header("Location: ../../main.php?module=compras&alert=3");
            }
        }
    }
}
?>