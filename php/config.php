<?php

$servername = "localhost";
$username = "root";
$password = "password"; // personal pass
$dbname = "ladelicia";

function conectar() {
    global $servername, $username, $password, $dbname;
    
    $conn = mysqli_connect($servername, $username, $password, $dbname);
    
    if (!$conn) {
        die("Conexión fallida: " . mysqli_connect_error());
    }
    // echo "Conexión exitosa";
    return $conn;
}

?>
