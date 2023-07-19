<?php
include "connect.php"; 
include('templates/header.php');


?>

<div class="container-fluid px-4">
    <h1 class="mt-4">Pedidos
    </h1>
    <div class="card mb-4">
            <div class="card">
                <div class ="card-header">
                    <h4>Lista de Pedidos
                    <a href = "report_pedidos.php" target="_black" class = "btn btn-danger float-end">
                        <i class="fa-regular fa-file-pdf fa-xl"></i> Generar Reporte</a><br>
                    </h4>
                </div>
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                            <th>ID</th>
                            <th>MENU_ID</th>
                            <th>CLIENTES_ID</th>
                            <th>CANTIDAD</th>
                            <th>PRECIO FINAL</th>
                            </tr>
                        </thead>

                    <?php
                        $sumar_pedidos = 0;
                        $s = mysqli_query($con,"SELECT * FROM compras");
                        while($r = mysqli_fetch_array($s))
                        {
                            $sumar_pedidos = $sumar_pedidos + $r['preciofinal'];
                    ?>
                    <tr align=center>
                        <td><?php echo $r['id']; ?></td>
                        <td><?php echo $r['menu_id']; ?></td>
                        <td><?php echo $r['clientes_id']; ?></td>
                        <td><?php echo $r['cantidad']; ?></td>
                        <td><?php echo $r['preciofinal']; ?></td>
                    </tr>	
                    <?php	
                    }
                    ?>

                    </table>
                <div>
                        <div class = "col-md-4">
                            <div class = "form-group">
                                <br><h5 for ="">Total | Ventas</h5>
                                <input type="text" value ="<?php echo $sumar_pedidos. " PEN" ?>" class="form-control" disabled>
                        </div>
                    </div>
                    </div>
                </div>
                </div>
        </div>

<?php
include('templates/footer.php');
include('templates/scripts.php');

?>