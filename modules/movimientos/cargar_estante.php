<?php
include_once __DIR__ . '/../../config/database.php';

// El resto de tu código
if (isset($_GET['cod_seccion'])) {
    $cod_seccion = $_GET['cod_seccion'];

    // Consulta para obtener las secciones del depósito seleccionado
    $query_estante = mysqli_query($mysqli, "SELECT cod_estante, descrip_estante FROM estante WHERE cod_seccion = '$cod_seccion'") or die('Error '.mysqli_error($mysqli));

    // Generar opciones para el selector de secciones
    echo "<option value=''>--Seleccionar estante--</option>";
    while ($data_estante = mysqli_fetch_assoc($query_estante)) {
        echo "<option value=\"{$data_estante['cod_estante']}\">{$data_estante['descrip_estante']}</option>";
    }
}
?>
