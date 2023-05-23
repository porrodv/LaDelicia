<?php session_start();
	include "connect.php";
	$user = $_POST['user'];
	$pass = $_POST['pass'];

	$sql = mysqli_query($con,"SELECT * FROM admin WHERE usuario ='$user' AND contrasena ='$pass'");
	
	if(mysqli_fetch_array($sql)) {
		$_SESSION['user'] = $user;
		header("location:after_login.php");
	} else {
		echo "<center><span style='color:red; font-size:2.3em; font-weight:bold;'>
		Ingrese ID de administrador y contraseña válidos</span></center>";
		include "index.php";
	}
?>
