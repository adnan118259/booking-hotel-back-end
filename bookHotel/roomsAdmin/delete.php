<?php
include "../connect.php";
$table="room";

 $RoomId= htmlspecialchars(strip_tags($_POST["room_id"]));
 $RoomImg= htmlspecialchars(strip_tags($_POST["room_img"]));

 deleteFile("../images/room",$RoomImg);
 deleteData($table,"room_id = $RoomId");