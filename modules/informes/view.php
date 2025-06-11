<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<section class="content-header">
    <h1>
    <ol class="breadcrumb">
      <li><a href="?module=start"><i class="fa fa-home"></i> Inicio </a></li>
      <li><a href="?module=reporte_interesados_por_sede"> Informe de movimientos </a></li>
      
    </ol>
  </section>



  <section class="content-header">
    <h1>
      <i class="fa fa-edit icon-title"></i> Estadísticas de Compras
    </h1>
  </section>
 <!-- Main content ventas-->
 <section class="content">
    <div class="row">
      <div class="col-md-12">
        <div class="box box-primary">
          <!-- form start -->
          <form role="form"  class="form-horizontal" method="POST" action="modules/informes/informe_compras.php" target="_blank">    
            <div class="box-body">

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Depósito</label>
                                  <div class="col-sm-2">
                                      <select class="chosen-select" name="cod_deposito" data-placeholder="-- Ingresa el depósito --"
                                      autocomplete="off" required>
                                          <option value=""></option>
                                          <?php 
                                              $query_dep = mysqli_query($mysqli, "SELECT cod_deposito, descrip
                                              FROM deposito 
                                              ORDER BY cod_deposito ASC") or die ('Error'.mysqli_error($mysqli));
                                              
                                              while ($data_dep = mysqli_fetch_assoc($query_dep)){
                                                $depo=$data_dep['descrip'];
                                                  echo "<option value=\"$data_dep[cod_deposito]\">$depo</option>";
                                              }
                                          ?>
                                      </select>
                                      
                                  </div>
                                    <label class="col-sm-1 control-label">Desde Fecha</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control date-picker" data-date-format="dd-mm-yyyy" name="dfecha" autocomplete="of">
                                    </div>

                                    <label class="col-sm-1 control-label">Desde hasta</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control date-picker" data-date-format="dd-mm-yyyy" name="hfecha" autocomplete="of">
                                    </div>
                            </div>  


            </div>
            <div class="box-footer">
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                
                        <button type="submit" class="btn btn-warning btn-social btn-submit" style="width: 200px;">
                    <i class="fa fa-file-text-o icon-title"></i> Imprimir informe
                </div>
                
              </div>
            </div><!-- /.box footer --> 
          </form>
        </div><!-- /.box -->
      </div><!--/.col -->
    </div>   <!-- /.row -->
  </section><!-- /.content -->

  <section class="content-header">
    <h1>
      <i class="fa fa-edit icon-title"></i> Estadísticas de Ventas
    </h1>
  </section>
 <!-- Main content -->
 <section class="content">
    <div class="row">
      <div class="col-md-12">
        <div class="box box-primary">
          <!-- form start -->
          <form role="form"  class="form-horizontal" method="POST" action="modules/informes/informe_ventas.php" target="_blank">    
            <div class="box-body">

                            <div class="form-group">
                                <label class="col-sm-2 control-label">Depósito</label>
                                  <div class="col-sm-2">
                                      <select class="chosen-select" name="cod_deposito" data-placeholder="-- Ingresa el depósito --"
                                      autocomplete="off" required>
                                          <option value=""></option>
                                          <?php 
                                              $query_dep = mysqli_query($mysqli, "SELECT cod_deposito, descrip
                                              FROM deposito 
                                              ORDER BY cod_deposito ASC") or die ('Error'.mysqli_error($mysqli));
                                              
                                              while ($data_dep = mysqli_fetch_assoc($query_dep)){
                                                $depo=$data_dep['descrip'];
                                                  echo "<option value=\"$data_dep[cod_deposito]\">$depo</option>";
                                              }
                                          ?>
                                      </select>
                                      
                                  </div>
                                    <label class="col-sm-1 control-label">Desde Fecha</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control date-picker" data-date-format="dd-mm-yyyy" name="dfecha" autocomplete="of">
                                    </div>

                                    <label class="col-sm-1 control-label">Desde hasta</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control date-picker" data-date-format="dd-mm-yyyy" name="hfecha" autocomplete="of">
                                    </div>
                            </div>  


            </div>
            <div class="box-footer">
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                
                        <button type="submit" class="btn btn-warning btn-social btn-submit" style="width: 200px;">
                    <i class="fa fa-file-text-o icon-title"></i> Imprimir informe
                </div>
                
              </div>
            </div><!-- /.box footer --> 
          </form>
        </div><!-- /.box -->
      </div><!--/.col -->
    </div>   <!-- /.row -->
  </section><!-- /.content -->


    <section class="content-header">
    <h1>
      <i class="fa fa-edit icon-title"></i> Estadísticas de Stock de productos
    </h1>
  </section>
 <!-- Main content -->
 <section class="content">
    <div class="row">
      <div class="col-md-12">
        <div class="box box-primary">
          <!-- form start -->
          <form role="form"  class="form-horizontal" method="POST" action="modules/informes/informe_stock.php" target="_blank">    
            <div class="box-body">

                            <div class="form-group">
                                <label class="col-sm-4 control-label">Depósito</label>
                                  <div class="col-sm-4">
                                      <select class="chosen-select" name="cod_deposito" data-placeholder="-- Ingresa el depósito --"
                                      autocomplete="off" required>
                                          <option value=""></option>
                                          <?php 
                                              $query_dep = mysqli_query($mysqli, "SELECT cod_deposito, descrip
                                              FROM deposito 
                                              ORDER BY cod_deposito ASC") or die ('Error'.mysqli_error($mysqli));
                                              
                                              while ($data_dep = mysqli_fetch_assoc($query_dep)){
                                                $depo=$data_dep['descrip'];
                                                  echo "<option value=\"$data_dep[cod_deposito]\">$depo</option>";
                                              }
                                          ?>
                                      </select>
                                      
                              
                            </div>  


            </div>
            <div class="box-footer">
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                
                        <button type="submit" class="btn btn-warning btn-social btn-submit" style="width: 200px;">
                    <i class="fa fa-file-text-o icon-title"></i> Imprimir informe
                </div>
                
              </div>
            </div><!-- /.box footer --> 
          </form>
        </div><!-- /.box -->
      </div><!--/.col -->
    </div>   <!-- /.row -->
  </section><!-- /.content -->



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<script>
$(document).ready(function() {
    $('.date-picker').datepicker({
        autoclose: true,
        todayHighlight: true,
        format: 'dd-mm-yyyy'
    });

    // Aquí también puedes poner la validación para que "hasta" no sea menor que "desde"
    $('input[name="dfecha"]').on('change', function() {
        var desde = $(this).val();
        $('input[name="hfecha"]').datepicker('setStartDate', desde);
    });
});
</script>