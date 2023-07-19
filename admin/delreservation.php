<?php include "connect.php"; ?>

<div class="content">
	<?php
		$a = $_GET['a']; //recopila los datos
		mysqli_query($con,"DELETE FROM reservaciones WHERE id='$a'");
		header("location:reservation.php"); //redirecciona al modulo de ver el menu
	?>
</div>
