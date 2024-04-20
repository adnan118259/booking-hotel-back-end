<?php
include "../connect.php";
 //orders_id	orders_usersid	orders_address	orders_type orders_pricedelievery	orders_price	orders_coupon	orders_datetime	orders_payments 

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

 $usersid  = htmlspecialchars(strip_tags($_POST["orders_usersid"]));  
 $orderstype  = htmlspecialchars(strip_tags($_POST["orders_type"]));  
 $ordersprice  = htmlspecialchars(strip_tags($_POST["orders_price"])); 
 $orderscoupon  = htmlspecialchars(strip_tags($_POST["orders_coupon"])); 
 $orderspayments  = htmlspecialchars(strip_tags($_POST["orders_payments"])); 
 $discountcoupon  = htmlspecialchars(strip_tags($_POST["discountcoupon"])); 
 $ordersdays  = htmlspecialchars(strip_tags($_POST["orders_days"])); 
 $ordersdatetimeend  = htmlspecialchars(strip_tags($_POST["orders_datetime_end"])); 


 $totalprice=$ordersprice ;
     
 //check coupon
$nowDate=date("Y-m-d H:i:s"); 

$checkcoupon=getData("coupon"," coupon_id = '$orderscoupon' and coupon_expiredate > '$nowDate'  and coupon_count > 0",null,false);
if($checkcoupon>0){
$totalprice=$totalprice-$ordersprice*$discountcoupon/100;
//نقلل عدد مرات استخدام الكوبون
$stmt=$con->prepare("UPDATE `coupon` SET `coupon_count`=`coupon_count`-1 where coupon_id = '$orderscoupon' ");
$stmt->execute();
} 
 
////////////////////////////////////////////////////////////////
$data=array( 
    "orders_usersid"=> $usersid	, 
    "orders_type"=> $orderstype , 
    "orders_price"=>  $ordersprice ,
    "orders_coupon"=> $orderscoupon,
    "orders_payments"=>  $orderspayments,
    "orders_days"=>$ordersdays,
    "orders_totalprice"=>  $totalprice*$ordersdays,
    "orders_datetime_end"=>$ordersdatetimeend,
);
$count= insertData("orders",$data,false);
if($count>0){
    $stmt=$con->prepare("SELECT MAX(orders_id) from orders ");
    $stmt->execute();
    $maxID=$stmt->fetchColumn();

    $data =array("book_orders"=>$maxID);
    updateData("book",$data,"book_orders =0 AND book_usersid = $usersid");
}