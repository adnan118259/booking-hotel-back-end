<?php
include "../connect.php";


$email =    htmlspecialchars(strip_tags($_POST["users_email"]));

$vfc =      htmlspecialchars(strip_tags($_POST["users_verflyCode"]));
 
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);



$stmt=$con->prepare("SELECT * FROM `users` WHERE `users_email`='$email' And `users_verflyCode`='$vfc' ");
$stmt->execute();

$count=$stmt->rowCount();//0 or 1

result($count);
 