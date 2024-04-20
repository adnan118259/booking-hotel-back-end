<?php
include "../connect.php";

$users_id  = htmlspecialchars(strip_tags($_POST["users_id"])); 
$room_id  = htmlspecialchars(strip_tags($_POST["room_id"])); 
$orders_id  = htmlspecialchars(strip_tags($_POST["orders_id"])); 

getAllData("invoicread","users_id = '$users_id' and room_id =$room_id and orders_id=$orders_id");//ordersPrice




//0 not agree yet
//1 in order 
//3 archive




