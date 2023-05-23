<?php

require_once("./db_connection.php");

$request_body = file_get_contents('php://input');
$data = json_decode($request_body, true);

$user = $data['username'];
$pass = $data['password'];

function verifyAdminAccount($user, $pass){
    $conn = connect();

    $sql = "SELECT * FROM usuario WHERE usuario = '" . $user . "' AND contra = '" . $pass . "'";
    $result = mysqli_query($conn, $sql);
    
    if ($result === false) {
        throw new Exception("Error en la consulta: " . mysqli_error($conn));
    }

    $found = mysqli_num_rows($result) > 0;

    mysqli_free_result($result);
    mysqli_close($conn);

    $found = preg_replace('/^0x/', '', $found); // provisional
    return json_encode($found);
}
echo verifyAdminAccount($user, $pass);

?>