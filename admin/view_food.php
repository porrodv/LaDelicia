<?php
include "connect.php"; 
include('templates/header.php');

?>
    <div class="container-fluid px-4">
        <h1 class="mt-4">Menú
        <a href = "report_food.php" target="_black" class = "btn btn-danger float-end">
            <i class="fa-regular fa-file-pdf fa-xl"></i></a><br>
        </h1>
        <div class="card mb-4">
            <div class="card">
                
                <div class ="card-header">
                    <h4>Listado de Comidas
                    <a href = "food.php" class = "btn btn-primary float-end">Nueva Comida</a>
                    </h4>
                </div>
        <div class="card-body">              
            <div class="content">
                <table id="datatablesSimple">
                    
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>SUBCATEGORIA</th>
                            <th>TITULO</th>
                            <th>DESCRIPCION</th>
                            <th>PRECIO</th>
                            <th>CANT.</th>
                            <th>IMAGEN</th>
                            <th></th>
                        </tr>
                    </thead>

                                <!-- CONEXION A LA BASE DE DATOS -->
                                <?php 
                                    $s = mysqli_query($con,"SELECT * FROM menu");
                                    while($r = mysqli_fetch_array($s))
                                    {
                                    ?>
                                        <tr align=center>
                                        <td><?php echo $r['id']; ?></td>
                                            <td><?php echo $r['sub_categoria']; ?></td>
                                            <td><?php echo $r['nombre']; ?></td>
                                            <td><div style="max-width: 500px;"><?php echo $r['descripcion']; ?></div>
                                            </td>
                                            <td><?php echo $r['precio']; ?></td>
                                            <td><?php echo $r['cantidad']; ?></td>
                                            <td>
                                                <img src="<?php echo $r['imagen']; ?>" width=70 height=70>
                                            </td>
                                            <td>
                                                <a href="delfood.php?a=<?php echo $r['id']; ?>" class="btn btn-sm btn-outline-danger" 
                                                onclick = "return fntDelFood()">Eliminar</a>
                                                <a href="editfood.php?b=<?php echo $r['id']; ?>" class="btn btn-sm btn-outline-secondary">Editar</a>
                                            </td>
                                        </tr>	
                                <?php	
                                    }
                                ?>
	                </table>	

                </div>
            </div>
        </div>

<?php
include('templates/footer.php');
include('templates/scripts.php');

?>