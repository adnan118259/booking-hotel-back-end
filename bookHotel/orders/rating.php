<?php
include "../connect.php";
$ordersid  = htmlspecialchars(strip_tags($_POST["orders_id"])); 
$ordersrating  = htmlspecialchars(strip_tags($_POST["orders_rating"])); 
$orderscomment  = htmlspecialchars(strip_tags($_POST["orders_comment"])); 

$data=array(
    "orders_rating"=>$ordersrating,
    "orders_comment" =>$orderscomment,
);
updateData("orders",$data,"orders_id =$ordersid" );