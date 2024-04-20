<?php
include "../connect.php";
$table="users";

 $users_id= htmlspecialchars(strip_tags($_POST["users_id"]));
 
  deleteData($table,"users_id = $users_id");