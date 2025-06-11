<?php
require_once '../../config/database.php';

$d = $_POST['cod_deposito'];
$desde_ = $_POST['dfecha'];
$desde = DateTime::createFromFormat('d-m-Y', $desde_)->format('Y-m-d');
$hasta_ = $_POST['hfecha'];
$hasta = DateTime::createFromFormat('d-m-Y', $hasta_)->format('Y-m-d');
// Obtener descripción del depósito
$sql_deposito = "SELECT descrip FROM deposito WHERE cod_deposito = $d";
$resultado_deposito = mysqli_query($mysqli, $sql_deposito);
$row_deposito = mysqli_fetch_assoc($resultado_deposito);
$deposito = $row_deposito['descrip'] ?? 'Sin nombre';

// Obtener productos y cantidades
$sql = "SELECT prod.p_descrip AS producto, SUM(dtc.det_cantidad) AS cantidad_total
        FROM venta c
        INNER JOIN det_venta dtc ON c.cod_venta = dtc.cod_venta
        INNER JOIN producto prod ON dtc.cod_producto = prod.cod_producto
        WHERE c.cod_deposito = $d 
          AND c.fecha BETWEEN '$desde' AND '$hasta'
        GROUP BY prod.p_descrip";
$resultado = mysqli_query($mysqli, $sql);

$data = [];
while ($row = mysqli_fetch_assoc($resultado)) {
    $data[] = [
        "name" => $row['producto'],
        "y" => (float)$row['cantidad_total']
    ];
}
?>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <title>Productos comprados - <?= htmlspecialchars($deposito) ?></title>
    <script src="../../code/highcharts.js"></script>
    <script src="../../code/modules/series-label.js"></script>
    <script src="../../code/modules/exporting.js"></script>
    <script src="../../code/modules/export-data.js"></script>
</head>
<body>
    <div id="container" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto"></div>

    <script type="text/javascript">
    Highcharts.chart('container', {
        chart: {
            type: 'pie'
        },
        title: {
            text: 'Productos vendidos en <?= addslashes($deposito) ?>'
        },
        subtitle: {
            text: 'Desde <?= $desde ?> hasta <?= $hasta ?>'
        },
        tooltip: {
            pointFormat: '<b>{point.name}</b>: {point.y} unidades<br/>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '{point.name}: {point.y}'
                }
            }
        },
        series: [{
            name: "Cantidad",
            colorByPoint: true,
            data: <?= json_encode($data, JSON_NUMERIC_CHECK); ?>
        }]
    });
    </script>
</body>
</html>
