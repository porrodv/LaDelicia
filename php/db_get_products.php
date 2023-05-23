<?php

require_once("./db_connection.php");

function getProducts(){
    $conn = connect();

    $sql = "SELECT * FROM menu ORDER BY id ASC";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        $registros = array();

        while ($row = mysqli_fetch_assoc($result)) {
            $registros[] = $row;
        }

        $json = json_encode($registros);
        return $json;
    } else {
        throw new Exception("Error en la consulta: " . mysqli_error($conn));
    }
    mysqli_free_result($result);
    mysqli_close($conn);
}
echo getProducts();

?>