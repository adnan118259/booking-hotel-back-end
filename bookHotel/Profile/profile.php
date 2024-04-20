<?php
include "../connect.php";



$usersid= htmlspecialchars(strip_tags($_POST["users_id"]));

getData("users","users_id = $usersid",null,true);
 
 