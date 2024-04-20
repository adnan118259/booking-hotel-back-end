<?php
include "../connect.php";
$table="categories";

 $CatId= htmlspecialchars(strip_tags($_POST["categories_id"]));
 $CatImg= htmlspecialchars(strip_tags($_POST["categories_img"]));

 
    deleteFile("../images/categories/",$CatImg);
 deleteData($table,"categories_id = $CatId");