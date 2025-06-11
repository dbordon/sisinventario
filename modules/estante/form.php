
<?php 
    if($_GET['form']=='add'){ ?>
      <section class="content-header">
      <h1>
        <i class="fa fa-edit icon-title">Agregar Estante</i>
      </h1>
      <ol class="breadcrumb">
        <li><a href="?module=start"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="?module=estante"> Estante</a></li>
        <li class="active">Agregar</li>
      </ol>
      </section>      

      <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <form role="form" class="form-horizontal" action="modules/estante/proses.php?act=insert" method="POST">
                        <div class="box-body">
                            <?php
                            //Método para generar código
                                $query_id = mysqli_query($mysqli, "SELECT MAX(cod_estante) as id FROM estante")
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
    <label class="col-sm-2 control-label">Depósito</label>
    <div class="col-sm-5">
        <select class="chosen-select" name="deposito" data-placeholder="--Seleccionar Depósito--" required onchange="cargarSecciones(this.value)">
            <option value=""></option>
            <?php 
                $query_deposito = mysqli_query($mysqli, "SELECT cod_deposito, descrip FROM deposito") or die('Error '.mysqli_error($mysqli));
                while ($data_deposito = mysqli_fetch_assoc($query_deposito)){
                    echo "<option value=\"$data_deposito[cod_deposito]\">$data_deposito[descrip]</option>"; 
                }
            ?>
        </select>
    </div>
</div>

<!-- Combo buscador de Sección (vacío inicialmente) -->
<div class="form-group">
    <label class="col-sm-2 control-label">Sección</label>
    <div class="col-sm-5">
        <select id="seccion" class="chosen-select" name="seccion" data-placeholder="--Seleccionar Sección--" required>
            <option value=""></option>
        </select>
    </div>
</div>


<script>
function cargarSecciones(depositoId) {
   // console.log("ID de depósito seleccionado:", depositoId);
    if (depositoId) {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "http://localhost/sisinventario/modules/estante/cargar_seccion.php?cod_deposito=" + depositoId, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
              //  console.log("Respuesta de secciones:", xhr.responseText);
                document.getElementById("seccion").innerHTML = xhr.responseText;

                // Actualiza Chosen después de cargar las opciones
                $(".chosen-select").trigger("chosen:updated");
            }
        };
        xhr.send();
    } else {
        document.getElementById("seccion").innerHTML = "<option value=''>--Seleccionar Sección--</option>";
        $(".chosen-select").trigger("chosen:updated");
    }
}


</script>


   

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Descripción</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="descrip_estante" pleaceholder="Ingresa un estante" required>
                                </div>
                            </div>

                            <div class="box-footer">
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <input type="submit" class="btn btn-primary btn-submit" name="Guardar" value="Guardar">
                                        <a href="?module=estante" class="btn btn-default btn-reset">Cancelar</a>
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
          $query = mysqli_query($mysqli, "SELECT cod_estante, descrip_estante, sec.cod_seccion, sec.descrip_seccion, dep.cod_deposito, dep.descrip
FROM estante es, seccion sec, deposito dep 
WHERE es.cod_seccion =  sec.cod_seccion
AND  sec.cod_deposito = dep.cod_deposito AND cod_estante= '$_GET[id]'")
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
                    <form role="form" class="form-horizontal" action="modules/estante/proses.php?act=update" method="POST">
                        <div class="box-body">
                       
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Código</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="codigo" value="<?php echo $data['cod_estante']; ?>" readonly>
                                </div>
                            </div>

                           
                             <!-- Combo buscador de Depósito -->
<div class="form-group">
    <label class="col-sm-2 control-label">Depósito</label>
    <div class="col-sm-5">
        <select class="chosen-select" name="deposito" data-placeholder="--Seleccionar Depósito--" required onchange="cargarSecciones(this.value)">
            <option value="<?php echo $data['cod_deposito']; ?>"><?php echo $data['descrip']; ?></option>
            <?php 
                $query_deposito = mysqli_query($mysqli, "SELECT cod_deposito, descrip FROM deposito") or die('Error '.mysqli_error($mysqli));
                while ($data_deposito = mysqli_fetch_assoc($query_deposito)){
                    echo "<option value=\"$data_deposito[cod_deposito]\">$data_deposito[descrip]</option>"; 
                }
            ?>
        </select>
    </div>
</div>

<!-- Combo buscador de Sección (vacío inicialmente) -->
<div class="form-group">
    <label class="col-sm-2 control-label">Sección</label>
    <div class="col-sm-5">
        <select id="seccion" class="chosen-select" name="seccion" data-placeholder="--Seleccionar Sección--" required>
            <option value="<?php echo $data['cod_seccion'];?>"><?php echo $data['descrip_seccion'];?></option>
        </select>
    </div>
</div>


<script>
function cargarSecciones(depositoId) {
   // console.log("ID de depósito seleccionado:", depositoId);
    if (depositoId) {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "http://localhost/sysweb/modules/estante/cargar_seccion.php?cod_deposito=" + depositoId, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
              //  console.log("Respuesta de secciones:", xhr.responseText);
                document.getElementById("seccion").innerHTML = xhr.responseText;

                // Actualiza Chosen después de cargar las opciones
                $(".chosen-select").trigger("chosen:updated");
            }
        };
        xhr.send();
    } else {
        document.getElementById("seccion").innerHTML = "<option value=''>--Seleccionar Sección--</option>";
        $(".chosen-select").trigger("chosen:updated");
    }
}


</script>


   

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Descripción</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="descrip_estante" pleaceholder="Ingresa un estante" required value="<?php echo $data['descrip_estante'] ?>"> 
                                    
                                </div>
                            </div>



                            <div class="box-footer">
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <input type="submit" class="btn btn-primary btn-submit" name="Guardar" value="Guardar">
                                        <a href="?module=estante" class="btn btn-default btn-reset">Cancelar</a>
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

