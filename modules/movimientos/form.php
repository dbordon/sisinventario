<?php 
    if($_GET['form']=='update'){ ?>
      <section class="content-header">
      <h1>
        <i class="fa fa-edit icon-title">Movimiento de artículos</i>
      </h1>
      <ol class="breadcrumb">
        <li><a href="?module=start"><i class="fa fa-home"></i>Inicio</a></li>
        <li><a href="?module=movimientos"> Movimiento</a></li>
        <li class="active">Establecer movimiento</li>
      </ol>
      </section>      

      <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <form role="form" class="form-horizontal" action="modules/movimientos/proses.php?act=update" method="POST">
                        <div class="box-body">
                        
                            <div class="form-group">
                              
                                <label class="col-sm-1 control-label">Fecha</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control date-picker" data-date-format="dd-mm-yyyy" name="fecha" autocomplete="of" 
                                    value="<?php echo date("yy-m-d"); ?>" readonly>
                                </div>

                                <label class="col-sm-1 control-label">Hora</label>
                                <div class="col-sm-2">
                                <input type="text" class="form-control date-picker" data-date-format="HH:mm:ss" name="hora" autocomplete="off" 
                                value="<?php echo date("H:i:s"); ?>" readonly>
                                </div>
                                <label class="col-sm-1 control-label">Usuario</label>
                                <div class="col-sm-2">
                                <input type="text" class="form-control " data-date-format="HH:mm:ss" name="name_user" autocomplete="off" 
                                value="<?php echo $_SESSION['name_user']; ?>" readonly>
                                <input class="form-control"  autocomplete="off" name="user" value="<?php echo $_SESSION['id_user']; ?>" type="hidden">
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
                                <select id="seccion" class="chosen-select" name="seccion" data-placeholder="--Seleccionar Sección--" required onchange="cargarEstantes(this.value)">
                                    <option value=""></option>
                                </select>
                            </div>
                        </div>


                        <!-- Combo buscador de estante (vacío inicialmente) -->
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Estante</label>
                            <div class="col-sm-5">
                                <select id="estante" class="chosen-select" name="estante" data-placeholder="--Seleccionar Estante--" required>
                                    <option value=""></option>
                                </select>
                            </div>
                        </div>

                            <script>
                                  

                                    function cargarSecciones(depositoId) {
                                        console.log("ID de depósito seleccionado:", depositoId);
                                        if (depositoId) {
                                            var xhr = new XMLHttpRequest();
                                            xhr.open("GET", "http://localhost/sisinventario/modules/estante/cargar_seccion.php?cod_deposito=" + depositoId, true);
                                            xhr.onreadystatechange = function() {
                                                if (xhr.readyState == 4 && xhr.status == 200) {
                                                    //console.log("Respuesta de secciones:", xhr.responseText);
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

                                    function cargarEstantes(seccionId){
                                        console.log("ID seccion seleccionado",seccionId);
                                        if (seccionId) {
                                            var shr = new XMLHttpRequest();
                                            shr.open("GET", "http://localhost/sisinventario/modules/movimientos/cargar_estante.php?cod_seccion=" + seccionId, true);
                                            shr.onreadystatechange = function() {
                                                if (shr.readyState == 4 && shr.status == 200) {
                                                    //console.log("Respuesta de secciones:", shr.responseText);
                                                    document.getElementById("estante").innerHTML = shr.responseText;

                                                    // Actualiza Chosen después de cargar las opciones
                                                    $(".chosen-select").trigger("chosen:updated");
                                                }
                                            };
                                            shr.send();
                                        } else {
                                            document.getElementById("estante").innerHTML = "<option value=''>--Seleccionar estante--</option>";
                                            $(".chosen-select").trigger("chosen:updated");
                                        }
                                    }

                            </script>
 <div class="form-group">
    <label class="col-sm-2 control-label">Producto</label>
    <div class="col-sm-5">
        <select class="chosen-select" name="producto" data-placeholder="-- Seleccionar Producto --"
                autocomplete="off" required onchange="cargarCantidad(this)">
            <option value=""></option>
            <?php 
                $query_prov = mysqli_query($mysqli, "SELECT d.cod_deposito, descrip, p.cod_producto, p_descrip, sec.cod_seccion, es.cod_estante, cantidad
                FROM stock s, deposito d, producto p, seccion sec, estante es
                WHERE s.cod_deposito=d.cod_deposito    
                AND s.cod_producto=p.cod_producto
                AND s.cod_seccion=sec.cod_seccion
                AND s.cod_estante=es.cod_estante
                ORDER BY cod_producto ASC") or die ('Error'.mysqli_error($mysqli));
                
                while ($data_prov = mysqli_fetch_assoc($query_prov)){
                    echo "<option value=\"{$data_prov['cod_producto']}\" data-cantidad=\"{$data_prov['cantidad']}\">{$data_prov['p_descrip']} | deposito: {$data_prov['descrip']} </option>";
                }
            ?>
        </select>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label">Cantidad</label>
    <div class="col-sm-5">
        <!-- Campo de número con valor máximo y mínimo -->
        <input type="number" id="cantidad" name="cantidad" class="form-control" readonly min="1" onchange="validarCantidad()" oninput="validarCantidad()">
    </div>
</div>

<script>
    function cargarCantidad(select) {
        // Obtener la opción seleccionada
        const selectedOption = select.options[select.selectedIndex];
        // Obtener el valor de cantidad desde el atributo data-cantidad
        const cantidad = selectedOption.getAttribute('data-cantidad');
        
        // Establecer el valor máximo y el valor actual en el campo de texto
        const cantidadInput = document.getElementById('cantidad');
        cantidadInput.value = cantidad;
        cantidadInput.max = cantidad;
        cantidadInput.readOnly = false;  // Habilitar el campo para que el usuario pueda reducir el valor
    }

    function validarCantidad() {
        const cantidadInput = document.getElementById('cantidad');
        const maxCantidad = parseInt(cantidadInput.max);
        const valorActual = parseInt(cantidadInput.value);
        
        // Si el valor es mayor al máximo permitido, lo establece en el máximo
        if (valorActual > maxCantidad) {
            cantidadInput.value = maxCantidad;
        }
        // Si el valor es menor a 1, lo establece en 1
        if (valorActual < 1) {
            cantidadInput.value = 1;
        }
    }
</script>


                      
                    
                      

                            <div class="box-footer">
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <input type="submit" class="btn btn-primary btn-submit" name="Guardar" value="Guardar">
                                        <a href="?module=movimientos" class="btn btn-default btn-reset">Cancelar</a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
      
      </section>  

    <?php } ?>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.2/js/select2.min.js"></script>


                                
    <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog modal-lg" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModallabel">Buscar Productos</h4>
            </div>
            <div class="modal-body">
              <form class="form-horizontal">
                <div class="form-group">
                   <div class="col-sm-6">
                       <input type="text" class="form-control" id="x" placeholder="Buscar productos" onkeyup="load(1)">
                   </div>
                   <button type="button" class="btn btn-default" onclick="load(1)"><span class="glyphicon glyphicon-search"></span>Buscar</button>
                </div>                            
              </form>
              <div id="loader" style="position: absolute; text-align: center; top: 55px; width:100%; display:none;"></div>
              <div class="outer_div"></div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>                                
         </div>
      </div>                                      
    </div>


    