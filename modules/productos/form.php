
<?php 
    if($_GET['form']=='add'){ ?>
      <section class="content-header">
      <h1>
        <i class="fa fa-edit icon-title">Agregar Productos</i>
      </h1>
      <ol class="breadcrumb">
        <li><a href="?module=start"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="?module=productos"> Estante</a></li>
        <li class="active">Agregar</li>
      </ol>
      </section>      

      <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <form role="form" class="form-horizontal" action="modules/productos/proses.php?act=insert" method="POST">
                        <div class="box-body">
                            <?php
                            //Método para generar código
                                $query_id = mysqli_query($mysqli, "SELECT MAX(cod_producto) as id FROM producto")
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
                                    <!-- Combo buscador de Depósito -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Tipo de producto</label>
                                <div class="col-sm-5">
                                    <select class="chosen-select" name="t_producto" data-placeholder="--Seleccionar tipo producto--" required >
                                        <option value=""></option>
                                        <?php 
                                            $query_deposito = mysqli_query($mysqli, "SELECT * FROM tipo_producto") or die('Error '.mysqli_error($mysqli));
                                            while ($data_deposito = mysqli_fetch_assoc($query_deposito)){
                                                echo "<option value=\"$data_deposito[cod_tipo_prod]\">$data_deposito[t_p_descrip]</option>"; 
                                            }

                                        ?>
                                        <option value="">Seleccione un tipo de producto </option>
                                    </select>
                                </div>
                            </div>

                            <!-- Combo buscador de Sección (vacío inicialmente) -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Unidad de medida</label>
                                <div class="col-sm-5">
                                    <select class="chosen-select" name="u_medida" data-placeholder="--Seleccionar unidad de medida--" required >
                                        <option value=""></option>
                                        <?php 
                                            $query_deposito = mysqli_query($mysqli, "SELECT * FROM u_medida") or die('Error '.mysqli_error($mysqli));
                                            while ($data_deposito = mysqli_fetch_assoc($query_deposito)){
                                                echo "<option value=\"$data_deposito[id_u_medida]\">$data_deposito[u_descrip]</option>"; 
                                            }
                                        ?>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Código de producto</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="cproducto" pleaceholder="Ingresa un código de producto" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Producto</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="p_descrip" pleaceholder="Ingresa un producto" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Precio</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="precio" pleaceholder="Ingresa un precio" required>
                                </div>
                            </div>

                            <div class="box-footer">
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <input type="submit" class="btn btn-primary btn-submit" name="Guardar" value="Guardar">
                                        <a href="?module=productos" class="btn btn-default btn-reset">Cancelar</a>
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
          $query = mysqli_query($mysqli, "SELECT cod_producto, tp.cod_tipo_prod, t_p_descrip, um.id_u_medida, u_descrip, p_descrip, precio, cproducto
FROM	producto p, tipo_producto tp, u_medida um
WHERE p.cod_tipo_prod=tp.cod_tipo_prod
AND p.id_u_medida=um.id_u_medida AND cod_producto= '$_GET[id]'")
                                                    or die('Error'.mysqli_error($mysqli));
          $data = mysqli_fetch_assoc($query);                                          
      }?> 
    <section class="content-header">
      <h1>
        <i class="fa fa-edit icon-title">Modificar Estante</i>
      </h1>
      <ol class="breadcrumb">
        <li><a href="?module=start"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="?module=estante"> Estante</a></li>
        <li class="active">Modificar</li>
      </ol>
    </section>  
    
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <form role="form" class="form-horizontal" action="modules/productos/proses.php?act=update" method="POST">
                        <div class="box-body">
                       
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Código</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="codigo" value="<?php echo $data['cod_producto']; ?>" readonly>
                                </div>
                            </div>

                           
                            <!-- Combo buscador de Depósito -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Tipo de producto</label>
                                <div class="col-sm-5">
                                    <select class="chosen-select" name="t_producto" data-placeholder="--Seleccionar tipo producto--" required >
                                        <option value="<?php echo $data['cod_tipo_prod']; ?>"><?php echo $data['t_p_descrip']; ?></option>
                                        <?php 
                                            $query_deposito = mysqli_query($mysqli, "SELECT * FROM tipo_producto") or die('Error '.mysqli_error($mysqli));
                                            while ($data_deposito = mysqli_fetch_assoc($query_deposito)){
                                                echo "<option value=\"$data_deposito[cod_tipo_prod]\">$data_deposito[t_p_descrip]</option>"; 
                                            }
                                        ?>
                                    </select>
                                </div>
                            </div>

                            <!-- Combo buscador de Sección (vacío inicialmente) -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Unidad de medida</label>
                                <div class="col-sm-5">
                                    <select class="chosen-select" name="u_medida" data-placeholder="--Seleccionar unidad de medida--" required >
                                        <option value="<?php echo $data['id_u_medida']; ?>"><?php echo $data['u_descrip']; ?></option>
                                        <?php 
                                            $query_deposito = mysqli_query($mysqli, "SELECT * FROM u_medida") or die('Error '.mysqli_error($mysqli));
                                            while ($data_deposito = mysqli_fetch_assoc($query_deposito)){
                                                echo "<option value=\"$data_deposito[id_u_medida]\">$data_deposito[u_descrip]</option>"; 
                                            }
                                        ?>
                                    </select>
                                </div>
                            </div>   

                             <div class="form-group">
                                <label class="col-sm-2 control-label">Código de Producto</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="cproducto" pleaceholder="Ingresa un producto" required value="<?php echo $data['cproducto']; ?>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Producto</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="p_descrip" pleaceholder="Ingresa un producto" required value="<?php echo $data['p_descrip']; ?>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Precio</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="precio" pleaceholder="Ingresa un precio" required value="<?php echo $data['precio']; ?>">
                                </div>
                            </div>

                            

                            <div class="box-footer">
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <input type="submit" class="btn btn-primary btn-submit" name="Guardar" value="Guardar">
                                        <a href="?module=productos" class="btn btn-default btn-reset">Cancelar</a>
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

