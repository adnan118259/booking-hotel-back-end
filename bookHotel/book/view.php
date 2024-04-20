<?php
include "../connect.php";
 
  

$usersid  = htmlspecialchars(strip_tags($_POST["book_usersid"])); 

$data=getAllData("bookView","book_usersid=$usersid",null,false);



//SUM(CountProd) من حيث الكمية .. يعمني اذا اخترت عشر هواتف ايفون بيعطيني رقم عشرة
//count(CountProd) من حيث النواع .. يعني اذا اخترت عشر هواتف ايفون بيعطيني رقم واحد 
$stmt = $con->prepare(" 
SELECT SUM(roomTotalPrice)AS totalPriceRoom,COUNT(countRoom) AS totalCountRoom FROM `bookView` 
WHERE bookView.book_usersid =$usersid
GROUP BY book_usersid;
");


$stmt->execute();

$datacountprice=$stmt->fetch(PDO::FETCH_ASSOC);

echo json_encode(array(
    "status" => "success",
    "data"=>$data,
    "priceCount"=>$datacountprice,
));
