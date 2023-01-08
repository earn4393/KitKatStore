<?php
session_start();
if(isset($_SESSION["cart"])){
    $_SESSION["cart"] = null;
}
?>
<script>
    window.alert("นำสินค้าออกจากตระกร้าเรียบร้อยแล้ว");
    window.location.replace('home.php');
</script>