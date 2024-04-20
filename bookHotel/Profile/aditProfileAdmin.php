<?php
include "../connect.php";
 

$usersid= htmlspecialchars(strip_tags($_POST["admins_id"]));
$users_fullName= htmlspecialchars(strip_tags($_POST["admins_fullName"]));
$users_email= htmlspecialchars(strip_tags($_POST["admins_email"]));
$users_phone= htmlspecialchars(strip_tags($_POST["admins_phone"]));
$users_password= htmlspecialchars(strip_tags($_POST["admins_password"]));
$users_desc= htmlspecialchars(strip_tags($_POST["admins_desc"]));
$users_image= htmlspecialchars(strip_tags($_POST["admins_image"]));

//$file=$_FILES['file'];
//$users_image=imageUpload("file");

     
 if(isset($_FILES['file'])){
    // deleteFile("Images/" . $users_image);
    $users_image=imageUpload("file");
     
}
$data=array(
    "admins_id"=>$usersid,
    "admins_fullName"=>$users_fullName,
    "admins_email"=>$users_email,
    "admins_phone"=>$users_phone,
    "admins_password"=>$users_password,
    "admins_desc"=>$users_desc,
    "admins_image"=>$users_image,
);
 
updateData("admins",$data,"admins_id='$usersid'");


  