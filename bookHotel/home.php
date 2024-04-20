<?php
include "connect.php";

$allData=array();
$allData['status']='success';//لسنا بحاجة لها ولكن هي اساسية لشرط    if(response['status']=="success") in ui flutter

//cat
$cat=getAllData("categories",null,null,false);
$allData['categories']=$cat;

//pro جلب المنتجات التي عليها عرض

 $room=getAllData("view_room_and_categories","1=1",null,false);
//المنتجات الاكثر مبيعا
  $allData['room']=$room;


 $roomTopBooking=getAllData("roomTopBooking","1=1  ORDER BY countRoom DESC ",null,false);
 $allData['roomTopBooking']=$roomTopBooking;
  


echo json_encode($allData);