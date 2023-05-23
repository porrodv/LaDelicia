<?php include "./templates/header.php"; ?>
<div class="content">
	<br><br>
	<?php include  "connect.php"; ?>
	<table border=1 cellpadding="6" cellspacing="8">
		<tr>
			 <th colspan="8">CLIENTES</th>
		</tr>
		<tr>
			<th>Producto ID</th>
			<th>Usuario ID</th>
			<th>Nombre</th>
			<th>Telefono</th>
			<th>Email</th>
			<th>Direccion</th>
			<th>Ver Producto</th>
			<th>Eliminar</th>
		</tr>
		<?php
		$s = mysqli_query($con,"SELECT * FROM checkout");
		while($r = mysqli_fetch_array($s))
		{
		?>
		<tr>
			<td><?php echo $r['produc_id']; ?></td>
			<td><?php echo $r['user_id']; ?></td>
			<td><?php echo $r['nombre']; ?></td>
			<td><?php echo $r['telefono']; ?></td>
			<td><?php echo $r['email']; ?></td>
			<td><?php echo $r['ubicacion']; ?></td>
		<?php
		}
		?>
	</table>
	 

</div>
<?php include "./templates/footer.php"; ?>