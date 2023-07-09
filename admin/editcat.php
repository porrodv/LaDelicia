<?php
include "connect.php";
$b = $_GET['b'];
$result = mysqli_query($con, "SELECT * FROM cat_food WHERE id =$b");
if (mysqli_num_rows($result) == 1) {
    $row = mysqli_fetch_array($result);
    $cat = $row['categoria'];
    $subcat = $row['sub_categoria'];
}
?>

<?php include('templates/header.php'); ?>

<div class="container-fluid px-4">

    <div class='row mt-4'>
        <div class='col-md-12'>
            <div class='card'>
                <div class='card-header'>
                    <h4>Edición de Subcategoria
                        <a href="view_category.php" class="btn btn-danger float-end">Atras</a>
                    </h4>
                </div>

                <div class="card-body">
                    <form action="" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <label>Categoria</label>
                                <select name="cat" requiered class="form-control">
                                    <option disabled selected>--Seleccione la categoria--</option>
                                    <option value="PLATILLO" <?php if ($cat === 'PLATILLO')
                                        echo 'selected'; ?>>PLATILLO
                                    </option>
                                    <option value="BEBIDA" <?php if ($cat === 'BEBIDA')
                                        echo 'selected'; ?>>BEBIDA
                                    </option>
                                </select>
                            </div>
                            <div class="col-md-12 mb-3">
                                <label>Ingrese el nombre de la Subcategoria</label>
                                <input type="text" name="scat" class="form-control" required
                                    value="<?php echo $subcat ?>">
                            </div>
                            <div class="col-md-12 mb-3">
                                <button type="submit" name="s" class="btn btn-primary">Guardar</button>
                            </div>
                        </div>
                    </form>

                    <!-- BASE DE DATOS - REGISTRO DE LA CATEGORIA -->
                    <?php
                    if (isset($_POST['s'])) {
                        $cat = $_POST['cat'];
                        $scat = $_POST['scat'];

                        $query = "";

                        $query = "UPDATE cat_food SET categoria='$cat', sub_categoria='$scat' WHERE id = $b";

                        include "connect.php";
                        mysqli_query($con, $query);
                    }
                    ?>
                </div>

                <?php
                include('templates/footer.php');
                include('templates/scripts.php');

                ?>