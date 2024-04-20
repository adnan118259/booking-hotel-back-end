<?php
include "../connect.php";
$table="users";
$users_name= htmlspecialchars(strip_tags($_POST["users_name"]));
$users_fullName= htmlspecialchars(strip_tags($_POST["users_fullName"]));
$users_desc= htmlspecialchars(strip_tags($_POST["users_desc"]));
$users_email = htmlspecialchars(strip_tags($_POST["users_email"]));
$users_phone= htmlspecialchars(strip_tags($_POST["users_phone"]));
$users_password= htmlspecialchars(strip_tags($_POST["users_password"])); 
$users_approve= htmlspecialchars(strip_tags($_POST["users_approve"]));
$UserImg= imageUploadPath("../Profile/Images","file");
 
 
 $data=array(
   "users_name"=>$users_name,
   "users_fullName"=>$users_fullName,
   "users_desc"=>$users_desc,
   "users_email"=>$users_email,
   "users_phone"=>$users_phone,
   "users_password"=>$users_password, 
   "users_approve"=>$users_approve,
   "users_image"=>$UserImg,
    
 );

 $count = insertData($table,$data);
  
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
 
 
 
 
  