<?php

include "../connect.php";
$username = htmlspecialchars(strip_tags($_POST["users_name"]));
$email =    htmlspecialchars(strip_tags($_POST["users_email"]));
$phone =    htmlspecialchars(strip_tags($_POST["users_phone"]));
$password = htmlspecialchars(strip_tags($_POST["users_password"]));
$fullName = htmlspecialchars(strip_tags($_POST["users_fullName"]));
$vfc =      rand(10000,99999);
 

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


///start if user reg in db
$stmt=$con->prepare("SELECT * FROM `users` WHERE `users_email`=? Or`users_phone`=? ");
$stmt->execute(array($email,$phone));

$count=$stmt->rowCount();//0 or 1

if($count >0){
    printFailure("users_email or users_phone is already exists");
}else{

    ///ارسال رمز التحقق عبر الايميل


    $stmt=$con->prepare("INSERT INTO `users`(`users_name`, `users_email`, `users_phone`, `users_password`,`users_fullName`, `users_verflyCode` ) 
    VALUES (:USER,:EMAIL,:PHONE,:PASS,:FULNAME,:VFC )"  );
    
$stmt->execute(
   array(
   ":USER"  =>$username,
   ":EMAIL" =>$email ,
   ":PHONE"  =>$phone,    
   ":PASS"  =>$password,    
   ":FULNAME"  =>$fullName, 
   ":VFC"  =>$vfc,
 
   )
);


$count=$stmt->rowCount();

if($count >0){
    echo json_encode(array("status" => "success"));
}else{
    echo json_encode(array("status" => "fail"));
}
  // sentMail($email,"Hello $username we happy for enjoy you to us " ,  "your Verify Code is :  $vfc  ");

}

      ?>
 