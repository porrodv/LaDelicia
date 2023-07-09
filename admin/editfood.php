<?php
include "connect.php";
$b = $_GET['b'];
$result = mysqli_query($con, "SELECT * FROM menu WHERE id =$b");
if (mysqli_num_rows($result) == 1) {
    $row = mysqli_fetch_array($result);
    $cat = $row['categoria'];
    $scat = $row['sub_categoria'];
    $title = $row['nombre'];
    $detail = $row['descripcion'];
    $price = $row['precio'];
    $img = $row['imagen'];

}
?>

<?php include('templates/header.php'); ?>

<script>

    document.addEventListener("DOMContentLoaded", function () {
        if (document.getElementById("txtCat").innerHTML !== "") {
            var catValue = document.getElementById("txtCat").value;
            showUser(catValue, "<?php echo $scat ?>");
        }
    });


    function showUser(str, scat) {
        if (str === "") {
            document.getElementById("txtHint").innerHTML = "";
            return;
        }
        fetch("getscat.php?q=" + str)
            .then(response => response.text())
            .then(data => {
                let selectElement = document.getElementById("txtHint");
                selectElement.innerHTML = data;

                let selectedIndex = Array.from(selectElement.options).findIndex(option => option.value === scat);
                selectElement.selectedIndex = selectedIndex !== -1 ? selectedIndex : 0;
            })
            .catch(error => console.error(error));
    }
</script>

<div class="container-fluid px-4">

    <div class='row mt-4'>
        <div class='col-md-12'>
            <div class='card'>
                <div class='card-header'>
                    <h4>Edición de Producto
                        <a href="view_food.php" class="btn btn-danger float-end">Atras</a>
                    </h4>
                </div>
                <div class="card-body">

                    <form action="" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <label>Categoria</label>
                                <select name="cat" requiered class="form-control" id="txtCat"
                                    onchange="showUser(this.value, '<?php echo $scat ?>')">
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
                                <label>Subcategoria</label>
                                <select name="scat" requiered class="form-control" id="txtHint">
                                    <option disabled selected>--Selecciona su categoria principal para mostrar la
                                        subcategoria--</option>
                                </select>
                            </div>
                            <div class="col-md-12 mb-3">
                                <label>Ingrese el nombre de la comida</label>
                                <input type="text" name="title" class="form-control" required
                                    value="<?php echo $title ?>">
                            </div>
                            <div class="col-md-12 mb-3">
                                <label>Ingrese el detalle de la comida</label>
                                <textarea name="detail" class="form-control" rows="4"
                                    required><?php echo $detail ?></textarea>
                            </div>
                            <div class="col-md-12 mb-3">
                                <label>Ingrese el precio de la comida</label>
                                <input type="text" name="price" class="form-control" required
                                    value="<?php echo $price ?>">
                            </div>
                            <div class="col-md-6 mb-3">
                                <h6>Imagen actual</h6>
                                <img src="<?php echo $img; ?>" width="100" height="100" alt="Imagen actual">
                            </div>

                            <div class="col-md-6 mb-3">
                                <label>Ingrese la nueva imagen de la comida</label>
                                <input type="File" name="img" class="form-control" >
                            </div>
                            <div class="col-md-12 mb-3">
                                <button type="submit" name="s" class="btn btn-primary">Guardar</button>
                            </div>
                    </form>

                    <?php
                    if (isset($_POST['s'])) {
                        $cat = $_POST['cat'];
                        $scat = $_POST['scat'];
                        $title = $_POST['title'];
                        $det = $_POST['detail'];
                        $price = $_POST['price'];

                        $i = "";
                        $query = "";
                        if (isset($_FILES['img']) && $_FILES['img']['error'] === UPLOAD_ERR_OK) {
                            $i = "mimg/" . $_FILES['img']['name'];
                            move_uploaded_file($_FILES['img']['tmp_name'], $i);

                            $query = "UPDATE menu SET categoria='$cat', sub_categoria='$scat', nombre='$title', descripcion='$det', precio='$price', imagen='$i' WHERE id = $b";
                        } else {
                            $query = "UPDATE menu SET categoria='$cat', sub_categoria='$scat', nombre='$title', descripcion='$det', precio='$price' WHERE id = '$b'";
                        }

                        include "connect.php";
                        mysqli_query($con, $query);
                        header("location:view_food.php");
                    }
                    ?>

                </div>
            </div>

            <?php
            include('templates/footer.php');
            include('templates/scripts.php');

            ?>