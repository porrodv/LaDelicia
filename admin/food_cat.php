<?php
include "connect.php"; 
include('templates/header.php');

?>


<div class="container-fluid px-4">

    <div class = 'row mt-4'>
        <div class = 'col-md-12'>
            <div class ='card'>
                <div class = 'card-header'>
                    <h4>Registro de Subcategoria
                        <a href="view_category.php" class="btn btn-danger float-end">Atras</a>
                    </h4>
            </div>
        <div class = "card-body">
        <form action ="" method ="post">
            <div class ="row">
                <div class ="col-md-12 mb-3">
                    <label for="">Categoria</label>
                    <select name = "cat" requiered class = "form-control">
                        <option disabled selected>--Seleccione la categoria--</option>
                        <option value="PLATILLO">PLATILLO</option>
                        <option value="BEBIDA">BEBIDA</option>
                    </select>
                </div>
                <div class="col-md-12 mb-3">
                    <label for ="">Ingrese el nombre de la Subcategoria</label>
                    <input type ="text" name ="scat" class ="form-control" required>
                </div>
                <div class ="col-md-12 mb-3">
                    <button type = "submit" name="s" class ="btn btn-primary">Registrar</button>
            </div>
        </form>


    <!-- BASE DE DATOS - REGISTRO DE LA CATEGORIA -->

        <?php
            if (isset($_POST['s'])) {  //evalua si la variable esta definida
                include "connect.php"; //captura
                $cat = $_POST['cat']; //envia la categoria
                $scat = $_POST['scat']; //envia la subcategoria
                mysqli_query($con, "insert into cat_food(categoria,sub_categoria) 
                values('$cat','$scat')") or die(mysqli_error($con)); //llama la base de datos
                echo "<script>alert('Registrado correctamente');</script>"; //se registra la categoria
            }
        ?>
          
    </div>


<?php
include('templates/footer.php');
include('templates/scripts.php');

?>


