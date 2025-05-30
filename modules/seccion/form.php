<?php 
    if($_GET['form']=='add'){ ?>
      <section class="content-header">
      <h1>
        <i class="fa fa-edit icon-title">Agregar Sección</i>
      </h1>
      <ol class="breadcrumb">
        <li><a href="?module=start"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="?module=seccion"> Sección</a></li>
        <li class="active">Agregar</li>
      </ol>
      </section>      

      <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <form role="form" class="form-horizontal" action="modules/seccion/proses.php?act=insert" method="POST">
                        <div class="box-body">
                            <?php
                            //Método para generar código
                                $query_id = mysqli_query($mysqli, "SELECT MAX(cod_seccion) as id FROM seccion")
                                                        or die('Error'.mysqli_error($mysqli));

                                $count = mysqli_num_rows($query_id);  
                                if($count <> 0){
                                    $data_id = mysqli_fetch_assoc($query_id);
                                    $codigo = $data_id['id']+1;
                                } else{
                                    $codigo=1;
                                }                      
                            ?>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Código</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="codigo" value="<?php echo $codigo; ?>" readonly>
                                </div>
                            </div>
                                    <!-- Combo buscador -->
                                    <div class="form-group">
                                <label class="col-sm-2 control-label">Depósito</label>
                                <div class="col-sm-5">
                                    <select class="chosen-select" name="deposito" data-placeholder="--Seleccionar Depósito--" autocomplete="off" required>
                                        <option value=""></option>
                                        <?php 
                                            $query_ciu = mysqli_query($mysqli, "SELECT cod_deposito, descrip
                                            FROM deposito")
                                                                                        or die('Error'.mysqli_error($mysqli));
                                            while ($data_ciu = mysqli_fetch_assoc($query_ciu)){
                                                echo "<option value=\"$data_ciu[cod_deposito]\">$data_ciu[descrip]</option>"; 
                                            }
                                        ?>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Descripción</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="descrip_seccion" pleaceholder="Ingresa una sección" required>
                                </div>
                            </div>

                            <div class="box-footer">
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <input type="submit" class="btn btn-primary btn-submit" name="Guardar" value="Guardar">
                                        <a href="?module=seccion" class="btn btn-default btn-reset">Cancelar</a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
      
      </section>  

    <?php }
    elseif($_GET['form']=='edit'){
      if(isset($_GET['id'])){
          $query = mysqli_query($mysqli, "SELECT cod_seccion, descrip_seccion, dep.cod_deposito, dep.descrip
                                                    FROM seccion sec, deposito dep
                                                    WHERE sec.cod_deposito=dep.cod_deposito
                                                    AND cod_seccion = '$_GET[id]'")
                                                    or die('Error'.mysqli_error($mysqli));
          $data = mysqli_fetch_assoc($query);                                          
      }?> 
    <section class="content-header">
      <h1>
        <i class="fa fa-edit icon-title">Modificar Sección</i>
      </h1>
      <ol class="breadcrumb">
        <li><a href="?module=start"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="?module=seccion"> Sección</a></li>
        <li class="active">Modificar</li>
      </ol>
    </section>  
    
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <form role="form" class="form-horizontal" action="modules/seccion/proses.php?act=update" method="POST">
                        <div class="box-body">
                       
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Código</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="codigo" value="<?php echo $data['cod_seccion']; ?>" readonly>
                                </div>
                            </div>

                            <!-- Combo para seleccionar un departamento-->
                            </div>
                                    <!-- Combo buscador -->
                                    <div class="form-group">
                                <label class="col-sm-2 control-label">Depósito</label>
                                <div class="col-sm-5">
                                    <select class="chosen-select" name="cod_deposito" data-placeholder="--Seleccionar Depósito--" autocomplete="off" required>
                                        <option value="<?php echo $data['cod_deposito']; ?>"><?php echo $data['descrip']; ?></option>
                                        <?php 
                                            $query_ciu = mysqli_query($mysqli, "SELECT cod_deposito, descrip
                                            FROM deposito")
                                                                                        or die('Error'.mysqli_error($mysqli));
                                            while ($data_dep = mysqli_fetch_assoc($query_ciu)){
                                                echo "<option value=\"$data_dep[cod_deposito]\">$data_dep[descrip]</option>"; 
                                            }
                                        ?>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Descripción</label>
                                <div class="col-sm-5">
                                <input type="text" class="form-control" name="descrip_seccion"  value="<?php echo $data['descrip_seccion'];?>" required>
                                </div>
                            </div>            


                            <div class="box-footer">
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <input type="submit" class="btn btn-primary btn-submit" name="Guardar" value="Guardar">
                                        <a href="?module=seccion" class="btn btn-default btn-reset">Cancelar</a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
      
      </section>  

   <?php }

?>