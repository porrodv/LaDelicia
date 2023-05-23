<?php
$q = $_GET['q'];

include "connect.php";


$sql="SELECT * FROM cat_food WHERE categoria = '".$q."'";
$result = mysqli_query($con,$sql);

echo "<select name='scat' class='text'>";
while($row = mysqli_fetch_array($result)) {
  
  echo "<option value='" . $row['sub_categoria'] . "'>". $row['sub_categoria'] ."</option>";
  
}
echo "</select>";

?>