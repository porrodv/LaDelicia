<?php
$q = $_GET['q']; //recopila los datos registrados en food_cat
include "connect.php"; //captura 

//llama a la tabla admin 

$sql="SELECT * FROM cat_food WHERE categoria = '".$q."'";
$result = mysqli_query($con,$sql);

//estrucura condicional para la conexion a la base de datos

echo "<select name='scat' class='text'>";
while($row = mysqli_fetch_array($result)) {
  
  echo "<option value='" . $row['sub_categoria'] . "'>". $row['sub_categoria'] ."</option>";
  
}
echo "</select>";

?>