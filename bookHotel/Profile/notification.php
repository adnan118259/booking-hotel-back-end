<?php
include "../connect.php";

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
 

$usersid= htmlspecialchars(strip_tags($_POST["notification_users"]));

 getAllData("notification","notification_users='$usersid'" );
 
  