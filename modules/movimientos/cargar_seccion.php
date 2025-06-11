<?php
include_once __DIR__ . '/../../config/database.php';

// El resto de tu código
if (isset($_GET['cod_deposito'])) {
    $cod_deposito = $_GET['cod_deposito'];

    // Consulta para obtener las secciones del depósito seleccionado
    $query_seccion = mysqli_query($mysqli, "SELECT cod_seccion, descrip_seccion FROM seccion WHERE cod_deposito = '$cod_deposito'") or die('Error '.mysqli_error($mysqli));

    // Generar opciones para el selector de secciones
    echo "<option value=''>--Seleccionar Sección--</option>";
    while ($data_seccion = mysqli_fetch_assoc($query_seccion)) {
        echo "<option value=\"{$data_seccion['cod_seccion']}\">{$data_seccion['descrip_seccion']}</option>";
    }
}
?>
