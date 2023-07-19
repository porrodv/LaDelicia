<?php
include "connect.php"; 
include('templates/header.php');


?>

<div class="container-fluid px-4">
    <h1 class="mt-4">Clientes</h1>
    <div class="card mb-4">
            <div class="card">
                <div class ="card-header">
                    <h4>Lista de Clientes
                    <a href = "report_clients.php" target="_black" class = "btn btn-danger float-end">
                        <i class="fa-regular fa-file-pdf fa-xl"></i> Generar Reporte</a><br>
                    </h4>
                </div>
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                            <th>ID</th>
                            <th>DNI</th>
                            <th>NOMBRE</th>
                            <th>DIRECCION</th>
                            <th>TELEFONO</th>
                            </tr>
                        </thead>

                    <?php 
                        $s = mysqli_query($con,"SELECT * FROM clientes");
                        while($r = mysqli_fetch_array($s))
                        {
                    ?>
                    <tr align=center>
                        <td><?php echo $r['id']; ?></td>
                        <td><?php echo $r['dni']; ?></td>
                        <td><?php echo $r['nombre']; ?></td>
                        <td><?php echo $r['direccion']; ?></td>
                        <td><?php echo $r['telefono']; ?></td>
                    </tr>	
                    <?php	
                    }
                    ?>

                    </table>
                </div>
        </div>

<?php
include('templates/footer.php');
include('templates/scripts.php');

?>