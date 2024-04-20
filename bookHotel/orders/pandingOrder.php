<?php
include "../connect.php";

$usersid  = htmlspecialchars(strip_tags($_POST["orders_usersid"])); 

getAllData("orders","orders_usersid = '$usersid' and orders_stause <2");//ordersPrice


 
//0 not agree yet
//1 in order 
//3 archive




