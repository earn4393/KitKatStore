<?php
session_start();
$i = $_GET['i'];

if(isset($_SESSION["cart"])){
    if($_SESSION["cart"][$i]['count'] < 2){
        if(count($_SESSION["cart"]) < 2){
            $_SESSION['cart'] =null; 
        }else{
          array_splice($_SESSION["cart"],$i,1); 
        }
    }else{
        $_SESSION["cart"][$i]['count'] += -1;
    }
    // array_splice($_SESSION["cart"],$i,1);
    }
    
?>
<script>
    window.alert("นำสินค้าออกจากตระกร้าเรียบร้อยแล้ว");
    window.location.replace('home.php');
</script>