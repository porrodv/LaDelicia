<?php

require_once("./db_connection.php");

echo postClient();

function postClient(){
    $conn = connect();

    $postData = json_decode(file_get_contents('php://input'), true);
    $dni = $postData['dni'];
    $name = $postData['name'];
    $phone = $postData['phone'];
    $address = $postData['address'];

    $sql = "INSERT INTO clientes (dni, nombre, direccion, telefono) VALUES ('{$dni}', '{$name}', '{$address}', '{$phone}')";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        $clientID = mysqli_insert_id($conn);
        echo postPurchase($postData['menuID'], $clientID, $postData['quantity'], $postData['total']);
        return "Inserción en 'cliente' exitosa";
    } else {
        throw new Exception("Error en la insercción: " . mysqli_error($conn));
    }
    mysqli_close($conn);
}

function postPurchase($menuID, $clientID, $quantity, $total){
    $conn = connect();

    $sql = "INSERT INTO compras (menu_id, clientes_id, cantidad, preciofinal) VALUES ('{$menuID}', '{$clientID}', '{$quantity}', '{$total}')";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        echo updateMenu($menuID, $quantity);
        return "Inserción en 'compras' exitosa";
    } else {
        throw new Exception("Error en la insercción: " . mysqli_error($conn));
    }
    mysqli_close($conn);
}

function updateMenu($menuID, $quantity){
    $conn = connect();

    $sql = "UPDATE menu SET cantidad = cantidad - $quantity WHERE id = $menuID";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        return "Actualización en 'menu' exitosa";
    } else {
        throw new Exception("Error en la insercción: " . mysqli_error($conn));
    }
    mysqli_close($conn);
}

?>