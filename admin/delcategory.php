<!-- HEADER -->

<?php include "connect.php"; ?>

<!-- ESTILO CSS DE LA TABLA -->

<div class="content">
	
	<?php
		$a = $_GET['a']; //recopila los datos
		mysqli_query($con,"delete from cat_food where id='$a'");
		header("location:view_category.php"); //redirecciona al modulo de ver el menu
	?>
		
</div>
