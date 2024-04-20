 
<?php
include "../connect.php";

$usersid  = htmlspecialchars(strip_tags($_POST["book_usersid"]));
$roomid = htmlspecialchars(strip_tags($_POST["book_roomid"]));
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$count = getData("book", "book_roomid = $roomid AND book_usersid = $usersid AND book_orders  = 0", null, false);

$data = array(
    "book_usersid" => $usersid,
    "book_roomid" => $roomid, 
);

insertData("book", $data);
?>
