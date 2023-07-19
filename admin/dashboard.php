<?php
include "connect.php"; 
include('templates/header.php');

?>

<div class="container-fluid px-4">
<h1 class="mt-4">Dashboard</h1>
<div class="row">
    <div class="col-xl-3 col-md-6">
        <div class="card bg-primary text-white mb-4">
            <div class="card-body">Platillos
                <?php
                    $dash_food_query = "SELECT *from menu";
                    $dash_food_query_run = mysqli_query ($con, $dash_food_query);

                    if ($food_total = mysqli_num_rows($dash_food_query_run))
                    {
                        echo '<h4 class = mb-0>'.$food_total.' </h4>';
                    }
                    else
                    {
                        echo '<h4 class =mb-0> No data </h4>';
                    }
                ?>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="view_food.php">Ver Detalles</a>
                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-warning text-white mb-4">
            <div class="card-body">Categorias
                <?php
                    $dash_category_query = "SELECT *from cat_food";
                    $dash_category_query_run = mysqli_query ($con, $dash_category_query);

                    if ($category_total = mysqli_num_rows($dash_category_query_run))
                    {
                        echo '<h4 class = mb-0>'.$category_total.' </h4>';
                    }
                    else
                    {
                        echo '<h4 class =mb-0> No data </h4>';
                    }
                ?>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="view_category.php">Ver Detalles</a>
                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-success text-white mb-4">
            <div class="card-body">Mensajes
                <?php
                    $dash_messages_query = "SELECT *from contacto";
                    $dash_messages_query_run = mysqli_query ($con, $dash_messages_query);

                    if ($messages_total = mysqli_num_rows($dash_messages_query_run))
                    {
                        echo '<h4 class = mb-0>'.$messages_total.' </h4>';
                    }
                    else
                    {
                        echo '<h4 class =mb-0> No data </h4>';
                    }
                ?>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="messages.php">Ver Detalles</a>
                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-danger text-white mb-4">
            <div class="card-body">Reservaciones
                <?php
                    $dash_reservation_query = "SELECT *from reservaciones";
                    $dash_reservation_query_run = mysqli_query ($con, $dash_reservation_query);

                    if ($reservation_total = mysqli_num_rows($dash_reservation_query_run))
                    {
                        echo '<h4 class = mb-0>'.$reservation_total.' </h4>';
                    }
                    else
                    {
                        echo '<h4 class =mb-0> No data </h4>';
                    }
                ?>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="reservation.php">Ver Detalles</a>
                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
    <div class="col-xl-3 col-md-6">
        <div class="card bg-info text-white mb-4">
            <div class="card-body">Clientes
                <?php
                    $dash_reservation_query = "SELECT *from clientes";
                    $dash_reservation_query_run = mysqli_query ($con, $dash_reservation_query);

                    if ($reservation_total = mysqli_num_rows($dash_reservation_query_run))
                    {
                        echo '<h4 class = mb-0>'.$reservation_total.' </h4>';
                    }
                    else
                    {
                        echo '<h4 class =mb-0> No data </h4>';
                    }
                ?>
            </div>
            <div class="card-footer d-flex align-items-center justify-content-between">
                <a class="small text-white stretched-link" href="clients.php">Ver Detalles</a>
                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
            </div>
        </div>
    </div>
</div>


<?php
include('templates/footer.php');
include('templates/scripts.php');

?>


