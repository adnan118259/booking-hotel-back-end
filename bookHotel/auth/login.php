<?php

include "../connect.php";
$email = htmlspecialchars(strip_tags($_POST["users_email"]));
$password =  (strip_tags($_POST["users_password"]));
 
 
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
 
 
$stmt=$con->prepare("SELECT * FROM `users` WHERE users_email = :EMAIL and users_password= :PASS  ");
$stmt->execute(array( 
    ":EMAIL"  => $email,
    ":PASS"  =>$password,
      ));
   $data = $stmt->fetch(PDO::FETCH_ASSOC);
    $count  = $stmt->rowCount();
    if ($count > 0){
        echo json_encode(array("status" => "success", "data" => $data));
    } else {
        echo json_encode(array("status" => "failure"));
    }
    return $count;

//getData("users" ,"users_password= ? and users_email = ? and users_approve =1",array($email,$password) );
 