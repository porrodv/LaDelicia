<?php include "./templates/header.php"; ?>
<link rel="stylesheet" type="text/css" href=".css/admin.css">
<div class="content">
	<form action="" method="post">
		<table border=0 align="center" bgcolor="white" width="40%" style="box-shadow: 1px 3px 15px 2px;"
			cellpadding="10" cellspacing="15">
			<tr align="center">
				<td class="title">REGISTRAR NUEVA CATEGORIA</td>
			</tr>

			<tr align="center">
				<td>
					<select class="text" name="cat">
						<option value="PLATILLO">PLATILLO</option>
						<option value="BEBIDA">BEBIDA</option>
					</select>
				</td>
			</tr>
			<tr align="center">
				<td><input type="text" name="scat" value="" placeholder="" class="text" required></td>
			</tr>
			<tr align="center">
				<td><input type="submit" name="s" value="   Registrar  " class="btn"></td>
			</tr>
		</table>
	</form>


	<?php
		if (isset($_POST['s'])) {
			include "connect.php";
			$cat = $_POST['cat'];
			$scat = $_POST['scat'];
			mysqli_query($con, "insert into cat_food(categoria,sub_categoria) values('$cat','$scat')") or die(mysqli_error($con));
			echo "<script>alert('Registrado correctamente');</script>";
		}
	?>
</div>
<?php include "./templates/footer.php"; ?>