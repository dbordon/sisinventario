<section class="content-header">
<ol class="breadcrumb">
    <li><a href="?module=start"><i class="fa fa-home"></i>Inicio</a></li>
    <li class="active"><a href="?module=Ventas">Compras</a></li>
</ol><br><hr>
<h1>
    <i class="fa fa-folder icon-title"></i>Datos de Ventas
    <a class="btn btn-primary btn-social pull-right" href="?module=form_ventas&form=add" title="Agregar" data-toggle="tooltip">
        <i class="fa fa-plus"></i>Agregar
    </a>
</h1>
</section>

<section class="content">
    <div class="row">
        <div class="col-md-12">
            <?php 
            if(empty($_GET['alert'])){
                echo "";
            }
            elseif($_GET['alert']==1){
                echo "<div class='alert alert-success alert-dismissable'>
                <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                <h4>  <i class='icon fa fa-check-circle'></i> Exitoso!</h4>
                Datos registrados correctamente
                </div>";
            }
        
           
            elseif($_GET['alert']==2){
                echo "<div class='alert alert-danger alert-dismissable'>
                <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                <h4>  <i class='icon fa fa-check-circle'></i> Exitoso!</h4>
                Datos anulados correctamente
                </div>";
            }

            elseif($_GET['alert']==3){
                echo "<div class='alert alert-danger alert-dismissable'>
                <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                <h4>  <i class='icon fa fa-check-circle'></i> Error!</h4>
                No se puedo realizar la acción
                </div>";
            }
            ?>

            <div class="box box-primary">
                <div class="box-body">
                <section class="content-header">
                 
                </section>
                    <table id="dataTables1" class="table table-bordered table-striped table-hover">
                        <h2>Lista de Ventas</h2>
                        <thead>
                            <tr>
                                <th class="center">Id</th>
                                <th class="center">Clientes</th>
                                <th class="center">Deposito</th>
                                <th class="center">N° Fact.</th>
                                <th class="center">Fecha</th>
                                <th class="center">Hora</th>
                                <th class="center">Total</th>                                
                                <th class="center">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            $nro=1;
                            $query = mysqli_query($mysqli, "SELECT * FROM v_ventas WHERE estado='activo'")
                            or die('Error'.mysqli_error($mysqli));

                            while($data = mysqli_fetch_assoc($query)){
                               $cod = $data['cod_venta'];
                               $cli_nombre = $data['cli_nombre'];
                               $cli_apellido = $data['cli_apellido'];
                               $deposito = $data['descrip'];
                               $nro_factura = $data['nro_factura'];
                               $fecha = $data['fecha'];
                               $hora = $data['hora'];
                               $total_compra = $data['total_venta'];


                               echo "<tr>
                               <td class='center'>$cod</td>
                               <td class='center'>$cli_nombre</td>
                               <td class='center'>$cli_apellido</td>
                               <td class='center'> $deposito</td>
                               <td class='center'>$nro_factura</td>
                               <td class='center'>$fecha</td>
                               <td class='center'>$hora</td>
                               <td class='center'>$total_compra</td>                               
                               <td class='center' width='80'>
                               <div>";?>
                               <a data-toggle="tooltip" data-placement="top" title="Anular Venta" class="btn btn-danger btn-sm"
                                href="modules/ventas/proses.php?act=anular&cod_venta=<?php echo $data['cod_venta']; ?>"
                                onclick ="return confirm('Estás seguro/a de anular la factura <?php echo $data['nro_factura']; ?>?');">
                                    <i style="color:#000" class="glyphicon glyphicon-trash"></i>
                                </a>

                                <a data-toggle="tooltip" data-placement="top" title="Imprimir factura de compra" class="btn btn-warning btn-sm" 
                                href="modules/ventas/print.php?act=imprimir&cod_venta=<?php echo $data['cod_venta']; ?>" target="_blank">
                                    <i style="color:#000" class="fa fa-print"></i>
                                </a>
                                <?php echo "</div>
                                </td>
                                </tr>" ?>
                            <?php }                               
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</section>