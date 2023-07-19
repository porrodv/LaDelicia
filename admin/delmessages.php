<?php include "connect.php"; ?>

<div class="content">
	<?php
		$a = $_GET['a']; //recopila los datos
		mysqli_query($con,"DELETE FROM contacto WHERE id='$a'");
		header("location:messages.php"); //redirecciona al modulo de ver el menu
	?>
</div>
