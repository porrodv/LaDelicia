<?php session_start();
	include "connect.php";
	$user = $_POST['user'];
	$pass = $_POST['pass'];

	$sql = mysqli_query($con,"SELECT * FROM admin WHERE usuario ='$user' AND contrasena ='$pass'");
	
	if(mysqli_fetch_array($sql)) {
		$_SESSION['user'] = $user;
		header("location:food.php");
	} else {
		echo "<script>alert('Ingrese USUARIO y/o CONTRASEÑA válidos');</script>";
		include "login.php";
	}
?>