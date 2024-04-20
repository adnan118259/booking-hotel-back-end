<?php

include '../../connect.php';
$ordersid  = htmlspecialchars(strip_tags($_POST["orders_id"])); 
$usersid  = htmlspecialchars(strip_tags($_POST["users_id"])); 


$data = array(
    "orders_stause"=>1
);

updateData("orders", $data,"orders_id = $ordersid and orders_stause =0");
sendGCM("updat booking","Your reservation has been approved","users $usersid","none","none");