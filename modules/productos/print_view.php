<?php 
require_once "../../config/database.php";

$query = mysqli_query($mysqli, "SELECT cod_estante, descrip_estante, sec.cod_seccion, sec.descrip_seccion, dep.cod_deposito, dep.descrip
FROM estante es, seccion sec, deposito dep 
WHERE es.cod_seccion =  sec.cod_seccion
AND  sec.cod_deposito = dep.cod_deposito")
    or die('Error'.mysqli_error($mysqli));

$count = mysqli_num_rows($query);    
?>

<!DOCTYPE HTML>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Reporte de Ciudad</title>
        <link rel="stylesheet" type="text/css" href="../../assets/img/favicon.ico">
    </head>
    <body>
        <div align="center">
            <img src="../../images/asuncion.jpg">
        </div>
        <div>
            Reporte de Estantes
        </div>
        <div align="center">
            Cantidad: <?php echo $count; ?>
        </div>
        <hr>
        <div id="tabla">
        <table width="100%" border="0.3" cellpadding="0" cellspacing="0" align="center">
                <thead style="background:#e8ecee">
                    <tr class="table-title">
                        <th height="20" align="center" valign="middle"><small>Código</small></th>
                        <th height="30" align="center" valign="middle"><small>Deposito</small></th>                      
                        <th height="30" align="center" valign="middle"><small>Seccion</small></th>
                        <th height="30" align="center" valign="middle"><small>Estante</small></th>                      
                      
                    </tr>
                </thead>
                <tbody>
                <?php
                    while ($data = mysqli_fetch_assoc($query)){
                        $codigo = $data['cod_estante'];
                        $descrip_deposito = $data['descrip'];
                        $descrip_seccion = $data['descrip_seccion'];
                        $descrip_estante = $data['descrip_estante'];

                        echo "<tr>
                        <td width='100' align='left'>$codigo</td>
                        <td width='150' align='left'>$descrip_deposito</td>
                        <td width='150' align='left'>$descrip_seccion</td>
                        <td width='150' align='left'>$descrip_estante</td>

                        </tr>";
                    }
                ?>
                </tbody>
            </table>
        </div>
    </body>
</html>