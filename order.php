<?php
session_start();
$fname= $_POST["fname"];
$lname= $_POST["lname"];
$address= $_POST["address"];
$mobile= $_POST["mobile"];
$servername="localhost";
$username="root";
$password="";
$dbname="kitkatshop";
$con=mysqli_connect($servername,$username,$password,$dbname);
if(!$con) die("Connnect mysql database fail!!".mysqli_connect_error());
echo "Connect mysql successfully!";

$sql="INSERT INTO order_product (fname, lname,address,mobile)";
$sql.="VALUES ('$fname', '$lname', '$address','$mobile');";

if (mysqli_query($con, $sql)) {
    $last_id = mysqli_insert_id($con);
    //echo "New record created successfully. Last inserted ID is: " . $last_id;
    // loop in session cart and insert each item to database
    $sql1="INSERT INTO order_details (order_id,product_id,count) VALUES ";
    for($i=0;$i<count($_SESSION["cart"]);$i++){
        $item_id=$_SESSION["cart"][$i]['id'];
        $count_product =$_SESSION["cart"][$i]['count'];
        $sql1.="('$last_id','$item_id',$count_product)";
        if($i<count($_SESSION["cart"])-1)
         $sql1.=",";
        else
         $sql.=";";
        $sql2 = "SELECT count FROM product WHERE id=$item_id";
        $result=mysqli_query($con,$sql2);
        $count = 0;
        if(mysqli_num_rows($result)>0){
          while($row=mysqli_fetch_assoc($result)){
            $count += $row["saleout"];
          }
        }
        $count += $_SESSION["cart"][$i]['count'];
        echo $count;
        echo $item_id;
        echo $_SESSION["cart"][$i]['name'];

        $sql3 = "UPDATE product SET saleout=$count WHERE id=$item_id";
        if (mysqli_query($con, $sql3)) {
          echo "Record updated successfully";
        } else {
          echo "Error updating record: " . mysqli_error($conn);
        }
        
    }
    //echo $sql1;
    if(mysqli_query($con,$sql1)) echo "บันทึกข้อมูลการสั่งซื้อเรียบร้อยแล้ว";
    else "เกิดข้อผิดพลาดในการสั่งซื้อ";
  } else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
  }
  
  mysqli_close($con);
  $_SESSION["cart"] = null;
?>
<script>
    window.alert("สั่งซื้อเรียบร้อย");
    window.location.replace('status-product.php');
</script>