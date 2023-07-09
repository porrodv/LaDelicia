<!-- HEADER -->

<?php include "connect.php"; ?>

<!-- ESTILO CSS DE LA TABLA -->

<div class="content">
	<?php
		$a = $_GET['a']; //recopila los datos
		mysqli_query($con,"DELETE FROM menu WHERE id='$a'");
		header("location:view_food.php"); //redirecciona al modulo de ver el menu
	?>
</div>



