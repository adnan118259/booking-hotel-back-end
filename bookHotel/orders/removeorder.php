<?php
include "../connect.php";
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$ordersid  = htmlspecialchars(strip_tags($_POST["orders_id"])); 


deleteData("orders","orders_id = $ordersid and orders_stause =0");

 