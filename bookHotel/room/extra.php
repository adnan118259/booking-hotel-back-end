<?php include "../connect.php"; 


   $extraTypeServices =  htmlspecialchars(strip_tags($_POST["extra_isServices"]));
   
   getAllData("extra", "extra_isServices='$extraTypeServices' and extra_available =1"); ?>

 