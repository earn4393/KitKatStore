<?php
session_start();
$id=$_GET['id'];

// เชื่อมฐานข้อมูล
$servername="localhost";
$username="root";
$password="";
$dbname="kitkatshop";
$con=mysqli_connect($servername,$username,$password,$dbname);
if(!$con) die("Connnect mysql database fail!!".mysqli_connect_error());
//echo "Connect mysql successfully!";
$sql="SELECT * FROM product WHERE id=$id";
$result=mysqli_query($con,$sql);

//ใส่ข้อมูลลงฐานข้อมูล
if(mysqli_num_rows($result)>0){
    $success=1;
    $row=mysqli_fetch_assoc($result);
    echo $row['id']."<br>";
    echo $row['name']."<br>";
    echo $row['price']."<br>";

    if(!isset($_SESSION["cart"]))
        $_SESSION["cart"]=array();



    if(count($_SESSION["cart"]) >0){
      $check = true;
      foreach($_SESSION["cart"] as $key => $value){
        if($value['id'] == $id){
          $item = $value;
          $item['count']++;
          array_splice($_SESSION["cart"],$key,$key+1);
          array_push($_SESSION["cart"],$item);
          $check = false;
        } 
      }
      if($check){
        $item=array("id"=>$row['id'],
        "name"=>$row['name'],
        "price"=>$row["price"],
        "count"=>1);
        array_push($_SESSION["cart"],$item);
      }
    }else{
      $item=array("id"=>$row['id'],
      "name"=>$row['name'],
      "price"=>$row["price"],
      "count"=>1);
      array_push($_SESSION["cart"],$item);
    }
    print_r($_SESSION["cart"]);
}
else
{
    $success=0;
}
mysqli_close($con);
?>
<?php
  if($success!=0){
?>
<script>
  // กลับไปที่หน้าโชว์สินค้า 
    window.alert("นำสินค้าใส่ตระกร้าเรียบร้อยแล้ว");
    window.location.replace("home.php");
</script>
<?php
  }
  else
  {
?>
<script>
    window.alert("เกิดข้อผิดพลาด!!!");
    window.location.replace("home.php");
</script>
<?php
  }
?>