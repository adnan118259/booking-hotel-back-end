<?php

include '../../connect.php';
$ordersid  = htmlspecialchars(strip_tags($_POST["orders_id"])); 
$usersid  = htmlspecialchars(strip_tags($_POST["users_id"])); 


$data = array(
    "orders_stause"=>1
);
$datan = array(
    "notification_title"=>"update booking",
    "notification_titleAr"=>"تحديث حالة الحجز",
    "notification_body"=>"Your reservation has been approved (orders_id : $ordersid)",
    "notification_bodyAr"=> "تمت الموفقة على حجزك برقم طلب".$ordersid,   
    "notification_users"=>"$usersid",
);

  updateData("orders", $data,"orders_id = $ordersid and orders_stause =0");

  insertData("notification", $datan);
 
  sendGCM("updat booking","Your reservation has been approved (orders_id : $ordersid)","users$usersid","none","refreshPendingBook");