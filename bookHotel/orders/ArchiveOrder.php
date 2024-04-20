<?php
include "../connect.php";

$usersid  = htmlspecialchars(strip_tags($_POST["orders_usersid"])); 

getAllData("orders","orders_usersid = '$usersid' and orders_stause >1");


//0  Proccess

//1 Delivered


//3  Archive