<?php
include "connect.php"; 
include('templates/header.php');

?>


<div class="container-fluid px-4">
        <h1 class="mt-4">Reservaciones</h1>
        <div class="card mb-4">
            <div class="card">
                <div class ="card-header">
                    <h4>Lista de Reservaciones</h4>
                </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                        <tr>
                        <th>ID</th>
                        <th>NOMBRE</th>
                        <th>EMAIL</th>
                        <th>TELEFONO</th>
                        <th>FECHA</th>
                        <th>HORARIO</th>
                        <th>PERSONAS</th>
                        <th>MENSAJE</th>
                        <th>ELIMINAR</th>
                        </tr>
                    </thead>

                    <?php 
                    $s = mysqli_query($con,"select * from reservaciones");
                    while($r = mysqli_fetch_array($s))
                    {
                    ?>
                    <tr align=center>
                    <td><?php echo $r['id']; ?></td>
                    <td><?php echo $r['nombre']; ?></td>
                    <td><?php echo $r['email']; ?></td>
                    <td><?php echo $r['telefono']; ?></td>
                    <td><?php echo $r['fecha']; ?></td>
                    <td><?php echo $r['hora']; ?></td>
                    <td><?php echo $r['persona']; ?></td>
                    <td>
                        <div style="max-width: 380px"><?php echo $r['mensaje']; ?></div>
                    </td>
                    <td><a href="delreview.php?a=<?php echo $r['id']; ?>" class="btn btn-outline-danger">Eliminar</a></td>
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