<?php
include "../connect.php";
$ordersid  = htmlspecialchars(strip_tags($_POST["book_orders"])); 


getAllData("orders","orders_id = $ordersid");

 
