<?php session_start(); //iniciando la sesion
	include "connect.php"; //captura 
	$user = $_POST['user']; //envia el usuario
	$pass = $_POST['pass']; //envia la contraseña

	//llama a la tabla admin 

	$sql = mysqli_query($con,"SELECT * FROM admin WHERE usuario ='$user' AND contrasena ='$pass'");
	
	//estrucura condicional para la conexion a la base de datos

	if(mysqli_fetch_array($sql)) {
		$_SESSION['user'] = $user;
		header("location:dashboard.php"); //redirecciona al modulo de menu
	} else {
		echo "<script>alert('Ingrese USUARIO y/o CONTRASEÑA válidos');</script>";
		include "login.php";
	}
?>