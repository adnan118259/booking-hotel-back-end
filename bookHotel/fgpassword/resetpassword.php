<?php

include "../connect.php";
$email = htmlspecialchars(strip_tags($_POST["users_email"]));
$password =  ( ($_POST["users_password"]));
 
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
$data=array("users_password"=>$password);

updateData("users",$data,"users_email='$email'");

