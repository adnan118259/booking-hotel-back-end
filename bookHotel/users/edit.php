<?php
include "../connect.php";
 

$usersid= htmlspecialchars(strip_tags($_POST["users_id"]));
$users_name= htmlspecialchars(strip_tags($_POST["users_name"]));
$users_fullName= htmlspecialchars(strip_tags($_POST["users_fullName"]));
$users_email= htmlspecialchars(strip_tags($_POST["users_email"]));
$users_phone= htmlspecialchars(strip_tags($_POST["users_phone"]));
$users_password= htmlspecialchars(strip_tags($_POST["users_password"]));
$users_desc= htmlspecialchars(strip_tags($_POST["users_desc"]));
$users_image= htmlspecialchars(strip_tags($_POST["users_image"]));
 
     
 if(isset($_FILES['file'])){
    // deleteFile("Images/" . $users_image);
    $users_image=imageUploadPath("../Profile/Images","file");
 
     
}
$data=array(
    "users_id"=>$usersid,
    "users_name"=>$users_name,
    "users_fullName"=>$users_fullName,
    "users_email"=>$users_email,
    "users_phone"=>$users_phone,
    "users_password"=>$users_password,
    "users_desc"=>$users_desc,
    "users_image"=>$users_image,
);
 
updateData("users",$data,"users_id='$usersid'");


  