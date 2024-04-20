<?php
include "../connect.php";
$table="categories";
$name= htmlspecialchars(strip_tags($_POST["categories_name"]));
$nameAr= htmlspecialchars(strip_tags($_POST["categories_name_ar"]));
$CatImg= imageUploadPath("../images/categories","file");

 $data=array(
    "categories_name"=>$name,
    "categories_name_ar"=>$nameAr,
    "categories_img"=>$CatImg,
 );

 $count = insertData($table,$data);