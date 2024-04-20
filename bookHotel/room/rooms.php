<?php
include "../connect.php";
 
 $userId =    htmlspecialchars(strip_tags($_POST["users_id"]));
  $categoriesid =    htmlspecialchars(strip_tags($_POST["categories_id"]));

  
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

//getAllData("view_room_and_categories","1=1") ;

 $stmt=$con->prepare(
    "
SELECT  view_room_and_categories.*, users.users_id,users.users_fullName
    
    , CAST((room_price - (room_price*room_discount / 100)) AS INT) AS roomPriceDiscount
FROM view_room_and_categories , users
 WHERE categories_id=$categoriesid AND  users.users_id=$userId;

    "
);


$stmt ->execute();

$data=$stmt->fetchAll(PDO::FETCH_ASSOC);
$count=$stmt->rowCount();

if($count>0){
    echo json_encode(array("status"=>"success","data"=>$data));
}else{
    echo json_encode(array("status"=>"failur"));

}