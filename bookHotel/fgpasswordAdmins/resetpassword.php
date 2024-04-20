<?php

include "../connect.php";
$email = htmlspecialchars(strip_tags($_POST["admins_email"]));
$password =  ( ($_POST["admins_password"]));
 
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
$data=array("admins_password"=>$password);

updateData("admins",$data,"admins_email='$email'");

