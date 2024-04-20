<?php
include "../connect.php";



$searchDesc = htmlspecialchars(strip_tags($_POST["room_desc"]));
 
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

getAllData("view_room_and_categories", "room_desc_ar LIKE '%$searchDesc%' OR room_desc LIKE '%$searchDesc%'

 OR categories_name LIKE '%$searchDesc%'
  OR categories_name_ar LIKE '%$searchDesc%' 
");


