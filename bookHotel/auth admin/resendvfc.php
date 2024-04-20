<?php
include "../connect.php";


$email =    htmlspecialchars(strip_tags($_POST["admins_email"]));
$vfc =      rand(10000,99999);


$data=array(
    "users_verflyCode"=>$vfc
);
updateData("admins",$data,"admins_email='$email'");
sentMail($email,"Hello we happy foe enjoy you to us " ,  "your Verify Code is :  $vfc  ");


 
 



 
