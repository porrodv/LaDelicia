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
    <h3 style="text-align:center">REPORTE DE PEDIDOS</h3>
	<table border=1 width="100%" cellspacing="3" cellpadding="5" style="box-shadow: 5px 4px 10px 2px; font-family: times new roman; background-color:">
		<tr>
			<th>ID</th>
			<th>MENU_ID</th>
			<th>CLIENTES_ID</th>
			<th>CANTIDAD</th>
			<th>PRECIO FINAL</th>
		</tr>
		<?php
			$sumar_pedidos = 0;
            $s = mysqli_query($con,"SELECT * FROM compras");
            while($r = mysqli_fetch_array($s))
            {
				$sumar_pedidos = $sumar_pedidos + $r['preciofinal'];
				?>
				<tr align=center>
					<td><?php echo $r['id']; ?></td>
					<td><?php echo $r['menu_id']; ?></td>
					<td><?php echo $r['clientes_id']; ?></td>
					<td><?php echo $r['cantidad']; ?></td>
					<td><?php echo $r['preciofinal']; ?></td>
				</tr>
				<?php		
				}
				?>
	</table>
	<div>
                        <div class = "col-md-4">
                            <div class = "form-group">
                                <br><h3 for ="">Total</h3>
                                <input type="text" value ="<?php echo $sumar_pedidos. " PEN" ?>" >
                        </div>
                    </div>
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
