<?php
include "../connect.php";

//	coupon_id	coupon_name	coupon_count	coupon_expiredate	coupon_discount	
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

 
$couponname  = htmlspecialchars(strip_tags($_POST["coupon_name"]));
$nowDate=date("Y-m-d H:i:s"); 

getData("coupon"," coupon_name = '$couponname' and coupon_expiredate > '$nowDate'  and coupon_count > 0");


