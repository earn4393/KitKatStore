<!DOCTYPE html>
<html lang="english">
  <head>
    <title>Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="utf-8" />
    <meta property="twitter:card" content="summary_large_image" />

    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
      data-tag="font"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Actor:wght@400&amp;display=swap"
      data-tag="font"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Acme:wght@400&amp;display=swap"
      data-tag="font"
    />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">


    <link rel="stylesheet"  href="kitkatStyles.css">
  </head>
<body>
<div class="header-header">
      <div class="header-logo">
      <span class="header-text">KitKat</span>
        <span class="header-text">Ever</span>
        <span class="header-text">For</span>
      </div>
      <div class="header-icons">
        <div class="icons1">
          <a href="status-product.php">
             <img
                alt="fluentalert12regular5036"
                src="public/playground_assets/fluentalert12regular5036-c9aab.svg"
                class="icon"
              />
          </a>
          <a href="home.php">
            <div class="home">
              <img
              alt="home"
              src="public/playground_assets/ant-design_home-outlined.svg"
              class="icon"
              />
            </div>
          </a> 
        </div>
        <div class="icons2">		
          <div class="header-search">
            <input class="search-input" type="text" placeholder="search">
            <input class="search-button"type="submit" value="search" >
          </div> 
          <a href="checkout.php">
            <img
                alt="ioncartoutline5035"
                src="public/playground_assets/ioncartoutline5035-pju6.svg"
                class="iconCart"
              />
          </a>
        </div>  
      </div>
    </div>



    <img src="public/playground_assets/pic_header.jpg">


    <div class="rainbow">
      <div class="box" style="background-color: #D00000; border-radius: 50px 0px 0px 50px;"></div>
      <div class="box" style="background-color: #FFD500;"></div>
      <div class="box" style="background-color: #9CF6F6;"></div>
      <div class="box" style="background-color: #AACC00;"></div>
      <div class="box" style="background-color: #9D4EDD;"></div>
      <div class="box" style="background-color: #D00000;"></div>
      <div class="box" style="background-color: #E85D04; border-radius: 0px 50px 50px 0px;"></div>
    </div>

<?php
session_start();
//กำหนดจำนวนสินค้าต่อหน้า All Product
$per_pageA=10;
if(isset($_GET["pageA"])) $start_pageA=$_GET["pageA"]*$per_pageA;
else $start_pageA=0;

//กำหนดจำนวนสินค้าต่อหน้า Bast Seller
$per_pageB=2;
if(isset($_GET["pageB"])) $start_pageB=$_GET["pageB"]*$per_pageB;
else $start_pageB=0;

// current page
$a = $start_pageA/$per_pageA;
$b = $start_pageB/$per_pageB;

// เชื่อมฐานข้อมูล
$servername="localhost";
$username="root";
$password="";
$dbname="kitkatshop";
$con=mysqli_connect($servername,$username,$password,$dbname);
if(!$con) die("Connnect mysql database fail!!".mysqli_connect_error());
// echo "Connect mysql successfully!";

// แบ่งและเรียกข้อมูลสินค้าในแต่ละหน้าของ Bast Seller
$sql="SELECT * FROM product ORDER BY saleout DESC LIMIT 10";
$result=mysqli_query($con,$sql);
$numrow=mysqli_num_rows($result);
$pagesB = $numrow/$per_pageB;
$showPageB = $b+1;

echo "<h2>Bast Seller</h2>";
echo "<div class='header-page'>";
echo "<div class='paging'>";
for($i=0;$i<ceil($pagesB);$i++){
   echo "<div class='circle-link'><a href='home.php?pageA=$a&pageB=$i'>".($i+1)."</a></div>";
}
echo "</div>";
echo "<p class='show-page'>$showPageB/$pagesB</p>";
echo "</div>";
$sql="SELECT * FROM product ORDER BY saleout DESC LIMIT $start_pageB,$per_pageB";
$result=mysqli_query($con,$sql);
if(mysqli_num_rows($result)>0){
    echo "<table class='table table-hover'>
    <tr>
    <th>#</th>
    <th>name</th>
    <th>description</th>
    <th></th>
    </tr>";
    while($row=mysqli_fetch_assoc($result)){
    echo "<tr><td>".$row["id"]."</td><td><h4>".$row["name"]."</h4>
    <p>฿".$row["price"]."<br>ขายแล้ว ".$row["saleout"]."
    </td>";
    echo "<td>".$row["description"]."</td>";
    echo "<td><a href='add-in-cart.php?id=".$row["id"]."'> <img
    alt='ioncartoutline5035'
    src='public/playground_assets/ioncartoutline5035-pju6.svg'
    class='iconCart'
  /></a></td></tr>";
    }
    echo "</table>";
}else{
    echo "0 results";
}


// แบ่งและเรียกข้อมูลสินค้าในแต่ละหน้าของ All Product
$sql="SELECT * FROM product";
$result=mysqli_query($con,$sql);
$numrow=mysqli_num_rows($result);
$pagesA = $numrow/$per_pageA;
$showPageA = $a+1;

echo "<h2>All Product</h2>";
echo "<div class='header-page'>";
echo "<div class='paging'>";
for($j=0;$j<ceil($pagesA);$j++)
    echo "<div class='circle-link'><a href='home.php?pageA=$j&pageB=$b'>".($j+1)."</a></div>";
echo "</div>";
echo "<p class='show-page'>$showPageA/$pagesA</p>";
echo "</div>";
$sql="SELECT * FROM product LIMIT $start_pageA,$per_pageA";
$result=mysqli_query($con,$sql);
if(mysqli_num_rows($result)>0){
    echo "<table class='table table-hover'>
    <tr>
    <th>#</th>
    <th>name</th>
    <th>description</th>
    <th></th>
    </tr>";
    while($row=mysqli_fetch_assoc($result)){
    echo "<tr><td>".$row["id"]."</td><td><h4>".$row["name"]."</h4>
    <p>฿".$row["price"]."<br>ขายแล้ว ".$row["count"]."
    </td>";
    echo "<td>".$row["description"]."</td>";
    echo "<td><a href='add-in-cart.php?id=".$row["id"]."'> <img
    alt='ioncartoutline5035'
    src='public/playground_assets/ioncartoutline5035-pju6.svg'
    class='iconCart'
  /></a></td></tr>";
    }
    echo "</table>";
}else{
    echo "0 results";
}

//หากมีสินค้าในตระกร้า
if(isset($_SESSION["cart"])){
$total=0;
echo "<div class='cart'>";
echo "<h2 class='cart-text'>ตระกร้าสินค้า</h2>";
echo "</div>";
echo "<table class='table table-hover'>
<tr>
<th>no.</th>
<th>#</th>
<th>name</th>
<th>price</th>
<th>count</th>
<th><a href='delAll-in-cart.php'><h5>X</h5></a></th></tr>";
    for($i=0;$i<count($_SESSION["cart"]);$i++)
    {
        $item=$_SESSION["cart"][$i];
        echo "<tr><td>".($i+1)."</td>";
        echo "<td>".$item['id']."</td>";
        echo "<td>".$item['name']."</td>";
        echo "<td>".$item['price']."</td>";
        echo "<td>".$item['count']."</td>";
        echo "<td><a href='del-in-cart.php?i=".$i."'>";
        echo "<font color='red'>x</font></a></td></tr>";
        $total+=$item['price']*$item['count'];
    }
echo "</table>";
echo "<div class='cart-button'>";
echo "<h3>ราคาสิ้นค้า $total บาท</h3>";
echo "</div>";
echo "<div class='order'>";
echo "<h4><a href='checkout.php'>สั่งซื้อ</a></h4>";
echo "</div>";
}
mysqli_close($con);
?>
</body>