<?php
include "../connect.php";

$usersid  = htmlspecialchars(strip_tags($_POST["book_usersid"]));
$roomid= htmlspecialchars(strip_tags($_POST["book_roomid"]));

 
 
 

 //جلب اخر ايدي للغرفة وحذفه والا رح تنحذف كل كمية المنتج
$where="book_id =(select book_id FROM book WHERE  book_usersid = $usersid  AND book_roomid =$roomid and book_orders =0 LIMIT 1)   ";
deleteData("book",$where);
?>
 
	