<!DOCTYPE html>
<html lang="en">
<head>

    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap v5.1.3 CDNs -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/login.css">

    <!-- CSS File -->
    <link rel="stylesheet" href="admin.css">

</head>

<body>

    <div class="login">

        <h4 class="text-center">ADMIN LOGIN</h4>
        
        <form action="loginck.php" method="post">
            <div class="form-group was-validated">
                <label class="form-label" for="user">Usuario</label>
                <input class="form-control" type="user" name="user" required>
                <div class="invalid-feedback">
                    Por favor ingrese su nombre de usuario
                </div>
            </div>
            <div class="form-group was-validated">
                <label class="form-label" for="password">Contraseña</label>
                <input class="form-control" type="password" name="pass" required>
                <div class="invalid-feedback">
                    Por favor ingrese su contraseña
                </div>
            </div>
            <input class="btn btn-success w-100" type="submit" name="s" value="Iniciar Sesion">
        </form>

    </div>
</body>
</html>










