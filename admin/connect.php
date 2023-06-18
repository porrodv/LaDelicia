<!-- CONEXION A LA BASE DE DATOS -->

<?php
	$con = new mysqli('localhost','root','password','ladelicia');

	if ($con->connect_error) {
		die("Error de conexión" . $con->connect_error);
	}
?>