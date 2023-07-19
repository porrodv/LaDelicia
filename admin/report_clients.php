<?php
ob_start();

?>

<?php
include "connect.php"; 

?>


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
    <h3 style="text-align:center">REPORTE DE CLIENTES</h3>
	<table border=1 width="100%" cellspacing="3" cellpadding="5" style="box-shadow: 5px 4px 10px 2px; font-family: times new roman; background-color:">
		<tr>
			<th>ID</th>
			<th>DNI</th>
			<th>NOMBRE</th>
			<th>DIRECCION</th>
			<th>TELEFONO</th>
		</tr>
		<?php 
				$s = mysqli_query($con,"SELECT * FROM clientes");
				while($r = mysqli_fetch_array($s))
				{
			?>
			<tr align=center>
				<td><?php echo $r['id']; ?></td>
				<td><?php echo $r['dni']; ?></td>
				<td><?php echo $r['nombre']; ?></td>
				<td><?php echo $r['direccion']; ?></td>
				<td><?php echo $r['telefono']; ?></td>
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


