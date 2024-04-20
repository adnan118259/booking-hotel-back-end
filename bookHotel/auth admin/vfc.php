<?php
include "../connect.php";


$email =    htmlspecialchars(strip_tags($_POST["admins_email"]));

$vfc =      htmlspecialchars(strip_tags($_POST["admins_verflyCode"]));


$stmt=$con->prepare("SELECT * FROM `admins` WHERE `admins_email`='$email' And `admins_verflyCode`='$vfc' ");
$stmt->execute();

$count=$stmt->rowCount();//0 or 1


if($count >0){
    $data=array("admins_approve" => "1");
   


    $stmt=$con->prepare("UPDATE `admins`  SET  `admins_approve`=   '$data[admins_approve]' WHERE `admins_email` ='$email'"    );
    $stmt->execute();
    echo json_encode(array("status" => "success" ));
    sentMail($email,"Hello we happy foe enjoy you to us " ,  "your Verify Code is :  $vfc  ");







}else{

    printFailure("Error: VFC is Wrong");

}
