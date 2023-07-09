<?php
if(isset ($_POST['sb'])){
    include "admin/connect.php";

    $nm = $_POST['name'];
    $em = $_POST['email'];
    $ms = $_POST['message'];

    mysqli_query($con, "INSERT INTO contacto (nombre, email, mensaje) VALUES ('$nm', '$em', '$ms')");

    echo "<script>alert('Enviado correctamente');</script>";
    include "contact_us.html";
}

?>