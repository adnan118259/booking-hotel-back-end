<?php
include "../connect.php";

 
//,(room_price - (room_price*room_discount / 100)) AS proPriceDiscountلحساب سعر الخصم
$stmt=$con->prepare(
    "
SELECT DISTINCT view_room_and_categories.*
    , 1 AS favorite
    , CAST((room_price - (room_price*room_discount / 100)) AS INT) AS roomPriceDiscount
FROM view_room_and_categories

INNER JOIN favorite ON favorite.favorite_roomid = view_room_and_categories.room_id 
WHERE room_discount != 0

UNION ALL 

SELECT DISTINCT view_room_and_categories.*
    , 0 AS favorite 
    , CAST((room_price - (room_price*room_discount / 100)) AS INT) AS roomPriceDiscount
FROM view_room_and_categories
WHERE room_discount != 0 AND NOT EXISTS (
    SELECT favorite.favorite_roomid
    FROM favorite 
    WHERE favorite.favorite_roomid = view_room_and_categories.room_id
);
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