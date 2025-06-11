<?php 
    require_once "../../config/database.php";
    if($_GET['act']=='imprimir'){
        if(isset($_GET['cod_venta'])){
            $codigo = $_GET['cod_venta'];
            //Cabecera de compra
            $cabecera_compra = mysqli_query($mysqli, "SELECT * FROM v_ventas WHERE cod_venta = $codigo")
                                                    or die('Error'.mysqli_error($mysqli));
                                                    while($data = mysqli_fetch_assoc($cabecera_compra)){
                                                        $cod = $data['cod_venta'];
                                                        $nombre = $data['cli_nombre'];
                                                        $apellido = $data['cli_apellido'];
                                                        $ci_ruc = $data['ci_ruc'];
                                                        $deposito = $data['descrip'];
                                                        $nro_factura = $data['nro_factura'];
                                                        $fecha = $data['fecha'];
                                                        $hora = $data['hora'];
                                                        $total_venta = $data['total_venta'];
                                                        $usuario = $data['name_user'];}
            //Detalle de compra
            $detalle_venta = mysqli_query($mysqli, "SELECT * FROM v_det_venta WHERE cod_venta =$codigo ")
                                                        or die('Error'.mysqli_error($mysqli));

        }
    }
?> 
<!DOCTYPE HTML>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title> Factura de Venta</title>
    </head>
    <body>
        <div align='center'>
            Registro de factura de Venta<br>
            <label><strong>Cliente:</strong><?php echo $nombre.', '.$apellido.'-'.'CI:'.$ci_ruc; ?></label><br>
            <label><strong>Depósito:</strong><?php echo $deposito; ?></label><br>
            <label><strong>N° de Factura de Venta:</strong><?php echo $nro_factura; ?></label><br>
            <label><strong>Fecha:</strong><?php echo $fecha; ?></label><br>
            <label><strong>hora:</strong><?php echo $hora; ?></label><br>
        </div>
        <hr>
            <div>
                <table width="100%" border="0.3" cellpadding="0" cellspacing="0" align="center">
                    <thead style="background:#e8ecee">
                        <tr class="tabla-title">
                            <th height="20" align="center" valign="middle"><small>Tipo de Producto</small></th>
                            <th height="20" align="center" valign="middle"><small>Producto</small></th>
                            <th height="20" align="center" valign="middle"><small>Unidad de Medidaf</small></th>
                            <th height="20" align="center" valign="middle"><small>Precio</small></th>
                            <th height="20" align="center" valign="middle"><small>Cantidad</small></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                            while ($data2 = mysqli_fetch_assoc($detalle_venta)){
                                $t_p_descrip = $data2['t_p_descrip'];
                                $p_descrip = $data2['p_descrip'];
                                $u_medida = $data2['u_descrip'];
                                $precio = $data2['det_precio_unit'];
                                $cantidad = $data2['det_cantidad'];

                                echo "<tr>
                                        <td width='100' align='left'>$t_p_descrip</td>
                                        <td width='80' align='left'>$p_descrip</td>
                                        <td width='80' align='left'>$u_medida</td>
                                        <td width='80' align='left'>$precio</td>
                                        <td width='80' align='left'>$cantidad</td>
                                      </tr> ";
                            }                        
                            ?>
                    </tbody>
                </table>         
            </div>
            <hr>
            <div align='center'>
             <label> <strong>El total de la venta es: Gs. <?php echo number_format($total_venta); ?></strong></label> 
            </div>
    </body>
</html>
