<?php 
	session_start(); //iniciando la sesion
	session_destroy(); //destruye todos los datos asociados a las sesion
	header("location:login.php");  //redireccion al login
?>