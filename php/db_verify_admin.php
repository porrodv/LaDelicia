<?php

require_once("./db_connection.php");

// testing
function verifyAdminAccount($user, $pass){
    $conn = connect();

    // "SELECT * FROM usuario WHERE usuario = '" . $user . "' AND contra = '" . $pass . "'"

    $sql = "SELECT * FROM usuario WHERE usuario = '" . $user . "' AND contra = '" . $pass . "'";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        $registros = array();

        while ($row = mysqli_fetch_assoc($result)) {
            $registros[] = $row;
        }

        $json = json_encode($registros);
        return $json;
    } else {
        return "Error en la consulta: " . mysqli_error($conn);
    }
    mysqli_close($conn);
}
echo verifyAdminAccount();

?>
