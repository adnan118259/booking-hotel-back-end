<?php
include "../connect.php";
$table="categories";
$name= htmlspecialchars(strip_tags($_POST["categories_name"]));
$nameAr= htmlspecialchars(strip_tags($_POST["categories_name_ar"]));
//$CatImg= imageUploadPath("../images/categories","file");
$CatId= htmlspecialchars(strip_tags($_POST["categories_id"]));
$CatImg= htmlspecialchars(strip_tags($_POST["categories_img_old"]));

$res= imageUploadPath("../images/categories","file");
if($res =="empty"){
   $data=array(
      "categories_name"=>$name,
      "categories_name_ar"=>$nameAr,
     // "categories_img"=>$CatImg,
   );
}else{
   deleteFile("../images/categories",$CatImg);
   $data=array(
      "categories_name"=>$name,
      "categories_name_ar"=>$nameAr,
      "categories_img"=>$res,
   );
}


 updateData($table,$data,"categories_id=$CatId");