<?php
include "connect.php"; 
include('templates/header.php');


?>

<div class="container-fluid px-4">
    <h1 class="mt-4">Categoría</h1>
        <div class="card mb-4">
            <div class="card">
                <div class ="card-header">
                    <h4>Lista de Categorias
                        <a href = "food_cat.php" class = "btn btn-primary float-end">Nueva Subcategoria</a>
                    </h4>
                </div>
                    <div class="card-body">                    
                        <div class="content">
                            <table id="datatablesSimple">
                                <thead>
		                            <tr>
                                        <th>ID</th>
			                            <th>CATEGORIA</th>
			                            <th>SUBCATEGORIA</th>
                                        <th>ELIMINAR</th>
                                    </tr>
                                </thead>

<!-- CONEXION A LA BASE DE DATOS -->
                            <?php 
                                $s = mysqli_query($con,"SELECT * FROM cat_food");
                                while($r = mysqli_fetch_array($s))
                                {
                                ?>
                                    <tr align=center>
                                        <td><?php echo $r['id']; ?></td>
                                        <td><?php echo $r['categoria']; ?></td>
                                        <td><?php echo $r['sub_categoria']; ?></td>
                                        <td><a href="delcategory.php?a=<?php echo $r['id']; ?>" class="btn btn-outline-danger">Eliminar</a></td>
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




        

























