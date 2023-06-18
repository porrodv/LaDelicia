<!-- SCRIP -->

<script>
	function showUser(str) {
    	if (str == "") {
        	document.getElementById("txtHint").innerHTML = "";
        	return;
    	} else {
        	var xmlhttp = new XMLHttpRequest();
        	xmlhttp.onreadystatechange = function () {
            	if (this.readyState == 4 && this.status == 200) {
                	document.getElementById("txtHint").innerHTML = this.responseText;
            	}
        	};
        	xmlhttp.open("GET", "getscat.php?q=" + str, true);
        	xmlhttp.send();
    	}
	}
</script>

<!-- DISEÑO DEL MODULO MENU - ADMINISTRADOR EN PHP -->

<?php
include "connect.php"; 
include('templates/header.php');

?>

<div class="container-fluid px-4">

    <div class = 'row mt-4'>
        <div class = 'col-md-12'>
            <div class ='card'>
                <div class = 'card-header'>
                    <h4>Registro de Comida
                        <a href="view_food.php" class="btn btn-danger float-end">Atras</a>
                    </h4>
            </div>
        <div class = "card-body">

        <form action ="" method ="post" enctype="multipart/form-data">
            <div class ="row">
                <div class ="col-md-12 mb-3">
                    <label>Categoria</label>
                    <select name = "cat" requiered class = "form-control" onchange="showUser(this.value)">
                        <option disabled selected>--Seleccione la categoria--</option>
                        <option value="PLATILLO">PLATILLO</option>
                        <option value="BEBIDA">BEBIDA</option>
                    </select>
                </div>
                <div class ="col-md-12 mb-3">
                    <label>Subcategoria</label>
                    <select name = "scat" requiered class = "form-control" id="txtHint" >
                        <option disabled selected>--Selecciona su categoria principal para mostrar la subcategoria--</option>
                    </select>
                </div>
                <div class="col-md-12 mb-3">
                    <label>Ingrese el nombre de la comida</label>
                    <input type ="text" name ="title" class ="form-control" required>
                </div>
                <div class="col-md-12 mb-3">
                    <label>Ingrese el detalle de la comida</label>
                    <textarea name ="detail" class ="form-control" rows="4" required></textarea>
                </div>
                <div class="col-md-12 mb-3">
                    <label>Ingrese el precio de la comida</label>
                    <input type ="text" name ="price" class ="form-control" required>
                </div>
                <div class="col-md-12 mb-3">
                    <label>Ingrese la imagen de la comida</label>
                    <input type ="File" name ="img" class ="form-control" required>
                </div>
                <div class ="col-md-12 mb-3">
                    <button type = "submit" name="s" class ="btn btn-primary">Registrar</button>
            </div>
        </form>


    
	<!-- BASE DE DATOS - REGISTRO DE LOS PLATILLOS -->

        <?php
        if (isset($_POST['s'])) { //evalua si la variable esta definida
            $cat = $_POST['cat']; //envia la categoria
            $scat = $_POST['scat']; //envia la sub categoria
            $title = $_POST['title']; //envia el titulo
            $det = $_POST['detail']; //envia el detalle
            $price = $_POST['price']; //envia el precio
            $i = "mimg/" . $_FILES['img']['name']; //envia la imagen
            move_uploaded_file($_FILES['img']['tmp_name'], $i); //envia la imagen  la base de datos
            include "connect.php"; //captura 
            mysqli_query($con, "insert into menu (categoria,sub_categoria,nombre,descripcion,precio,imagen)
            values('$cat','$scat','$title','$det','$price','$i')"); //llama a la base de datos
            echo "<script>alert('Registrado correctamente');</script>"; //se registra el platillo
        }
        ?>

    </div>            
</div>


<?php
include('templates/footer.php');
include('templates/scripts.php');

?>


        


