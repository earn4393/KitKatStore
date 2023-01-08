<!DOCTYPE html>
<html lang="english">
  <head>
    <title>Shopping Cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="utf-8" />
    <meta property="twitter:card" content="summary_large_image" />

    <style data-tag="reset-style-sheet">
      html {  line-height: 1.15;}body {  margin: 0;}* {  box-sizing: border-box;  border-width: 0;  border-style: solid;}p,li,ul,pre,div,h1,h2,h3,h4,h5,h6 {  margin: 0;  padding: 0;}button,input,optgroup,select,textarea {  font-family: inherit;  font-size: 100%;  line-height: 1.15;  margin: 0;}button,select {  text-transform: none;}button,[type="button"],[type="reset"],[type="submit"] {  -webkit-appearance: button;}button::-moz-focus-inner,[type="button"]::-moz-focus-inner,[type="reset"]::-moz-focus-inner,[type="submit"]::-moz-focus-inner {  border-style: none;  padding: 0;}button:-moz-focus,[type="button"]:-moz-focus,[type="reset"]:-moz-focus,[type="submit"]:-moz-focus {  outline: 1px dotted ButtonText;}a {  color: inherit;  text-decoration: inherit;}input {  padding: 2px 4px;}img {  display: block;}html { scroll-behavior: smooth  }
    </style>
    <style data-tag="default-style-sheet">
      html {
        font-family: Inter;
        font-size: 16px;
      }
    </style>

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


    <div class="header-cart">
    <h1>ประวัติซื้อสินค้า</h1>
    </div>
<?php
echo "<div class='body-cart'>";
// เชื่อมต่อฐานข้อมูล
$servername="localhost";
$username="root";
$password="";
$dbname="kitkatshop";
$con=mysqli_connect($servername,$username,$password,$dbname);
if(!$con) die("Connnect mysql database fail!!".mysqli_connect_error());
// echo "Connect mysql successfully!";


$sql1 = "SELECT * FROM order_product";
$allCus=mysqli_query($con,$sql1);
if(mysqli_num_rows($allCus)>0){
    while($row=mysqli_fetch_assoc($allCus)){
      echo "<div class='box-history'>";
            $order = $row['id'];
            echo "<h3>Order : ".$row['id']."</h3>";
            echo "<p>Name : ".$row['fname']." ".$row['lname']."</p>";
            echo "<p> Address : ".$row['address']."</p>";
            echo "<p>Mobile : ".$row['mobile']."</p>";
            echo "<p>Date : ".$row['date']."</p>";

             $sql2="SELECT  * FROM  order_details INNER JOIN product ON product.id = order_details.product_id
                    INNER JOIN order_product ON order_details.order_id = order_product.id WHERE order_product.id = $order";
            $productList=mysqli_query($con,$sql2);
          
            if(mysqli_num_rows($productList)>0){
                $total = 0;
                   echo "<table class='table table-hover'>
                    <tr>
                    <th>#</th>
                    <th>name</th>
                    <th>count</th>
                    <th>price</th>
                    </tr>";
                while($row=mysqli_fetch_assoc($productList)){
                    echo "<tr>
                    <td>".$row["product_id"]."</td>
                    <td>".$row["name"]."</td>
                    <td>".$row["count"]."</td>
                    <td>".$row["price"]."</td>
                    </tr>";
                    $total += $row["price"]*$row["count"];
                }
                 echo "</table>";
                 echo "<h3>ราคาสิ้นค้า $total บาท</h3>";
                 echo "</div>";
            }else{
                echo "0 results";
            }
    }
   
}else{
    echo "0 results";
}
echo "</div>";
echo "<div class='order'>";
echo "<h4><a href='home.php'>home</a></h4>";
echo "</div>";
mysqli_close($con);
?>
</body>