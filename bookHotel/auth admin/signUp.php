<?php

include "../connect.php";
$username = htmlspecialchars(strip_tags($_POST["admins_name"]));
$email =    htmlspecialchars(strip_tags($_POST["admins_email"]));
$phone =    htmlspecialchars(strip_tags($_POST["admins_phone"]));
$password = htmlspecialchars(strip_tags($_POST["admins_password"]));
$vfc =      rand(10000,99999);
 

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


///start if user reg in db
$stmt=$con->prepare("SELECT * FROM `admins` WHERE `admins_email`=? Or`admins_phone`=? ");
$stmt->execute(array($email,$phone));

$count=$stmt->rowCount();//0 or 1

if($count >0){
    printFailure("admins_email or admins_phone is already exists");
}else{

    ///ارسال رمز التحقق عبر الايميل
   // sentMail($email,"Hello $username we happy for enjoy you to us " ,  "your Verify Code is :  $vfc  ");


    $stmt=$con->prepare("INSERT INTO `admins`(`admins_name`, `admins_email`, `admins_phone`, `admins_password`, `admins_verflyCode` ) 
    VALUES (:USER,:EMAIL,:PHONE,:PASS,:VFC )"  );
    
$stmt->execute(
   array(
   ":USER"  =>$username,
   ":EMAIL" =>$email ,
   ":PHONE"  =>$phone,    
   ":PASS"  =>$password,    
   ":VFC"  =>$vfc,
 
   )
);


$count=$stmt->rowCount();

if($count >0){
    echo json_encode(array("status" => "success"));
}else{
    echo json_encode(array("status" => "fail"));
}

}

      ?>
 