<?php
include "../connect.php";



$usersid= htmlspecialchars(strip_tags($_POST["admins_id"]));

getData("admins","admins_id = $usersid",null,true);
 
 