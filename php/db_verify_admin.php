<?php

// fix

require_once("./db_connection.php");

$request_body = file_get_contents('php://input');
$data = json_decode($request_body, true);

$user = $data['username'];
$pass = $data['password'];
var_dump($user);

function verifyAdminAccount($user, $pass){
    $conn = connect();

    // "SELECT * FROM usuario WHERE usuario = '" . $user . "' AND contra = '" . $pass . "'"

    $sql = "SELECT * FROM usuario WHERE usuario = '" . $user . "'";
    $result = mysqli_query($conn, $sql);
    
    if ($result) {
        $registros = array();
        
        while ($row = mysqli_fetch_assoc($result)) {
            $registros[] = $row;
        }
        
        $json = json_encode($registros, JSON_UNESCAPED_UNICODE);
        var_dump($json);
        echo $json;
    } else {
        return "Error en la consulta: " . mysqli_error($conn);
    }
    mysqli_close($conn);
}
echo verifyAdminAccount($user, $pass);

?>
