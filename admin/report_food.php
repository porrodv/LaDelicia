<?php
ob_start();

?>

<?php
include "connect.php"; 

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Reporte Platillo</title>
</head>
<body>


<style type="text/css">
	tr{
		font-size: 0.9em;
		color: black;
	}
	tr:hover{
		background-color: black;
		color: white;
	}
	th{
		color: blue;
		font-size: 0.9em;
	}
	.del{
		color: red;
		text-decoration: none;
	}
	.del:hover{
		color: blue;
		text-decoration: none;
		text-shadow: 1px 2px 3px #FFFFFF;
	}
    
</style>

<div class="content">
    <h3 style="text-align:center">REPORTE DE PLATILLOS</h3>
	<table border=1 width="100%" cellspacing="3" cellpadding="5" style="box-shadow: 5px 4px 10px 2px; font-family: times new roman; background-color:">
		<tr>
            <th>ID</th>
			<th>SUB CATEGORIA</th>
			<th>TITULO</th>
			<th>DESCRIPCION</th>
			<th>PRECIO</th>
			<th>CANTIDAD</th>
		</tr>
		<?php
            $s = mysqli_query($con,"SELECT * FROM menu");
            while($r = mysqli_fetch_array($s))
            {
            ?>
                <tr align=center>
                <td><?php echo $r['id']; ?></td>
                    <td><?php echo $r['sub_categoria']; ?></td>
                    <td><?php echo $r['nombre']; ?></td>
                    <td><div style="max-width: 500px;"><?php echo $r['descripcion']; ?></div>
                    </td>
                    <td><?php echo $r['precio']; ?></td>
                    <td><?php echo $r['cantidad']; ?></td>
                </tr>	
        <?php	
            }
        ?>
	</table>
</div>	

<?php
$html = ob_get_clean();
//echo $html;

require_once './library/dompdf/autoload.inc.php';

use Dompdf\Dompdf;
$dompdf = new Dompdf();

$options = $dompdf->getOptions();
$options->set(array('isRemoteEnabled' => true));

$dompdf->loadHtml($html);

$dompdf->setPaper('letter');

$dompdf->render();

$dompdf->stream("archivo_.pdf", array("Attachment" => false));


?>



	
</body>
</html>




