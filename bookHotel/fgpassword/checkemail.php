<?php

include "../connect.php";
$email = htmlspecialchars(strip_tags($_POST["users_email"]));
$vfc =      rand(10000,99999);
 
 
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
 
$stmt=$con->prepare("SELECT * FROM `users` WHERE  users_email = :EMAIL  ");
$stmt->execute(array( 
    ":EMAIL"  => $email,
      ));

 $count=$stmt->rowCount();

// use function
result($count);

if($count >0){
    ///ارسال رمز التحقق عبر الايميل
    $data=array("users_verflyCode" => $vfc);
    updateData("users",$data,"users_email='$email' ",false);//false كي لايطبع اي شي مشان مايصير غلط في json

  //  sentMail($email,"Hello we happy foe enjoy you to us " ,  "your Verify Code is :  '$vfc'  ");
    
} 
