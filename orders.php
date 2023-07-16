<?php

include 'config.php';

session_start();

$user_id = $_SESSION['user_id'];

if(!isset($user_id)){
   header('location:login.php');
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>orders</title>

  

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'header.php'; ?>

<div class="heading">
   <h3>Pesanan anda</h3>
   <p> <a href="index.php">home</a> / orders </p>
</div>

<section class="placed-orders">


   <div class="box-container">

      <?php
         $order_query = mysqli_query($conn, "SELECT * FROM `orders` WHERE user_id = '$user_id'") or die('query failed');
         if(mysqli_num_rows($order_query) > 0){
            while($fetch_orders = mysqli_fetch_assoc($order_query)){
      ?>
      <div class="box">
         <p> tanggal checkout : <span><?php echo $fetch_orders['placed_on']; ?></span> </p>
         <p> nama : <span><?php echo $fetch_orders['name']; ?></span> </p>
         <p> nomor HP : <span><?php echo $fetch_orders['number']; ?></span> </p>
         <p> email : <span><?php echo $fetch_orders['email']; ?></span> </p>
         <p> Alamat : <span><?php echo $fetch_orders['address']; ?></span> </p>
         <p> Metode Bayar : <span><?php echo $fetch_orders['method']; ?></span> </p>
         <p> pesanan anda : <span><?php echo $fetch_orders['total_products']; ?></span> </p>
         <p> total harga : <span>Rp <?php echo $fetch_orders['total_price']; ?></span> </p>
         <p> status : <span><?php echo $fetch_orders['member']; ?></span> </p>
         <p> status pembayaran : <span style="color:<?php if($fetch_orders['payment_status'] == 'pending'){ echo 'red'; }else{ echo 'green'; } ?>;"><?php echo $fetch_orders['payment_status']; ?></span> </p>
         </div>
      <?php
       }
      }else{
         echo '<p class="empty">belum ada pesanan!</p>';
      }

  
      ?>
   </div>

</section>








<?php include 'footer.php'; ?>
<script src="js/script.js"></script>

</body>
</html>