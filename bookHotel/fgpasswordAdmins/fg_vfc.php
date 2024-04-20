<?php
include "../connect.php";


$email =    htmlspecialchars(strip_tags($_POST["admins_email"]));

$vfc =      htmlspecialchars(strip_tags($_POST["admins_verflyCode"]));
 
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);



$stmt=$con->prepare("SELECT * FROM `admins` WHERE `admins_email`='$email' And `admins_verflyCode`='$vfc' ");
$stmt->execute();

$count=$stmt->rowCount();//0 or 1

result($count);
 