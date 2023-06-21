<?php
    if(isset ($_POST['r'])){
        $nm=$_POST['name'];
        $em=$_POST['email'];
        $telf=$_POST['phone'];
        $fech=$_POST['fecha'];
        $hor=$_POST['hora'];
        $per=$_POST['person'];
        $des=$_POST['mess'];
        include "admin/connect.php";
        mysqli_query($con, "insert into reservaciones (nombre, email, telefono, fecha, hora, persona, mensaje) 
        values ('$nm', '$em', '$telf', '$fech', '$hor', '$per', '$des' )");
        echo "<script>alert('Enviado correctamente');</script>";
        include "contact_us.html";
    }
?>