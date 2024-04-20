<?php
include "../connect.php";

$file=$_FILES['file'];

imageUpload("file");
echo "<pre>";
print_r($_FILES['file']);
echo "</pre>";


/*
$usersid  = htmlspecialchars(strip_tags($_POST["users_id"])); 
$imagename  = htmlspecialchars(strip_tags($_POST["users_image"])); 


$stmt=$con->prepare(
    "
    UPDATE `users` SET  `users_image`='$imagename' WHERE users_id =$usersid

    "
);

$stmt ->execute(); 
$count=$stmt->rowCount();

if($count>0){
    echo json_encode(array("status"=>"success","data"=>$data));
}else{
    echo json_encode(array("status"=>"failur"));

}
*/
