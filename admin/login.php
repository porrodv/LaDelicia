<link rel="stylesheet" type="text/css" href="./css/login.css">
<body class="background-image">
	<div style="padding-top:100px;"></div>

	<form action="loginck.php" method="post">
		<table border=0 align="center" bgcolor="white" width="40%" style="box-shadow: 1px 3px 15px 2px;" cellpadding="10" cellspacing="15" >

			<tr align="center">
				<td class="title">ADMIN LOGIN</td>
			</tr>
			<tr align="center">
				<td><input type="text" name="user" value="" placeholder="Ingrese el usuario" class="text" required></td>
			</tr>
			<tr align="center">
				<td><input type="password" name="pass" value="" placeholder="Ingrese la contraseña" class="text" required></td>
			</tr>
			<tr align="center">
				<td><input type="submit" name="s" value="Iniciar Sesion" class="button"></td>
			</tr>
		</table>
	</form>
</body>