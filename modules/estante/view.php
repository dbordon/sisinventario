<section class="content-header">
<ol class="breadcrumb">
    <li><a href="?module=start"><i class="fa fa-home"></i>Inicio</a></li>
    <li class="active"><a href="?module=estante">Estante</a></li>
</ol><br><hr>
<h1>
    <i class="fa fa-folder icon-title"></i>Datos de Estante
    <a class="btn btn-primary btn-social pull-right" href="?module=form_estante&form=add" title="Agregar" data-toggle="tooltip">
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
                echo "<div class='alert alert-success alert-dismissable'>
                <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                <h4>  <i class='icon fa fa-check-circle'></i> Exitoso!</h4>
                Datos Modificados correctamente
                </div>";
            }
            elseif($_GET['alert']==3){
                echo "<div class='alert alert-success alert-dismissable'>
                <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                <h4>  <i class='icon fa fa-check-circle'></i> Exitoso!</h4>
                Datos Eliminados correctamente
                </div>";
            }
            elseif($_GET['alert']==4){
                echo "<div class='alert alert-danger alert-dismissable'>
                <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                <h4>  <i class='icon fa fa-check-circle'></i> Error!</h4>
                No se pudo realizar la operación
                </div>";
            }
            ?>

            <div class="box box-primary">
                <div class="box-body">
                <section class="content-header">
                    <a class="btn btn-warning btn-social pull-right" href="modules/estante/print.php" target="_blank">
                    <i class="fa fa-print"></i>Imprimir Reporte
                    </a>
                </section>
                    <table id="dataTables1" class="table table-bordered table-striped table-hover">
                        <h2>Lista de Estantes</h2>
                        <thead>
                            <tr>
                                <th class="center">Código</th>
                                <th class="center">Depósito</th>
                                <th class="center">Sección</th>
                                <th class="center">Estante</th>
                                <th class="center">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            $nro=1;
                            $query = mysqli_query($mysqli, "SELECT cod_estante, descrip_estante, sec.cod_seccion, sec.descrip_seccion, dep.cod_deposito, dep.descrip
                                                    FROM estante es, seccion sec, deposito dep 
                                                    WHERE es.cod_seccion =  sec.cod_seccion
                                                    AND  sec.cod_deposito = dep.cod_deposito")
                            or die('Error'.mysqli_error($mysqli));

                            while($data = mysqli_fetch_assoc($query)){
                               $cod_estante = $data['cod_estante'];
                               $descrip = $data['descrip'];
                               $descrip_seccion = $data['descrip_seccion'];
                               $descrip_estante = $data['descrip_estante'];

                               echo "<tr>
                               <td class='center'>$cod_estante</td>
                               <td class='center'>$descrip</td>
                               <td class='center'>$descrip_seccion</td>
                               <td class='center'>$descrip_estante</td>

                               <td class='center' width='80'>
                               <div>
                               <a data-toggle='tooltip' data-placement='top' title='Modificar datos de Ciudad' style='margin-right:5px' 
                               class='btn btn-primary btn-sm' href='?module=form_estante&form=edit&id=$data[cod_estante]'>
                                    <i class='glyphicon glyphicon-edit' style='color:#fff'></i> </a>";
                                ?>
                                <a data-toggle="tooltip" data-data-placement="top" title="Eliminar datos" class="btn btn-danger btn-sm" 
                                href="modules/estante/proses.php?act=delete&cod_estante=<?php echo $data['cod_estante']; ?>"
                                onclick="return confirm('¿Estás seguro/a de eliminar <?php echo $data['descrip_estante']; ?>?')">
                                    <i class="glyphicon glyphicon-trash"></i>
                                </a>
                                <?php 
                                echo "</div>
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