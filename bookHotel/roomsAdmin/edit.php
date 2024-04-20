<?php
include "../connect.php";
$table="room";
$room_id= htmlspecialchars(strip_tags($_POST["room_id"]));
$room_categories= htmlspecialchars(strip_tags($_POST["room_categories"]));
$room_desc= htmlspecialchars(strip_tags($_POST["room_desc"]));
$room_desc_ar= htmlspecialchars(strip_tags($_POST["room_desc_ar"]));
$room_discount= htmlspecialchars(strip_tags($_POST["room_discount"]));
$room_numfloor= htmlspecialchars(strip_tags($_POST["room_numfloor"]));
$room_numroom= htmlspecialchars(strip_tags($_POST["room_numroom"]));
$room_price= htmlspecialchars(strip_tags($_POST["room_price"]));
$room_active= htmlspecialchars(strip_tags($_POST["room_active"]));
$RoomImg= htmlspecialchars(strip_tags($_POST["room_img_old"]));

$res= imageUploadPath("../images/room","file");
if($res =="empty"){
   $data=array(
      "room_desc"=>$room_desc,
      "room_categories"=>$room_categories,
      "room_desc_ar"=>$room_desc_ar,
      "room_discount"=>$room_discount,
      "room_numfloor"=>$room_numfloor,
      "room_numroom"=>$room_numroom,
      "room_price"=>$room_price,
      "room_active"=>$room_active,
    //  "room_img"=>$RoomImg,
      
    );
}else{
 
   deleteFile("../images/room/",$RoomImg);
   $data=array(
      "room_desc"=>$room_desc,
      "room_categories"=>$room_categories,
      "room_desc_ar"=>$room_desc_ar,
      "room_discount"=>$room_discount,
      "room_numfloor"=>$room_numfloor,
      "room_numroom"=>$room_numroom,
      "room_price"=>$room_price,
      "room_active"=>$room_active,
      "room_img"=>$res,
      
    );
}


 updateData($table,$data,"room_id=$room_id");