<?php
include "../connect.php";
 
 $userId =    htmlspecialchars(strip_tags($_POST["admins_id"]));
  $categoriesid =    htmlspecialchars(strip_tags($_POST["categories_id"]));

  
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

//getAllData("view_room_and_categories","1=1") ;

 $stmt=$con->prepare(
    "
SELECT  view_room_and_categories.*, admins.admins_id,admins.admins_fullName
    
    , CAST((room_price - (room_price*room_discount / 100)) AS INT) AS roomPriceDiscount
FROM view_room_and_categories , admins
 WHERE categories_id=$categoriesid AND  admins.admins_id=$userId;

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